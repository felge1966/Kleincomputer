program KCLOAD;
{$D KC-Load 0.XX (02/02)}
{$R-,S-,I-,Q-,W-,K+,G+,A+}
{$C MOVEABLE PRELOAD PERMANENT}
{$R KCLOAD.RES}
{Wünschenswerte Erweiterungen:
 * OK: Auto-Detect von KC, KC-Turbo, Z1013 und BASICODE
 * Hochpass-Filter: nö!
 * Variable Sampleraten 11, 22, 44 kS/s: nö!
 * Vollautomatik (Einlesen und Abspeichern hintereinanderweg)
 * OK: grüne Aussteuerungs-Anzeige
 * Motorschaltspannungs-Unterstützung (KCMOTOR.DRV)
 * OK: Unverfrühte Statusanzeige bei SAVE
 * Mehr als nur 2 Puffer
}

uses
  WinTypes, WinProcs, Win31, MMSystem, CommDlg, ShellApi,
  WUtils, Strings;

const
 RegPath='KCEMU\KCLOAD';
 HelpFileName='KCLOAD.HLP';
 UserDllFilter='*.KCL';
 WaveFileName='KCLOAD.WAV';

type
 AModus=(NONE,LOAD,SAVE);
 ACoding=(AUTO,KC,MPM,HS,Z1013,BASICODE,Z1013ALL);
 AFilter=(NON,KCC,DUM,SSS,Z80,BAC);

var
 hWav: HWaveIn;		{für Ein- und Ausgabe (erfolgt nie gleichzeitig)}
 Waves: array[0..1] of THandle;	{später mehr für bessere "Flüssigkeit"}
 Modus: AModus;		{0=frei, 1=LOADing, 2=SAVEteimas}
{Gespeicherte Setup-Daten (Registry), MÜSSEN HINTEREINANDER LIEGEN BLEIBEN}
 Retries: Integer;	{Anzahl Wiederholungen beim Lesen}
 Coding: ACoding;	{Modus KC normal, Turbo MPM, Turbo h#s, Z1013}
 Filter: AFilter;	{FilterIndex bei Datei-Auswahl-Dialog}
 WaveVol: ShortInt;	{Lautstärke-Multiplikator (log.) bei Ausgabe}
 AutoSave: Boolean;	{Schalter für Automatisches Speichern}
 WaveInDev, WaveOutDev: Integer;
	{Nummer des Ein- bzw. Ausgabegerätes:
	 -2=KCLOAD.WAV, -1=Wave-Mapper, 0=erste Soundkarte usw.}
 Installed: Boolean;	{zum automatischen Sichern von Einstellungen}
 BytesToWrite: LongInt;
 BufPtr: LongInt;
 AppName: array[0..31] of Char;
 CurWaveHdr: PWaveHdr;	{ZeigerZeiger auf momentan zu prozessierende Daten}
 ByteIndex: Word;	{Index für momentanes Sample in CurWaveHdr}
 Task: THandle;		{Handle der MMTASK.TSK ("Windows-3.1-Thread")}
 LibInst: THandle;	{Geladene KCL-Bibliothek}
 Back: HBrush;		{Hintergrundpinsel für Statusfenster (Blau)}
 Green: HBrush;		{Pinsel für Aussteuer-Anzeige (Dunkelgrün)}
 Font: HFont;		{Schrift für Statuszeile}
 StatusChars: Integer;	{Anzahl sichtbarer Zeichen in Statuszeile}
 ckRIFF,ck: TMmCkInfo;	{RIFF-Merker zum (Lesen und) Schreiben}

const
 WAVBLK=$1000;		{je größer, desto weniger Aussetzer, aber asynchroner}

samplefaktor = 2; {vp}

 MyWav: TPCMWaveFormat=(
  wf:(
   wFormatTag:      WAVE_Format_PCM;
   nChannels:       1;
   nSamplesPerSec:  11025*samplefaktor;
   nAvgBytesPerSec: 11025*samplefaktor;
   nBlockAlign:     1);
  wBitsPerSample:   8);

 WM_ContinueInit=WM_User+10;
 WM_EndProcess=WM_User+11;
 WM_SetStatus=WM_User+12;
 WM_ReportWaveError=WM_User+13;

type
 TBlock=array[0..127] of Byte;
 TCallProc=procedure;	{Formatabhängige Lese/Schreibfunktion}

var
 MainWnd: HWnd;		{Global ist besser im Zugriff!}
 hBuffer: THandle;	{Speicherabbild der Datei, Wachstum durch Verdopplung}
 BufContent: AFilter;	{vom Leseprogramm gesetzter Puffer-Inhalt}
 Amp: ShortInt;		{Momentanwert (also Elongation!)}
 WavePeak: Integer;	{Maximale Amplitude eines Wave-Blocks beim Lesen}
 StatusBuf: TS31;	{Statuszeilen-Text}

{*************************************}
{** Prozeduren zur Wave-Ein/Ausgabe **}
{*************************************}

procedure FindPeak(P:PChar; len:Word);
 begin
  WavePeak:=0;
  while len<>0 do begin
   WavePeak:=max(WavePeak,abs(ShortInt(Byte(P^)-$80)));
   Inc(P);
   Dec(len);
  end;
  InvalidateRect(GetDlgItem(MainWnd,19),nil,false);
 end;

function GetSize:LongInt;
 begin
  case Modus of
   LOAD: GetSize:=BufPtr;
   SAVE: GetSize:=BytesToWrite-BufPtr;
  end;
 end;

function GetData(P:PChar; Size:Integer):Integer;
 var
  Buf: PChar;
 begin
  Buf:=GlobalLock(hBuffer);
  IncHPL(Buf,BufPtr);
  if Size>BytesToWrite-BufPtr then Size:=BytesToWrite-BufPtr;
  hmemcpy(P,Buf,Size);
  Inc(BufPtr,Size);
  GetData:=Size;
  GlobalUnlock(hBuffer);
 end;

procedure EndProcess1(OK:Boolean); forward;

procedure AddData(P:PChar; Size:Integer);
 var
  Buf: PChar;
 begin
  if BufPtr+Size>GlobalSize(hBuffer) then begin
   hBuffer:=GlobalReAlloc(hBuffer,GlobalSize(hBuffer) shl 1,0);
   if hBuffer=0 then EndProcess1(false);	{sollte nie passieren}
  end;
  Buf:=GlobalLock(hBuffer);
  IncHPL(Buf,BufPtr);
  hmemcpy(Buf,P,Size);
  Inc(BufPtr,Size);
  GlobalUnlock(hBuffer);
 end;

procedure ProcessBlock;
{Kontext: MMTASK.TSK}
 var
  Msg: TMsg;
 begin
  with CurWaveHdr^ do case Modus of
   LOAD: begin
    if WaveInDev=-2 then begin
     LongRec(dwBytesRecorded).Lo:=
       mmioRead(hWav,lpData,LongRec(dwBufferLength).Lo);
     if LongRec(dwBytesRecorded).Lo=0 then EndProcess1(false);
     PeekMessage(Msg,0,0,0,PM_Remove);	{Windows zum Zug kommen lassen}
     if Msg.message=WM_Quit then EndProcess1(false);
    end else begin
     WaveInAddBuffer(hWav,CurWaveHdr,sizeof(TWaveHdr));	{leeren Puffer hinein}
     if not GetMessage(Msg,0,0,0) then EndProcess1(true {vp; in jedem Fall abspeichern erm÷glichen});
					{gibt Rechenzeit frei}
{$IFOPT D+} if Msg.message<>MM_WIM_Data then asm int 3 end; {$ENDIF}
     CurWaveHdr:=Pointer(Msg.lParam);	{Neuer Block, gefüllt mit Daten, steht bereit}
    end;
    FindPeak(CurWaveHdr^.lpData,CurWaveHdr^.dwBytesRecorded);
   end;
   SAVE: begin
    if WaveOutDev=-2 then begin
     if mmioWrite(hWav,CurWaveHdr^.lpData,
       LongRec(CurWaveHdr^.dwBufferLength).Lo)<>
       LongRec(CurWaveHdr^.dwBufferLength).Lo
     then EndProcess1(false);
     PeekMessage(Msg,0,0,0,PM_Remove);	{Windows zum Zug kommen lassen}
     if Msg.message=WM_Quit then EndProcess1(false);
    end else begin
     WaveOutWrite(hWav,CurWaveHdr,sizeof(TWaveHdr));	{vollen Puffer hinein}
     if not GetMessage(Msg,0,0,0) then EndProcess1(false);
					{gibt Rechenzeit frei}
{$IFOPT D+} if Msg.message<>MM_WOM_Done then asm int 3 end; {$ENDIF}
     CurWaveHdr:=Pointer(Msg.lParam);	{Geleerter Puffer}
	{Jetzt erst Status setzen:}
     if PChar(CurWaveHdr)[sizeof(TWaveHdr)+WAVBLK]<>#0 then begin
      lstrcpy(StatusBuf,PChar(CurWaveHdr)+sizeof(TWaveHdr)+WAVBLK);
      {Nicht doppelt in Warteschlange stellen (z.B. langsamer Rechner)}
      if not PeekMessage(Msg,MainWnd,WM_SetStatus,WM_SetStatus,
	PM_NoYield or PM_NoRemove)
      then PostMessage(MainWnd,WM_SetStatus,0,0);
      PChar(CurWaveHdr)[sizeof(TWaveHdr)+WAVBLK]:=#0;
     end;
    end;
   end;
  end;
  ByteIndex:=0;		{Lese- oder Schreibzeiger}
 end;

function MakeWaveBlock(var M:THandle):PWaveHdr;
{Erzeugt einen Speicherblock, bestehend aus WaveHdr und
 einem direkt darauf folgenden Datenpuffer.
 Benutzt globale Variablen hWav, Modus, WaveInDev und WaveOutDev
 wegen der notwendigen "Präparation" dieser Puffer.
 Beim Speichern "hängt" an diesem Puffer auch noch Platz für
 einen Status-String, damit dieser erst bei Wave-Ausgabe und nicht
 schon zu seiner Vorbereitung erscheint.}
 var
  WH: PWaveHdr;
 begin
  M:=GlobalAlloc(GHND or GMEM_Share,sizeof(TWaveHdr)+WAVBLK+
    IfThenElse(Modus=SAVE,32,0));
  if M=0 then EndProcess1(false);
  WH:=GlobalLock(M);
  WH^.lpData:=PChar(WH)+sizeof(TWaveHdr);
  WH^.dwBufferLength:=WAVBLK;
  case Modus of
   LOAD: if WaveInDev>-2 then WaveInPrepareHeader(hWav,WH,sizeof(TWaveHdr));
   SAVE: if WaveOutDev>-2 then WaveOutPrepareHeader(hWav,WH,sizeof(TWaveHdr));
  end;
  MakeWaveBlock:=WH;
 end;

procedure FreeWaveBlock(var M:THandle);
{Gegenteil von oben}
 var
  WH: PWaveHdr;
 begin
  if M=0 then exit;	{Nichts tun, falls gar nicht angefordert}
  GlobalUnlock(M);	{der Block war die ganze Zeit gelockt!}
  if hWav<>0 then begin
   WH:=GlobalLock(M);	{Pointer beschaffen}
   case Modus of
    LOAD: if WaveInDev>-2 then WaveInUnprepareHeader(hWav,WH,sizeof(TWaveHdr));
    SAVE: if WaveOutDev>-2 then WaveOutUnprepareHeader(hWav,WH,sizeof(TWaveHdr));
   end;
   GlobalUnlock(M);
  end;
  M:=GlobalFree(M);
 end;

procedure EndProcess1(OK:Boolean);
{Kontext: MMTASK.TSK, Funktion beendet Task}
 begin
  case Modus of
   LOAD: begin		{Lesen vom Band oder von der WAV-Datei}
    if WaveInDev<>-2 then begin
     WaveInReset(hWav);	{Restliche (leere) Puffer "ausspucken"}
     WaveInClose(hWav);	{Gerät schließen}
    end else mmioClose(hWav,0);
    FindPeak(nil,0);	{Anzeige rücksetzen (lassen)}
   end;
   SAVE: begin		{Schreiben aufs Band oder in die WAV-Datei}
    if OK and (ByteIndex<>0) then begin
     LongRec(CurWaveHdr^.dwBufferLength).Lo:=ByteIndex;
     ProcessBlock;
    end;
    if WaveOutDev<>-2 then begin
     if OK then begin
      while WaveOutClose(hWav)<>0	{=WAVERR_StillPlaying}
      do MMTaskBlock(Task);
     end else begin
      WaveOutReset(hWav);	{im Abbruch-Fall}
      WaveOutClose(hWav);
     end;
     hWav:=0;
    end else begin
     if OK then begin		{WAV-Datei patchen lassen}
      if mmioAscend(hWav,@ck,0)<>0 then OK:=false
      else if mmioAscend(hWav,@ckRIFF,0)<>0 then OK:=false;
     end;
     if mmioClose(hWav,0)<>0 then OK:=false;
     if not OK then mmioOpen(WaveFileName,nil,MMIO_Delete);
    end;
   end;
  end{case};
  FreeWaveBlock(Waves[0]);
  FreeWaveBlock(Waves[1]);
  PostMessage(MainWnd,WM_EndProcess,Word(OK),0);
  halt;
 end;

function memcmpw(var p1, p2; vlen: Word):Boolean; assembler;
{Speicher-Vergleich, wortweise}
 asm	push	ds
	 lds	si,[p2]
	 les	di,[p1]
	 mov	cx,vlen
	 mov	al,FALSE
	 cld
	 rep	cmpsw	{[SI]-[DI]}
	pop	ds
	jnz	@@e
	inc	al	{TRUE}
@@e:
 end;

procedure WaveInTask(CallProc:TCallProc);far;
{Kontext: MMTASK.TSK, Funktion beendet Task und kehrt nicht zurück}
 label
  err,errfile;
 var
  I: Integer;
  ThisWav: TPCMWaveFormat;
 begin
  asm mov ax,seg @data; mov ds,ax; {$IFOPT D+} int 3 {$ENDIF} end;
  if WaveInDev=-2 then begin
   I:=mmsyserr_InvalHandle;	{5}
   hWav:=mmioOpen(WaveFileName,nil,
     MMIO_Read or MMIO_AllocBuf or MMIO_DenyNone);
   if hWav=0 then goto err;
   I:=mmsyserr_NotSupported;	{8}
   if mmioDescend(hWav,@ckRIFF,nil,0)<>0 then goto errfile;
   if ckRIFF.ckID<>FOURCC_RIFF then goto errfile;
   if ckRIFF.fccType<>$45564157 then goto errfile;	{'WAVE'}
   ck.ckID:=$20746D66;					{'fmt '}
   if mmioDescend(hWav,@ck,@ckRIFF,MMIO_FindChunk)<>0 then goto errfile;
   if ck.ckSize<sizeof(TPCMWaveFormat) then goto errfile;
   if mmioRead(hWav,PChar(@ThisWav),sizeof(TPCMWaveFormat))
     <>sizeof(TPCMWaveFormat) then goto errfile;
   if mmioAscend(hWav,@ck,0)<>0 then goto errfile;
   if not memcmpw(ThisWav,MyWav,sizeof(TPCMWaveFormat) div 2)
   then goto errfile;
   ck.ckID:=$61746164;					{'data'}
   if mmioDescend(hWav,@ck,@ckRIFF,MMIO_FindChunk)<>0 then goto errfile;
   CurWaveHdr:=MakeWaveBlock(Waves[0]);
  end else begin
   I:=Integer(WaveInOpen(@hWav,Word(WaveInDev),@MyWav.wf,
     MMGetCurrentTask,0,Callback_Task));
   if I<>0 then goto err;
   MMTaskBlock(Task);		{MM_WIM_Open entfernen}
   WaveInAddbuffer(hWav,MakeWaveBlock(Waves[0]),sizeof(TWaveHdr));
   CurWaveHdr:=MakeWaveBlock(Waves[1]);
   ByteIndex:=$FFFF;
   WaveInStart(hWav);
  end;
  CallProc;
  EndProcess1(true);
errfile:
  mmioClose(hWav,0);
err:
  PostMessage(MainWnd,WM_ReportWaveError,I,0);
  halt;				{Prozess MMTASK.TSK beenden (nicht KCLOAD)}
 end;

procedure WaveOutTask(CallProc:TCallProc);far;
{Kontext: MMTASK.TSK, Funktion beendet Task und kehrt nicht zurück}
 label
  err,errfile;
 var
  I: Integer;
 begin
  asm mov ax,seg @data; mov ds,ax; {$IFOPT D+} int 3 {$ENDIF}  end;
  if WaveOutDev=-2 then begin
   I:=mmsyserr_InvalHandle;		{5}
   hWav:=mmioOpen(WaveFileName,nil,
     MMIO_Write or MMIO_AllocBuf or MMIO_Create or MMIO_DenyNone);
   if hWav=0 then goto err;
   I:=mmsyserr_NotSupported;		{8 - besser: cant_write}
   ckRIFF.fccType:=$45564157;				{'WAVE'}
   if mmioCreateChunk(hWav,@ckRIFF,MMIO_CreateRIFF)<>0 then goto errfile;
   ck.ckID:=$20746D66;					{'fmt '}
   ck.ckSize:=sizeof(TPCMWaveFormat);
   if mmioCreateChunk(hWav,@ck,0)<>0 then goto errfile;
   if mmioWrite(hWav,PChar(@MyWav),sizeof(TPCMWaveFormat))
     <>sizeof(TPCMWaveFormat) then goto errfile;
   if mmioAscend(hWav,@ck,0)<>0 then goto errfile;
   ck.ckID:=$61746164;					{'data'}
   if mmioCreateChunk(hWav,@ck,0)<>0 then goto errfile;
  end else begin
   I:=Integer(WaveOutOpen(@hWav,Word(WaveOutDev),@MyWav.wf,
     MMGetCurrentTask,0,Callback_Task));
   if I<>0 then goto err;
   MMTaskBlock(Task);		{MM_WOM_Open entfernen}
   PostAppMessage(MMGetCurrentTask,MM_WOM_Done,hWav,
     LongInt(MakeWaveBlock(Waves[1])));
  end;
  CurWaveHdr:=MakeWaveBlock(Waves[0]);
  ByteIndex:=0;
  CallProc;
  EndProcess1(true);
errfile:
  mmioClose(hWav,0);
  mmioOpen(WaveFileName,nil,MMIO_Delete);
err:
  PostMessage(MainWnd,WM_ReportWaveError,I,0);
  halt;
 end;

{**********************************************}
{** Formatabhängiges Lesen: Anzeige-Routinen **}
{**********************************************}

function LoadStr31(D,S:PChar):Integer;
 begin
  if PtrRec(S).sel=0
  then LoadStr31:=LoadString(Seg(HInstance),LongRec(S).lo,D,32)
  else begin
   lstrcpyn(D,S,32);
   LoadStr31:=lstrlen(D);
  end;
 end;

function SetStat_LOAD(S:PChar):Integer;
 begin
  SetStat_LOAD:=LoadStr31(StatusBuf,S);
  PostMessage(MainWnd,WM_SetStatus,0,0);
 end;

function SetStat_SAVE(S:PChar):Integer;
 begin
  SetStat_SAVE:=LoadStr31(PChar(CurWaveHdr)+sizeof(TWaveHdr)+WAVBLK,S);
 end;

function Char_KC2ANSI:Char; assembler;
{Zeichen-Bereich begrenzen, 6 Zeichencodes (vornehmlich Umlaute) austauschen.
 Liefert außerdem Flags vom Vergleich des Zeichens mit ' '!}
 asm	and	al,7Fh
	cmp	al,5Ch
	mov	ah,7Ch		{Pipe-Symbol}
	je	@@2
	cmp	al,5Dh
	mov	ah,0ACh		{Negations-Zeichen}
	je	@@2
	cmp	al,7Bh
	mov	ah,0E4h		{ä}
	je	@@2
	cmp	al,7Ch
	mov	ah,0F6h		{ö}
	je	@@2
	cmp	al,7Dh
	mov	ah,0FCh		{ü}
	je	@@2
	cmp	al,7Eh
	mov	ah,0DFh		{ß}
	jne	@@e
@@2:	xchg	ah,al
@@e:	cmp	al,' '
	ja	@@1
	mov	al,' '
@@1:
 end;

function GetFileNameKC(S,buf:PChar):integer;assembler;
{Dateiname von Pufferzeiger buf (hier: 11 Bytes, mit Leerzeichen aufgefüllt)
 nach S (als ASCIIZ 8.3) extrahieren,
 bei den typischen BASIC-Dateinamen wird die vorn liegende Extension
 nach hinten gebracht.
 Leerzeichen und ungültige Zeichen werden NOCH NICHT aus dem String entfernt,
 das muß ein nachfolgendes Programm (je nach Vorhandensein einer LFN-API) tun.
 Hat der Name keine Erweiterung, gibt's auch keinen Punkt.
 Liefert Anzahl der Zeichen in S}
 asm	cld
	push	ds
	 les	di,[S]
	 lds	si,[Buf]
	 mov	dx,di
	 xor	bx,bx
	 mov	cx,8		{8 Zeichen}
	 lodsb			{1. Zeichen}
	 test	al,al		{Endung am Anfang?}
	 jns	@@1
	 mov	bx,11		{Kennung}
	 add	si,2		{mit dem 4. Zeichen loslegen}
@@l1:	 lodsb
@@1:	 call	Char_KC2ANSI
	 stosb			{Alle (auch verbotene W31) in Puffer}
	 jbe	@@2
	 mov	dx,di		{Vorrücken bei nicht-leeren Zeichen}
@@2:	 loop	@@l1
	 mov	di,dx
	 mov	al,'.'
	 stosb			{jetzt kommt die Extension!}
	 sub	si,bx		{Korrektur, wenn Extension vorn war!}
	 mov	cx,3
@@l2:	 lodsb
	 call	Char_KC2ANSI
	 stosb
	 jbe	@@3
	 mov	dx,di		{Vorrücken bei nicht-leeren Zeichen}
@@3:	 loop	@@l2
	 mov	di,dx
	 xor	al,al
	 stosb			{Terminierende Null}
	 xchg	dx,ax
	 sub	ax,word ptr [S]
@@e:	pop	ds
 end;

function GetFileNameZ80(S,buf:PChar):integer; assembler;
{Extrahiert Z1013-Headersave-Dateiname - nachlaufende Leerzeichen werden
 abgeschnitten. Liefert Anzahl der Zeichen in S}
 asm	cld
	push	ds
	 les	di,[S]
	 lds	si,[buf]
	 mov	cx,16		{16 Zeichen können's sein!}
	 add	si,cx
	 mov	dx,di		{Merker für letztes Nicht-Leerzeichen}
@@l:	 lodsb
	 cmp	al,' '
	 ja	@@1
	 mov	al,' '
@@1:	 stosb
	 jbe	@@2
	 mov	dx,di		{"Ein nicht-leeres Zeichen" merken}
@@2:	 loop	@@l
	 mov	di,dx
	 xor	al,al
	 stosb
	 xchg	dx,ax
	 sub	ax,word ptr [S]	{Anzahl Zeichen liefern}
	pop	ds
 end;

{-Bin-Laden-von-Kassette-----------------------------------------------------}
procedure ReadB;
{Liest das nächste Sample als vzb. 8-Bit-Wert zur globalen Variable "Amp"}
{Kontext: MMTASK.TSK}
 begin
  with CurWaveHdr^ do begin
   if ByteIndex>=LongRec(dwBytesRecorded).Lo
   then ProcessBlock;		{Nächsten Block einlesen}
  end;				{CurWaveHdr geändert, WITH beenden!!!}
  with CurWaveHdr^ do begin
   Amp:=Integer(lpData[ByteIndex])-$80;
   Inc(ByteIndex);
  end;
 end;

function ReadSwing1:Integer;
{Liest Samples bis zum nächsten Nulldurchgang und liefert die Sample-Anzahl,
 somit die Zeit für eine halbe Schwingung}
{Kontext: MMTASK.TSK}
 var
  W: Integer;
 begin
  W:=0;
  if Amp<0
  then repeat ReadB; Inc(W); until Amp>=0
  else repeat ReadB; Inc(W); until Amp<0;
  ReadSwing1:=W;
 end;

function ReadSwing2: Integer;
{Liefert die Zeit in Samples für eine ganze Schwingung}
{Kontext: MMTASK.TSK}
 begin
  ReadSwing2:=ReadSwing1+ReadSwing1;
 end;

{**************************************}
{** Formatabhängiges Lesen: Routinen **}
{**************************************}

type
 TBL=record		{Blocklese-Struktur}
  expect: Word;		{Erwartete Blocknummer}
  readbl: Word;		{Gelesene Blocknummer}
  showch: Char;		{Anzeige-Zeichen}
  ok: Boolean;		{Block OK oder nicht}
  retry: Integer;	{Wiederholungs-Zähler (aufwärts!)}
  spos1: Integer;	{String-Position: ! stehenlassen}
  spos2: Integer;	{String-Position: ? stehenlassen}
  t: PChar;		{String-Template}
  tl: Integer;		{Ausgabe-Länge pro String-Template}
  s: TS31;		{String-Puffer}
 end;

procedure InitBL(var BL:TBL; t:PChar; tl:Integer);
{BL-Struktur initialisieren}
 begin
  FillChar(BL,sizeof(BL),0);
  BL.t:=t;
  BL.tl:=tl;
  FillChar(BL.s,31,' ');
 end;

procedure HandleBL(var BL:TBL);
{Gelesenen Block behandeln; der Aufrufer muss die Elemente
 expect, readbl und ok geeignet setzen!}
 begin
  with BL do begin
   spos2:=tl;		{zunächst Platz lassen}
   if readbl=expect then begin
    if ok then begin
     showch:='>';
    end else begin
     showch:='?';
     Inc(retry);
     if (retry>=Retries) or (WaveInDev=-2) then begin
      ok:=true;
      showch:='!';
     end;
    end;
    if ok then begin
     spos2:=0;
     retry:=0;
    end;
   end else begin
    showch:='*';
    ok := false;  { vp }
   end;
   wvsprintf(s+spos1+spos2,t,readbl);
   if (showch='!') and (spos1<StatusChars-2*tl)
   then Inc(spos1,tl);	{(einige) Ausrufezeichen-Blöcke stehen lassen}
   SetStat_LOAD(s);
  end;
 end;

procedure CatHex(S:PChar; W:Word);
{Hängt eine vierstellige Hexzahl an S an, solange S, mit 31 Zeichen
 angenommen, noch nicht voll ist.}
 var
  I:Integer;
 begin
  I:=lstrlen(S);
  if I>31-5 then exit;	{kein Platz: Zahl weglassen!}
  wvsprintf(S+I,' %04X',W);
 end;

function HandleMPMHeader(buf:TBlock):LongInt;
{Zeigt den KC85-Header in der Statuszeile und berechnet die Dateilänge}
 function IsBASICProg: Boolean;
  var
   B: Byte;
  begin
   IsBASICProg:=false;
   B:=buf[0];
   if (B-$D3) and not 4 <>0 then exit;
   if B<>buf[1] then exit;
   if B<>buf[2] then exit;
   IsBASICProg:=true;
  end;

 function IsBASICField: Boolean;
  var
   B: Byte;
  begin
   IsBASICField:=false;
   B:=buf[0];
   if (B-$D3) and not 4 >3 then exit;	{SSS,TTT,UUU, WWW,XXX,YYY +80h}
   if B<>buf[1] then exit;
   if B<>buf[2] then exit;
   IsBASICField:=true;
  end;

 function IsMCProg: Boolean;
  begin
   IsMCProg:=buf[16] in [2..10];
  end;

 var
  s:TS31;
 begin
  HandleMPMHeader:=MaxLongInt;
  GetFileNameKC(s,PChar(@buf));
  if IsBASICProg then begin
   HandleMPMHeader:=PWord(@buf[11])^+LongInt(14);
   CatHex(s,PWord(@buf[11])^);
   BufContent:=SSS;	{als BASIC speichern lassen}
  end else if IsBASICField then begin
   BufContent:=SSS;		{als BASIC speichern lassen}
  end else if IsMCProg then begin
   HandleMPMHeader:=PWord(@buf[19])^-PWord(@buf[17])^+LongInt(128);
   BufContent:=KCC;		{als MC speichern lassen}
   CatHex(s,PWord(@buf[17])^);
   CatHex(s,PWord(@buf[19])^);
   if buf[16]>2 then CatHex(s,PWord(@buf[21])^);
  end else if PLongInt(PChar(@buf)+12)^=0 then BufContent:=KCC
  else BufContent:=SSS;	{wahrscheinlich! - aber ziemlich sicher}
  SetStat_LOAD(s);	{müsste normalerweise in eine andere Statuszeile!}
 end;

{KC-Format:
 Die Angaben im KC-Handbuch und (z.Z.) KCEMU-Hilfe sind FALSCH!
 Ursache: Die Mühlhäuser Programmierer haben die Latenzzeit der
 Interruptserviceroutine unterschlagen.
 Z.B. Vorton: TC=$2F=47->1179Hz(848µs), es sind aber ca. 1060Hz(943µs).
 In dieser Zeit wird der Timer 2x per ISR neu programmiert, 943-848=95µs,
 pro Aufruf also 47.5µs->83 Takte.
 Der IM2 verbraucht 19 Takte, in der ISR vergehen 11+7+11+19+11 Takte,
 macht zusammen 78 Takte. Da die Warteschleife aus einer Schleife
 mit 19+4+12 Takten besteht, ist die mittlere Latenz 5 Takte
 (wegen mittlerer Befehlsausführungszeit von 11 Takten). Kommt genau hin!
 (Dummerweise wird die CTC rückgesetzt, eigentlich Schwachsinn!)

 0-Bit: Vollschwingung  1950 Hz (11 Samples,  7-16)
 1-Bit: Vollschwingung  1050 Hz (21 Samples, 17-26)
 Trennzeichen: Vollschw. 557 Hz (39 Samples, 27-50)

 Byte: Bit0, Bit1, ... Bit7, Trennzeichen (TZ)

 Block: Vorton (>160 1-Bits), TZ, Byte (BlockNr), 128 Bytes, Byte (Summe)

 Datei: Vorblock (Nr. 0 oder 1), n Datenblöcke, Schlussblock (Nr. FF)

 Vorblock: 11 Byte Name, 117 Byte verschieden verwendet oder Datenbytes

 Schlussblock: Kann Daten enthalten

 Idiotien:
 * Keine vernünftige Definition des Vorblock-Inhaltes, verschiedene
   Auslegung für BASIC oder MC, unsichere Block-Nr.
 * Block-Nr. FF kann, muss aber nicht Schlussblock sein; Auslegung
   verschieden: VERIFY und LOAD machen Schluss, BASIC lädt weiter
   und interessiert sich mitnichten für den FF-Block
   (dieser enthält keine Daten und wird gar nicht gelesen)
   KC87-BASIC generiert keinen FF-Block
   Dateien >31K haben einen FF-Block mittendrin
 * Schwer behebbare Differenzen zwischen Kassetten- und Disketten-
   Aufzeichnung (das mache man erst mal dem Normalverbraucher klar...)
}
procedure ReadDataKCC; far;
{Kontext: MMTASK.TSK}

 function Bytein:Byte;
  var
   I,W:Integer;
   B:Byte;
 begin
  for I:=0 to 7 do begin
   w:=ReadSwing2;
   asm shr [B],1 end;
   if w>=17 then asm or [B],80h end;	{kompakter als "B:=B or $80"}
  end;
  ReadSwing2;
  Bytein:=B;
 end;

 function ReadBlock(var BlkNr:Byte; var Buffer:TBlock; Vorton:Integer):Boolean;
  label step1,step2;
  var
   I,W:Integer;
   B,Sum:Byte;
  begin
   ReadBlock:=false;
 {Schritt 1: Vorton erkennen und aufsynchronisieren}
step1:
   I:=Vorton;
   {Vorton:=16;			{Wiederholungen mit kürzerem Einlauf?}
   repeat
    W:=ReadSwing2;
    if W<17 then goto step1;
    if W>26 then goto step1;
    Dec(I);
   until I=0;
 {Schritt 2: 1. Trennzeichen holen}
step2:
   repeat
    W:=ReadSwing1;
    if W>25 then goto step1;	{Aussetzer im Vorton}
    if W<8 then goto step1;	{Störnadel im Vorton}
   until W>13;
   Inc(W,ReadSwing1);
   if W<27 then goto step2;
   if W>50 then goto step2;	{2. halbes Trennzeichen muß folgen!}
 {Schritt 3: Bytes lesen}
   BLKNr:=ByteIn;
   Sum:=0;
   for I:=0 to 127 do begin
    B:=ByteIn;
    Inc(Sum,b);
    Buffer[I]:=b;
   end;
   If Sum=ByteIn then ReadBlock:=true;
  end;


 label nochmal;
 var
  BL:TBL;
  buf: TBlock;
  L:LongInt;

 begin
  SetStat_LOAD(PChar(17));		{'KC85,KC87'}
  InitBL(BL,' %02X%c',4);
  repeat
   BL.ok:=ReadBlock(Byte(BL.readbl),buf,300);
   if BL.readbl in [0,1]
   then BL.expect:=BL.readbl
   else BL.expect:=$FFFF;	{"falscher Block" erzwingen}
   HandleBL(BL);
  until BL.ok;
  AddData(PChar(@Buf),sizeof(buf));

  L:=HandleMPMHeader(buf);

  repeat
   Inc(Byte(BL.expect));
nochmal:
   BL.ok:=ReadBlock(Byte(BL.readbl),buf,16);
   if (BL.readbl=$FF)		{Schlussblock: gekommen?}
   and (BL.ok)			{und in Ordnung?}
   and (BL.expect<>$FF)		{und nicht erwartet?}
   and (L=MaxLongInt)		{Datenmenge: unbekannt?}
   then begin
    BL.expect:=$FF;		{Sei erwarteter Block}
    L:=0;			{Datenvolumen erfüllt}
   end;
   HandleBL(BL);
   if not BL.ok then goto nochmal;
   AddData(PChar(@Buf),sizeof(buf));
  until GetSize>=L;
 end;

{MPM-Turbo-Format:
 Vorton: Vollwelle 2200 Hz (10 Samples)
 Trennz: Vollwelle  900 Hz (24 Samples)
 0-Bit:  Halbwelle 2200 Hz ( 5 Samples, 2..8)
 1-Bit:  Halbwelle  900 Hz (12 Samples, 9..15)

 Byte: Bit0, Bit1, ... Bit7

 Block: Vorton(70h..1000h) - Trennzeichen - 130 Bytes

 weiter wie KC-Format

 In grauer Vorgeschichte habe ich MPM-Turbo umgeschrieben, damit es
 kürzer werde und habe die Geschichte mit der Interrupt-Latenz
 übersehen, so dass verschiedene Ergebnisse zu Tage kommen!
 Original Latenz: (8+12)/4+19+4+7+11+4+11 = 61 Takte (Jitter: 11)
 Meine Latenz: (19+4+12)/6+19+11+7+11+19+11 = 84 Takte (Jitter: 18)
 0-Bit: ZK 15h->336 Takte (Halbwelle), 2200 Hz vs. 2100 Hz
 1-Bit: ZK=39h->912 Takte (Halbwelle), 900 Hz vs. 880 Hz
 Vorton = viele 0-Bits, Trennzeichen = 2 1-Bits
 Zum Glück bleiben die Frequenzen noch detektierbar...
}
procedure ReadDataMPMTurbo; far;
{Kontext: MMTASK.TSK}

 function Bytein:Byte; assembler;
  asm
	mov	ah,8
@@l:	push	ax
	 call	ReadSwing1
	 cmp	ax,9
	 cmc
	pop	ax
	rcr	al,1
	dec	ah
	jnz	@@l
  end;

 function ReadBlock(var BlkNr:Byte; var Buffer:TBlock; Vorton:Integer):Boolean;
  label Try;
  var
   I,W:Integer;
   B,Sum:Byte;
  begin
   ReadBlock:=false;
 {Schritt 1: Vorton erkennen und aufsynchronisieren}
Try:
   for I:=1 to Vorton do begin
    W:=ReadSwing1;
    if W>=10 then begin
     I:=0;
     continue;
    end;
   end;
 {Schritt 2: 1. Trennzeichen holen}
   for I:=1 to 2 do begin
    W:=ReadSwing1;
    if W<10 then begin
     if I=2 then Goto Try else I:=0;
     continue;
    end;
   end;
 {Schritt 3: Bytes lesen}
   BLKNr:=ByteIn;
   Sum:=0;
   for I:=0 to 127 do begin
    B:=ByteIn;
    Inc(Sum,B);
    Buffer[I]:=B;
   end;
   If Sum=ByteIn then ReadBlock:=true;
  end;


 label nochmal;
 var
  BL:TBL;
  buf: TBlock;
  L:LongInt;

 begin
  SetStat_LOAD(PChar(18));		{'Turbo MPM'}
  InitBL(BL,' %02X%c',4);
  repeat
   BL.ok:=ReadBlock(Byte(BL.readbl),buf,300);
   if BL.readbl in [0,1]
   then BL.expect:=BL.readbl
   else BL.expect:=$FFFF;	{"falscher Block" erzwingen}
   HandleBL(BL);
  until BL.ok;
  AddData(PChar(@Buf),sizeof(buf));

  L:=HandleMPMHeader(buf);

  repeat
   Inc(Byte(BL.expect));
nochmal:
   BL.ok:=ReadBlock(Byte(BL.readbl),buf,16);
   if (BL.readbl=$FF)		{Schlussblock: gekommen?}
   and (BL.ok)			{und in Ordnung?}
   and (BL.expect<>$FF)		{und nicht erwartet?}
   and (L=MaxLongInt)		{Datenmenge: unbekannt?}
   then begin
    BL.expect:=$FF;		{Sei erwarteter Block}
    L:=0;			{Datenvolumen erfüllt}
   end;
   HandleBL(BL);
   if not BL.ok then goto nochmal;
   AddData(PChar(@Buf),sizeof(buf));
  until GetSize>=L;
 end;

{h#s-Turbo-Format:
 Nach 2 Blöcken im normalen KC-Format, die den 128-Byte-Bootstrap-Loader
 enthalten, der ab B880h im Modulsteuerwortspeicher landet (und dort leider
 die Steuerbytes für den Diskettenaufsatz ruiniert), kommt der Speicherabzug
 oder das BASIC-Programm (gemeinhin auch ein Speicherabzug).

 Vorton: Vollschwingung  735 Hz (30 Samples)
 Trennz: Halbschwingung 1200 Hz ( 9 Samples)
 0-Bit:  Halbschwingung 5500 Hz ( 4 Samples)
 1-Bit:  Halbschwingung 2400 Hz ( 9 Samples)

 Byte: Bit7, Bit6, ... Bit0

 Datei: Vorton (512) - Trennzeichen - n Bytes

 (n sowie die Prüfsumme stehen im beim Speichern zusammengestellten
  Bootstrap-Loader)
 Der Aufbau des Bootstrap-Laders ist meine Dokumentationsschwäche;
 ich konnte nie mehr das alles entscheidende Listing auftreiben!
}
procedure ReadDataHSTurbo; far;
{Kontext: MMTASK.TSK}
 var
  S: array[0..31] of Char;
  I,W: integer;
  Sum,B:Byte;
 begin
  ReadDataKCC;
  if GetSize<>$100 then EndProcess1(false);
  SetStat_LOAD(PChar(19));		{'Turbo h#s'}
  BufContent:=NON;		{hier: HS-Turbo ist gemeint!}
{fehlt: Ausgeben der Adressen, Bestimmung der Lade-Länge}
  for I:=0 to 40 do begin
   W:=ReadSwing1;
   if W<12 then begin I:=0;continue;end;
  end;
  repeat
  until ReadSwing1<12;
  Sum:=0;
  Repeat
   for I:=0 to 7 do begin
    w:=ReadSwing1;
    B:=B SHL 1;
    if w>20 then begin AddData(PChar(@Sum),1);exit;end;
    if w>6 then B:=B or 1;
   end;
   inc(Sum,B);
   AddData(PChar(@B),1);
  until false
{fehlt:
    if pBuf[$D8]<>pBuf[BufPtr-1] then
	if MBox1(MainWnd,111,SFile)=IDCANCEL then exit;}
 end;

{-----------------------------------------------------------------------vp}

{Z1013-Format:
 Vorton: Halbschwingung  650 Hz (17 Samples) Diskriminator:
 Trennz: Vollschwingung 1400 Hz (16 Samples)
 0-Bit:  Halbschwingung 1200 Hz ( 9 Samples)
 1-Bit:  Vollschwingung 2400 Hz ( 9 Samples) Diskriminator: 6

 Wort: Bit0, Bit1, ... Bit15

 Block: Vorton (14..2000) - Trennz - Wort (Zieladr.) - 16 Wort -
	Wort (Summe über die vorhergehenden 17(!) Worte)

 Datei: HEADERSAVE-Vorblock (bel. Zieladresse), n Datenblöcke

 HEADERSAVE-Vorblock (leider optional, aber sehr verbreitet):
	WORD aadr,eadr,sadr; CHAR creator[6]; BYTE type; BYTE magic[3];
	CHAR filename[16]
}


type
  Tz1013_filetyp = (UNK,HEADERSAVE,TINYBASIC);

var
  z1013_all: boolean;
  z1013_filetyp: Tz1013_filetyp;

procedure ReadDataZ1013; far;
{Kontext: MMTASK.TSK}
const
  faktor = 1;  { 2 MHz }

 type
  TBlk=array[0..15] of Word;

 function Wordin:Word;
  var
   I:Integer;
   W:Word;
 begin
  for I:=0 to 15 do begin
   asm shr [W],1 end;
   if ReadSwing1>6*faktor then asm or byte ptr [W+1],80h end else ReadSwing1;
  end;
  Wordin:=W;
 end;

 function ReadBlock(var BlkNum:Word; var Buffer:TBlk; VLen:Integer):Boolean;
  label step1;
  var
   I:Integer;
   W,Sum:Word;
  begin
   ReadBlock:=false;
 {Schritt 1: Vorton erkennen und aufsynchronisieren}
step1:
   I:=VLen;
   repeat
    W:=ReadSwing1;
    if W<12*faktor then goto step1;
    if W>22*faktor then goto step1;
    Dec(I);
   until I=0;
 {Schritt 2: 1. Trennzeichen holen}
   repeat
    W:=ReadSwing1;
    if W>22*faktor then goto step1;	{Aussetzer im Vorton}
    if W<5*faktor then goto step1;	{Störnadel im Vorton}
   until W<12*faktor;			{ein halbes Trennzeichen}
   W:=ReadSwing1;
   if W<5 then goto step1;
   if W>=12 then goto step1;	{2. halbes Trennzeichen muß folgen!}
 {Schritt 3: Bytes lesen}
   BlkNum:=Wordin;
   Sum:=BlkNum;
   for I:=0 to 15 do begin
    W:=WordIn;
    Sum:=Sum+W;
    Buffer[I]:=W;
   end;
   If Sum=WordIn then ReadBlock:=true;
  end;


 label nochmal;
 var
  BL:TBL;
  buf: TBlk;
  L:LongInt;

 begin
  SetStat_LOAD(PChar(20));		{'Z1013'}
  InitBL(BL,' %04X%c',6);
  repeat
   BL.ok:=ReadBlock(BL.readbl,buf,50);	{langer Vorton ist hier WICHTIG!}
   BL.expect:=BL.readbl;		{Für den ersten Block kein Hindernis}
   HandleBL(BL);
  until BL.ok;
  AddData(PChar(@Buf),sizeof(buf));
  L:=MaxLongInt;
  BufContent:=DUM;

  if (PChar(@buf)[13]=#$D3)	{Headersave-Vorblock?}
  and (buf[7]=$D3D3) then begin
   z1013_filetyp := HEADERSAVE; {vp}
   GetFileNameZ80(BL.s,PChar(@buf));
   CatHex(BL.s,buf[0]);
   CatHex(BL.s,buf[1]);
   if PChar(@buf)[12]='C' then CatHex(BL.s,buf[2]);
   SetStat_LOAD(BL.s);
   L:=buf[1]-buf[0]+LongInt(32);
   BufContent:=Z80;		{Vorzugs-Speicherformat}
   BL.expect:=buf[0];
   goto nochmal;		{kein INC voraus}
  end else
  if buf[0]=$1000 then begin    {vp: Tiny-Basic-Vorblock?}
   z1013_filetyp := TINYBASIC;
   GetFileNameZ80(BL.s,PChar(@buf));
   CatHex(BL.s,buf[0]);
   CatHex(BL.s,buf[1]);
   SetStat_LOAD(BL.s);
   L:=buf[1]-buf[0]+LongInt(32);
   BufContent:=Z80;		{Vorzugs-Speicherformat}
   BL.expect:=buf[0];
   goto nochmal;		{kein INC voraus}
  end else begin
    z1013_filetyp := UNK;
    BufContent:=Z80;		{Vorzugs-Speicherformat}
  end;

  repeat
   Inc(BL.expect,32);
nochmal:
   BL.ok:=ReadBlock(BL.readbl,buf,8);
   if (BL.readbl = 0) or z1013_all then BL.expect:=BL.readbl; {vp}
   HandleBL(BL);
   if not BL.ok then goto nochmal;
   AddData(PChar(@Buf),sizeof(buf));
   if (L=MaxLongInt)		{Datenmenge: unbekannt?}
   and (ReadSwing2>100*faktor)		{scheint nichts mehr vom Band zu kommen?}
   then break;			{Schleife beenden!}
  until GetSize>=L;
 end;
{-----------------------------------------------------------------------vp}


{BASICODE-Format:
 Vorton: Vollschwingung 2400 Hz ( 9 Samples) Diskriminator:
 Trennz: Vollschwingung 1200 Hz (18 Samples)
 0-Bit:  Vollschwingung 1200 Hz (18 Samples)
 1-Bit:  2 Vollschw.    2400 Hz (9+9 Samples) Diskriminator: 6

 Byte: Trennz, Bit0, Bit1, ... Bit7

 Block: Kein (oder eben nur ein) Block! Nur für Text.

 Datei: Vorton (9000) - 2 (SOT = Start Of Text) - Text -
	3 (EOT = End Of Text) - Prüf-XOR xor 80h - Vorton (3500)
}
procedure ReadDataBasicode; far;
{Kontext: MMTASK.TSK}
 var
  S: array[0..31] of Char;
  I: Integer;
  B,Sum:Byte;

 function Bytein:Byte;
  var
   I,W:Integer;
   B:Byte;
  begin
   for I:=1 to 2 do begin
    W:=ReadSwing1;
    if W<7 then begin
     I:=0;
     continue;
    end;
   end;
   for I:=0 to 7 do begin
    w:=ReadSwing2;
    B:=B SHR 1;
    if w<16 then begin B:=B or $80;ReadSwing2;end;
   end;
   Sum:=Sum xor B;
   Bytein:=B xor $80;
  end;

 var
  w: Word;

 begin
  SetStat_LOAD(PChar(21));		{'BASICODE'}
  BufContent:=BAC;
  for I:=1 to 40 do begin
   W:=ReadSwing1;
   if W>=6 then begin
    I:=0;
    continue;
   end;
  end;
  Sum:=$0;
  If ByteIn=1 then ByteIn;
  Repeat
   B:=ByteIn;
   If B=3 then begin
    B:=Sum;
    If ByteIn<>B then SetStat_LOAD(PChar(22));	{'Lesefehler erkannt!'}
    ShortYield;
    exit;
   end;
   AddData(PChar(@B),1);
   if B=$0D then B:=0;
   B:=B and $7F;
   if B in [1..$1F,$7F] then B:=Byte('.');
   S[I]:=Char(B);
   if I<sizeof(S)-1 then Inc(I);
   if B=0 then begin
    SetStat_LOAD(S);
    I:=0;
   end;
  until false;
 end;

{Automatische Formaterkennung am Vorton:
 2400 Hz -> BASICODE (= MPM-Turbo)
 1050 Hz -> KC
  600 Hz -> Z1013
}

procedure ReadDataAuto; far;
 label step1;
 var
  I,U,O,D,Z: Integer;
  S: TS31;
 begin
  SetStat_LOAD(PChar(16));	{'Suche...'}
step1:
  U:=100; O:=0; Z:=500;
  repeat
   I:=ReadSwing2;
   D:=I div 8 +1;		{erlaubte Differenz O-U}
   U:=min(U,I); O:=max(O,I);
   if U+D<O then goto step1;	{Zu große Abweichung: von vorn!}
   Dec(Z)
  until Z=0;
{  if U>=183 then goto step1;	{Nur Netzbrummen: bis 120 Hz}
{  if O<=1 then goto step1;	{Zu hochfrequent}
  if (U<=9) and (9<=O) then ReadDataBasicode
  else if (U<=21) and (21<=O) then ReadDataKCC
  else if (U<=34) and (34<=O) then ReadDataZ1013
  else begin
   Word(I):=44100 div Word(U+O);
   wvsprintf(S,'%u Hz ???',I);
   SetStat_LOAD(S);
   goto step1;
  end;
 end;

{-Speichern-auf-Kassette-----------------------------------------------------}
procedure WriteB;
{Schreibt ein Sample "Amp" (globale Variable) auf die Wave-Ausgabe}
{Kontext: MMTASK.TSK}
 begin
  with CurWaveHdr^ do begin
   lpData[ByteIndex]:=Char(Integer(Amp)+$80);
   Inc(ByteIndex);
   if ByteIndex>=LongRec(dwBufferLength).Lo
   then begin
    {$IFOPT D+} asm int 3 end; {$ENDIF}
    ProcessBlock;		{vollen Block schreiben}
   end;
  end;
 end;

procedure WriteSwing1(Len:Integer);
{Schreibt eine Halbschwingung der gewünschten Länge mit abgerundeter
 Vorderflanke (nur bei Längen >=4) -
 ansonsten war die Aufzeichnung futsch sowie keine KC-Direktankopplung
 (ohne Magnetband) möglich.}
{Kontext: MMTASK.TSK}
 begin
  if Len>=4 then asm		{bei =4 bleibt die Amplitude auf 7/8}
	mov	al,[Amp]
	neg	al
	push	ax
	 mov	[Amp],0
	 call	WriteB
	pop	ax
	push	ax
	 sar	al,1		{/2, Amp ist immer gerade!}
	 mov	[Amp],al
	 call	WriteB
	pop	ax
	push	ax
	 sar	al,2		{/4}
	 add	[Amp],al	{3/4}
	 call	WriteB
	pop	ax
	push	ax
	 sar	al,3		{/8}
	 add	[Amp],al	{7/8}
	 call	WriteB
	pop	ax
	sub	[Len],4
	mov	[Amp],al
  end else asm
	neg	[Amp]
  end;
  while Len<>0 do begin
   WriteB;			{Rest gerade (Gleichspannung)}
   Dec(Len);
  end;
 end;

procedure WriteSwing2(Len:Integer);
{Ganze Schwingung der gewünschten Länge (in 22-kHz-Samples) schreiben}
{Kontext: MMTASK.TSK}
 var
  Len1:integer;
 begin
  Len1:=idiv2(Len);		{halbieren...}
  WriteSwing1(Len1);
  WriteSwing1(Len-Len1);	{kann unterschiedliche Längen ergeben!}
 end;

procedure WriteDataKCC; far;
{Kontext: MMTASK.TSK}
{Schreibt BytesToWrite Bytes aus dem hBuffer}

 procedure WriteByte(B:Byte); assembler;
  asm
	mov	ah,8
	mov	al,[B]
@@l:	shr	al,1
	push	ax
	 mov	ax,11
	 jnc	@@1
	 mov	al,21
@@1:	 push	ax
	 call	WriteSwing2
	pop	ax
	dec	ah
	jnz	@@l
	push	39
	call	WriteSwing2
  end;

  procedure WriteBlock(BlkNr:Byte; const Buffer:TBlock; Vorton:Integer);
   var
    I,W:Integer;
    B,Sum:Byte;
   begin
    for I:=1 to Vorton do WriteSwing2(21);	{Vorton}
    WriteSwing2(39);				{Trennzeichen}
    WriteByte(BlkNr);
    Sum:=0;
    for I:=0 to $7F do begin
     Inc(Sum,Buffer[I]);
     WriteByte(Buffer[I]);
    end;
    WriteByte(Sum);
   end;

 var
  CurBlk: Byte;
  S: array[0..31] of Char;
  I: Integer;
  buf: TBlock;
  Erster_Block, Letzter_Block: Boolean;
 begin
  SetStat_SAVE(PChar(17));
  CurBlk:=1;
  Erster_Block:=true;
  Letzter_Block:=false;
  repeat
   I:=GetData(PChar(@buf),sizeof(buf));
   if ((I<sizeof(buf)) or (GetSize=0))
   and (not Erster_Block)
   and (CurBlk<>$FF) then begin
    Letzter_Block:=true;
    CurBlk:=$FF;
   end;
   I:=CurBlk;
   wvsprintf(S,' %02X<',I);
   SetStat_SAVE(S);
   I:=$A0;
   if Erster_Block then I:=$A00;
   WriteBlock(CurBlk,buf,I);
   Inc(CurBlk);
   Erster_Block:=false;
  until Letzter_Block;
 end;

procedure WriteDataMPMTurbo; far;
{Kontext: MMTASK.TSK}
{Schreibt BytesToWrite Bytes aus dem hBuffer}

 procedure WriteByte(B:Byte); assembler;
  asm
	mov	ah,8
	mov	al,[B]
@@l:	shr	al,1
	push	ax
	 mov	ax,5
	 jnc	@@1
	 mov	al,12
@@1:	 push	ax
	 call	WriteSwing1
	pop	ax
	dec	ah
	jnz	@@l
  end;

  procedure WriteBlock(BlkNr:Byte; const Buffer:TBlock; Vorton:Integer);
   var
    I,W:Integer;
    B,Sum:Byte;
   begin
    for I:=1 to Vorton do WriteSwing2(10);	{Vorton}
    WriteSwing2(24);				{Trennzeichen}
    WriteByte(BlkNr);
    Sum:=0;
    for I:=0 to $7F do begin
     Sum:=Sum xor Buffer[I];
     WriteByte(Buffer[I]);
    end;
    WriteByte(Sum);
   end;

 var
  CurBlk: Byte;
  S: array[0..31] of Char;
  I: Integer;
  buf: TBlock;
  Erster_Block, Letzter_Block: Boolean;
 begin
  SetStat_SAVE(PChar(18));
  CurBlk:=1;
  Erster_Block:=true;
  Letzter_Block:=false;
  repeat
   I:=GetData(PChar(@buf),sizeof(buf));
   if ((I<sizeof(buf)) or (GetSize=0))
   and (not Erster_Block)
   and (CurBlk<>$FF) then begin
    Letzter_Block:=true;
    CurBlk:=$FF;
   end;
   I:=$70;
   if Erster_Block then I:=$1000;
   WriteBlock(CurBlk,buf,I);
   I:=CurBlk;
   Inc(CurBlk);
   wvsprintf(S,'%02X<',I);
   SetStat_SAVE(S);
   Erster_Block:=false;
  until Letzter_Block;
 end;

procedure WriteDataHSTurbo; far;
{Kontext: MMTASK.TSK}
{Schreibt BytesToWrite Bytes aus dem hBuffer}
 var
  BTW: Longint;
  B:Byte;
  S: TS255;
 begin
  {Loader saven}
  BTW:=BytestoWrite;BytestoWrite:=256;
  WriteDataKCC;
  BytestoWrite:=BTW;
  {eigentliche Daten speichern}
  SetStat_SAVE(PChar(19));	{'Turbo h#s'}
  asm	mov	cx,512
@@l:	push	cx
	 push	30
	 call	WriteSwing2
	pop	cx
	loop	@@l
  end;
  WriteSwing1(9);
  while GetData(PChar(@B),1)<>0 do asm
	mov	cx,8
@@l:	mov	ax,4		{Null-Bit}
	shl	[B],1
	jnc	@@1
	mov	al,9		{Eins-Bit}
@@1:	push	cx
	 push	ax
	 call	WriteSwing1
	pop	cx
	loop	@@l
  end;
 end;

procedure WriteDataZ1013; far;
{Kontext: MMTASK.TSK}
{Schreibt BytesToWrite Bytes aus dem hBuffer}
 type
  TBlk=array[0..15] of Word;
 var
  S: array[0..31] of Char;
  I:integer;
  buf:TBlk;
  W: Word;

 procedure WriteWord(W:Word); assembler;
  asm
	mov	cx,16
	mov	ax,[W]
@@l:	shr	ax,1
	push cx; push ax
	 mov	ax,offset WriteSwing1
	 jnc	@@1
	 mov	ax,offset WriteSwing2
@@1:	 push	9
	 call	ax
	pop ax; pop cx
	loop	@@l
  end;

 procedure WriteBlock(const Buffer:TBlk; W:Word; Vorton:Integer);
  var
   I:Integer;
   Sum:Word;
  begin
   for I:=1 to Vorton do WriteSwing1(17);	{Vorton}
   WriteSwing2(16);				{Trennzeichen}
   WriteWord(W);
   Sum:=0;
   for I:=0 to 15 do begin
    inc(Sum,Buffer[I]);
    WriteWord(Buffer[I]);
   end;
   WriteWord(Sum);
  end;

 begin
  SetStat_SAVE(PChar(20));
  I:=2000;
  W:=0;
  While GetSize>0 do begin
   GetData(PChar(@buf),sizeof(buf));
   wvsprintf(S,'%04X<',W); Setstat_SAVE(s);
   WriteBlock(buf,W,I);
   Inc(W,32);
   I:=14;
  end;
 end;


procedure WriteDataBasicode; far;
{Kontext: MMTASK.TSK}
{Schreibt BytesToWrite Bytes aus dem hBuffer}
 var
  S: array[0..31] of Char;
  I: Integer;
  B,Sum:Byte;

  procedure WriteByte(B:Byte);
   var
    I,W:Integer;
   begin
    Sum:=Sum xor B;
    WriteSwing2(18);
    for I:=0 to 7 do begin
     if B and 1 =0 then WriteSwing2(18)
     else begin WriteSwing2(9);WriteSwing2(9);end;
     B:=B shr 1;
    end;
    WriteSwing2(9);WriteSwing2(9);
   end;

 begin
  SetStat_SAVE(PChar(21));
  Sum:=0;
  for I:=1 to 9000 do WriteSwing2(9);
  WriteByte(2);
  I:=0;
  while GetData(PChar(@B),1)<>0 do begin
   WriteByte(B);
   if B=$0D then B:=0;
   B:=B and $7F;
   if B in [1..$1F,$7F] then B:=Byte('.');
   S[I]:=Char(B);
   if I<sizeof(S)-1 then Inc(I);
   if B=0 then begin
    SetStat_SAVE(S);
    I:=0;
   end;
  end;
  WriteByte(3);
  WriteByte(Sum xor $80);
  for I:=1 to 3500 do WriteSwing2(9);
 end;

{-Dialogfunktionen-----------------------------------------------------------}
const
 ID_OfnWriteProt=1040;
function OFNHook(Wnd:HWnd; Msg,wParam:Word; lParam:Longint):Word; export;
 {trägt lediglich 'mit Vorblock' ein;
  sollt bei SAVE aber erkennen, ob es eine BASIC-Datei ist und das
  OFN_ReadOnly-Flag entsprechend setzen! }
 var
  S: TS31;
 begin
  OFNHook:=0;
  case Msg of
   WM_InitDialog: begin
    LoadString(Seg(HInstance),108,S,sizeof(S));	{"Mit Vorblock"}
    SetDlgItemText(Wnd,ID_OfnWriteProt,S);
   end;
  end{case Msg};
 end;

var
 SFile: TS255;
 SFilter: TS255;
 SExt: TS31;
const
 hm: Word=WM_User+100;	{HelpMessageString-Nachricht}
const
 Ofn: TOpenFileName=(
  lStructSize: sizeof(TOpenFileName);
  hWndOwner: 0;
  hInstance: Seg(HInstance);
  lpstrFilter: SFilter;
  lpstrCustomFilter: SExt;
  nMaxCustFilter: sizeof(SExt);
  nFilterIndex: 0;
  lpstrFile: SFile;
  nMaxFile: sizeof(SFile);
  lpstrFileTitle: nil;
  nMaxFileTitle: 0;
  lpstrInitialDir: nil;
  lpstrTitle: nil;
  Flags: OFN_LongNames or OFN_ShowHelp or OFN_PathMustExist
    or OFN_EnableHook or OFN_OverwritePrompt or OFN_HideReadOnly;
  nFileOffset: 0;
  nFileExtension: 0;
  lpstrDefExt: nil;
  lCustData: 0;
  lpfnHook: OFNHook;
  lpTemplateName: nil);

procedure PrepareOFN;
 var
  SP1,SP2:PChar;
  I: Integer;
 begin
  hm:=RegisterWindowMessage(HelpMsgString);
  Ofn.hWndOwner:=MainWnd;
  LoadString(Seg(HInstance),107,SFilter,sizeof(SFilter));
  AFilter(ofn.nFilterIndex):=Filter;
  if Filter<>NON then begin
   SP1:=SFilter;		{Mißbrauch!}
   for I:=Integer(Filter)*2 downto 2	{min. 1x}
   do Inc(SP1,lstrlen(SP1)+1);
{Bug der COMMDLG.DLL bereinigen}
   if lstrcmp1(SExt+1,SP1,lstrcmp)<>0 then begin
    SP2:=SP1+lstrlen(SP1);	{String-Ende}
    memmove(SP1+lstrlen(SExt+1),SP2,SFilter+sizeof(SFilter)-SP2);
    lstrcpy(SP1,SExt+1);	{User-Extension einfügen}
   end;
  end;
  SFile[0]:=#0;
 end;

function Char_ANSI2KC:Char; assembler;
{6 Zeichencodes (vornehmlich Umlaute) austauschen}
 asm	mov	ah,5Ch		{Pipe-Symbol}
	cmp	al,7Ch
	jz	@@2
	mov	ah,5Dh		{Negations-Zeichen}
	cmp	al,0ACh
	jz	@@2
	mov	ah,7Bh		{ä}
	cmp	al,0E4h
	jz	@@2
	inc	ah		{ö}
	cmp	al,0F6h
	jz	@@2
	inc	ah		{ü}
	cmp	al,0FCh
	jz	@@2
	inc	ah		{ß}
	cmp	al,0DFh
	jnz	@@e
@@2:	xchg	ah,al
@@e:
 end;

procedure PutFileName(pBuf:PChar); assembler;
{Dateiname vom globalen String SFile einbauen;
 dabei Name und Erweiterung mit Leerzeichen auffüllen;
 weitere Voraussetzungen sind gültige Einträge ofn.nFileOffset,
 ofn.nFileExtension und ofn.nFilterIndex.
 Bei Erweiterungen mit 3 gleichen Buchstaben UND ofn.nFilterIndex=3
 (BASIC-Programm) wird diese an den Anfang gezogen und 80h addiert,
 als Extrawurst für BASIC-Programme und ~Daten}
 asm	cld
	les	di,[pBuf]
	xor	dx,dx		{Merk-Register}
	mov	al,byte ptr [ofn.nFilterIndex]
	cmp	al,SSS		{BASIC ausgewählt?}
	jne	@@1		{nein, Extension egal}
	mov	cx,[ofn.nFileExtension]
	jcxz	@@1		{keine Endung!}
	mov	si,offset SFile
	add	si,cx
	lodsb			{1. Zeichen der Endung}
	cmp	[si],al		{Vgl. mit 2. Zeichen}
	jnz	@@1
	cmp	[si+1],al	{Vgl. mit 3. Zeichen}
	jnz	@@1
	and	al,not 20h	{Großbuchstabe}
	cmp	al,'S'
	jc	@@1		{kein .SSS .. .ZZZ}
	cmp	al,'Z'
	ja	@@1
	or	al,80h		{zuerst Extension+80h}
	stosb
	stosb
	stosb
	inc	dl		{Kennungs-Bit: Extension geschrieben}
@@1:	mov	si,offset SFile
	add	si,[ofn.nFileOffset]
	mov	cx,8
@@l1:	lodsb
	or	al,al		{Ende extensionsloser Dateiname}
	jz	@@2
	cmp	al,'.'		{Ende Dateiname (Namensbestandteil)}
	je	@@2		{eigentlich ist der LETZTE Punkt maßgebend!}
	call	Char_ANSI2KC
	stosb
	loop	@@l1
@@2:	mov	al,' '
	rep	stosb		{Rest mit Leerzeichen auffüllen (CX=0 = nix)}
	or	dl,dl		{Endung vorgezogen?}
	jnz	@@3
	inc	dl		{keine Rekursion!}
	mov	cx,[ofn.nFileExtension]
	jcxz	@@2		{Keine Extension?}
	mov	si,offset SFile
	add	si,cx
	mov	cx,3		{noch 3 Bytes löschen!}
	jmp	@@l1		{Extension <blank-padded> anhängen}
@@3: end;

function GetCoding:ACoding;
{Ermittelt Kodierung, löst "automatisch" anhand Filter auf}
 begin
  case Coding of
   AUTO: case Filter of
    Z80: GetCoding:=Z1013;
    BAC: GetCoding:=BASICODE;
    else GetCoding:=KC;
   end;
   else GetCoding:=Coding;
  end;
 end;

function LoadFile:Boolean;
 label exi, exi2;
{ const
  FilterHeaderSizes: array[KCC..BAC] of Byte=($80,0,0,$20,0);}
{  CodingHeaderSizes_C: array[KC..BASICODE] of Byte=($80,$80,0,$20,0);}
{  CodingHeaderSizes_B: array[KC..BASICODE] of Byte=(11,11,0,0,0);}
 var
{  BytesWritten:Longint;}
  f,Add,Sub,I: Integer;
  Sum: Byte;
  pBuf: PChar;
  hLdr: THandle;
  C: Char;
  Autostart: Boolean;
  aadr,eadr,sadr: Word;
  buf: TBlock;
  This_Coding: ACoding;
 begin
  LoadFile:=false;
  PrepareOfn;
  with ofn do begin
   Flags:=Flags or OFN_FileMustExist;
	{or OFN_AllowMultiselect: Zukunftsmusik!}
   if not GetOpenFileName(ofn) then exit;
   Filter:=AFilter(ofn.nFilterIndex);
   {$IFOPT D+} asm int 3 end; {$ENDIF}
   f:=_lopen(SFile,0);
   if f=-1 then goto exi2;
   BytesToWrite:=_llseek(f,0,2);	{Dateilänge}
   if BytesToWrite=0 then goto exi;
   _llseek(f,0,0);			{Zeiger zurück}

   Add:=0;
   case Filter of
    DUM: begin
     if not (Coding in [AUTO,KC,MPM,Z1013])	{Code-Zwang!}
     then This_Coding:=KC;
    end;
    SSS: begin
     if not (Coding in [AUTO,KC,MPM,HS])	{Code-Zwang!}
     then This_Coding:=KC;
     Add:=11;
    end;
    BAC: if not (Coding in [AUTO,BASICODE])	{Code-Zwang!}
    then This_Coding:=BASICODE;
   end;
   if Coding<>This_Coding
   then SendDlgItemMessage(MainWnd,12,CB_SetCurSel,Word(This_Coding),0);
   This_Coding:=GetCoding;

   case This_Coding of
    KC,MPM: begin
     if Filter=DUM then add:=$80;
     if Filter=Z80 then add:=$60;
    end;
    HS: begin
     add:=$80;
     if Filter=DUM then add:=$100;
     if Filter=SSS then add:=$0FE;	{Längen-Byte verschwindet!}
     if Filter=Z80 then add:=$0E0;
     hLdr:=LoadResource(Seg(HInstance),	{Turboloadervorblock}
       FindResource(Seg(HInstance),MakeIntResource(102),RT_RCData));
     if hLdr=0 then RunError(220);	{Böser Fehler!}
    end;
    Z1013: begin
     if Filter=KCC then add:=-$60;
     if Filter=DUM then add:=$20;
    end;
   end;

   Inc(BytesToWrite,Add);
   hBuffer:=GlobalAlloc(GMEM_MoveAble or GMEM_Share,BytesToWrite);
   pBuf:=GlobalLock(hBuffer);
   if This_Coding=HS then begin
    MemMove(pBuf,LockResource(hLdr),$100);
    UnlockResource(hLdr);
    FreeResource(hLdr);
   end;
   Autostart:=false;
    if (Add<>0)
    and (_lread(f,PChar(@buf),Add)<>Add) then goto exi;	{Datei zu kurz}
    case Filter of
     KCC: begin				{.KCC}
      aadr:=PWord(@buf[$11])^;
      eadr:=PWord(@buf[$13])^;
      if buf[$10]>=3 then begin
       Autostart:=true;
       sadr:=PWord(@buf[$15])^;
      end;
     end;
     DUM: begin				{Speicherabzug: hier fest ab 200h}
      aadr:=$200;			{CP/M-Freaks würden hier 100h setzen}
      eadr:=BytesToWrite+aadr;
     end;
     SSS: begin				{BASIC-Programm}
      aadr:=$401;			{wird eigentlich nicht benutzt}
      eadr:=PWord(@buf[0])^+aadr;
     end;
     Z80: begin				{.Z80 - noch nicht benutzt}
      aadr:=PWord(@buf[0])^;
      eadr:=PWord(@buf[2])^;
      if Char(buf[$0C])='C' then begin
       Autostart:=true;
       sadr:=PWord(@buf[4])^;
      end;
     end;
    end{case};

    if Filter=SSS then begin		{Extrawurst für BASIC}
     MemMove(pbuf+$80,pbuf+$70,$0A);
     PWord(@pbuf[$81])^:=eadr;
    end else begin
     PWord(pbuf+$81)^:=aadr;
     PWord(@pbuf[$84])^:=eadr;
    end;
    PWord(pbuf+$A8)^:=eadr-aadr;
    if Autostart then begin
     pbuf[$E0]:=Char($C3);		{JMP nn}
     PWord(pbuf+$E1)^:=sadr;
    end;

    if _hread(f,pbuf+$100,BytesToWrite)<>BytesToWrite then goto exi;
    Inc(BytesToWrite,$100);		{nun: alle Bytes}
    sum:=0;				{Rest laden - Datei zu kurz?}
    for i:=$100 to BytesToWrite-1 do inc(sum,byte(pBuf[I]));
    pBuf[$D8]:=char(Sum);		{Prüfsumme einsetzen}

    GlobalUnlock(hBuffer);
   end;
   hBuffer:=GlobalAlloc(GMEM_MoveAble or GMEM_Share or GMEM_ZeroInit,
     BytesToWrite+Add);
   pBuf:=GlobalLock(hBuffer);
   if _hread(f,pBuf+Add,BytesToWrite)<>BytesToWrite then goto exi;
   Inc(BytesToWrite,Add);
   if (Add<>0)
   or (Filter=KCC) and (pbuf[0]=#0)
   then PutFileName(pBuf);
   if (Filter=DUM)
   and (coding<>HS) then begin
    PByte(pBuf+$10)^:=2;			{ARGN; ARG1 bleibt 0}
    PWord(pBuf+$13)^:=LongRec(BytesToWrite).Lo;	{ARG2=EAdr+1}
   end;
   if _lclose(f)<>0 then goto exi2;
   GlobalUnlock(hBuffer);
   LoadFile:=true;
   exit;
exi:
   _lclose(f);
exi2:
   GlobalUnlock(hBuffer);
   hBuffer:=GlobalFree(hBuffer);
   MBox1(MainWnd,105,SFile);
  end{with};
{ end;}

const
 InvalChars_LFN: array[0..6] of Char='"<|>:\/';	{' .+,;=[]' für SFN}

procedure StripInvalChars(S:PChar); assembler;
 asm	cld
	push	ds
	 push	ds
	 pop	es
	 lds	si,[S]
@@l:	 lodsb
	 or	al,al
	 jz	@@e
	 mov	cx,7
	 mov	di,offset InvalChars_LFN
	 repne	scasb
	 jne	@@l
	 mov	byte ptr [si-1],'_'
	 jmp	@@l
@@e:	pop	ds
 end;

procedure Convert_HS2KCC(pBuf:PChar);
{schaufelt HS-Turbo-Daten in KC-MC oder KC-BASIC-Daten im Speicher um;
 sollte beim Lader geschehen!}
 begin
  if pBuf[$80]=char($21) then begin {Maschinenprg.}
   Dec(BufPtr,$81);
   asm
	les	di,[pBuf]
	mov	si,di
	add	di,11
	xor	ax,ax
	mov	cx,6
	rep	stosb
	add	si,81h
	seges	lodsw
	stosw
	inc	si
	seges	lodsw
	stosw
	add	si,5Ah
	sub	di,5
	push	si
	 seges	lodsb
	 cmp	al,0C3h
	 jnz	@@1
	 mov	al,3
	 stosb
	 add	di,4
	 seges	lodsw
	 jmp	@@2
@@1:	 mov	al,2
	 stosb
	 add	di,4
	 xor	ax,ax
@@2:	 stosw
	 mov	cx,69h
	 xor	ax,ax
	 rep	stosb
	pop	si
	add	si,20h
	mov	cx,word[BufPtr]
@@3:	seges	lodsb
	stosb
	loop	@@3
   end;
   BufContent:=KCC;
  end else begin {BASIC Prg.}
   Dec(BufPtr,$100);
   asm
	les	di,[pBuf]
	mov	si,di
	add	si,81h
	seges	lodsw
	dec	ax
	stosw
	add	si,7Eh
	mov	cx,word[BufPtr]
@@1:	seges	lodsb
	stosb
	loop	@@1
   end;
   BufContent:=SSS;
  end;
 end;


 var filecnt: integer;

function SaveFile:Boolean;
 var
  BytesWritten: Longint;
  f,Add: Integer;		{Add= 0 oder 11}
  pBuf: PChar;
  C: Char;
  WantFilter: AFilter;
  filename: string[8];
 begin
  SaveFile:=false;
  Add:=0;
  pBuf:=GlobalLock(hBuffer);
  if BufContent=NON then Convert_HS2KCC(pBuf);
  Filter:=BufContent;
  PrepareOfn;
{für Turbolader h#s und Z1013 ohne Headersave Dateiname weglassen;
 durch zweckmäßige Vorgabe wie UnbenanntXXX ersetzen}
  case Filter of
   KCC,SSS: GetFileNameKC(SFile,pBuf);
   Z80: begin					{vp}
   	  GetFileNameZ80(SFile,pBuf);

        if autosave then begin {vp}
          inc(filecnt); Str(filecnt, filename);
          strpcopy(SFile, filename);
        end;

          if z1013_filetyp = HEADERSAVE then
      	    lstrcat(SFile,'.Z80')
          else {if z1013_filetyp = TINYBASIC then}
      	    lstrcat(SFile,'.Z13');		{vp}
   	end;
  end;
  { if filename ist leer und autosave, dann auch hochzählen
        if autosave and ... then begin 
          inc(filecnt); Str(filecnt, filename);
          strpcopy(SFile, filename);
        end;
  {vp}
  
  StripInvalChars(SFile);
  with ofn do begin
    if Not autosave Then  { vp }
     if not GetSaveFileName(ofn) then exit;
   WantFilter:=AFilter(ofn.nFilterIndex);
   f:=_lcreat(SFile,0);
   if f=-1 then begin
    GlobalUnlock(hBuffer);
    exit;
   end;
   Dec(BufPtr,Add);
   BytesWritten:=_hwrite(f,pBuf+Add,BufPtr);
   GlobalUnlock(hBuffer);
   if (_lclose(f)<>0) or (BytesWritten<>BufPtr) then begin
    MBox1(MainWnd,106,SFile);
    exit;
   end;
   SaveFile:=true;
  end;
 end;

function GetInt(var S: PChar; Def:Integer):Integer;
{macht strtok() und atoi() oder reicht Def durch}
 var
  SP: PChar;
  I,J: Integer;
 begin
  GetInt:=Def;
  if S=nil then exit;
  SP:=lStrChr(S,' ');
  if SP<>nil then begin
   SP^:=#0;
  end;
  Val(S,I,J);
  if SP<>nil then S:=SP+1;
  if J=0 then GetInt:=I;
 end;


procedure HandleMMError(Code:Integer);
 var
  S: array[0..255] of Char;
 begin
  case Code of
   MMSysErr_Allocated: MBox1(MainWnd,102,nil);
   WAVERR_Sync: MBox1(MainWnd,101,nil);
   else begin
    WaveInGetErrorText(Code,S,sizeof(S));
    MBox1(MainWnd,103,S)
   end;
  end;
 end;

procedure SetModus(NewModus:AModus);
 begin
  if Modus<>NewModus then begin
   Modus:=NewModus;
   DragAcceptFiles(MainWnd,Modus=NONE);
   EnableWindow(GetDlgItem(MainWnd,1),Modus=NONE);
   EnableWindow(GetDlgItem(MainWnd,22),Modus=NONE);
   ShowWindow(GetDlgItem(MainWnd,2),Integer(Modus<>NONE));
   ShowWindow(GetDlgItem(MainWnd,3),Integer(Modus=NONE));
   ShowWindow(GetDlgItem(MainWnd,19),Integer(Modus=LOAD));
  end;
  if GetFocus=0 then SetFocus(GetDlgItem(MainWnd,12));
 end;

function GetLibProc(Entry:PChar):TFarProc;
 var
  P: TFarProc;
  LibName: TS31;
 begin
  GetLibProc:=nil;
  SendDlgItemMsgP(MainWnd,12,CB_GetLbText,Word(coding),@LibName);
  LibInst:=LoadLibrary(LibName);
  if LibInst<32 then begin
   MBox1(MainWnd,114,LibName);
   exit;
  end;
  P:=GetProcAddress(LibInst,Entry);
  if P=nil then begin
   MBox1(MainWnd,115,Entry);
   FreeLibrary(LibInst);
   LibInst:=0;
   exit;
  end;
  GetLibProc:=P;
 end;

procedure DoEndProcess(OK:Boolean);
 begin
  if OK and (Modus=LOAD) then SaveFile;
  if hBuffer<>0 then hBuffer:=GlobalFree(hBuffer);
  if LibInst>=32 then FreeLibrary(LibInst);
  SetModus(NONE);
  if autosave then     {vp}
       SendMessage(MainWnd, WM_Command, 1,0);  { buton 1 click  } ;
 end;

var
 DefEditProc:TFarProc;

function EditHook(Wnd:HWnd;Msg,wParam:Word;lParam:LongInt):LongInt; export;
{Anzapfung Edit-Fenster mit Rollbalken zur bequemen Wert-Veränderung mit
 Maus und/oder Cursortasten (sog. unterklassifiziertes Fenster)}
 var
  I,J,E: Integer;
  S: TS7;
 begin
  EditHook:=0;
  I:=Msg2VScroll(Msg,wParam,2);
  if I=0 then begin
   EditHook:=CallWindowProc(DefEditProc,Wnd,Msg,wParam,lParam);
   exit;
  end;
  GetWindowText(Wnd,S,sizeof(S));
  Val(S,J,E);
  if E<>0 then begin
   MessageBeep(MB_IconHand);
   exit;
  end;
  J:=between(J+I,1,7);
  wvsprintf(S,'%d',J);
  SetWindowText(Wnd,S);
 end;

procedure IODev_AddString(W:HWnd; S:PChar; J,K:Integer);
{Fügt String hinzu mit ItemData J, ist J=K wird dieser Eintrag selektiert.
 Für das Füllen der Ein- und Ausgabe-Geräte-Kombinationsfenster}
 var
  I: Integer;
 begin
  I:=SendMessageP(W,CB_AddString,0,S);
  SendMessage(W,CB_SetItemData,I,J);
  if J=K then SendMessage(W,CB_SetCurSel,I,0);
 end;

function MainDlgProc(Wnd:HWnd; Msg,wParam:Word; lParam:LongInt):Bool; export;
 var
  lPar: LongRec absolute lParam;
  WH: PWaveHdr absolute lParam;
  dis: PDrawItemStruct absolute lParam;
  S: TS255;
  S2: TS31;
  WaveOutCaps: TWaveOutCaps;
  WaveInCaps: TWaveInCaps absolute WaveOutCaps;	{ist kürzer!}
  LF: TLogFont absolute S;
  R: TRect absolute S;
  SP: PChar;
  Proc: TFarProc absolute SP;
  DC: HDC absolute SP;
  W: Word;
  I,J: Integer;
  B: Bool absolute J;
  vsrec: array[0..4] of Integer;
 begin
  MainDlgProc:=false;

  case Msg of
   WM_InitDialog: begin
    MainWnd:=Wnd;		{Globale Variable setzen}
    W:=GetSystemMenu(Wnd,false);
    DeleteMenu(W,SC_Zoom,MF_ByCommand);
    DeleteMenu(W,SC_Size,MF_ByCommand);
    ShowWindow(Wnd,CmdShow);	{Icon? - Sofort wirksam machen!}
    Back:= CreateSolidBrush($FF0000);	{KC-Blau}
    Green:=CreateSolidBrush($008000);	{dunkelgrün}
    PostMessage(Wnd,WM_ContinueInit,0,0);
   end;

   WM_ContinueInit: begin
    LongInt(DefEditProc):=
    SetWindowLong(GetDlgItem(Wnd,11),GWL_WndProc,LongInt(@EditHook));
    SetWindowLong(GetDlgItem(Wnd,13),GWL_WndProc,LongInt(@EditHook));
    UpdateWindow(Wnd);		{würde in InitDialog nichts bringen !!}
    SP:=nil;
    if RegGetRoot(RegPath,S,sizeof(S)) then begin
     SP:=S;
     Installed:=true;
    end;
    Retries:=GetInt(SP,4);
    Coding:=ACoding(GetInt(SP,0));
    WaveVol:=GetInt(SP,4);
    WaveInDev:=GetInt(SP,0);
    WaveOutDev:=GetInt(SP,0);
    SetDlgItemInt(Wnd,11,Retries,true);
    if WaveInDev=-2 then EnableWindow(GetDlgItem(Wnd,11),false);
    LoadString(Seg(HInstance),104,S,sizeof(S));	{Kassetten-Formate}
    SP:=S;
    W:=GetDlgItem(Wnd,12);	{CB Format}
    while SP^<>#0 do begin
     SendMessageP(W,CB_AddString,0,SP);
     Inc(SP,lstrlen(SP)+1);
    end;
    SendMessageP(W,CB_Dir,0,PChar(UserDllFilter));
    SendMessage(W,CB_SetCurSel,Word(Coding),0);
    SetDlgItemInt(Wnd,13,WaveVol,true);
    W:=GetDlgItem(Wnd,14);	{Handle Kombifenster WaveIN}
    LoadString(Seg(HInstance),112,S2,sizeof(S2));	{"Datei %s"}
    SP:=WaveFileName;
    wvsprintf(S,S2,SP);
    IODev_AddString(W,S,-2,WaveInDev);
    I:=WaveInGetNumDevs;
    for J:=-1 to I-1 do begin	{mit Wave_Mapper (-1) beginnen}
     if (WaveInGetDevCaps(Word(J),@WaveInCaps,sizeof(WaveInCaps))=0)
     and (WaveInCaps.dwFormats and WAVE_Format_2M08 <>0)
     then IODev_AddString(W,WaveInCaps.szPName,J,WaveInDev);
    end;
    W:=GetDlgItem(Wnd,15);	{Handle Kombobox WaveOUT}
    IODev_AddString(W,S,-2,WaveOutDev);
    I:=WaveOutGetNumDevs;
    for J:=-1 to I-1 do begin	{mit Wave_Mapper (-1) beginnen}
     if (WaveOutGetDevCaps(Word(J),@WaveOutCaps,sizeof(WaveOutCaps))=0)
     and (WaveOutCaps.dwFormats and WAVE_Format_2M08 <>0)
     and (WaveOutCaps.dwSupport and WAVECAPS_Sync =0)
     then IODev_AddString(W,WaveOutCaps.szPName,J,WaveOutDev);
    end;
    GetObject(SendMessage(Wnd,WM_GetFont,0,0),sizeof(lf),@lf);
    lstrcpy(lf.lfFaceName,'Courier');
    lf.lfWeight:=FW_Bold;
    Font:=CreateFontIndirect(lf);
    W:=GetDlgItem(Wnd,10);
    SendMessage(W,WM_SetFont,Font,0);
    DC:=GetDC(W);
    wParam:=SelectObject(DC,Font);
    lParam:=GetTextExtent(DC,'X',1); {So viel Aufwand für eine Zeichenbreite!}
    SelectObject(DC,wParam);
    ReleaseDC(W,DC);
    GetClientRect(W,R);
    StatusChars:=max((R.right-R.left) div lPar.hi,31);
    DragAcceptFiles(Wnd,true);
   end;

   WM_CtlColor: if (lPar.Hi=CtlColor_Static)
   and (GetDlgCtrlID(lPar.Lo)=10) then begin
    MainDlgProc:=Bool(Back);
    SetTextColor(wParam,$FFFFFF);
    SetBkMode(wParam,Transparent);
   end;

   WM_EndProcess: DoEndProcess(Boolean(wParam));

   WM_SetStatus: begin
    SetDlgItemText(Wnd,10,StatusBuf);
   end;

   WM_ReportWaveError: begin	{in MMTASK Fehler bei WaveInOpen()}
    HandleMMError(wParam);
    hBuffer:=GlobalFree(hBuffer);
    SetModus(NONE);
   end;

   WM_DrawItem: with dis^ do begin
    I:=rcitem.left;
    J:=rcItem.right;
    rcItem.right:=MulDiv(WavePeak,J-I,128)+I;
    FillRect(hDC,rcItem,Green);
    rcItem.left:=rcItem.right; rcItem.right:=J;
    FillRect(hDC,rcItem,GetStockObject(Gray_Brush));
    rcItem.left:=I;		{restaurieren (sicherheitshalber)}
   end;

   WM_QueryEndSession: if (Modus<>NONE)
   and (MBox1(Wnd,113,nil)<>IDYes) then MainDlgProc:=true;

   WM_EndSession: if Bool(wParam) and Installed
   then SendMessage(Wnd,WM_Command,23,0);

   WM_Close: begin
    if (Modus<>NONE) then begin
     if MBox1(Wnd,113,nil)<>IDYes then begin
      MainDlgProc:=true;		{Nicht beenden!}
      exit;
     end;
     SendMessage(Wnd,WM_Command,IDCancel,0);
    end;
    DeleteObject(Green);
    DeleteObject(Back);
    DeleteObject(Font);
    if Installed then SendMessage(Wnd,WM_Command,23,0);
    EndDialog(Wnd,1);
   end;

   WM_Command: case wParam of
{Änderungen an den Eingabe-Elementen erfassen}
    11: if lPar.Hi=EN_Change then begin
     I:=GetDlgItemInt(Wnd,wParam,nil,true);
     if (I>0) and (I<=7) then Retries:=I;
    end;
    12: if lPar.Hi=CBN_SelChange then begin
     I:=SendMessage(lPar.Lo,CB_GetCurSel,0,0);
     if I>=0 then Coding:=ACoding(I){SendMessage(lPar.Lo,CB_GetItemData,I,0)};
    end;
    13: if lPar.Hi=EN_Change then begin
     I:=GetDlgItemInt(Wnd,wParam,nil,true);
     if (I>0) and (I<=7) then begin
      WaveVol:=I;
      I:=sqr(WaveVol)*2;
      if Amp>=0 then Amp:=I else Amp:=-I;
     end;
    end;
    14: if lPar.Hi=CBN_SelChange then begin
     I:=SendMessage(lPar.Lo,CB_GetCurSel,0,0);
     if I>=0 then begin
      WaveInDev:=SendMessage(lPar.Lo,CB_GetItemData,I,0);
      EnableWindow(GetDlgItem(Wnd,11),WaveInDev<>-2);
     end;
    end;
    15: if lPar.Hi=CBN_SelChange then begin
     I:=SendMessage(lPar.Lo,CB_GetCurSel,0,0);
     if I>=0 then WaveOutDev:=SendMessage(lPar.Lo,CB_GetItemData,I,0);
    end;
{Tastendrücke}
    3: SendMessage(Wnd,WM_Close,0,0);	{Programmende}

    IDCancel: begin			{Abbruch}
     LoadString(Seg(HInstance),110,S,sizeof(S));
     SetDlgItemText(MainWnd,10,S);
     if Modus<>NONE then begin
      if IsTask(Task) then PostAppMessage(Task,WM_Quit,0,0)
      else SetModus(NONE);
     end;
    end;

    1: if Modus=NONE then begin		{Datei einlesen}
     case coding of
      AUTO:	Proc:=@ReadDataAuto;
      KC:	Proc:=@ReadDataKCC;
      MPM:	Proc:=@ReadDataMPMTurbo;
      HS:	Proc:=@ReadDataHSTurbo;
      Z1013:	begin z1013_all := false; Proc:=@ReadDataZ1013; end; {vp}
      BASICODE:	Proc:=@ReadDataBasicode;
      Z1013ALL:	begin z1013_all := true; Proc:=@ReadDataZ1013; end;  {vp}
      else begin
       Proc:=GetLibProc('LOAD');		{Benutzer-definiert...}
       if Proc=nil then exit;
      end;
     end;
     hBuffer:=GlobalAlloc(GMEM_MoveAble or GMEM_Share,$8000);
     BufPtr:=0;
     SetModus(LOAD);
     MMTaskCreate(@WaveInTask,Task,LongInt(Proc));
    end;

    22: if Modus=NONE then begin		{Datei ausgeben}
     if not LoadFile then exit;
     case GetCoding of
      KC:	Proc:=@WriteDataKCC;
      MPM:	Proc:=@WriteDataMPMTurbo;
      HS:	Proc:=@WriteDataHSTurbo;
      Z1013:	Proc:=@WriteDataZ1013;
      BASICODE:	Proc:=@WriteDataBasicode;
      else begin
       Proc:=GetLibProc('SAVE');
       if Proc=nil then exit;
      end;
     end;
     BufPtr:=0;
     Amp:=sqr(WaveVol)*2;
     SetModus(SAVE);
     MMTaskCreate(@WaveOutTask,Task,LongInt(Proc));
    end;

    23: begin
     Installed:=true;
     wvsprintf(S,'%d %d %d %d %d',Retries);
     RegSetRoot(RegPath,S);
    end;

    9: WinHelp(Wnd,HelpFileName,HELP_Contents,0);

	  18: {vp, autom. speichern} begin
	    i := Sendmessage(lPar.Lo,bm_getcheck,0,0);
	    autosave := (i <> 0);
	  end;
	  
   end{WM_Command};
  else if Msg=hm then WinHelp(Wnd,HelpFileName,HELP_Context,1);
  end;
 end;

const
 wc:TWndClass=(
  style:	CS_VRedraw or CS_HRedraw;
  lpfnWndProc:	@DefDlgProc;
  cbClsExtra:	0;
  cbWndExtra:	DlgWindowExtra;
  hInstance:	Seg(HInstance);
  hIcon:	0;
  hCursor:	0;
  hbrBackground:Color_Background+1;
  lpszMenuName: nil;
  lpszClassName:'KCLOAD');

{FAR+EXPORT-Wrapper-Routinen (interne Routinen arbeiten mit NEAR)}
function ReadSwing:Integer; export;
 begin ReadSwing:=ReadSwing1; end;

procedure WriteSwing(Len:Integer); export;
 begin WriteSwing1(Len); end;

procedure EndProcess(OK:Boolean); export;
 begin EndProcess1(OK); end;

function SetStatus(S:PChar):Integer; export;
 begin
  if Modus=LOAD
  then SetStatus:=SetStat_LOAD(S)
  else SetStatus:=SetStat_SAVE(S);
 end;

function GetSizeData:Longint; export;
 begin GetSizeData:=GetSize; end;

function GetDataBlock(P:PChar; Size:Integer):Integer; export;
 begin GetDataBlock:=GetData(P,Size); end;

procedure AddDataBlock(P:PChar; Size:Integer); export;
 begin AddData(P,Size); end;

procedure GetName(P:PChar; Size:Integer); export;
 begin lstrcpyn(P,SFile+ofn.nFileOffset,Size); end;

procedure SetNameHint(P:PChar); export;
 begin lstrcpyn(SFile,P,sizeof(SFile)); end;

exports
 ReadSwing	index 2,	{Flußwechsel lesen}
 WriteSwing	index 3,	{Flußwechsel schreiben}
 EndProcess	index 4,	{Vorzeitig abbrechen}
 SetStatus	index 5,	{Statuszeile setzen}
 GetSizeData    index 6,	{restliche Bytes ermitteln}
 GetDataBlock	index 7,	{Nächsten Datenblock aus Puffer lesen}
 AddDataBlock	index 8,	{Neuen Datenblock in Puffer anhängen}
 GetName	index 9,	{DOS-Dateiname holen}
 SetNameHint	index 10;	{DOS-Dateiname vorschlagen}

begin
 LoadString(Seg(HInstance),100,AppName,sizeof(AppName));
 WUtils.StdMBoxTitle:=AppName;	{MessageBox-Titel in Unit setzen}
 if HPrevInst<>0 then begin	{Nicht doppelt starten!}
  MainWnd:=FindWindow('KCLOAD',nil);
  SetActiveWindow(MainWnd);
  ShowWindow(MainWnd,SW_Restore);
  halt(221);
 end;
 wc.hIcon:=LoadIcon(Seg(HInstance),MakeIntResource(100));
 wc.hCursor:=LoadCursor(0,IDC_Arrow);
 RegisterClass(wc);
 DialogBox(Seg(HInstance),MakeIntResource(100),0,@MainDlgProc);
end.

{
Log der Veränderungen:
01/02:
* Wave-Datei-Verarbeitung auf Windows-Chunk-Befehle umgestellt
- Wave-Datei-Voreinstellung in Kombinationsfenster korrigiert
}

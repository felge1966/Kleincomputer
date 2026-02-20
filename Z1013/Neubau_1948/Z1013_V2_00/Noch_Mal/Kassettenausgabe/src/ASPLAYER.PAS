unit Asplayer;  { Asynchroner WAV-Player, 06-JUL-97 as (Arne Schäpers) }

{ Funktionaler Unterschied gegenüber MPlayer: Die Möglichkeit, auch nach
  StartPlaying mit Write weitere abzuspielende WAV-Daten hinzuzufügen. }

{ Anpassung D5 vp040224 }

interface
uses WinTypes, WinProcs, SysUtils, Classes, Forms, MMSystem;

const WaveOutMaxBuffers = 999;  { Maximal 1000 WAV-Puffer }
type
  TAsyncplayerMode = (asClosed, asWaiting, asPlaying);
  TWaveHdrAry = Array[0..WaveOutMaxBuffers] of PWaveHdr;
  TAsyncPlayer = class(TComponent)
  private
    FMMResult: Integer;  { Ergebnis der letzten MMSystem-Operation }
    FMode: TAsyncPlayerMode;
    FMSecPending: LongInt;  { für Positionsbestimmungen }
    FPlayBufSize: Word;
    WaveOutHandle: Integer;  { Ausgabegerät }
    WaveOutHeaderCount: Integer; { Anzahl definierter Puffer }
    WaveOutHeaders: ^TWaveHdrAry;
    WaveOutSuspended: Boolean;   { True: Puffer aufstapeln (Vorausberechnung) }
    WaveOutBuffersPending: Integer;  { noch nicht abgespielte Puffer }
  protected
   procedure Callback(Msg: Word; Param1, Param2: LongInt);
   procedure CheckIfOpen;    { XRef: Write, StartPlaying }
   procedure HandleMMError;  { if FMMResult <> 0 then Exception(MM-Msg) }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Open(SamplesPerSec: LongInt; BitsPerSample, Channels: Integer);
    procedure StartPlaying;
    procedure Write(Buf: Pointer; ByteCount, MSec: LongInt);
    procedure Stop;
    procedure Close;
  public
    property Mode: TAsyncPlayerMode read FMode;
    property PlayBufSize: Word read FPlayBufSize;
    property MMResult: Integer read FMMResult;  { für post mortem-Checks }
    property MSecPending: LongInt read FMSecPending;  { Positionsbestimmung }
  end;

implementation
{ Man will es ja nicht recht glauben, aber die SoundBlaster ASP-32 spielt
  bei Stereo und PlayBufSize 4096 die ersten 2048 Bytes doppelt ab. }
const
  MonoPlayBufSize = 4096;
  StereoPlayBufSize = 2*MonoPlayBufSize;

{ Format-Festlegung für die Wiedergabe. In D2/D3 fehlt das Attribut "packed",
  weshalb der Compiler dort für ein DWORD-Aligment der einzelnen Felder
  sorgen will }
type
  PPCMWaveFormatEx = ^TPCMWaveFormatEx;
  TPCMWaveFormatEx = packed record
    wFormatTag: SmallInt; { 1 = wave_Format_PCM, 2 = wave_Format_ADPCM }
    nChannels: SmallInt;  { 1 = Mono, 2 = Stereo, Rest = Theorie }
    nSamplesPerSec: Longint;  { Samplerate  }
    nAvgBytesPerSec: Longint; { PCM : SampleRate*Channels*BitsPerSample div 8 }
    nBlockAlign: SmallInt;    { PCM: BitsPerSamle div 8 * Channels (= 1,2,4) }
    { ---- das ist der "Ex"-Teil ---- }
    wBitsPerSample: SmallInt; { PCM: 8 oder 16, ADPCM: immer 16 }
  end;

{ Rückruf von MMSystem für Öffnen, Schließen und Rückgabe von Puffern.
  Wird bei Open eingesetzt, dwInstance = Self }
procedure PlayerCallback(WaveOutHandle: Integer; Msg: Word;
  dwInstance: TAsyncPlayer; Param1, Param2: LongInt);
{$IFDEF WIN32} stdcall; {$ELSE} export; {$ENDIF}
begin
  { Die "Smart Callbacks" von Delphi16 wollen das DS-Register auf den
    Stack von MMSystem setzen - tut dem System nicht sonderlich gut }
  {$IFNDEF WIN32} asm mov ax,SEG @DATA; mov ds,ax; end; {$ENDIF}
  dwInstance.Callback(Msg,Param1,Param2);  { -> TAsyncPlayer.Callback }
end;

{ XRef: Ausschließlich PlayerCallback }
procedure TAsyncPlayer.Callback(Msg: Word; Param1, Param2: LongInt);
begin
  case Msg of
    WOM_OPEN: ;  { Reaktion auf erfolgreiches waveOutOpen }

    WOM_DONE: { Rückgabe eines "abgespielten" Puffers }
      with PWaveHdr(Param1)^ do
      begin
        Dec(FMSecPending, dwUser and not (LongInt(1) shl 31));
        dwUser := 0;  { Puffer ist frei }
        Dec(WaveOutBuffersPending);
        if WaveOutBuffersPending = 0 then FMode := asWaiting;  { else asPlaying }
      end;

    WOM_CLOSE:  { Reaktion auf erfolgreiches waveOutClose }
       waveOutHandle := 0;
    else
      ;   { sonst sollte hier eigentlich nichts ankommen }
  end;
end;

constructor TAsyncPlayer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMode := asClosed; FPlayBufSize := MonoPlayBufSize;
  { 4000 Bytes auf dem Heap für maximal 1000 Puffer (= 4 MByte WAV-Daten) }
  New(WaveOutHeaders); WaveOutHeaderCount := 0;  { kein Header besetzt }
  FillChar(WaveOutHeaders^,SizeOf(WaveOutHeaders^),0);
end;

destructor TAsyncPlayer.Destroy;
begin
  Close;  { waveoutReset, Unprepare, Freigabe der Wave-Header+Buffer }
  Dispose(WaveOutHeaders);
  inherited Destroy;
end;

procedure TAsyncPlayer.Open(SamplesPerSec: LongInt; BitsPerSample, Channels: Integer);
var
  SampleFormat: LongInt;  { Bitflag fürs Ausgabeformat }
  DevCaps: TWaveOutCaps;
  x: Cardinal;
  OutDeviceID: Cardinal;
  WaveFormat: TPCMWaveFormatEx;
begin
  Close;  { falls da noch irgendwas läuft }
  { Gewünschtes WAV-Format zusammensetzen (= 1 einziges gesetztes Bit)
    11025 Hz = $01, 22050 Hz = $10, 44100 Hz = $100,
      Stereo = $02,   Stereo = $20,   Stereo = $200,
      16 = $04/$08,   16 = $40/$80,  16 = $400/$800 }
  SampleFormat := LongInt(1) shl ((SamplesPerSec div 11025 -1) * 4
   + Channels div 2 + (BitsPerSample div 16) * 2);
  { Wiedergabegerät ermitteln (Win32: Immer Wave-Mapper) }
  OutDeviceID := WAVE_MAPPER;
  for x := WAVE_MAPPER to waveOutGetNumDevs-1 do begin
    waveOutGetDevCaps(x, @DevCaps, SizeOf(DevCaps));
    if DevCaps.dwFormats and SampleFormat <> 0 then
    begin
      OutDeviceID := x;
      Break;
    end;
  end;
  { Das ist auch mal wieder was ganz Besonderes: Wenn man den Wave Mapper
    haben will, darf man ihn unter Win32 nicht angeben - unter Win31 muß er rein. }
  {$IFDEF WIN32} if OutDeviceID = WAVE_MAPPER then OutDeviceID := 0; {$ENDIF}
  { Einfüllen der Parameter für das Open des Wiedergabegeräts }
  with WaveFormat do
  begin
    wFormatTag := Wave_Format_PCM;  { 1 - ADPCM wäre 2 }
    nChannels := Channels; nSamplesPerSec := SamplesPerSec;
    nAvgBytesPerSec := LongInt(SamplesPerSec)*Channels*BitsPerSample div 8;
    nBlockAlign := BitsPerSample div 8 * Channels;
    wBitsPerSample := BitsPerSample;
  end;
  { Open des Wiedergabegeräts. Hat einen ersten (ignorierten) Rückruf zur Folge }
  FMMResult := waveOutOpen(@WaveOutHandle, OutDeviceID, @WaveFormat,
     LongInt(@PlayerCallback), LongInt(Self),  { dwInstance in PlayerCallback }
     CALLBACK_FUNCTION {$IFDEF WIN32} or WAVE_MAPPED {$ENDIF});
  HandleMMError;  { except if FMMResult <> 0 }
  FMode := asWaiting;  { Wiedergabegerät ist geöffnet und wartet auf Daten }
  WaveOutSuspended := True;  { Write: Daten aufstapeln, nicht übergeben }
  WaveOutBuffersPending := 0;  { bis dato keine an MMSystem übergebenen Puffer }
  { Bei Stereo müssen die Puffer für bestimmte §$%@@!-Soundkarten doppelt so
    groß sein, damit sich die Treiber nicht am ersten Block verschlucken }
  if Channels = 1 then FPlayBufSize := MonoPlayBufSize
    else FPlayBufSize := StereoPlayBufSize;
end;

{ Ausgabegerät zurücksetzen, Puffer freigeben, schließen. Keine Prüfung von
  MMResult - Close ist Teil des graceful exit bei Fehlern in anderen Methoden }
procedure TAsyncPlayer.Stop;
var x: Integer;
begin
  if waveOutHandle = 0 then Exit;
  { Gibt schlagartig alle Puffer zurück (WaveOutBuffersPending Aufrufe von Callback) }
  waveOutReset(WaveOutHandle);

  { Freigabe der Puffer }
  for x := 0 to WaveOutHeaderCount-1 do
  begin
    waveOutUnprepareHeader(WaveOutHandle, WaveOutHeaders^[x], SizeOf(TWaveHdr));
    FreeMem(WaveOutHeaders^[x]^.lpData,PlayBufSize);
    Dispose(WaveOutHeaders^[x]); WaveOutHeaders^[x] := nil;
  end;
  WaveOutHeaderCount := 0; WaveOutBuffersPending := 0;
end;

procedure TAsyncPlayer.Close;
begin
  if waveOutHandle = 0 then Exit;
  Stop;
  waveOutClose(WaveOutHandle);  { Callback setzt waveOutHandle zurück }
  FMode := asClosed;
end;

{ Schaltet auf "Übergabe" um und sendet die bis dato gefüllten Puffer. Weitere
  Aufrufe von Write übergeben Daten direkt an MMSystem (ohne Aufstapeln). }
procedure TAsyncPlayer.StartPlaying;
var x: Integer;
begin
  if not WaveOutSuspended then Exit;  { dann hatten wir das schon mal }
  CheckIfOpen;
  WaveOutSuspended := False;
  for x := 0 to WaveOutHeaderCount-1 do
    if WaveOutHeaders^[x]^.dwUser <> 0 then  { Puffer besetzt? }
    begin  { -> ja, Übergabe an MMSystem }
      FMMResult := waveOutWrite(WaveOutHandle,WaveOutHeaders^[x],SizeOf(TWaveHdr));
      HandleMMError;  { if MMResult <> 0 then Close/Except }
      FMode := asPlaying;
    end;
  { Wenn kein einziger Puffer übergeben wurde (Open; StartPlaying), dann
    bleibt es auch hier beim Modus asWaiting }
end;

{ Verteilt die übergebenen WAV-Daten auf eine entsprechende Anzahl von WaveOut-
  Puffern. if WaveOutSuspended: Aufstapeln, sonst sofortige Übergabe }
procedure TAsyncPlayer.Write(Buf: Pointer; ByteCount, MSec: LongInt);
var P: PWaveHdr; BufIndex: Integer; FoundEmptyBuf: Boolean;
   Chunk, BytesToGo: LongInt;
begin
  CheckIfOpen;  { except if not }
  { Buf -> waveOut-Puffer. Die als MSec übergebene Zeit wird anteilig
    in die unteren 31 Bit von dwUser eingesetzt }
  BytesToGo := ByteCount;
  while BytesToGo > 0 do
  begin     { Suche nach einem leeren (= wieder zurückgegebenen) Puffer }
    FoundEmptyBuf := False;
    for BufIndex := 0 to WaveOutHeaderCount-1 do
      with WaveOutHeaders^[BufIndex]^ do
      if dwUser = 0 then
      begin
        FoundEmptyBuf := True; Break;
      end;
    if not FoundEmptyBuf then
    begin { schlicht einen neuen Puffer belegen }
      if WaveOutHeaderCount >= WaveOutMaxBuffers-1 then
      begin  { Vorsicht ist die Mutter der Porzellankiste }
        Close;
        raise Exception.Create('TAsyncPlayer.Write: WaveOutMaxBuffers überschritten');
      end;
      BufIndex := WaveOutHeaderCount;  { erstes unbesetztes Element }
      Inc(WaveOutHeaderCount);
      New(P); FillChar(P^,SizeOf(P^),0); WaveOutHeaders^[BufIndex] := P;
      with P^ do
      begin
        dwBufferLength := PlayBufSize; { wird später variabel gesetzt }
        {$IFDEF WIN32} GetMem(lpData,PlayBufSize); {$ELSE}
        lpData := GlobalLock(GlobalAlloc(GMEM_MOVEABLE or GMEM_SHARE,PlayBufSize));
        {$ENDIF}
      end;
      waveOutPrepareHeader(WaveOutHandle, P, SizeOf(TWaveHdr));
    end;

    Chunk := BytesToGo; if Chunk > PlayBufSize then Chunk := PlayBufSize;
    with WaveOutHeaders^[BufIndex]^ do
    begin
      { dwUser-Feld im Wave-Header: MSB = frei/belegt
        B0..B30 = anteilige Zeit (MSec ist vom Aufrufer festgelegt, kann 0 sein) }
      dwUser := (MSec * Chunk) div ByteCount;  { anteilige Zeit }
      Inc(FMSecPending,dwUser);  { so viele MSec sind jetzt "draußen" }
      dwUser := dwUser or (LongInt(1) shl 31);  { MSB setzen: "belegt" }
      dwBufferLength := Chunk;  { kann ohne weiteres kleiner als PlayBufSize sein }
      { Win16: hmemcpy funktioniert auch über Segmentgrenzen hinweg, Move nicht }
      {$IFDEF WIN32} Move(Buf^,lpData^,Chunk); {$ELSE} hmemcpy(lpData,Buf,Chunk); {$ENDIF}
    end;
    if not WaveOutSuspended then
    begin
      FMMResult := waveOutWrite(WaveOutHandle,WaveOutHeaders^[BufIndex],SizeOf(TWaveHdr));
      HandleMMError;
      FMode := asPlaying;
    end; { else bleibt der Puffer bis zu StartPlaying stehen }
    Inc(WaveOutBuffersPending);
    Dec(BytesToGo,Chunk);
    {$IFDEF WIN32} Inc(PByte(Buf),Chunk); {$ELSE}  { Win16: ggf. Segmentwechsel }
    asm mov ax, Word Ptr [Chunk]; add Word Ptr[Buf],ax;
    jnc @@1; add Word Ptr [Buf+2],8; @@1: end; {$ENDIF}
  end;  { while BytesToGo > 0 }
  { Wenn demnächst die Puffer ausgehen (was eigentlich nur bei extrem aufwendigen
    Berechnungen in übergeordneten Routinen der Fall sein kann: StartPlaying, weil ein
    Stottereffekt immer noch besser als ein Abbruch per Exception ist }
  if WaveOutSuspended and (WaveOutHeaderCount > waveOutMaxBuffers - 10) then StartPlaying;
end;

procedure TAsyncPlayer.CheckIfOpen;
begin
  if WaveOutHandle = 0 then
    raise Exception.Create('TASyncPlayer: kein Ausgabegerät geöffnet');
end;

procedure TAsyncPlayer.HandleMMError;
var Buf: Array[0..255] of Char;
begin
  if MMResult = 0 then Exit;
  Close;  { wegen der direkten Callbacks lebensnotwendig }
  waveOutGetErrorText(FMMResult,Buf,255);
  raise Exception.Create(StrPas(Buf));
end;

end.








unit umain;

{ Programm: ZSAVE
 Speichern im Z1013-Headersave-Format
 Volker Pohlers, 200x

  History:
   v0.1
 v0.2 12.01.2017 zusätzlicher Swing am Ende, damit das letzte Bit komplett gelesen wird.
    v0.3 14.02.2017 Checkbox Headersave, falls ohne Kopfblock (orig. Z1013) erzeugt werden soll
    v0.4 20.7.2017 Umstellung auf Delphi 10.2 und CHM-Hilfe
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, asplayer, uZ80File, System.StrUtils, System.UITypes,
  Vcl.HtmlHelpViewer;

type
  TfrmKCSave = class(TForm)
    Button3: TButton;
    Button4: TButton;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Button2: TButton;
    edVolume: TEdit;
    UpDown1: TUpDown;
    GroupBox2: TGroupBox;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    AADR: TEdit;
    EADR: TEdit;
    SADR: TEdit;
    edFilename: TEdit;
    Label11: TLabel;
    SaveDialog1: TSaveDialog;
    TYP: TEdit;
    Label1: TLabel;
    Button5: TButton;
    Checkbox1: TCheckbox;
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure UpDown1Exit(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private-Deklarationen }
    GlobalCookie: Word; { Rekursionserkennung/-bremse }
    Player: TASyncPlayer;
    bWAV: boolean;
    WAVFile: TFileStream;
    procedure SaveFileWAV(filename: string);
  public
    { Public-Deklarationen }
  end;

var
  frmKCSave: TfrmKCSave;
  Z80File: TZ80File;

implementation

uses Math;

{$R *.DFM}

procedure TfrmKCSave.Button3Click(Sender: TObject);
begin
  if frmKCSave.Player.Mode <> asPlaying then
    Close
  else
  begin
    Player.Stop; { Ruhe im Schiff! }
    Inc(GlobalCookie); { laufende Loops beenden }
  end;
end;

procedure TfrmKCSave.FormCreate(Sender: TObject);
begin
  Player := TASyncPlayer.Create(Self);
  Z80File := TZ80File.Create;
end;

procedure TfrmKCSave.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Player.Stop; { Ruhe im Schiff! }
  Inc(GlobalCookie); { laufende Loops beenden }
end;

{ KC-File einlesen. Format ist egal, es wird alles ins AF-Format gewandelt }

procedure TfrmKCSave.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Z80File.LoadFile(OpenDialog1.FileName);

    edFilename.Text := Z80File.Header.dateiname;
    typ.text := Z80File.Header.dateityp;
    aadr.text := Format('%.4x', [Z80File.Header.aadr]);
    eadr.text := Format('%.4x', [Z80File.Header.eadr]);
    sadr.text := Format('%.4x', [Z80File.Header.sadr]);

    Button2.Enabled := True; { WAV-Ausgabe aktivieren }
    Button5.Enabled := True; { Speichern aktivieren }
  end;
end;

{ KC-File Speichern }

procedure TfrmKCSave.Button5Click(Sender: TObject);
var
  ext: string;
begin
  SaveDialog1.FileName := ChangeFileExt(OpenDialog1.FileName, '');
  SaveDialog1.Filterindex := 1;
  if SaveDialog1.Execute then
  begin
    //ext := AnsiLowerCase(ExtractFileExt(SaveDialog1.FileName));
    if ext = '' then
    begin
      case SaveDialog1.Filterindex of
        1: ext := '.wav';
      end;
      SaveDialog1.FileName := SaveDialog1.FileName + ext;
    end;

    if FileExists(SaveDialog1.FileName) then
      if MessageDlg('Die Datei "' + SaveDialog1.FileName +
        '" gibt es bereits. Überschreiben?', mtConfirmation, [mbYes, mbNo,
        mbCancel], 0) <> mrYes then
        exit;

    if ext = '.wav' then
      SaveFileWAV(SaveDialog1.FileName);
  end;
end;

var
  Amp: ShortInt = 32; {Momentanwert (also Elongation!)}

  { Ändern der Lautstärke }

procedure TfrmKCSave.UpDown1Exit(Sender: TObject);
begin
  if Amp >= 0 then
    Amp := sqr(UpDown1.Position) * 2
  else
    Amp := -sqr(UpDown1.Position) * 2;
end;

{ --------------------------------------------------------------------------- }
{ die Soundausgabe unter Nutzung der Ideen von H. Haftmann und der
{ Soundausgabekomponente von A. Shäpers
{ --------------------------------------------------------------------------- }

const
  BufSize = 22050;
type
  TBuf = array[0..BufSize - 1] of ShortInt;
var
  OrgBuf: ^TBuf;
  OrgPos: Integer;
  BlockNr: Integer;

procedure ProcessBlock;
{ Ausgabe eines Blockes auf das Wave-Gerät }
label
  PlayDone;
var
  LocalCookie: Word;
begin
  if frmKCSave.bWAV then
    frmKCSave.WAVFile.Write(OrgBuf^, OrgPos)
  else
  begin
    Inc(frmKCSave.GlobalCookie);
    LocalCookie := frmKCSave.GlobalCookie;
    repeat { mindestens einmal }
      Application.ProcessMessages;
      if LocalCookie <> frmKCSave.GlobalCookie then
        goto PlayDone;
    until frmKCSave.Player.MSecPending < 500;

    frmKCSave.Player.Write(OrgBuf, OrgPos, Trunc(BlockNr * BufSize / 22050));
    inc(BlockNr);
    if frmKCSave.Player.Mode = asWaiting then
      frmKCSave.Player.StartPlaying;
  end;
  PlayDone:
end;

procedure WriteB;
{Schreibt ein Sample "Amp" (globale Variable) auf die Wave-Ausgabe}
begin
  OrgBuf^[OrgPos] := Amp + $80;
  inc(OrgPos);
  if OrgPos >= BufSize then
  begin
    ProcessBlock; {vollen Block schreiben}
    OrgPos := 0;
  end;
end;

procedure WriteSwing1(Len: Integer);
{Schreibt eine Halbschwingung der gewünschten Länge mit abgerundeter
 Vorderflanke (nur bei Längen >=4) - ansonsten war die Aufzeichnung futsch
 sowie keine KC-Direktankopplung (ohne Magnetband) möglich.}
var
  AmpOrig: SmallInt;
begin
  if Len >= 4 then
  begin
    AmpOrig := -Amp;
    Amp := 0;
    WriteB;
    Amp := AmpOrig div 2;
    WriteB;
    Amp := (AmpOrig * 3) div 4;
    WriteB;
    Amp := (AmpOrig * 7) div 8;
    WriteB;
    Amp := AmpOrig;
    Len := Len - 4;
  end
  else
    Amp := -Amp;
  while Len <> 0 do
  begin
    WriteB; { Rest gerade (Gleichspannung) }
    Dec(Len);
  end;
end;

procedure WriteSwing2(Len: Integer);
{Ganze Schwingung der gewünschten Länge (in 22-kHz-Samples) schreiben}
var
  Len1: integer;
begin
  Len1 := Len div 2; {halbieren...}
  WriteSwing1(Len1);
  WriteSwing1(Len - Len1); {kann unterschiedliche Längen ergeben!}
end;

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

1. Vorton: 14 Halbschwingung a 640 Hz, beim ersten Block 2000 Schwingungen
2. Trennschwingung: 1 Vollschwingung a 1280 Hz
3. Blocknummer: 16 Bit, Bedeutung siehe „logisches Aufzeichnungsformat“
4. Datenbereich: 32 Bytes in Form von 16 Datenwörtern
5. Prüfsumme: 16-Bit-Addition über die Blocknummer und die 16 Datenwörter

Die Datenwörter sind Little-Endian-kodiert, d.h. niederwertiges Byte zuerst.
Es wird jeweils das Bit 0 zuerst gespeichert.

Bit-Codierung: 0-Bit: 1 Vollschwingung mit 2560 Hz (2 Phasenwechsel nach
jeweils 0,39 ms) 1-Bit: 1 Halbschwingung mit 1280 Hz (1 Phasenwechsel nach 0,78 ms)

Mit Blocknummer und Prüfsumme zusammen besteht ein Block damit aus
36 Byte (= 18 Word).

 }

procedure WriteDataZ1013(headersave: boolean);
var
  I: integer;
  W: Word;

  procedure WriteWord(W: Word); assembler;
  var
    i: integer;
  begin
    for i := 0 to 15 do
    begin
      if W and $0001 = 1 then
        WriteSwing1(9)
      else
        WriteSwing2(9);
      W := W shr 1;
    end;
  end;

  procedure WriteBlock(W: Word; Vorton: Integer; blnr: Word);
  var
    I: Integer;
    Sum: Word;
    ww: word;
  begin
    for I := 1 to Vorton do
      WriteSwing1(17); {Vorton}
    WriteSwing2(16); {Trennzeichen}
    WriteWord(blnr);
    Sum := blnr;
    for I := 0 to 15 do
    begin
      ww := Z80file.data[W + 2 * I] + 256 * Z80file.data[W + 2 * I + 1];
      inc(Sum, ww);
      WriteWord(ww);
    end;
    WriteWord(Sum);
  end;

begin
  I := 2000;
  W := 0;
  if headersave then
    WriteBlock(W, I, $00E0); // Header
  Inc(W, 32);
  while W < Z80File.filesize do
  begin
    WriteBlock(W, I, W + Z80file.Header.aadr - 32);
    Inc(W, 32);
    I := 14;
  end;

  //am Ende zusätzlichen Swing, damit letztes Bit komplett eingelesen wird.
  WriteSwing1(17);
end;

{ --------------------------------------------------------------------------- }

{ Ausgabe als WAV }

procedure TfrmKCSave.Button2Click(Sender: TObject);
begin
  { Wiedergabegerät für 22 KHz, 8 Bit, Mono öffnen }
  Player.Open(22050, 8, 1);
  New(OrgBuf);
  OrgPos := 0;
  WriteDataZ1013(Checkbox1.Checked); { Ausgabe WAV }
  if OrgPos > 0 then
    ProcessBlock; { letzten Block ausgeben }
  Dispose(OrgBuf);
end;

{ --------------------------------------------------------------------------- }
// write to file

procedure TfrmKCSave.SaveFileWAV(filename: string);
const
  WAVHeader =
    ansistring('RIFF'#$00#$00#$00#$00'WAVEfmt '#$10#$00#$00#$00#$01#$00#$01#$00#$22#$56#$00#$00#$22#$56#$00#$00#$01#$00#$08#$00'data'#$00#$00#$00#$00);
var
  filesize: dword;
  buf: dword;
begin
  WAVFile := TFileStream.Create(filename, fmCreate or fmOpenWrite);
  WAVFile.Write(WAVHeader, length(WAVHeader));
  bWAV := true;
  Button2Click(nil);
  bWAV := false;

  filesize := WAVFile.Position;
  buf := filesize - 8;
  WAVFile.Seek(4, soFromBeginning);
  WAVFile.Write(buf, 4);

  buf := filesize - 44;
  WAVFile.Seek(40, soFromBeginning);
  WAVFile.Write(buf, 4);

  WAVFile.Free;
end;

procedure TfrmKCSave.Button4Click(Sender: TObject);
begin
  // Hilfe aufrufen
  Application.HelpCommand(HELP_CONTENTS, 1);
end;

end.


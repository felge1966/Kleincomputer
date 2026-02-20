unit uZ80File;

{ History: 15.09.2011 new
  10.12.2011 compiled with Delphi5

  todo:
  .z13 hinzunehmen
cp/m : startadr = 100h, sadr = laenge / 512 Byte ( page )

tiny basic decodieren:
  abgekürzte befehle auskodieren, mit leerzeichen am Ende (?)

'T' + aad E00 -> Editex
 keine Zeilenumbrüche
 z.B. d:\temp\z1013soft\falk\v10b TEXT 1\23.Z80

'Q'	- Text

$  basicode, hsave

  }

interface

uses SysUtils, Classes;

type
  TKCData = (UNDEF, UNKNOWN, BASIC_CSAVE, BASIC_ARRAY, BASIC_LIST, FORTH, ZTEXT, BASICODE, CPM, TINYBASIC);

  PKCBinaryFile = ^TKCBinaryFile;
  TKCBinaryFile = array of byte;

type

  { FileHeader HeaderSave Z1013-Programm }
  TZ80Header = packed record
    aadr, eadr, sadr: word;
    zusatz: array[0..5] of byte;
    dateityp: ansichar;
    kennung: array[0..2] of ansichar;
    dateiname: array[0..15] of ansichar;
  end;

  { FileControlBlock HCBasic-Programm }
  TFCBBASIC = packed record
    dateityp: array[0..2] of ansichar;
    dateiname: array[0..7] of ansichar;
    adr1, adr2: word;
  end;

const
  HS_Kennung = ansistring(#$D3#$D3#$D3);

type
  TZ80File = class
  public
    KCData: TKCData;
    IgnoreBASICEnd: boolean;
  private
    function BasicToken(c: char): string;
    procedure ConvertASCIIBasic(strings: TStrings);
    procedure ConvertText(strings: TStrings; offset: integer = 32);
    procedure ConvertBasicode(strings: TStrings);
    procedure ConvertForth(strings: TStrings);
    procedure ConvertTextAll(strings: TStrings);
//    procedure ConvertScript(strings: TStrings);
    procedure ConvertHex(strings: TStrings);
    procedure ConvertBasic(strings: TStrings; offset: integer = $61);
//    procedure ConvertBasicKCB(strings: TStrings);
    procedure ConvertBasicArray(strings: TStrings);
    procedure ConvertTinyBasic(strings: TStrings);
//    procedure UpdateFCB;
    procedure GetKCData;
  public
    filesize: integer;
    data: TKCBinaryFile;
    function Header: TZ80Header;
    procedure LoadFile(filename: string);
    procedure SaveFile(filename: string);
    procedure DecodeZ80File(strings: TStrings; typ: TKCData = UNDEF);
    function ListHeader: string;
  end;

implementation

uses Math, Dialogs;

function TZ80File.Header: TZ80Header;
begin
  result := TZ80Header(Pointer(data)^);
end;

function TZ80File.ListHeader: string;
var name: string;
begin
  with Header do begin
    name := header.dateiname;
    result := Format('aadr %.4x eadr %.4x sadr %.4x  type %s  file %s',
      [aadr, eadr, sadr, dateityp, name]);
  end;
end;

procedure TZ80File.LoadFile(filename: string);
var
  f: TFileStream;
  i: integer;
begin
  // KC-FileInfo leeren
  data := nil;

  f := TFileStream.Create(filename, fmOpenRead);
  try
    filesize := f.size;

    // Einlesen der Datei
    SetLength(data, filesize);
    i := f.read(Pointer(data)^, filesize);
    if i <> filesize then
      raise EFilerError.Create('Datei wurde nicht komplett gelesen');
  finally
    f.free;
  end;

  if UpperCase(ExtractFileExt(filename)) = '.Z13' then begin
    with TZ80Header(Pointer(data)^) do
      if aadr = $1000 then begin
    // wenn Tiny-Basic, dann Typ setzen
        dateityp := 'b';
        kennung := HS_Kennung;
      end else begin
    // sonst Pseudo-Header für Z13 einfügen
        SetLength(data, filesize + 32);
        move(data[0], data[32], filesize);
        FillChar(data[0], 32, 0);
        with TZ80Header(Pointer(data)^) do begin
          aadr := $0000;
          eadr := aadr + filesize - 1;
          sadr := 0;
          dateityp := 'M';
          //Move('Z13-Ohne Header! ', dateiname, 16);
          FillChar(dateiname, 16, ' ');
          kennung := HS_Kennung;
        end;
      end;
  end;
  with TZ80Header(Pointer(data)^) do
    if kennung <> HS_Kennung then
      raise EFilerError.Create('Keine Z1013-Z80-Datei');

  // Typ ermitteln
  GetKCData;
end;


procedure TZ80File.SaveFile(filename: string);
var
  f: tfilestream;
begin
  //TODO
  f := tfilestream.create(filename, fmcreate or fmopenwrite);
  f.write(Pointer(data)^, length(data));
  f.free;
end;

procedure TZ80File.GetKCData;
begin
  case Header.dateityp of
    'B': KCData := BASIC_CSAVE;
    'T', 'I', 'A', 'S': KCData := ZTEXT;
    'F', 'G': KCData := FORTH; // auch Grafik-Files
    'b': KCData := TINYBASIC;
(*    C-COM-File (Maschinenprogramm), selbststartend
      T-allgemeines Text-File
      B-BASIC-Programm für 10K-Basic vom KC 85/1,87 und KC-BASIC+
      K-BASIC-Programm für 10K-Basic vom KC 85/2,3
      L-BASIC-Programm für TDL-Basic
      b-3-K-BASIC
      M-Maschinenprogramm, nicht selbststartend
      S-SOURCE-Assemblerquelle in ASCII (Quelltext)
      s-SOURCE-Assemblerquelle vom EDAS 1.01 (IDAS)
      P-PASCAL-Programm
      F-FORTH-Programm
      D-DATA-Datenfelder, RAM-Diskinhalte
      G-Grafik-Files
      I-Instruktion, Informationen, Programmbeschreibung
      E-EPROM-Inhalte
      Q-mit NSWEEP gequetschte Files
  Space-ohne Typ
      X,Y,Z vorgesehen für Urlader-Files(CC Halle)
 *)
  else
    KCData := UNKNOWN
  end;

  { cp/m : startadr = 100h, sadr (dez!) = laenge / 256 Byte ( page )
  if (Header.aadr = $100) and (Header.sadr*256 = Header.eadr-Header.aadr+1-$20) then
   KCData := CPM;
  }
end;

procedure TZ80File.DecodeZ80File(strings: TStrings; typ: TKCData = UNDEF);
begin
  strings.Clear;

  if typ = UNDEF then
    typ := KCData;
  case typ of
    BASIC_CSAVE: ConvertBasic(strings);
    BASIC_ARRAY: ConvertBasicArray(strings);
    BASIC_LIST: ConvertASCIIBasic(strings);
    ZTEXT: ConvertText(strings);
    BASICODE: ConvertBasicode(strings);
    FORTH: ConvertForth(strings);
    UNKNOWN: ConvertHex(strings);
    CPM: ConvertHex(strings);
    TINYBASIC: ConvertTinyBasic(strings);
  else ConvertTextAll(strings);
  end;
end;



function TZ80File.BasicToken(c: char): string;
begin
  result := c;
  case c of
    #$80: result := 'END';
    #$81: result := 'FOR';
    #$82: result := 'NEXT';
    #$83: result := 'DATA';
    #$84: result := 'INPUT';
    #$85: result := 'DIM';
    #$86: result := 'READ';
    #$87: result := 'LET';
    #$88: result := 'GOTO';
    #$89: result := 'RUN';
    #$8A: result := 'IF';
    #$8B: result := 'RESTORE';
    #$8C: result := 'GOSUB';
    #$8D: result := 'RETURN';
    #$8E: result := 'REM';
    #$8F: result := 'STOP';
    #$90: result := 'OUT';
    #$91: result := 'ON';
    #$92: result := 'NULL';
    #$93: result := 'WAIT';
    #$94: result := 'DEF';
    #$95: result := 'POKE';
    #$96: result := 'DOKE';
    #$97: result := 'AUTO';
    #$98: result := 'LINES';
    #$99: result := 'CLS';
    #$9A: result := 'WIDTH';
    #$9B: result := 'BYE';
    #$9C: result := '!';
    #$9D: result := 'CALL';
    #$9E: result := 'PRINT';
    #$9F: result := 'CONT';
    #$A0: result := 'LIST';
    #$A1: result := 'CLEAR';
    #$A2: result := 'CLOAD';
    #$A3: result := 'CSAVE';
    #$A4: result := 'NEW';
    #$A5: result := 'TAB(';
    #$A6: result := 'TO';
    #$A7: result := 'FN';
    #$A8: result := 'SPC(';
    #$A9: result := 'THEN';
    #$AA: result := 'NOT';
    #$AB: result := 'STEP';
    #$AC: result := '+';
    #$AD: result := '-';
    #$AE: result := '*';
    #$AF: result := '/';
    #$B0: result := '^';
    #$B1: result := 'AND';
    #$B2: result := 'OR';
    #$B3: result := '>';
    #$B4: result := '=';
    #$B5: result := '<';
    #$B6: result := 'SGN';
    #$B7: result := 'INT';
    #$B8: result := 'ABS';
    #$B9: result := 'USR';
    #$BA: result := 'FRE';
    #$BB: result := 'INP';
    #$BC: result := 'POS';
    #$BD: result := 'SQR';
    #$BE: result := 'RND';
    #$BF: result := 'LN';
    #$C0: result := 'EXP';
    #$C1: result := 'COS';
    #$C2: result := 'SIN';
    #$C3: result := 'TAN';
    #$C4: result := 'ATN';
    #$C5: result := 'PEEK';
    #$C6: result := 'DEEK';
    #$C7: result := 'PI';
    #$C8: result := 'LEN';
    #$C9: result := 'STR$';
    #$CA: result := 'VAL';
    #$CB: result := 'ASC';
    #$CC: result := 'chr$';
    #$CD: result := 'LEFT$';
    #$CE: result := 'RIGHT$';
    #$CF: result := 'MID$';
    #$D0: result := 'LOAD';
    #$D1: result := 'TRON';
    #$D2: result := 'TROFF';
    #$D3: result := 'EDIT';
    #$D4: result := 'ELSE';

    // Erweiterung M511
    #$D5: result := 'INKEY$';
    #$D6: result := 'JOYST';
    #$D7: result := 'STRING$';
    #$D8: result := 'INSTR';
    #$D9: result := 'RENUM'; //RENUMBER
    #$DA: result := 'DELETE';
    #$DB: result := 'PAUSE';
    #$DC: result := 'BEEP';
    #$DD: result := 'WINDOW';
    #$DE: result := 'BORDER';
    #$DF: result := 'INK';
    #$E0: result := 'PAPER';
    #$E1: result := 'AT';
  end;
end;

procedure TZ80File.ConvertBasic(strings: TStrings; offset: integer = $61);
var
  i: integer;
  addrnl: integer;
  znr: integer;
  s: string;
  c: char;
type
  tstate = (st_end, st_normal, st_string);
var
  state: tstate;
begin
  strings.BeginUpdate;
  strings.Clear;

  // Kopf überspringen (default 13 = 'D3D3D3' + 8 Byte Name + 2 Byte Gesamtlänge)
  i := offset;

  while i < length(data) do begin
    // 2 Byte Adresse nächste Zeile
    addrnl := data[i] + 256 * data[i + 1];
    inc(i, 2);
    if not IgnoreBASICEnd then
      if addrnl = 0 then break;

    //Zeilennummer
    znr := data[i] + 256 * data[i + 1];
    inc(i, 2);

    //Zeile bearbeiten
    s := '';
    state := st_normal;
    while state <> st_end do begin
      c := chr(data[i]);
      inc(i);
      case c of
        #0: state := st_end; // Zeilenendezeichen (0)
        '"': if state = st_string then state := st_normal
          else if state = st_normal then state := st_string;
      end;
      if (state = st_normal) and (c >= #$80) then
        s := s + BasicToken(c)
      else if state in [st_normal, st_string] then
        s := s + c;
    end;

{$IFDEF debug}
    strings.Add(Format('%.4x %d %s', [addrnl, znr, s]));
{$ELSE}
    strings.Add(Format('%d %s', [znr, s]));
{$ENDIF}
  end;

  Strings.EndUpdate;
end;

procedure TZ80File.ConvertASCIIBasic(strings: TStrings);
var
  i: integer;
  s: string;
begin
  strings.BeginUpdate;
  strings.Clear;

  // Kopf überspringen ('D3D3D3' + 8 Byte Name + 2 Byte Gesamtlänge)
  i := 13;

  while i < Length(data) do begin
     //00-Bytes übergehen, Ende ist 03
    if data[i] = 3 then break;
    if data[i] <> 0 then
      s := s + chr(data[i]);

    inc(i);
  end;

  strings.Text := s;

  Strings.EndUpdate;
end;

procedure TZ80File.ConvertText(strings: TStrings; offset: integer = 32);
var
  i: integer;
  s: string;
begin
  strings.BeginUpdate;
  strings.Clear;

  // Kopfblock überspringen
  i := offset;

  while i < Length(data) do begin
    case data[i] of
      $1E: s := s + chr(10); // 1E -> NL
      0: ; // 00-Bytes übergehen
      3: if not IgnoreBASICEnd then break; // Ende ist 03
    else
      s := s + chr(data[i]);
    end;
    inc(i);
  end;

//  strings.Text := s;
  Strings.Text := AdjustLineBreaks(s);

  Strings.EndUpdate;
end;

procedure TZ80File.ConvertBasicode(strings: TStrings);
var
  i: integer;
  s: string;
begin
  strings.BeginUpdate;
  strings.Clear;

  // Kopfblock überspringen
  i := 1;

  while i < Length(data) do begin
     //Ende ist 0
    if data[i] = 0 then break;
    s := s + chr(data[i]);
    inc(i);
  end;
  strings.Text := s;

  Strings.EndUpdate;
end;

procedure TZ80File.ConvertForth(strings: TStrings);
var
  i: integer;
  s: string;
begin
  strings.BeginUpdate;
  strings.Clear;

  // Kopfblock überspringen
  i := 32;

  while i < Length(data) do begin
     //Ende ist 0
    if data[i] = 0 then break;
    s := copy(pchar(@data[i]), 1, 32);
    inc(i, 32);
    strings.Add(s);
  end;

  Strings.EndUpdate;
end;

(* Basic-gepackte Zahlen konvertieren.
Das funktioniert, leifert aber wg. größerer Genauigkeit nicht dieselben
Zahlen wie BASIC selbst *)

function BasicNumber(b1, b2, b3, b4: byte): single;
var
  mantisse: integer;
  exp: integer;
begin
  //exponent
  exp := b4 and 127;
  if (b4 and 128) = 0 then exp := exp - 128;
  //mantisse
  mantisse := (b3 and 127 + 128) * $100 * $100 + b2 * $100 + b4;
  if (b3 and 128) = 0 then
    result := mantisse * IntPower(2, exp - 24)
  else
    result := -mantisse * IntPower(2, exp - 24);
end;

// 18.02.2011

procedure TZ80File.ConvertBasicArray(strings: TStrings);
var
  i: integer;
  gesamtlaenge: integer;
  indx: integer;
  sa: array[0..8000] of string;
  k, p: integer;
  len: integer;
  bn: single;
begin
  strings.BeginUpdate;
  strings.Clear;

  // Kopf überspringen ('D3D3D3' + 8 Byte Name + 2 Byte Gesamtlänge)
  i := 13;

  indx := -1; gesamtlaenge := 0;
  while i < Length(data) do begin
    if (indx >= 0) and (gesamtlaenge = data[i + 1] * 256 + data[i])
      then begin
      inc(i, 2);
      strings.add(Format('DIM A$(%d)', [indx]));
      //weiter mit Auswertung
      for k := indx downto 0 do begin
        len := ord(sa[k][1]);
//        sa[k] := 'abc';     // substr(KCBinFile[i]..KCBinFile[i+len]
        sa[k] := '';
        for p := i to i + len - 1 do
          sa[k] := sa[k] + chr(data[p]);
        inc(i, len);
      end;
      for k := 0 to indx do begin
        strings.Add(Format('A$(%d) = "%s"', [k, sa[k]]))
      end;
      break;
    end else begin
      if data[i + 1] <> ((data[i] + 1) and 255)
        then begin
       //kein Text-Array
        strings.add('Zahlen-Array (test)');
        i := 13; k := 0;
        while i < Length(data) do begin
          if (data[i] = 3) and (Length(data) - i < 256) then break;
          bn := BasicNumber(data[i], data[i + 1], data[i + 2], data[i + 3]);
          //strings.Add(Format('A(%d) = %2x %2x %2x %2x = %.6g', [k, KCBinFile[i], KCBinFile[i+1], KCBinFile[i+2], KCBinFile[i+3], bn]));
          strings.Add(Format('A(%d) = %.6g', [k, bn]));
          inc(i, 4); inc(k, 1);
        end;
        break;
      end else begin
        inc(indx);
        sa[indx] := chr(data[i]);
        gesamtlaenge := gesamtlaenge + data[i];
        inc(i, 4);
      end;
    end;
  end;

  Strings.EndUpdate;
end;


procedure TZ80File.ConvertTextAll(strings: TStrings);
var
  i: integer;
  s: string;
begin
  strings.BeginUpdate;
  strings.Clear;

  // Kopf überspringen
  i := 128;

  SetLength(s, Length(data) - i);
  move(data[i], PChar(s)^, Length(data) - i);

  for i := 1 to length(s) do
    if s[i] = #0 then s[i] := '.';

  Strings.Text := AdjustLineBreaks(s);

  Strings.EndUpdate;
end;


procedure TZ80File.ConvertHex(strings: TStrings);
var
  i, j, adr: integer;
  s: string;
begin
  strings.BeginUpdate;
  strings.Clear;
  i := 32; // ohne Header
  adr := Header.aadr - i;

  while i < Length(data) do begin
//    for k := 0 to 1 do begin
    setlength(s, 16);
    move(data[i], s[1], 16);
    for j := 1 to length(s) do
      if s[j] < ' ' then s[j] := '.';

    strings.add(Format('%.4x: %.2x %.2x %.2x %.2x %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x %.2x %.2x %.2x %.2x  %s',
      [adr + i,
      data[i + 0],
        data[i + 1],
        data[i + 2],
        data[i + 3],
        data[i + 4],
        data[i + 5],
        data[i + 6],
        data[i + 7],
        data[i + 8],
        data[i + 9],
        data[i + 10],
        data[i + 11],
        data[i + 12],
        data[i + 13],
        data[i + 14],
        data[i + 15],
        s
        ]));
    i := i + 16;
//    end;
//    strings.Add('');
  end;
  Strings.EndUpdate;
end;

procedure TZ80File.ConvertTinyBasic(strings: TStrings);
var
  i: integer;
  s: string;
  znr: integer;
begin
  strings.BeginUpdate;
  strings.Clear;

  // Kopf überspringen, Basic beginnt ab 1152h
  i := $172;

  while i < (Header.eadr - $1000 + $20) - 1 do begin
    //Zeile bearbeiten
    s := '';
    znr := data[i + 0] + $100 * data[i + 1]; inc(i, 2);
    if znr = 0 then break;

    while (data[i] <> $0D)
      and (i < Header.eadr - $1000 + $20)
      do begin
      s := s + chr(data[i]);
      inc(i);
    end;
    // Zeilenendezeichen (0D)
    inc(i);

    //strings.Add(Format('%.4x %d %s', [i, znr, s]));
    strings.Add(Format('%d %s', [znr, s]));
  end;

  Strings.EndUpdate;
end;


end.


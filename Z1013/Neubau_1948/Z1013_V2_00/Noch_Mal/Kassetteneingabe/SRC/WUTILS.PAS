unit wutils;
{Statische Bibliothek fÅr Windows-typische Problemchen}
{$C MOVEABLE PRELOAD PERMANENT}	{gleiche Attribute wie Unit SYSTEM}
{$F-,A+,G+,K+,W-}
{$I-,Q-,R-,S-}
{$V+,B-,X+,T+,P+}
{Die Einbindung dieser Unit verbraucht 8 uninitialisierte Datenbytes}
interface
uses WinProcs,WinTypes,Win31,ShellAPI;

{MessageBox-Funktionen auf Basis von unterteilten Ressourcen-Strings}
var
 StdProfile: PChar{=nil};	{Vorgabe: WIN.INI, hier: ungenutzt}
 StdMBoxTitle: PChar{=nil};
const
 MB_Sound = $0080;

 HKCR=HKEY_Classes_Root;
 WF_WinNT	=$4000;		{zusÑtzlich fÅr GetWinFlags()}
{Windows9x und NT4-Konstanten}
 VK_XButton1	=$05;		{Linke X-Maustaste}
 VK_XButton2	=$06;		{Rechte X-Maustaste}
 VK_Kana	=$15;		{jap.}
 VK_JunJa	=$17;		{jap.}
 VK_Final	=$18;		{jap.}
 VK_Kanji	=$19;		{jap.}
 VK_NonConvert	=$1D;		{jap.}
 VK_Accept	=$1E;		{jap.}
 VK_ModeChange	=$1F;		{jap.}
 VK_Print	=$2A;
 VK_LWin	=$5B;
 VK_RWin	=$5C;
 VK_ContextKey	=$5D;		{Kontext-MenÅ-Taste einer Win95-Tastatur}
 VK_Apps	=VK_ContextKey;
 VK_Sleep	=$5F;
 VK_LShift	=$A0;
 VK_RShift	=$A1;
 VK_LControl	=$A2;
 VK_RControl	=$A3;
 VK_LMenu	=$A4;
 VK_RMenu	=$A5;
 VK_Browser_Back	=$A6;
 VK_Browser_Forward	=$A7;
 VK_Browser_Refresh	=$A8;
 VK_Browser_Stop	=$A9;
 VK_Browser_Search	=$AA;
 VK_Browser_Favorites	=$AB;
 VK_Browser_Home	=$AC;
 VK_Volume_Mute		=$AD;
 VK_Volume_Down		=$AE;
 VK_Volume_Up		=$AF;
 VK_Media_Next_Track	=$B0;
 VK_Media_Prev_Track	=$B1;
 VK_Media_Stop		=$B2;
 VK_Media_Play_Pause	=$B3;
 VK_Launch_Mail		=$B4;
 VK_Launch_Media_Select	=$B5;
 VK_Launch_App1		=$B6;
 VK_Launch_App2		=$B7;

 WM_MouseWheel	=$020A;		{Rotation kommt bei GetMessageExtraInfo()}
 MSH_MouseWheel	='MSWHEEL_ROLLMSG';	{wParam=Rotation in 120er Schritten}
				{Wird an GetActiveWindow() verschickt!}
 Wheel_Delta	=120;		{Standard-Schrittweite}
 WM_Sizing	=$0214;		{ab Win9x; bei NT dummerweise Flat-Pointer}
 WM_Moving	=$0216;		{ab Win9x}
 WMSZ_Left=1;			{hier war 'ne Blindpese am Werk!}
 WMSZ_Right=2;
 WMSZ_Top=3;
 WMSZ_TopLeft=4;
 WMSZ_TopRight=5;
 WMSZ_Bottom=6;
 WMSZ_BottomLeft=7;
 WMSZ_BottomRight=8;
 WM_Print		=$0317;	{wParam=PrintDC?}
 WM_PrintClient		=$0318;	{wParam=PrintDC?}
 WM_Notify		=$004E;
 WM_InputLangChangeRequest=$0050;
 WM_InputLangChange	=$0051;
 WM_TCard		=$0052;
 WM_Help		=$0053;
 WM_ContextMenu		=$007B;
 WM_StyleChanging	=$007C;
 WM_StyleChanged	=$007D;
 WM_DisplayChange	=$007E;
 CF_SelectScript	=$00400000;	{ChooseFont-Flags}
 CF_NoScriptSel		=$00800000;
 CF_NoVertFonts		=$01000000;
 OFN_LongNames		=$00200000;	{GetOpen/SaveFileName-Flag}
type
 UInt=Word;			{16 bit in Win16, 32 bit in Win32}

 PHelpInfo=^THelpInfo;
 THelpInfo=record		{na?}
  cbSize: LongInt;
  iContextType: Integer;
  iCtrlID: Word;
  hItemHandle: THandle;
  dwContextID: LongInt;
  MousePos: TPoint;
 end;

const	{Accelerator Table Codes fÅr fVirt}
 FVirtKey	=$01;
 FNoInvert	=$02;
 FShift		=$04;
 FControl	=$08;
 FAlt		=$10;
 FLast		=$80;
type
 PAccel=^TAccel;
 TAccel=packed record
  fVirt: Byte;
  key: Word;
  cmd: Word;
 end;

type	{lParam in CallWndProc-Callback}
 PCwpStruct=^TCwpStruct;
 TCwpStruct=record
  lParam:LongInt;
  wParam,message:UInt;
  hwnd:HWnd;
 end;

type
 TCompProc=function(s1,s2:PChar):Integer; {entweder lstrcmp oder lstrcmpi}

function vMBox(WndParent:HWnd; ID,style:UInt; var p):Integer;
function MBox:Integer;	 	{cdecl - nur fÅr Assembler-Aufruf}
function MBox0(WndParent:HWnd; ID,style:UInt):Integer;
function MBox1(WndParent:HWnd; ID{,style}:UInt; S:PChar):Integer;
function MBox2(WndParent:HWnd; ID,style:UInt; S2,S1:PChar):Integer;
function lstrchr(Str:PChar; C:Char):PChar;
{Zeichen <c> im String <Str> suchen, Position liefern}
function lstrcmp1(s_short,s_long:PChar;CP:TCompProc):Integer;
{Anfang von <s_long> mit <s_short> vergleichen, entweder strcmpi oder strcmp}
function lstrstr(needle,heap:PChar;CP:TCompProc):PChar;
{einfache Suche von Nadel in Heuhaufen, entweder strcmpi oder strcmp}
function memcmp(s1,s2:PChar; len:UInt):Integer;
function GetModuleDescription(FName,Descript:PChar):Boolean;
{extrahiert aus Windows-EXE Modulbeschreibung, max. 255 Zeichen, ANSI-Font
 FName kann auch ein Dateihandle einer offenen Datei sein}
procedure Accel2Text(const accel:TAccel; s:PChar);
{Wandelt Akzelerator via Tastaturtreiber in lokalisierte,
 beschreibende Zeichenkette um, ideal fÅr MenÅs und ToolTips,
 bspw.: "Alt+Strg+Umschalt+Num 5"}
procedure memmove(d,s:Pointer; l:UInt);	{prÅft auf öberlappung, rep movsb}

{HinzufÅgen oder Entfernen von VxD's zur/aus SYSTEM.INI}
const
 ARV_CantRemove = 1;
 ARV_CantAdd = 2;
 ARV_FailCreateTempFile = -2;
 ARV_FailOpenSystemIni = -3;
 ARV_FailReadWrite = -4;
 ARV_FailDelete = -5;
 ARV_FailRename = -6;
function AddRemoveVxD(AddPath,RemovVxD:PChar):Integer;
{AddPath bezeichnet ein neues VxD samt Pfad; NIL wenn kein neues}
{RemovVxD bezeichnet ein zu entfernendes VxD (kein Pfad erforderlich)}

{Registrierungs-Hilfen}
function RegSetRoot(Path,Value:PChar):Boolean;
function RegGetRoot(Path,Value:PChar; VL:UInt):Boolean;
function RegSetVal(Key:HKey;Path,Value:PChar):Boolean;
function RegGetVal(Key:HKey;Path,Value:PChar; VL:Word):Boolean;
function WriteProfileInt(Section,Key:PChar; Value:Integer):Bool;

{C-mÑ·ige String-Umwandlung in darstellbares Format}
function EscapeStr(src:PChar; slen:UInt; dst:PChar; dlen:UInt):UInt;
function UnescapeStr(src, dst:PChar; dlen:UInt):UInt;

{Dateifunktionen}
procedure AnsiDosFunc;
function _ldelete(S: PChar):Integer;

function GetFileNamePtr(S:PChar):PChar;
{liefert Zeiger hinter das letzte Auftreten von /\: oder Stringanfang}
function GetFileNameExt(S:PChar):PChar;
{liefert Zeiger AUF DEN PUNKT oder AUF DIE NULL, niemals NIL}
function RemoveTrailSlash(S:PChar):PChar;
{liefert Zeiger AUF DIE NULL, entfernt ggf. mehr als 1 Slash}
function PathCat(Path,FName:PChar):PChar;
{AnhÑngen von FName an Path; dabei darf Path mit oder ohne (Back)Slash enden,
 RÅckgabewert ist die Stelle, wo FName hinkopiert wurde (also hinter Slash)}

procedure ShortYield;
{einfachste Wartefunktion, gibt eine "Zeitscheibe" her.
 Zur Nachbildung von Delay() nur bedingt geeignet, da dann volle CPU-Last}
procedure TranslateWin95Keys(const Msg:TMsg);
{Åbersetzt die KontextmenÅ-Tasten Shift+F10 oder WinMenÅ in WM_ContextMenu,
 unter Windows 3.1 liefert diese Taste VK_FF und Scancode=VK_ContextKey;
 die Umwandlung von Shift+F10 mu· auch unter Win95 durchgefÅhrt werden!
 Die beiden Windows-Logo-Tasten werden nicht beachtet,
 da sie systemglobal fÅr die Shell oder als AppHotKey
 (Stichwort: SetWindowsHookEx(WH_Keyboard...)) gedacht sind.
 Der Aufruf erfolgt vor TranslateMessage(Msg)}


function BitCount(W:UInt):Integer;
{ZÑhlt die gesetzten Bits in W}
procedure TransparentBlt(DC:HDC; x,y:Integer; HBM:HBitmap; cr:TColorRef);
{Kopiert Bitmap und wandelt dabei die Transparent-Farbe der Bitmap in den
 Hintergrund-Pinsel des ZielgerÑtekontexts (keine echte Transparenz!)}
function _lopen2(Name:PChar;ReadWrite:Integer):Integer;
{ôffnet die Datei im angegebenen Share-Modus und, wenn das schiefgeht,
 im KompatibilitÑtsmodus}
function  CopyFile(NameS,NameD:PChar; Overwrite: Bool):Bool;
{Funktionskompatibel zur Win32-API, unterstÅtzt lange Dateinamen}
function  GetRadioCheck(Wnd:HWnd; u,o:UInt): Integer;
{Abfrage einer Reihe von Radiobuttons, bis ein gedrÅckter gefunden
 wird, sonst RÅckgabe von -1}
function  GetCheckboxGroup(Wnd:HWnd; u,o:UInt): LongInt;
{Abfrage von bis zu 16 in ihrer ID aufeinanderfolgenden Checkboxen}
procedure SetCheckboxGroup(Wnd:HWnd; u,o:UInt; x:LongInt);
{Setzen von bis zu 16 in ihrer ID aufeinanderfolgenden Checkboxen}
procedure SetCheckboxGroup2(Wnd:HWnd; u,o,x:UInt);
{Setzen von bis zu 16 in ihrer ID aufeinanderfolgenden Checkboxen,
 belÑ·t jedoch solche im dritten Schaltzustand unverÑndert}
function  EnableDlgItem(Wnd:HWnd; idItem:UInt; Enable:Bool):Bool;
{Aktivieren bzw. Grausetzen eines Dialogelements.
 Achtung - Gefahr: Noch keine Fokuskontrolle!}
procedure EnableDlgItemGroup(Wnd:HWnd; u,o:UInt; Enable:Bool);
{Aktivieren bzw. Grausetzen einer Reihe von Dialogfeldern.
 Achtung: Ohne Fokuskontrolle!}
function  ShowDlgItem(Wnd:HWnd; idItem:UInt; iShow:Integer):Bool;
procedure ShowDlgItemGroup(Wnd:HWnd; u,o:UInt; iShow:Integer);
{dito fÅrs Anzeigen/Verstecken}

procedure SetEditFocus(HWndEdit: HWnd);
{fokussiert+markiert Editfenster}
procedure CenterDlg(Wnd:HWnd);
{Zentriert Wnd im Elternfenster oder Desktopfenster - unnîtig bei Win32}
function MoveRectIntoRect(var R:TRect; const R2:TRect): Bool;
{Dient zum Hineinholen von au·erhalb liegenden Fenstern in den Desktop.}
procedure GetFullScreenRect(var R:TRect);
{liefert ideales R2 fÅr MoveRectIntoRect zur Ganz-Anzeige von Dialogen u.Ñ.}
procedure MoveRectIntoFullScreen(var R:TRect);
{die logische Kombination beider o.g. Routinen}
function GetShiftState:Bool;
{Status der Shift-Taste}
function GetControlState:Bool;
{Status der Strg-Taste}
function Msg2VScroll(Msg,wParam: UInt; PageSize:Integer):Integer;
{Wandelt geeignete VScroll- und KeyDown-Nachrichten in "Entfernungscodes"
 um, liefert Ò1 fÅr "Zeilen" und PageSize fÅr "Seiten", sonst 0}
function iitrafo(x,a,e,ta,te:Integer):Integer;
{Koordinatentransformation von x innerhalb a und e
 zu Ergebnis innerhalb ta (transformiertes A) und te,
 jeweils mit Integer-Zahlen (manchmal bracht's auch ein fitrafo usw.}
const
 Drive_CDROM	=5;
 Drive_RAM	=6;
function GetDriveTypeEx(Drv:Integer):UInt;

type HFile=Integer;	{fehlt bei BP7}
const HFile_Error=-1;	{fehlt bei BP7}

type
 PLongLong=^LongLong;
 LongLong=record
  case integer of
   0:(lo,hi: LongInt);
   1:(b: array[0..7] of Byte);
   2:(w: array[0..3] of Word);
   3:(l: array[0..1] of LongInt);
   4:(d: Double);
 end;
 PQWord=^QWord;
 QWord=LongLong;

 LongRec=record
  Lo,Hi:Word;
 end;
 LongRecI=record
  Lo,Hi:Integer;
 end;
 PtrRec=record
  Ofs,Sel:Word;
 end;
 WordRec=record
  Lo,Hi:Byte;
 end;
 ByteSet=set of 0..7;	{fÅr die Verwendung von Include u.a.}
 WordSet=set of 0..15;	{Mengenoperationen}
 LongSet=set of 0..31;

 TS259=array[0..259] of Char;	
 TLfnBuf=TS259;		{fÅr "lange" Pfade}
 TS255=array[0..255] of Char;
 TS127=array[0..127] of Char;
 TS79=array[0..79] of Char;
 TSfnBuf=TS79;		{fÅr "kurze" Pfade}
 TS63=array[0..63] of Char;
 TS31=array[0..31] of Char;
 TS15=array[0..15] of Char;
 TS7=array[0..7] of Char;
 TS3=array[0..3] of Char;

 PPChar=^PChar;
 PDropFileStruct=^TDropFileStruct;
 TDropFileStruct=record		{ist so nur 16bittrig definiert}
  wSize: Word;
  MPos: TPoint;
  InNcArea: Bool;
  FNames: array[0..0] of Char;
 end;
function GetDragClientFromPos(const P:TPoint):HWnd;
function PerformDrop(ToWnd:HWnd;const P:TPoint;argc:Integer;argv:PPChar):Bool;

{Arbeit mit "Huge"-Zeigern auf Speicher mit mehr als 64 KB}
procedure IncHP(var P:PChar; By: Word);
procedure DecHP(var P:PChar; By: Word);
procedure IncHPL(var P:PChar; By: LongInt);

{Minimum und Maximum, vzb. und vzl.}
function min(I1,I2:Integer):Integer;
 inline($58/$5A/$D039/$017C/$92);
	{pop ax; pop dx; cmp ax,dx; jl $+3; xchg dx,ax}
function minW(W1,W2:UInt):UInt;
 inline($58/$5A/$D039/$0172/$92);
	{pop ax; pop dx; cmp ax,dx; jb $+3; xchg dx,ax}
function minL(L1,L2:LongInt):LongInt;

function max(I1,I2:Integer):Integer;
 inline($58/$5A/$D039/$017F/$92);
	{pop ax; pop dx; cmp ax,dx; jg $+3; xchg dx,ax}
function maxW(W1,W2:UInt):UInt;
 inline($58/$5A/$D039/$0177/$92);
	{pop ax; pop dx; cmp ax,dx; ja $+3; xchg dx,ax}
function maxL(L1,L2:LongInt):LongInt;

{LimitX begrenzt i zwischen u und o, wobei u<o gelten muss}
function Limit(i,u,o:Integer):Integer;
 inline($5A/$59/$58/$C839/$017F/$91/$D039/$017C/$92);
	{pop dx; pop cx; pop ax;
	 cmp ax,cx; jg $+3; xchg cx,ax; cmp ax,dx; jl $+3; xchg dx,ax}
function LimitW(i,u,o:UInt):UInt;
 inline($5A/$59/$58/$C839/$0177/$91/$D039/$0172/$92);
	{pop dx; pop cx; pop ax;
	 cmp ax,cx; ja $+3; xchg cx,ax; cmp ax,dx; jb $+3; xchg dx,ax}
function LimitL(i,u,o:LongInt):LongInt;

{BetweenX begrenzt i zwischen u und o, wobei nicht u<o gelten muss}
function Between(i,u,o:Integer):Integer;
 inline($5A/$59/$58/$D139/$027C/$D178/$C839/$017F/$91/$D039/$017C/$92);
	{pop dx; pop cx; pop ax; cmp cx,dx; jl $+4; xchg dx,cx;
	 cmp ax,cx; jg $+3; xchg cx,ax; cmp ax,dx; jl $+3; xchg dx,ax}
function BetweenW(i,u,o:UInt):UInt;
 inline($5A/$59/$58/$D139/$0272/$D178/$C839/$0177/$91/$D039/$0172/$92);
	{pop dx; pop cx; pop ax; cmp cx,dx; jb $+4; xchg dx,cx;
	 cmp ax,cx; ja $+3; xchg cx,ax; cmp ax,dx; jb $+3; xchg dx,ax}
function BetweenL(i,u,o:LongInt):LongInt;

function Parity(W:UInt):Boolean;
 inline($58/$09/$C0/$B0/$00/$7B/$02/$B0/$01);
	{pop ax; or ax,ax; mov al,0; jpo $+4; mov al,1}
function LongMul(A,B:Integer):LongInt;
 inline($5A/$58/$F7/$EA);
	{pop dx; pop ax; imul dx}
function LongMulW(A,B:Word):LongInt;
 inline($5A/$58/$F7/$E2);
	{pop dx; pop ax; mul dx}
function LongDiv(A:LongInt;B:Integer):Integer;
 inline($5B/$58/$5A/$F7/$FB);
	{pop bx; pop ax; pop dx; idiv bx - rundet nicht}
function LongDivR(A:LongInt;B:Integer):LongInt;
 inline($5B/$58/$5A/$F7/$FB);
	{pop bx; pop ax; pop dx; idiv bx - mit RestrÅckgabe im High-Teil}
function LongDivW(A:LongInt;B:Word):Word;
 inline($5B/$58/$5A/$F7/$F3);
	{pop bx; pop ax; pop dx; div bx - rundet nicht}
function lLongDivW(A:LongInt;B:Word):Word;
 inline($5B/$58/$5A/$39/$DA/$72/$05/$B8/$FF/$FF/$EB/$02/$F7/$F3);
	{pop bx; pop ax; pop dx; cmp dx,bx; jc $+7; mov ax,-1; jmp $+4;
	 div bx - mit Begrenzung auf 65535}
function LongDivWR(A:LongInt;B:Word):LongInt;
 inline($5B/$58/$5A/$F7/$F3);
	{pop bx; pop ax; pop dx; div bx - mit RestrÅckgabe im High-Teil}
function MulDivW(A,B,C:Word):Word;
 inline($5B/$58/$5A/$F7/$E2/$F7/$F3);
	{pop bx; pop ax; pop dx; mul dx; div bx - rundet nicht}
function idiv2(x: Integer):Integer;
{weil Turbo's shr nicht arithmetisch schiebt!}
 inline($58/$D1/$F8);		{pop ax; sar ax,1}
function bsf(w: UInt):Integer;	{Bitsuche vorwÑrts, findet tiefstes Bit}
function bsr(w: UInt):Integer;	{Bitsuche vorwÑrts, findet hîchstes Bit}

function sar(x: Integer; bits:Byte):Integer;
{weil Turbo's Operator <shr> nicht arithmetisch schiebt!}
 inline($59/$58/$D3/$F8);	{pop cx; pop ax; sar ax,cl}

function salr(x,bits: Integer):Integer;
{vorzeichenbehaftet links (bits>0) oder rechts (bits<0) schieben}
 inline($59/$58/$C90B/$0579/$D9F7/$F8D3/$B9/$E0D3);
 {pop cx; pop ax; or cx,cx; jns $+7; neg cx; sar ax,cl; mov cx,; shl ax,cl}

function shlr(x:UInt; bits: Integer):Integer;
{vorzeichenlos links (bits>0) oder rechts (bits<0) schieben}
 inline($59/$58/$C90B/$0579/$D9F7/$E8D3/$B9/$E0D3);
 {pop cx; pop ax; or cx,cx; jns $+7; neg cx; shr ax,cl; mov cx,; shl ax,cl}

function Bool2MenuCheck(Check:Bool):UInt;
{konvertiert Bool-Argument in MF_UnChecked(false) oder MF_Checked(true)}
 inline($58/$09/$C0/$74/$03/$B8/>MF_Checked);
			{pop ax; or ax,ax; jz $+5; mov ax,MF_Checked}
function IfThenElse(i:Bool;t,e:Integer):Integer;	{"?:"-Operator}
 inline($58/$5A/$59/$01E3/$92);
			{pop ax; pop dx; pop cx; jcxz $+3; xchg dx,ax}
function IfThenElseW(i:Bool;t,e:UInt):UInt;		{"?:"-Operator}
 inline($58/$5A/$59/$01E3/$92);
			{pop ax; pop dx; pop cx; jcxz $+3; xchg dx,ax}
function IfThenElseL(i:Bool;t,e:LongInt):LongInt;
 inline($5A/$58/$5B/$5E/$59/$03E3/$96/$DA87);
 {pop dx; pop ax; pop bx; pop si; pop cx; jcxz $+5; xchg si,ax; xchg bx,dx}
function IfThenElseP(i:Bool;t,e:PChar):PChar;
 inline($5A/$58/$5B/$5E/$59/$03E3/$96/$DA87);
			{dito!}
{Um systemweite Hooks oder eine Toolhelp-Notify-Prozedur in eine .EXE
 statt in eine .DLL zu legen, und nicht auf Smart Callbacks verzichten
 zu mÅssen, deklariert man dieses Callback als "far" statt "export"
 und benutzt dafÅr MakeProcInstance. Am Anfang des Callbacks muss
 der Aufruf "export_enter", am Ende "export_leave".
 Stack-PrÅfung muss ausgeschaltet sein!
 Falls die .EXE stets nur 1x lÑuft, reicht aber mov ax,seg @data, und
 MakeProcInstance ist unnîtig.}
procedure export_enter;
 inline($1E/$D88E);	{push ds; mov ds,ax}
procedure export_leave;
 inline($1F);		{pop ds}

function InitStruct(var x; xlen:UInt):UInt;
			{xlen muss gerade sein! Liefert stets Null.}
{PUSH und POP nur verwenden, wenn man wei·, was man tut!}
procedure push(i: Integer);	inline($90);		{nop}
procedure pushW(w:UInt);	inline($90);		{nop}
procedure pushL(l: LongInt);	inline($90);		{nop}
function pop:Integer;		inline($58);		{pop ax}
function popW:Integer;		inline($58);		{pop ax}
function popL:Integer;		inline($58/$5A);	{pop ax; pop dx}
{Kann leider nicht fÅr SelectObject verwendet werden wegen DC-Parameter}

{Das schîne am Stack-Speicher ist, man mu· ihn nicht freigeben!}
function StackAlloc(size:UInt):Pointer;
{reserviert dynamisch Stack-Speicher (size sollte gerade sein)}
 inline($58/$C429/$E089/$D28C);	{pop ax; sub sp,ax; mov ax,sp; mov dx,ss}

procedure StackFree(size:UInt);
{gibt o.g. StackAlloc-Speicher frei (size mu· gleich sein!)}
 inline($58/$C401);		{pop ax; add sp,ax}

function StackAlloc2(size:UInt):Pointer;
{reserviert dynamisch Stack-Speicher (size wird gerade gemacht)}
 inline($58/$40/$FE24/$C429/$E089/$D28C);
	{pop ax; inc ax; and al,0FEh; sub sp,ax; mov ax,sp; mov dx,ss}

procedure StackFree2(size:UInt);
{gibt o.g. StackAlloc2-Speicher frei (size mu· gleich sein!)}
 inline($58/$40/$FE24/$C401);	{pop ax; inc ax; and al,0FEh; add sp,ax}

type
 Bool2MenuGray=UInt;		{Hier: Einfache Typkonvertierung}
{konvertiert Bool-Argument in MF_Enabled(false!) oder MF_Grayed(true!)}

procedure SortRect(var R:TRect);
	{sortiert die Koordinaten in R so um,
	 da· top/left links oben und bottom/right rechts unten ist}

{NÅtzliche Funktionen der Windows-API}
procedure __AHShift;
procedure __AHIncr;
procedure __0000H;
procedure __0040H;
procedure __A000H;
procedure __B000H;
procedure __B800H;
procedure __C000H;
procedure __D000H;
procedure __E000H;
procedure __F000H;
procedure __RomBios;
procedure __WinFlags;
function _hread(f:HFile;Buf:PChar;BufLen:LongInt):LongInt;
function _hwrite(f:HFile;Buf:PChar;BufLen:LongInt):LongInt;
function _LocalLock(Mem: THandle): Word;	{fÅr echte Near-Zeiger}
function LocalLock(Mem: THandle): Pointer;	{wegen Segmentdefinition!}
{Ersparen MakeLong(=Code!) und TypeCasts, ersteres nicht portabel zu Win32}
function SendMessageWW(Wnd: HWnd; Msg, wParam:UInt; lParHi, lParLo: Word): LongInt;
function SendMessageP(Wnd: HWnd; Msg, wParam: UInt; lParam: Pointer): LongInt;
function SendDlgItemMsgWW(Dlg: HWnd; IDDlgItem: Integer; Msg, wParam,
  lParHi, lParLo: Word): LongInt;
function SendDlgItemMsgP(Dlg: HWnd; IDDlgItem: Integer; Msg, wParam: UInt;
  lParam: Pointer): LongInt;
{FÅr Quelltext, der in 16 und 32 bit Åbersetzbar sein soll}
function GetWindowUInt(Wnd: HWnd; Index: Integer): UInt;
function SetWindowUInt(Wnd: HWnd; Index: Integer; NewWord: UInt): UInt;
{Korrekturen fehlerhaft definierter API-Funktionen (fast alles: const)}
procedure CopyRect(var DestRect: TRect; const SourceRect: TRect);
function CreatePolygonRgn(const Points; Count, PolyFillMode: Integer): HRgn;
function CreatePolyPolygonRgn(const Points; const PolyCounts; Count,
  PolyFillMode: Integer): HRgn;
function CreateRectRgnIndirect(const Rect: TRect): HRgn;
function GetInstanceData(Instance:THandle; Data:Word; Count:Integer):Integer;
function EqualRect(const Rect1, Rect2: TRect): Bool;
function FillRect(DC: HDC; const Rect: TRect; Brush: HBrush): Integer;
procedure FrameRect(DC: HDC; const Rect: TRect; Brush: HBrush);
function IntersectRect(var DestRect: TRect; const Src1Rect, Src2Rect: TRect): Integer;
procedure InvertRect(DC: HDC; const Rect: TRect);
function IsRectEmpty(const Rect: TRect): Bool;
function Polygon(DC: HDC; const Points; Count: Integer): Bool;
function Polyline(DC: HDC; const Points; Count: Integer): Bool;
function PolyPolygon(DC: HDC; const Points; const PolyCounts;
  Count: Integer): Bool;
function PtInRect(const Rect: TRect; Point: TPoint): Bool;
function RectInRegion(Rgn: HRgn; const Rect: TRect): Bool;
function RectVisible(DC: HDC; const Rect: TRect): Bool;
function RegisterClass(const WndClass: TWndClass): Bool;
function ScrollDC(DC: HDC; dx, dy: Integer; const Scroll, Clip: TRect;
  UpdateRgn: HRgn; UpdateRect: PRect): Bool;
function SetDIBits(DC: HDC; Bitmap: THandle; StartScan, NumScans: Word;
  Bits: Pointer; const BitsInfo: TBitmapInfo; Usage: Word): Integer;
function SetDIBitsToDevice(DC: HDC; DestX, DestY, Width, Height, SrcX, SrcY,
  nStartScan, NumScans: Word; Bits: Pointer; const BitsInfo: TBitmapInfo;
  Usage: Word): Integer;
procedure SetSysColors(Changes: Integer; const SysColor; const ColorValues);
function StretchDIBits(DC: HDC; DestX, DestY, DestWidth, DestHegiht, SrcX,
  SrcY, SrcWidth, SrcHeight: Word; Bits: Pointer; const BitsInfo: TBitmapInfo;
  Usage: Word; Rop: LongInt): Integer;
function TabbedTextOut(HC: HDC; X, Y: Integer; Str: PChar; Count: Integer;
  TabPositions: Integer; const TabStopPositions; TabOrigin: Integer): LongInt;
procedure Throw(const CatchBuf: TCatchBuf; ThrowBack: Integer);
function UnionRect(var DestRect: TRect; const Src1Rect, Src2Rect: TRect):
  Integer;
function wvsprintf(DestStr, Format: PChar; const ArgList): Integer;
function wsprintf: Integer;			{Nur fÅr Assembler}
function GetTabbedTextExtent(DC: HDC; Str: PChar; Count: Integer;
  TabPostions: Integer; const TabStopPostions):LongInt;
function waveInClose(hWaveIn: Word): Word;	{Bîsartiger Bug!!}
{Umdefinition des RÅckgabewertes}
function GetProfileInt(Sec,Key:PChar; Def: Integer): Integer;
function GetPrivateProfileInt(Sec,Key:PChar; Def: Integer; FileName: PChar):
  Integer;
{Sowas wie "mehrere FÑden" gibts damit auch in Windows 3.1!}
function MMTaskCreate(Proc:TFarProc; var Task: THandle; Data:LongInt):Integer;
{liefert womîglich Fehlercode, 0 wenn OK}
function MMTaskBlock(h:THandle): Word;
function MMTaskSignal(h:THandle): Bool;
function MMGetCurrentTask: THandle;
procedure MMTaskYield;

implementation

function vMBox(WndParent:HWnd; ID,style:UInt; var p):Integer;
{** NICHT OK fÅr DLL wegen HInstance - aber vielleicht vom Aufrufer? **}
 var
  SPH: PChar;			{Zeiger auf Titel}
  I,K: Integer;
  S,S2: TS255;			{2 Puffer; leider so erforderlich}
 begin
  I:=LoadString(HInstance,ID,S,sizeof(S)); {I=Anzahl der Zeichen insgesamt}
  K:=lstrlen(S);
  SPH:=StdMBoxTitle;
  if K<I then SPH:=S+K+1;
  wvsprintf(S2,S,p);
  if style and MB_Sound <>0 then MessageBeep(style and $0070);
  vMBox:=MessageBox(WndParent,S2,SPH,style and not MB_Sound);
 end;

function MBox:Integer; assembler; {cdecl - nur fÅr Assembler-Aufruf}
 asm	mov	si,sp
	add	si,4		{FAR-Return-Adresse Åberspringen}
	cld
	segss	lodsw
	push	ax		{HWndParent}
	segss	lodsw
	push	ax		{ID}
	segss	lodsw
	push	ax		{style}
	push	ss
	push	si		{p}
	call	vMBox
 end;

function MBox0(WndParent:HWnd; ID,style:UInt):Integer;
{hier waere ein cdecl himmlisch...}
 begin
  MBox0:=vMBox(WndParent,ID,style,MemW[0:0]);
 end;
function MBox1(WndParent:HWnd; ID{,style}:UInt; S:PChar):Integer;
 begin
  MBox1:=vMBox(WndParent,ID,0,S);
 end;
function MBox2(WndParent:HWnd; ID,style:UInt; S2,S1:PChar):Integer;
 begin
  MBox2:=vMBox(WndParent,ID,style,S1);
 end;

function AddRemoveVxD(AddPath,RemovVxD:PChar):Integer;
{** OK fÅr DLL **}
 const
  devkey: array[0..7]of Char='device='#0;
 var
  f1,f2: Text;	{zum SYSTEM.INI parsen}
  S,Line: array[0..255]of Char;
  PS,PL: PChar;
  InsideSection,CopyLine: Boolean;
  W: Word;
 begin
  WritePrivateProfileString(nil,nil,nil,'SYSTEM.INI');	{Cache leeren}
  W:=GetWindowsDirectory(S,sizeof(S));
  if S[W-1]<>'\' then begin S[W]:='\'; S[W+1]:=#0; end;	{Backslash anhÑngen}
  PS:=S+lStrLen(S);		{auf die Null}
  lStrCpy(PS,'SYSTEM.IN$');	{Tempname anhÑngen}
  Assign(f2,S); ReWrite(f2);	{zum Schreiben îffnen}
  if IOResult<>0 then begin
   AddRemoveVxD:=ARV_FailCreateTempFile;
   exit;
  end;
  lStrCpy(PS,'SYSTEM.INI');	{Richtigen Namen anhÑngen}
  Assign(f1,S); Reset(f1);	{zum Lesen îffnen}
  if IOResult<>0 then begin
   AddRemoveVxD:=ARV_FailOpenSystemIni;
   exit;
  end;
  InsideSection:=false;
  while not eof(f1) do begin
   ReadLn(f1,Line); CopyLine:=true;
   if Line[0]='[' then begin
    InsideSection:=(lstrcmp1('[386Enh]',Line,lstrcmpi)=0);
    if InsideSection and (AddPath<>nil) then begin
     WriteLn(f2,Line);			{Sektionsbeginn beibehalten}
     WriteLn(f2,devkey,AddPath);	{Neue Zeile hinzufÅgen}
     AddPath:=nil;			{Einmal hinzufÅgen genÅgt}
     CopyLine:=false;			{nichts weiter...}
    end;
   end else begin
    if InsideSection
    and (RemovVxD<>nil)
    and (lstrcmp1(devkey,Line,lstrcmpi)=0)
    and (lStrCmpi(GetFileNamePtr(Line+7),RemovVxD)=0) then begin
     CopyLine:=false;
     RemovVxD:=nil;			{erledigt}
    end;
   end;
   if CopyLine then WriteLn(f2,Line);
  end;
  Close(f1); Close(f2);
  if IOResult<>0 then begin
   AddRemoveVxD:=ARV_FailReadWrite;
   exit;	{Problem! Quelle nicht lîschen!}
  end;
  Erase(f1);			{Quelle lîschen}
  if IOResult<>0 then begin
   AddRemoveVxD:=ARV_FailDelete;
   exit;
  end;
  ReName(f2,S);			{Ziel umbenennen}
  if IOResult<>0 then begin
   AddRemoveVxD:=ARV_FailRename;
   exit;
  end;
  AddRemoveVxD:=0;
  if RemovVxD<>nil then AddRemoveVxD:=ARV_CantRemove;
  if AddPath<>nil then AddRemoveVxD:=ARV_CantAdd;
 end;

function RegSetRoot(Path,Value:PChar):Boolean;
 begin	{** OK fÅr DLL **}
  RegSetRoot:=(RegSetValue(HKCR,Path,REG_SZ,Value,
    lstrlen(Value))=ERROR_SUCCESS);
 end;

function RegGetRoot(Path,Value:PChar; VL:UInt):Boolean;
 var	{** OK fÅr DLL **}
  cb: LongInt;
 begin
  cb:=VL;
  RegGetRoot:=(RegQueryValue(HKCR,Path,Value,cb)=ERROR_SUCCESS);
 end;

function RegSetVal(Key:HKey;Path,Value:PChar):Boolean;
 begin	{** OK fÅr DLL **}
  RegSetVal:=(RegSetValue(Key,Path,REG_SZ,Value,
    lstrlen(Value))=ERROR_SUCCESS);
 end;

function RegGetVal(Key:HKey;Path,Value:PChar; VL:UInt):Boolean;
 var	{** OK fÅr DLL **}
  cb: LongInt;
 begin
  cb:=VL;
  RegGetVal:=(RegQueryValue(Key,Path,Value,cb)=ERROR_SUCCESS);
 end;

function WriteProfileInt(Section,Key:PChar; Value:Integer):Bool;
{** OK fÅr DLL **}
 var
  S: array[0..7]of Char;
 begin
  wvsprintf(S,'%d',Value);
  WriteProfileInt:=WriteProfileString(Section,Key,S);
 end;

function IsInvisible(c:Char):Boolean;
{liefert TRUE, wenn Zeichen im Åblichen Windows-Zeichensatz nicht sichtbar}
 begin
  IsInvisible:=(c<' ') or (c>=#$80) and (c<#$A0) or (c=#$FF);
 end;

function EscapeStr(src:PChar; slen:UInt; dst:PChar; dlen:UInt):UInt;
{Wandelt Åbergebene "Bytefolge" (nicht nullterminiert) in C-String
 mit Escape-Sequenzen um, auch \" und \' und \\. Nicht darstellbare
 Zeichen werden in \a, \b usw. und ansonsten in Hex (\xXX) umgesetzt.
 Liefert als Ergebnis die LÑnge des Ergebnisstrings ohne \0.
 src und dst dÅrfen sich nicht Åberlappen.}
 var
  su:record
   case Integer of
    1: (c: Char);
    2: (i: Integer);	{Ausrichtungs-Problem bei wvsprintf}
  end;
  ChrCount: UInt;
 function fcat(template:PChar; len:UInt):Boolean;
  begin
   fcat:=false;
   if len<dlen then begin
    if PtrRec(template).Sel<>0
    then wvsprintf(dst,template,su.i)
    else dst^:=su.c;
    Inc(dst,len);
    Inc(ChrCount,len);
    Dec(dlen,len);
    fcat:=true;
   end;
  end;
 begin
  ChrCount:=0;
  while slen>0 do begin
   su.i:=0;
   case src^ of
    '\','"','''': su.c:=src^;
    #7:  su.c:='a';
    #8:  su.c:='b';
    #9:  su.c:='t';
    #10: su.c:='n';
    #11: su.c:='v';
    #13: su.c:='r';
   end;
   if su.i<>0 then begin
    if not fcat('\%c',2) then break;
   end else begin
    su.c:=src^;
    if IsInvisible(su.c) then begin
     if not fcat('\x%02X',4) then break;
    end else begin
     if not fcat(nil,1) then break;
    end;
   end;
   Inc(src);
   Dec(slen);
  end{while};
  if dlen>0 then dst^:=#0;	{terminieren}
  EscapeStr:=ChrCount;
 end;

function UnescapeStr(src, dst:PChar; dlen:UInt):UInt;
{Wandelt Åbergebenen C-String (nullterminiert) in "Bytefolge".
 Liefert als Ergebnis die LÑnge der Ergebnis-Bytefolge -
 diese ist nicht nullterminiert!
 Da der Ergebnisstring niemals lÑnger wird, darf src=dst sein.}
 var
  su,st: Char;
  ChrCount: UInt;
  e,f: Integer;
 begin
  ChrCount:=0;
  while dlen>0 do begin
   su:=src^;
   Inc(src);
   if su=#0 then break;
   if su='\' then begin
    su:=src^;
    Inc(src);
    case su of
     #0: break;
     '0': su:=#0;	{Hier: Keine Oktalzahlen - nur dieser Sonderfall}
     '1'..'9': begin
      Dec(src);
      Val(src,Byte(su),e);	{liefert als Fehler Zeichenpos+1!}
      if e<>0 then begin
       Dec(e);
       st:=src[e];
       src[e]:=#0;
       Val(src,Byte(su),f);	{sollte f=0 liefern, ist jedoch belanglos}
       Inc(src,e);
       src^:=st;		{ZurÅckpatchen}
      end else Inc(src,lstrlen(src));	{falls gerade am Stringende}
     end;
     'a': su:=#7;
     'b': su:=#8;
     't': su:=#9;
     'n': su:=#10;
     'v': su:=#11;
     'r': su:=#13;
     'x': begin
      st:=src[2];
      src[2]:=#0;
      Dec(src);
      src[0]:='$';
      Val(src,Byte(su),e);
      src[0]:='x';		{ZurÅckpatchen}
      Inc(src);
      src[2]:=st;		{ZurÅckpatchen}
      if e=0 then Inc(src,2) else su:='x';
     end;
    end{case};		{im ELSE-Fall bleibt "su" literal!}
   end{if};
   dst^:=su;
   Inc(dst);
   Inc(ChrCount);
   Dec(dlen);
  end;
  UnescapeStr:=ChrCount;
 end;

function _ldelete(S: PChar):Integer;
{** OK fÅr DLL, nur kurze Dateinamen! **}
 var
  ReOpenBuf: TOfStruct;
 begin
  _lDelete:=OpenFile(S,ReOpenBuf,OF_Delete);
 end;

function lstrchr(Str:PChar; C:Char):PChar; assembler;
 asm	les	bx,[Str]
	mov	dx,es
	or	dx,dx
	jz	@@n
	jmp	@@f
@@l:	push	es
	push	ax
	call	AnsiNext	{Leider ist diese Funktion Ñtzend langsam!}
	mov	es,dx
	xchg	bx,ax
@@f:	mov	al,es:[bx]
	cmp	al,[C]
	xchg	bx,ax
	je	@@e
	or	bl,bl
	jnz	@@l
@@n:	xor	ax,ax
	cwd
@@e: end;

function lstrcmp1(s_short,s_long:PChar;CP:TCompProc):Integer; assembler;
 asm	les	si,[s_short]
	push	es
	push	si
	call	lstrlen		{String-LÑnge...}
	les	bx,[s_long]
	mov	di,bx
	add	di,ax		{bis dahin vergleichen!}
	mov	al,0
	xchg	es:[di],al	{deshalb langen String abhacken}
	push	es
	push	di
	push	ax
	 push	PtrRec[s_short].sel
	 push	si
	 push	es
	 push	bx
	 call	[CP]		{DI und SI kînnten zerstîrt werden}
	pop	bx
	pop	di
	pop	es
	mov	es:[di],bl	{zurÅckpatchen}
 end;

function lstrstr(needle,heap:PChar;CP:TCompProc):PChar; assembler;
 asm	push	ds
	 lds	si,[needle]
	 push	ds
	 push	si
	 call	lstrlen
	 xchg	di,ax
	 lds	si,[heap]
	 push	ds
	 push	si
	 call	lstrlen
	 mov	bx,si		{der Heu-Zeiger}
	 add	si,di		{die Null-Patch-Stelle}
	 sub	di,ax		{LÑngendifferenz = Anzahl der Vergleiche -1}
	 jc	@@notfound	{Nadel lÑnger als Heu? Kann nicht finden!}
	 lea	cx,[di+1]	{Anzahl der Vergleiche (stets >0)}
	 les	di,[needle]
	 mov	dx,es
@@l:	{Suchschleife mit DS:SI=Null-Patch-Stelle, DS:BX=Heu, DX:DI=Nadel, CX=}
	 mov	al,0
	 xchg	[si],al		{Patch!}
	 pusha
	  push	dx
	  push	di		{DX:DI=Nadel-Zeiger}
	  push	ds
	  push	bx		{DS:BX=Heu-Zeiger}
	  call	[CP]
	  or	ax,ax
	 popa
	 mov	[si],al		{RÅckpatch!}
	 jz	@@found
	 inc	di
	 inc	si
	 loop	@@l
@@notfound:
	 xor	ax,ax
	 cwd
	 jmp	@@e
@@found:
	 mov	dx,ds		{ins HEU!}
	 xchg	di,ax
@@e:	pop	ds
 end;

function memcmp(s1,s2:PChar; len:UInt):Integer; assembler;
 asm	push	ds
	 cld
	 lds	si,[s1]
	 les	di,[s2]
	 mov	cx,[len]
	 mov	ax,1
	 repe	cmpsb
	 ja	@@e		{AX=1 wenn Z=0 und CY=0}
	 sbb	ax,ax		{AX=0 wenn Z=1 und AX=-1 wenn CY=1}
@@e:	pop	ds
 end;

procedure Inc_SI_when_AL_DBCS; assembler;
 asm	pusha
	 push	ax
	 call	IsDbcsLeadByte
	 add	ax,-1	{CY=1 wenn AX<>0}
	popa
	adc	si,0
 end;

function GetFileNamePtr(S:PChar):PChar; assembler;
{** OK fÅr DLL **}
{liefert Zeiger hinter das letzte Auftreten von /\: oder Stringanfang}
 asm	les	si,[S]
	cld
@@ME:	mov	dx,si	{Mîgliches Ende merken}
@@l:	seges	lodsb
	cmp	al,'\'
	jz	@@ME
	cmp	al,'/'
	jz	@@ME
	cmp	al,':'
	jz	@@ME
	or	al,al
	jz	@@e
	call	Inc_SI_when_AL_DBCS
	jmp	@@l
@@e:
	mov	ax,es
	xchg	dx,ax
 end;

function GetFileNameExt(S:PChar):PChar; assembler;
{** OK fÅr DLL **}
{liefert Zeiger AUF DEN PUNKT oder AUF DIE TERMINIERENDE NULL, niemals NIL}
{Als Extension gilt hierbei die Zeichenkette beginnend am _letzten_
 Punkt in der _letzten_ Pfadkomponente, wenn dieser Punkt nicht
 am Anfang steht (wie bei den versteckten Dateien unter UNIX)
 und auch nicht als Folge von Punkten am Anfang steht (wie bei ..)
*Voraussetzung fÅr das korrekte Funktionieren dieser Funktion ist,
 da· der Dateiname keinen anhÑngigen Pfad-Trenner (/\:) hat.}
{AH enthÑlt: 0 fÅr Pfadkomponentenanfang, 1 fÅr andere Zeichen als /\:.,
 Ú2 fÅr Punkt gefunden}
 asm	les	si,[S]
	cld
@@ME:	xor	ah,ah	{AH=0 Pfadkomponente beginnt}
@@m1:	mov	dx,si
@@l:	seges	lodsb
	cmp	al,'\'
	jz	@@me	{Neue Pfadkomponente: AH=0 setzen}
	cmp	al,'/'
	jz	@@me	{dito}
	cmp	al,':'
	jz	@@me	{dito}
	cmp	al,'.'
	jz	@@pt
	or	al,al
	jz	@@e	{fertig}
	call	Inc_SI_when_AL_DBCS
	cmp	ah,2
	jnc	@@l	{AH=2 (oder hîher) nicht fertig und zuletzt '.'}
	mov	ah,1	{AH=1 setzen - zuletzt kein '\/:'}
	jmp	@@m1
@@pt:
	or	ah,ah	{Null?}
	jz	@@m1	{kein Extensionspunkt am Anfang!}
	inc	ah	{AHÚ2 gÅltiger, aber vielleicht nicht finaler Punkt}
	lea	dx,[si-1]
	jmp	@@l	{Adresse AUF den Punkt bleibt in DX stehen}
@@e:	mov	ax,es
	xchg	dx,ax
 end;

function RemoveTrailSlash(S:PChar):PChar; assembler;
{** OK fÅr DLL ** - nicht fÅr DBCS geeignet}
{liefert Zeiger AUF DIE NULL, entfernt alle anhÑngenden Slashes}
 asm	les	di,[S]
	cld
	xor	ax,ax
	mov	dx,di
	mov	cx,$FFFF
	repne	scasb	{ES:DI hinter die Null}
@@l:	dec	di	{auf die Null}
	cmp	di,dx
	je	@@e
	mov	al,es:[di-1]
	cmp	al,'\'
	jz	@@l
	cmp	al,'/'
	jz	@@l
@@e:{Sonstiges Zeichen erreicht}
	mov	byte ptr es:[di],ah
	mov	dx,es
	mov	ax,di
 end;

function PathCat(Path,FName:PChar):PChar; assembler;
{AnhÑngen von FName an Path; dabei darf Path mit oder ohne (Back)Slash enden,
 RÅckgabewert ist die Stelle, wo FName hinkopiert wurde (also hinter Slash)}
 asm	les	di,[Path]
	push	es
	push	di
	call	RemoveTrailSlash
	mov	al,'\'
	stosb
	push	es
	push	di
	les	di,[FName]
	push	es
	push	di
	call	lstrcpy
 end;

procedure AnsiDosFunc; assembler;
{PE: DS:DX=Dateiname (wird ANSI2OEM-konvertiert mit dynamischer
 Stackanforderung); sonstige Register au·er BP werden durchgereicht
 VR: DS,DX, weitere Register je nach DOS-Funktion}
 asm	push	bp
	mov	bp,sp
	{Register retten; Windows-Funktionen retten SI und DI selbst}
	push	ax
	push	bx
	push	cx
	push	es
	{LÑnge ermitteln und Stack reservieren}
	push	dx		{DX Åber's lstrlen hinÅberretten}
	push	ds
	push	dx
	call	lstrlen		{NamenslÑnge in AX}
	pop	dx
	inc	ax
	inc	ax
	and	al,not 1	{aufrunden und ausrichten}
	sub	sp,ax		{dynamische Stack-Anforderung!!}
	mov	ax,sp		{neuer Stringzeiger}
	{String dahinein kopieren}
	push	ds
	push	dx		{ds:dx=Quelle}
	push	ss
	push	ax		{ss:ax=Ziel}
	call	AnsiToOem
	{Register holen}
	mov	ax,[bp-2]
	mov	bx,[bp-4]
	mov	cx,[bp-6]
	mov	es,[bp-8]
	{DOS rufen}
	push	ss
	pop	ds
	mov	dx,sp		{ds:dx=konvertierter String}
	stc
	call	Dos3Call
	{fertig}
	leave			{sp:=bp, pop bp}
 end;

procedure ShortYield;
{** OK fÅr DLL **}
 var
  Msg: TMsg;
 begin
  if PeekMessage(Msg,0,0,0,PM_Remove) then begin
   TranslateMessage(Msg);
   DispatchMessage(Msg);
  end;
 end;

procedure TranslateWin95Keys(const Msg:TMsg); assembler;
 asm
	les	di,[Msg]
{if (Msg.message and $FFFE <>WM_SysKeyDown) then exit;}
	mov	ax,es:TMsg[di].message
	mov	si,es:TMsg[di].wParam
	cmp	ax,WM_SysKeyDown		{kein F10}
	jne	@@noF10
	cmp	si,VK_F10
	jne	@@e
	push	es
	 call	GetShiftState
	pop	es
	jz	@@e
	jmp	@@ok
@@noF10:
	cmp	ax,WM_KeyDown
	jne	@@e
	cmp	si,0FFh			{VK_FF kommt unter Win3.1}
	jne	@@e
	cmp	es:byte ptr TMsg[di].lParam+2,VK_ContextKey
	jne	@@e

@@ok:	mov	ax,es:TMsg[di].hWnd
	push	ax
	push	WM_ContextMenu
	push	ax
	push	-1
	push	-1
	call	PostMessage
@@e:	end;

procedure SortRect(var R:TRect); assembler;
{sortiert die Punkte, da· die Zuordnungen stimmen}
 asm	les	bx,[R]
	mov	ax,es:TRect[bx].left
	cmp	ax,es:TRect[bx].right
	jl	@@1
	xchg	es:TRect[bx].right,ax
	mov	es:TRect[bx].left,ax
@@1:	mov	ax,es:TRect[bx].top
	cmp	ax,es:TRect[bx].bottom
	jl	@@2
	xchg	es:TRect[bx].bottom,ax
	mov	es:TRect[bx].top,ax
@@2:	end;

procedure ShiftRect; assembler;
{Hilfsfunktion, schiebt horizontal bzw. vertikal}
 asm	mov	ax,es:TRect[di].left
	sub	ax,TRect[si].left
	jz	@@e		{wenn linksbÅndig: niemals schieben}
	jg	@@r		{R nach rechts}
	{nun: AX negativ oder Null: Verschiebe-FÑhigkeit nach links}
	mov	dx,es:TRect[di].right
	sub	dx,TRect[si].right
	jge	@@e		{nicht schieben}
	cmp	ax,dx		{die betragsmÑ·ig kleinere Zahl ist gefragt}
	jg	@@r
	xchg	dx,ax
@@r:	add	TRect[si].left,ax
	add	TRect[si].right,ax
	mov	cl,TRUE		{Verschiebung vermerken}
@@e: end;

function MoveRectIntoRect(var R:TRect; const R2:TRect): Bool; assembler;
{Falls R in R2 teilweise oder vollstÑndig au·erhalb liegt,
 wird R verschoben und TRUE zurÅckgeliefert, um maximale Sichtbarkeit
 zu realisieren.
 Dient zum Hineinholen von au·erhalb liegenden Fenstern in den Desktop.}
 asm	push	ds
	 lds	si,[R]
	 les	di,[R2]
	 xor	cx,cx
	 call	ShiftRect
	 add	si,2		{auf "top" bzw. "bottom" vorrÅcken}
	 add	di,2
	 call	ShiftRect
	 xchg	cx,ax
	pop	ds
 end;

procedure GetFullScreenRect(var R:TRect); assembler;
{Ermittelt das Rechteck fÅr maximierte Fenster, d.h. die Startleiste(n)
 von Win9x bereits abgezogen, ideal fÅr R2 in MoveRectIntoRect}
 asm	les	di,[R]
	cld
	xor	ax,ax
	stosw		{R.left=0}
	stosw		{R.top=0}
	push	es
	 push	SM_CXFullScreen
	 call	GetSystemMetrics
	pop	es
	cld
	stosw
	push	es
	 push	SM_CYFullScreen
	 call	GetSystemMetrics
	 xchg	si,ax
	 push	SM_CYCaption
	 call	GetSystemMetrics
	 add	ax,si
	pop	es
	stosw
 end;

procedure MoveRectIntoFullScreen(var R:TRect);
{die logische Kombination beider o.g. Routinen}
 var
  R2: TRect;
 begin
  GetFullScreenRect(R2);
  MoveRectIntoRect(R,R2);
 end;

function GetShiftState:Bool; assembler;
{liefert Z=0: Shift gedrÅckt (AX<>0), Z=1: Shift nicht gedrÅckt (AX=0),
 VR: AX,BX,CX,DX,ES}
 asm	push	VK_Shift
	call	GetKeyState
	and	al,0FEh
 end;

function GetControlState:Bool; assembler;
{liefert Z=0: Control gedrÅckt (AX<>0), Z=1: Control nicht gedrÅckt (AX=0),
 VR: AX,BX,CX,DX,ES}
 asm	push	VK_Control
	call	GetKeyState
	and	al,0FEh
 end;

procedure __AHShift;		external 'KERNEL' index 113;
procedure __AHIncr;		external 'KERNEL' index 114;
procedure __0000H;		external 'KERNEL' index 183;
procedure __0040H;		external 'KERNEL' index 193;
procedure __A000H;		external 'KERNEL' index 174;
procedure __B000H;		external 'KERNEL' index 181;
procedure __B800H;		external 'KERNEL' index 182;
procedure __C000H;		external 'KERNEL' index 195;
procedure __D000H;		external 'KERNEL' index 179;
procedure __E000H;		external 'KERNEL' index 190;
procedure __F000H;		external 'KERNEL' index 194;
procedure __RomBios;		external 'KERNEL' index 173;
procedure __WinFlags;		external 'KERNEL' index 178;
function _hread;		external 'KERNEL' index 349;
function _hwrite;		external 'KERNEL' index 350;
procedure Throw;		external 'KERNEL' index 56;
function GetInstanceData;	external 'KERNEL' index 54;
function GetProfileInt;		external 'KERNEL' index 57;
function GetPrivateProfileInt;	external 'KERNEL' index 127;
function _LocalLock;		external 'KERNEL' index 8;
function SendMessageWW;		external 'USER' index 111;
function SendMessageP;		external 'USER' index 111;
function SendDlgItemMsgWW;	external 'USER' index 101;
function SendDlgItemMsgP;	external 'USER' index 101;
procedure CopyRect;		external 'USER' index 74;
function IsRectEmpty;		external 'USER' index 75;
function PtInRect;		external 'USER' index 76;
function IntersectRect;		external 'USER' index 79;
function UnionRect;		external 'USER' index 80;
function FillRect;		external 'USER' index 81;
procedure InvertRect;		external 'USER' index 82;
procedure FrameRect;		external 'USER' index 83;
function EqualRect;		external 'USER' index 244;
function RegisterClass;		external 'USER' index 57;
function ScrollDC;		external 'USER' index 221;
procedure SetSysColors;		external 'USER' index 181;
function TabbedTextOut;		external 'USER' index 196;
function wsprintf;		external 'USER' index 420;
function wvsprintf;		external 'USER' index 421;
function GetTabbedTextExtent;	external 'USER' index 197;
function GetWindowUInt;		external 'USER' index 133;
function SetWindowUInt;		external 'USER' index 134;
function CreatePolygonRgn;	external 'GDI' index 63;
function CreatePolyPolygonRgn;	external 'GDI' index 451;
function CreateRectRgnIndirect;	external 'GDI' index 65;
function Polygon;		external 'GDI' index 36;
function Polyline;		external 'GDI' index 37;
function PolyPolygon;		external 'GDI' index 450;
function RectInRegion;		external 'GDI' index 181;
function RectVisible;		external 'GDI' index 104;
function SetDIBits;		external 'GDI' index 440;
function SetDIBitsToDevice;	external 'GDI' index 443;
function StretchDIBits;		external 'GDI' index 439;
function waveInClose;		external 'MMSYSTEM' index 505;
function MMTaskCreate;		external 'MMSYSTEM' index 900;
function MMTaskBlock;		external 'MMSYSTEM' index 902;
function MMTaskSignal;		external 'MMSYSTEM' index 903;
function MMGetCurrentTask;	external 'MMSYSTEM' index 904;
procedure MMTaskYield;		external 'MMSYSTEM' index 905;

function LocalLock(Mem: THandle): Pointer; assembler;
{noch einmal wegen falscher Codesegment-Attribute von WinProcs}
 asm	push	Mem
	call	_LocalLock
	mov	dx,ds
 end;

function GetDragClientFromPos(const P:TPoint):HWnd;
 var
  Wnd:HWnd;
 begin
  Wnd:=WindowFromPoint(P);
  if Wnd<>0 then begin
   if GetWindowLong(Wnd,GWL_ExStyle) and WS_EX_AcceptFiles =0
   then Wnd:=0;
  end;
  GetDragClientFromPos:=Wnd;
 end;

function PerformDrop(ToWnd:HWnd;const P:TPoint;
  argc:Integer;argv:PPChar):Bool;
{enthÑlt Bugs? Noch ungetestet!}
 var
  HDrop: THandle;
  len: Word;
  i: Integer;
  ppc: PPChar;
  SP: PChar absolute ppc;	{nicht gemeinsam benutzt}
 begin
  PerformDrop:=false;
  if ToWnd=0 then exit;
  if argc<=0 then exit;
  ppc:=argv;
  len:=sizeof(TDropFileStruct);
  for i:=argc downto 1 do begin
   if ppc^=nil then exit;
   Inc(len,lstrlen(ppc^)+1);	{GesamtlÑnge ermittlen}
   Inc(ppc);
  end;
  HDrop:=GlobalAlloc(GMEM_Share or GMEM_Moveable, len);
  if HDrop=0 then exit;
  with PDropFileStruct(GlobalLock(HDrop))^ do begin
   wSize:=8;
   mPos:=P;
   InNcArea:=Word(SendMessage(ToWnd,WM_NcHitTest,0,LongInt(P)))<>HTClient;
   ScreenToClient(ToWnd,mPos);
   SP:=fNames;
   repeat
    lstrcpy(SP,argv^);
    Inc(SP,lstrlen(argv^)+1);
    Inc(argv);
    Dec(argc);
   until argc=0;
   SP^:=#0;
  end;
  GlobalUnlock(HDrop);
  PerformDrop:=PostMessage(ToWnd,WM_DropFiles,HDrop,0);
 end;

{IncHugePointer - Erhîhen eines Zeigers
 auf Speicher mit mehr als 64 Kilobyte; Windows-Version mit AHIncr}
procedure IncHP(var P:PChar; By: Word); assembler;
 asm
  les di,[P]			{Adresse von P}
  mov ax,[By]
  add es:PtrRec[di].Ofs,ax	{Offset inkrementieren}
  jnc @@e			{kein öberlauf: Selektor belassen!}
  add es:PtrRec[di].Sel,offset __AHIncr	{Selektor erhîhen}
@@e:
 end;

{DecHugePointer - Erniedrigen eines Zeigers
 auf Speicher mit mehr als 64 Kilobyte; Windows-Version mit AHIncr}
procedure DecHP(var P:PChar; By: Word); assembler;
 asm
  les di,[P]			{Adresse von P}
  mov ax,[By]
  sub es:PtrRec[di].Ofs,ax	{Offset inkrementieren}
  jnc @@e			{kein öberlauf: Selektor belassen!}
  sub es:PtrRec[di].Sel,offset __AHIncr	{Selektor erniedrigen}
@@e:
 end;

{IncHugePointerLong - Erhîhen und Erniedrigen eines Zeigers
 auf Speicher mit mehr als 64 Kilobyte; Windows-Version mit AHIncr}
procedure IncHPL(var P:PChar; By: LongInt); assembler;
 asm
  les di,[P]			{Adresse von P}
  mov cx,LongRec[By].Lo		{Hier AX:CX: ungewîhnlich!}
  mov ax,LongRec[By].Hi
  add es:PtrRec[di].Ofs,cx	{Offset inkrementieren}
  adc ax,0			{Anzahl der 64-K-öbergÑnge}
  mov cx,offset __AHShift
  shl ax,cl			{Vielfaches erzeugen}
  add es:PtrRec[di].Sel,ax	{Selektor erhîhen bzw. erniedrigen}
 end;

function minL(L1,L2:LongInt):LongInt; assembler;
{Nebenergebnis: CX:BX = Maximum}
 asm	mov	dx,LongRec[L1].hi
	mov	ax,LongRec[L1].lo
	mov	cx,LongRec[L2].hi
	mov	bx,LongRec[L2].lo
	cmp	dx,cx
	jl	@@e
	jg	@@swp
	cmp	ax,bx
	jle	@@e
@@swp:	xchg	bx,ax
	xchg	cx,dx
@@e:	end;

function maxL(L1,L2:LongInt):LongInt; assembler;
 asm	push	LongRec[L1].hi
	push	LongRec[L1].lo
	push	LongRec[L2].hi
	push	LongRec[L2].lo
	call	minL
	xchg	bx,ax
	xchg	cx,dx
	end;

function LimitL(i,u,o:LongInt):LongInt; assembler;
 asm	push	LongRec[i].hi
	push	LongRec[i].lo
	push	LongRec[u].hi
	push	LongRec[u].lo
	call	minL	{Maximum in CX:BX}
	push	cx
	push	bx
	push	LongRec[o].hi
	push	LongRec[o].lo
	call	minL	{Minimum in DX:AX - fertig}
 end;

function BetweenL(i,u,o:LongInt):LongInt; assembler;
 asm	push	LongRec[u].hi
	push	LongRec[u].lo
	push	LongRec[o].hi
	push	LongRec[o].lo
	call	minL	{DX:AX = Minimum, CX:BX = Maximum}
	push	LongRec[i].hi
	push	LongRec[i].lo
	push	dx
	push	ax
	push	cx
	push	bx
	call	LimitL
 end;

function InitStruct; assembler;
 asm	les	di,[x]
	mov	ax,[xlen]
	cld
	stosw
	shr ax,1
	dec ax
	xchg cx,ax
	xor ax,ax
	rep stosw
 end;

function BitCount; assembler;
 asm	mov	cx,[W]
	xor	ax,ax
@@l:	jcxz	@@e
	shr	cx,1	{statistisch sind die meisten Bits "unten"}
	adc	ax,0
	jmp	@@l
@@e:	end;

function bsf; assembler;
 asm	mov	cx,[W]
	mov	ax,-1
	jcxz	@@e
	mov	ax,16
@@l:	jcxz	@@e
	shl	cx,1
	dec	ax
	jmp	@@l
@@e:	end;

function bsr; assembler;
 asm	mov	cx,[W]
	mov	ax,-1
@@l:	jcxz	@@e
	shr	cx,1
	inc	ax
	jmp	@@l
@@e:	end;

{TransparentBlt: von der MSDN-Library-CD
 kopiert Bitmap unter Angabe einer tranparenten Farbe (TColorRef)
 in einen Zielkontext. Dreh- und Angelpunkt ist der korrekte ROP.
 PE: DC:  ZielgerÑtekontext
     x,y: Ziel-Koordinaten linke obere Ecke
     hBm: Quell-Bitmap
     cr:  Transparente Farbe}
procedure TransparentBlt(DC:HDC; x,y:Integer; HBM:HBitmap; cr:TColorRef);
 const ROP_DSPDxax=$00E20746;
 var
  hDCSrc,hDCMid: HDC;
  hBmpMono: HBitmap;
  hBrT: HBrush;
  crBack,crText: TColorRef;
  bm: TBitmap;
 begin
  if HBM<>0 then begin
   GetObject(hBM,sizeof(bm),@bm);
   hDCSrc:=CreateCompatibleDC(DC);
   hDCMid:=CreateCompatibleDC(DC);
   hBmpMono:=CreateCompatibleBitmap(hDCMid,bm.bmWidth,bm.bmHeight);
   SelectObject(hDCSrc,hBm);
   SelectObject(hDCMid,hBmpMono);

   crBack:=SetBkColor(hDCSrc,cr);
   BitBlt(hDCMid,0,0,bm.bmWidth,bm.bmHeight,hDCSrc,0,0,SrcCopy);
   SetBkColor(hDCSrc,crBack);

   BitBlt(DC,x,y,bm.bmWidth,bm.bmHeight,hDCSrc,0,0,SrcCopy);
   hBrT:=SelectObject(DC,CreateSolidBrush(GetBkColor(DC)));
   crText:=SetTextColor(DC,$000000);
   crBack:=SetBkColor(DC,$FFFFFF);
   BitBlt(DC,x,y,bm.bmWidth,bm.bmHeight,hDCMid,0,0,ROP_DSPDxax);
   SetTextColor(DC,crText);
   SetBkColor(DC,crBack);
   DeleteObject(SelectObject(DC,hBrT));
   DeleteDC(hDCSrc);
   DeleteDC(hDCMid);
   DeleteObject(hBmpMono);
  end;
 end;

function _lopen2(Name:PChar;ReadWrite:Integer):Integer; assembler;
{wie _lopen, aber 2 Versuche: mit gegebenem Share-Modus und dann im
 KompatibilitÑts-Modus.
 Verhindert, dass ein ôffnen fehlschlÑgt, wenn ein anderes Programm
 (in welchem Glauben auch immer, es gab nie eine Empfehlung seitens
 Microsoft!) dieselbe Datei geîffnet hÑlt.}
 asm	les	di,[Name]
	push	es
	 push	es
	 push	di
	 push	[ReadWrite]
	 call	_lopen
	pop	es
	cmp	ax,-1
	jne	@@e		{schon OK}
	push	es
	push	di
	mov	ax,[ReadWrite]
	and	al,0Fh		{Share-Bits ausmaskieren}
	push	ax
	call	_lopen
@@e:
 end;

{Funktionskompatibel zur Win32-API, unterstÅtzt lange Dateinamen}
function CopyFile(NameS,NameD:PChar; Overwrite: Bool):Bool;
 label
  ex1, ex2, ex3;
 const
  BUFSIZE=$4000;
 var
  OK: Bool;
  Buf: PChar;		{hier: 16K-Cluster}
  fs,fd: Integer;
  BytesRead: Integer;
 begin
  OK:=false;
  fs:=_lopen2(NameS,OF_Share_Deny_Write);
  if fs=-1 then goto ex1;
  if not Overwrite then begin
   fd:=_lopen2(NameD,OF_Share_Deny_Write);	{LFN-fÑhiger Existenz-Test}
   if fd<>-1 then goto ex2;
  end;
  fd:=_lcreat(NameD,0); {BÅgeln! (Eigentlich: Dateiattribute kopieren?)}
  if fd=-1 then goto ex2;
  Buf:=Ptr(GlobalAlloc(GMEM_Fixed,BUFSIZE),0);
  if PtrRec(Buf).sel=0 then goto ex2;
  repeat
   BytesRead:=_lread(fs,Buf,BUFSIZE);
   if Integer(_lwrite(fd,Buf,BytesRead))<>BytesRead then goto ex3;
  until BytesRead=0;
  GlobalFree(PtrRec(Buf).sel);
  asm	mov	ax,5700h	{Datum/Uhrzeit lesen}
	mov	bx,[fs]
	call	Dos3Call
	jc	ex3
	inc	al		{Datum/Uhrzeit setzen}
	mov	bx,[fd]
	call	Dos3Call
	jc	ex3
  end;
  OK:=true;
  ex3: OK:=(_lclose(fd)<>-1) and OK;
  ex2: OK:=(_lclose(fs)<>-1) and OK;
  ex1: CopyFile:=OK;
 end;

{GetDriveTypeEx: Laufwerkstyp ermitteln, mit CD-ROM und RAM
 PE: Drv:	Nullbasierter Laufwerks-Index
 PA: Einer der Werte:
   Drive_Removable, Drive_Fixed, Drive_Remote, Drive_CDROM, Drive_RAM}

function GetDriveTypeEx(Drv:Integer):UInt; assembler;
 asm
	push	[Drv]
	call	GetDriveType
	cmp	ax,Drive_Fixed
	jz	@@TestCD
	cmp	ax,Drive_Remote
	jnz	@@SkipCD
@@TestCD:
	push	ax
	 mov	ax,$1500
	 xor	bx,bx
	 int	$2f	{Test MSCDEX-PrÑsenz}
	 or	bx,bx
	 jz	@@NoCD
	 mov	ax,$150B
	 mov	cx,[Drv]
	 int	$2f	{Test Laufwerk=CD-ROM?}
	 or	ax,ax
	 jz	@@NoCD
	pop	ax
	push	Drive_CDROM
@@NoCD:
@@SkipCD:
	pop	ax
	cmp	ax,Drive_Fixed
	jnz	@@SkipRAM
	push	ax
	push	ds
	 push	ss
	 pop	ds
	 sub	sp,$200	{Dynamische Stackreservierung zum Sektorlesen}
	 mov	bx,sp	{BX=Sektorzeiger}
	 mov	ax,[Drv]
	 mov	cx,1	{Anzahl=1}
	 xor	dx,dx	{Sektor 0}
	 int	$25
	 jc	@@NoRAM
	 mov	bx,sp	{Achtung: BX ist 2 tiefergelegt!}
{	 cmp	byte ptr ss:[bx+$17],$f8 {Nochmals auf "Festplatte" testen}
{	 jne	@@NoRAM			  ... funktioniert nicht mit TDSK!}
	 cmp	byte ptr ss:[bx+$12],1	{Eine FAT?}
	 jne	@@NoRAM
	 mov	word ptr ss:[bx+$204],Drive_RAM	{gepushtes AX verÑndern!!}
@@NoRAM:
	 add	sp,$202	{Stack freigeben, 2 mehr wegen Int25}
	pop	ds
	pop	ax
@@SkipRAM:
 end;

{Zentriert Wnd im Elternfenster oder Desktopfenster}
procedure CenterDlg(Wnd:HWnd); assembler;
 var
  R: TRect;
 asm	mov	si,sp		{Rechteck Dialog und Desktop}
	push	[Wnd]
	call	GetParent
	or	ax,ax
	jnz	@@1
	call	GetDesktopWindow
@@1:	push	ax
	push	ss
	push	si		{fÅr GetDesktopWindowRect}
	 push	[Wnd]
	 push	ss
	 push	si
	 call	GetWindowRect
	mov	si,[R.right]
	sub	si,[R.left]	{SI=neues R.width}
	mov	di,[R.bottom]
	sub	di,[R.top]	{DI=neues R.height}
	call	GetWindowRect

	push	[Wnd]
	mov	ax,[R.right]	{R.left sollte 0 sein}
	sub	ax,si
	sar	ax,1
	push	ax		{neues R.left (X)}

	mov	ax,[R.bottom]	{R.top sollte 0 sein}
	sub	ax,di
	sar	ax,1
	push	ax		{neues R.top (Y)}

	push	si		{width}
	push	di		{height}
	push	1		{fRepaint}
	call	MoveWindow
 end;

function GetRadioCheck(Wnd:HWnd; u,o:UInt): Integer; assembler;
{Abfrage einer Reihe von Radiobuttons, bis ein gedrÅckter gefunden
 wird, sonst RÅckgabe von -1}
 asm	mov	di,0	{ZÑhler}
	mov	si,[u]
	dec	si
@@l:
	inc	si
	push	[Wnd]
	push	si
	call	IsDlgButtonChecked
	dec	ax		{Nicht vorhandene Knîpfe (-1) ignorieren}
	jz	@@found
	inc	di
	cmp	si,[o]
	jnz	@@l
	mov	di,-1		{Kein Button}
@@found:xchg	di,ax
 end;

function GetCheckboxGroup(Wnd:HWnd; u,o:UInt): LongInt; assembler;
{Abfrage von bis zu 16 in ihrer ID aufeinanderfolgenden Checkboxen}
 asm	xor	ax,ax	{Ergebnis: Angekreuzt}
	xor	dx,dx	{Ergebnis: Tristate}
	mov	di,1	{Maske}
	mov	si,[u]
	dec	si
@@l:	inc	si
	push	dx
	push	ax
	 push	[Wnd]
	 push	si
	 call	IsDlgButtonChecked
	 dec	ax
	pop	ax
	pop	dx
	js	@@1	{nichts wenn <=0}
	jz	@@set
	or	dx,di
	db	0B9h	{2 Bytes Åberspringen, mov cx,xxxx}
@@set:	or	ax,di	{setzen wenn =1}
@@1:	shl	di,1
	jc	@@e	{Notbremse}
@@f:	cmp	si,[o]
	jnz	@@l
@@e: end;

procedure SetCheckboxGroup(Wnd:HWnd; u,o:UInt; x:LongInt); assembler;
{Setzen von bis zu 16 in ihrer ID aufeinanderfolgenden Checkboxen}
 asm	mov	si,[u]
	dec	si
@@l:	inc	si
	push	[Wnd]
	mov	ax,1
	push	si
	test	ax,LongRec[x].hi
	jnz	@@tri
	and	ax,LongRec[x].lo	{Null oder Eins}
	db	0B9h		{2 Bytes Åberspringen, mov cx,xxxx}
@@tri:	add	ax,ax
	push	ax
	call	CheckDlgButton
	shr	LongRec[x].hi,1
	shr	LongRec[x].lo,1
@@f:	cmp	si,[o]	{ohne Notbremse!}
	jnz	@@l	{auch umlaufend geeignet}
 end;

procedure SetCheckboxGroup2(Wnd:HWnd; u,o,x:UInt); assembler;
{Setzen von bis zu 16 in ihrer ID aufeinanderfolgenden Checkboxen,
 belÑ·t jedoch solche im dritten Schaltzustand unverÑndert}
 asm	mov	si,[u]
	dec	si
@@l:	inc	si
	push	[Wnd]
	push	si
	call	IsDlgButtonChecked
	inc	ax	{-1?}
	jz	@@e	{Notbremse}
	cmp	ax,3
	jnc	@@1
	push	[Wnd]
	mov	al,1	{AH ist hier bereits Null!}
	push	si
	and	ax,[x]	{Null oder Eins}
	push	ax
	call	CheckDlgButton
@@1:	shr	[x],1
@@f:	cmp	si,[o]
	jne	@@l
@@e: end;

function EnableDlgItem(Wnd:HWnd; idItem:UInt; Enable:Bool):Bool; assembler;
 asm	push	[Wnd]
	push	[idItem]
	call	GetDlgItem
	or	ax,ax
	jz	@@e	{Fehler}
	push	ax
	push	[Enable]
	call	EnableWindow
@@e: end;

procedure EnableDlgItemGroup(Wnd:HWnd; u,o:UInt; Enable:Bool); assembler;
 asm	mov	si,[u]
	dec	si
@@l:	inc	si
	push	[Wnd]
	push	si
	push	[Enable]
	call	EnableDlgItem
	cmp	si,[o]
	jne	@@l
 end;

function  ShowDlgItem(Wnd:HWnd; idItem:UInt; iShow:Integer):Bool; assembler;
 asm	push	[Wnd]
	push	[idItem]
	call	GetDlgItem
	or	ax,ax
	jz	@@e	{Fehler}
	push	ax
	push	[iShow]
	call	ShowWindow
@@e: end;

procedure ShowDlgItemGroup(Wnd:HWnd; u,o:UInt; iShow:Integer); assembler;
 asm	mov	si,[u]
	dec	si
@@l:	inc	si
	push	[Wnd]
	push	si
	push	[iShow]
	call	ShowDlgItem
	cmp	si,[o]
	jne	@@l
 end;

procedure SetEditFocus(HWndEdit: HWnd);
{fokussiert+markiert Editfenster}
 begin
  SetFocus(HWndEdit);
  SendMessage(HWndEdit,EM_SetSel,0,$FFFF0000);
 end;

function Msg2VScroll(Msg,wParam: UInt; PageSize:Integer):Integer; assembler;
{Wandelt geeignete VScroll- und KeyDown-Nachrichten in "Entfernungscodes"
 um, liefert Ò1 fÅr "Zeilen" und PageSize fÅr "Seiten", sonst 0}
{begin
  Msg2VScroll:=0;
  case Msg of
   WM_KeyDown: case wParam of
    VK_Prior:	Msg2VScroll:=PageSize;
    VK_Up:	Msg2VScroll:=1;
    VK_Down:	Msg2VScroll:=-1;
    VK_Next:	Msg2VScroll:=-PageSize;
   end;
   WM_VScroll: case wParam of
    SB_PageUp:	Msg2VScroll:=PageSize;
    SB_LineUp:	Msg2VScroll:=1;
    SB_LineDown:Msg2VScroll:=-1;
    SB_PageDown:Msg2VScroll:=-PageSize;
   end;
  end;
 end;}
 asm	mov	ax,[Msg]
	cmp	ax,WM_VScroll
	jz	@@bar
	cmp	ax,WM_KeyDown
	jnz	@@f
@@key:
	mov	ax,[wParam]
	mov	dx,1
	cmp	al,VK_Up
	jz	@@e
	neg	dx		{-1}
	cmp	al,VK_Down
	jz	@@e
	mov	dx,[PageSize]
	cmp	al,VK_Prior
	jz	@@e
	neg	dx		{-PageSize}
	cmp	al,VK_Next
	jz	@@e
	jmp	@@f
@@bar:
	mov	ax,[wParam]
	mov	dx,1
	cmp	al,SB_LineUp
	jz	@@e
	neg	dx		{-1}
	cmp	al,SB_LineDown
	jz	@@e
	mov	dx,[PageSize]
	cmp	al,SB_PageUp
	jz	@@e
	neg	dx		{-PageSize}
	cmp	al,SB_PageDown
	jz	@@e
@@f:	xor	dx,dx
@@e:	xchg	dx,ax
 end;

function iitrafo(x,a,e,ta,te:Integer):Integer; assembler;
{iitrafo:=MulDiv(x-a,te-ta,e-a)+ta;}
 asm	mov	cx,[a]
	mov	ax,[e]
	sub	ax,cx
	jz	@@e		{bei Fehler (e=a) Null liefern}
	mov	dx,[x]
	sub	dx,cx
	push	dx		{x-a}
	mov	dx,[te]
	sub	dx,[ta]
	push	dx		{te-ta}
	push	ax		{e-a}
	call	MulDiv
	add	ax,[ta]
@@e: end;

function GetModuleDescription(FName,Descript:PChar):Boolean;
{extrahiert aus Windows-EXE Modulbeschreibung, mit OEM->ANSI
 FName darf alternativ ein geîffnetes Datei-Handle sein (Dateipos=0!),
 Descript mu· auf einen Puffer mit mindestens 256 Bytes zeigen}
 const
  MZ=$5A4D;
  NE=$454E;
 label
  finally;
 var
  f: Integer absolute FName;
  L: LongInt;
  LR: LongRec absolute L;
  W: Word absolute L;
  B: Byte absolute L;
 begin
  GetModuleDescription:=false;
  if PtrRec(FName).Sel<>0
  then f:=_lopen2(FName,OF_Share_Deny_Write);
  if f=0 then exit;		{falls NIL Åbergeben wurde}
  if f=-1 then exit;		{falls das ôffnen fehlschlug}
  _lread(f,PChar(@W),2);
  if W<>MZ then goto finally;
  _llseek(f,$18,0);
  _lread(f,PChar(@W),2);
  if W<>$0040 then goto finally;
  _llseek(f,$3C,0);
  _lread(f,PChar(@L),4);	{neuer Dateioffset}
  _llseek(f,L,0);
  if _lread(f,PChar(@W),2)<>2 then goto finally;
  if W<>NE then goto finally;
  _llseek(f,$2A,1);		{42 Bytes hinter NE}
  _lread(f,PChar(@L),4);	{Dateioffset des Pascal-Strings}
  _llseek(f,L,0);
  if _lread(f,PChar(@B),1)<>1 then goto finally;
  if B=0 then goto finally;
  W:=B;
  if _lread(f,Descript,W)<>W then goto finally;
  for LR.Hi:=0 to W-1 do if Descript[LR.Hi]<' ' then goto finally;
  Descript[W]:=#0;		{terminieren}
  OemToAnsi(Descript,Descript);
  GetModuleDescription:=true;
finally:
  if PtrRec(FName).Sel<>0
  then _lclose(f);
 end;

procedure Accel2Text(const accel:TAccel; s:PChar); assembler;
 asm	push	ds
	 cld
	 lds	si,[accel]
	 les	di,[s]
	 mov	bx,FShift*256+VK_Shift
@@l:	 test	TAccel[si].fVirt,bh
	 jz	@@1
	 push	bx
	  mov	al,bl
	  cbw
	  call	@@mvk_gknt
	  add	di,ax
	  mov	al,'+'
	  stosb
	 pop	bx
@@1:	 shl	bh,1
	 inc	bl
	 cmp	bl,VK_Menu+1
	 jne	@@l

	 test	TAccel[si].fVirt,FVirtKey
	 mov	ax,TAccel[si].key
	 jz	@@else	;{AL ist direkt der ASCII-Kode der Taste}
	 call	@@mvk_gknt
	 jmp	@@e
@@mvk_gknt:		;{UP wandelt AX=VK-Kode in ES:DI=Tasten-Name}
	push	es
	 push	ax
	 push	0
	 call	MapVirtualKey
	pop	es
	push	es
	 push	ax
	 push	0	;{lParam}
	 push	es
	 push	di	;{Buffer}
	 push	16	;{Size}
	 call	GetKeyNameText
	pop	es
	retn
@@else:
	 cmp	al,20h
	 jnc	@@dc
	 push	ax
	  mov	al,'^'
	  stosb
	 pop	ax
	 add	al,40h
@@dc:	 stosw
@@e:	pop	ds

{const
  prs: array[0..3] of Char='%s+';
 var
  s2: TS15;
  k: Word;
  if (accel.fVirt and FVirtKey =0) and (accel.key<32) then begin
  for i:=0 to 2 do
  if accel.fVirt and (FShift shl i) <>0 then begin
   GetKeyNameText(MakeLong(0,MapVirtualKey(VK_Shift+i,0)),
     s2,sizeof(s2));
   sp:=s2;
   Inc(s,wvsprintf(s,'%s+',sp));
  end;
  if accel.fVirt and FVirtKey <>0 then begin
   GetKeyNameText(MakeLong(0,MapVirtualKey(accel.key,0)),
     s,32);
  end else begin
   k:=accel.key
   if k<32 then begin
    s^:='^'; Inc(s); Inc(k,64);		/*zur Kenntlichmachung WM_CHAR*/
   end;
   PWord(s)^:=k;
  end;}
 end;

procedure memmove(d,s:Pointer; l:UInt); assembler;
 asm	cld
	push	ds
	 lds	si,[s]
	 les	di,[d]
	 mov	cx,[l]
	 cmp	si,di
	 jnc	@@up
	 dec	cx
	 add	si,cx
	 add	di,cx
	 inc	cx
	 std
@@up:	 rep	movsb
	pop	ds
	cld
 end;

end.

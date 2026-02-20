## Tastaturbelegungstabelle

Im Laufe der Jahre wurden für den AC1 verschiedene Betriebssystemvarianten entwickelt. Jede erwartet eine abweichende Belegung spezieller Tasten.
Hinzu kommen Unterschiede in der Belegung, Anwenderprogramme mit speziellen Erwartungen und persönliche Vorlieben.   
Da all dies nicht in eine Konfiguration zu bekommen ist, wird mit Version 1.0.2 des picoIO eine User-Konfiguration eingeführt. 
Dabei handelt es sich um eine Binrärdatei, die am PC ins Rootverzeichnis der SD-Karte kopiert wird und die Übersetzungstabelle vom USB-HID-Scancode in den AC1-Zeichensatz enthält.  

Diese Datei wird beim booten des picoIO eingelesen und ersetzt die interne Tabelle.
Sollte beim Booten diese Datei nicht gefunden werden, wird mit der eingebauten Tabelle gearbeitet.  
Die Datei kann man sich als Tabelle mit 104 Zeilen (Tasten) und 4 Spalten für die Modifier (ohne, Shift, Strg, Alt) vorstellen.
Sie hat eine feste Größe von 416 Bytes.   

Die Scancodes lassen sich der [Übersicht](https://codeberg.org/bw38/picoAC1/src/branch/main/Keyboard/Keyboard_de_hex.pdf) in diesem Verzeichnis entnehmen.  
Bei den Musteraufbauten zeigte sich, dass es Abweichungen gibt.
So ist bspw. das Doppelkreuz nicht immer unter 31h, sondern auch hin und wieder unter dem Code 32h zu finden.  
Zur Ermittlung individueller Codes wurde im picoAC1 die Hilfsfunktion "LShift + LMenu + (Taste)" eingeführt, mit dem der Scancode, der am picoIO empfangen wird, in der Statuszeile des VGA-Monitors angezeigt wird.

Die aktuell verwendete Tabelle lässt sich mit LStrg + LWin + ß (Linke Steurungs-Taste + Linke Win/Menu-Taste + ß) auf der SD-Karte sichern. Dabei wird der Dateiname ".scan2ascii.bk" vergeben. Diese Datei kann am PC mit einem Hexeditor bearbeitet und umbenannt werden.
Unter Linux funktioniert das bspw. mit GHex. In der Mac- oder M$-Welt wird sich geeignetes finden.   

Die Byte-Position der gesuchten Taste wird wie folgt ermittelt:   
Scancode * 4 + Modifier [0..3]  

Unbenutzte Zellen werden mit FFh belegt.
Dieser Wert wird vor der Ausgabe in 00h gewandelt.

Möchte man bspw. die Tasten Z und Y von der deutschen Standardbelegung in die amerikanische tauschen, müssen folgende Bytes geändert werden:   
```
Taste "Z"
1Ch * 4 + 0 = 70h <== 'y'   ohne Modifier
1Ch * 4 + 1 = 71h <== 'Y' + Shift
1Ch * 4 + 2 = 72h <== 19h + Ctrl 
1Ch * 4 + 3 = 73h <== FFh + Ctrl (ohne Funktion)

Taste "Y"
1Dh * 4 + 0 = 74h <== 'z' ohne Modifier
1Dh * 4 + 1 = 75h <== 'Z' + Shift
1Dh * 4 + 2 = 76h <== 1Ah + Ctrl 
1Dh * 4 + 3 = 77h <== FFh + Ctrl (ohne Funktion)
```

Beispiel 2:
Auf einer Tastatur fehlt die "<>" - Taste. Die fehlenden Zeichen sollen den Tasten "Y" und "X" auf der Alt-Ebene zugeordnet werden.

```
Taste "Y"
1Dh * 4 + 3 = 77h <== '<'

Taste "X"
1Bh * 4 + 3 = 6Fh <== '>'
```
(Anmerkung: diese Belegung wurde bereits integriert)  

Die Datei muss im Root-Verzeichnis der SD-Karte den Namen: "**.scan2ascii**" tragen. Der Punkt als erstes Zeichen ist Teil des Dateinamens.  

Zusammen mit den Konfigurationseinstellungen (Monitor und Zeichengenerator) lässt sich die bevorzugte Konfiguration auf der SD-Karte speichern und nach einem Masterboot wieder herstellen.

In diesem Verzeichnis ist zusätzlich eine Libre-Office-Tabelle zur grundlegenden Erstellung einer neuen Tabelle zu finden. Am Ende der Tabelle wird kurz erläutert, wie daraus unter Linux die erforderliche Datei erzeugt werden kann.

In V1.0.2 des picoIO sind die Tasten entsprechend u.a. Quelltextauszuges belegt.

```
//  ---------------------    
//  non   shift ctrl  alt
//  --------------------- 
    0xFF, 0xFF, 0xFF, 0xFF, /* 0x00 */ 
    0xFF, 0xFF, 0xFF, 0xFF, /* 0x01 */ 
    0xFF, 0xFF, 0xFF, 0xFF, /* 0x02 */ 
    0xFF, 0xFF, 0xFF, 0xFF, /* 0x03 */ 
    'a' , 'A' , 0x01, 0xFF, /* 0x04 */ 
    'b' , 'B' , 0x02, 0xFF, /* 0x05 */
    'c' , 'C' , 0x03, 0xFF, /* 0x06 */
    'd' , 'D' , 0x04, 0xFF, /* 0x07 */
    'e' , 'E' , 0x05, 0xFF, /* 0x08 */
    'f' , 'F' , 0x06, 0xFF, /* 0x09 */
    'g' , 'G' , 0x07, 0xFF, /* 0x0a */
    'h' , 'H' , 0x08, 0xFF, /* 0x0b */
    'i' , 'I' , 0x09, 0xFF, /* 0x0c */
    'j' , 'J' , 0x0A, 0xFF, /* 0x0d */
    'k' , 'K' , 0x0B, 0xFF, /* 0x0e */
    'l' , 'L' , 0x0C, 0xFF, /* 0x0f */
    'm' , 'M' , 0x0D, 0xFF, /* 0x10 */
    'n' , 'N' , 0x0E, 0xFF, /* 0x11 */
    'o' , 'O' , 0x0F, 0xFF, /* 0x12 */
    'p' , 'P' , 0x10, 0xFF, /* 0x13 */
    'q' , 'Q' , 0x11, '@' , /* 0x14 */
    'r' , 'R' , 0x12, 0xFF, /* 0x15 */
    's' , 'S' , 0x13, 0xFF, /* 0x16 */
    't' , 'T' , 0x14, 0xFF, /* 0x17 */
    'u' , 'U' , 0x15, 0xFF, /* 0x18 */
    'v' , 'V' , 0x16, 0xFF, /* 0x19 */
    'w' , 'W' , 0x17, 0xFF, /* 0x1a */
    'x' , 'X' , 0x18,  '>', /* 0x1b */
    'z' , 'Z' , 0x1A, 0xFF, /* 0x1c */
    'y' , 'Y' , 0x19,  '<', /* 0x1d */
    '1' , '!' , 0xFF, 0xFF, /* 0x1e */
    '2' , '"' , 0xFF, 0xFF, /* 0x1f */
    '3' , 0xFF, 0xFF, 0xFF, /* 0x20     3 § */
    '4' , '$' , 0xFF, 0xFF, /* 0x21 */
    '5' , '%' , 0xFF, 0xFF, /* 0x22 */
    '6' , '&' , 0xFF, 0xFF, /* 0x23 */
    '7' , '/' , 0xFF, '{' , /* 0x24 */
    '8' , '(' , 0xFF, '[' , /* 0x25 */
    '9' , ')' , 0xFF, ']' , /* 0x26 */
    '0' , '=' , 0xFF, '}' , /* 0x27 */
    
    0x0D, 0x0D, 0xFF, 0xFF, /* 0x28     CR */
    0x1B, 0X1B, 0xFF, 0xFF, /* 0x29     ESC*/
    0x08, 0x12, 0xFF, 0xFF, /* 0x2a     BS | BS EDAS4 */
    0x17, 0x0F, 0xFF, 0xFF, /* 0x2b     Tab => CTRL-W f. EDAS4 | Tab f. SCCH */
    ' ' , ' ' , 0xFF, 0xFF, /* 0x2c     Space*/
    0x7E, '?' , 0xFF, 0x5C, /* 0x2d     ß  ? \*/
    0x60, 0x60, 0xFF, 0xFF, /* 0x2e     ' ` */
    0x7D, 0x5D, 0xFF, 0xFF, /* 0x2f     ü Ü*/
    '+' , '*' , 0xFF, 0x7E, /* 0x30 *   + *  ~*/
    '#' , '\'', 0xFF, 0xFF, /* 0x31 */
    '#',  '\'', 0xFF, 0xFF, /* 0x32 */
    0x7C, 0x5C, 0xFF, 0xFF, /* 0x33     ö Ö*/
    0x7B, 0x5B, 0xFF, 0xFF, /* 0x34     ä Ä*/
    0x5E, 0x60, 0xFF, 0xFF, /* 0x35      ^ °*/
    ',' ,  ';', 0xFF,0xFF, /* 0x36 */
    '.' ,  ':', 0xFF,0xFF, /* 0x37 */
    '-' ,  '_', 0xFF,0xFF, /* 0x38 */
                                 
    0xFF,0xFF,0xFF,0xFF, /* 0x39        CapsLock*/
    0xFF,0xFF,0xFF,0xFF, /* 0x3a        F1*/
    0xFF,0xFF,0xFF,0xFF, /* 0x3b        F2 */
    0xFF,0xFF,0xFF,0xFF, /* 0x3c        F3 */
    0xFF,0xFF,0xFF,0xFF, /* 0x3d        F4 */
    0xFF,0xFF,0xFF,0xFF, /* 0x3e        F5 */
    0xFF,0xFF,0xFF,0xFF, /* 0x3f        F6 */
    0xFF,0xFF,0xFF,0xFF, /* 0x40        F7 */
    0xFF,0xFF,0xFF,0xFF, /* 0x41        F8 */
    0xFF,0xFF,0xFF,0xFF, /* 0x42        F9 */
    0xFF,0xFF,0xFF,0xFF, /* 0x43        F10 */
    0xFF,0xFF,0xFF,0xFF, /* 0x44        F11 */
    0xFF,0xFF,0xFF,0xFF, /* 0x45        F12 */
    0xFF,0xFF,0xFF,0xFF, /* 0x46        Print Screen */
    0xFF,0xFF,0xFF,0xFF, /* 0x47        Scroll Lock */
    0xFF,0xFF,0xFF,0xFF, /* 0x48        Pause */
    0x05,0xFF,0xFF,0xFF, /* 0x49        Insert */
    0x01,0xFF,0xFF,0xFF, /* 0x4a        Home */
    0xFF,0xFF,0xFF,0xFF, /* 0x4b        PageUp */
    0x13,0x13,0xFF,0xFF, /* 0x4c        Delete Forward ==> CTRL-S f. EDAS4*/
    0x7F,0x7F,0xFF,0xFF, /* 0x4d        End  ==> DEL SCCH*/
    0xFF,0xFF,0xFF,0xFF, /* 0x4e        PageDwn */
    0x09,0x09,0xFF,0xFF, /* 0x4f        RightArrow */
    0x08,0x08,0xFF,0xFF, /* 0x50        LeftArrow*/
    0x0A,0x0A,0xFF,0xFF, /* 0x51        DownArrow*/
    0x0B,0x0B,0xFF,0xFF, /* 0x52        UpArrow*/
    0xFF,0xFF,0xFF,0xFF, /* 0x53        NumLock*/
    /* ---- Nummernblock ---- */                            
    '/' , '/' , 0xFF, 0xFF, /* 0x54 */
    '*' , '*' , 0xFF, 0xFF, /* 0x55 */
    '-' , '-' , 0xFF, 0xFF, /* 0x56 */
    '+' , '+' , 0xFF, 0xFF, /* 0x57 */
    0x0D, 0x0D, 0xFF, 0xFF, /* 0x58     CR*/
    '1' , '1' , 0xFF, 0xFF, /* 0x59 */
    '2' , '2' , 0xFF, 0xFF, /* 0x5a */
    '3' , '3' , 0xFF, 0xFF, /* 0x5b */
    '4' , '4' , 0xFF, 0xFF, /* 0x5c */
    '5' , '5' , 0xFF, 0xFF, /* 0x5d */
    '6' , '6' , 0xFF, 0xFF, /* 0x5e */
    '7' , '7' , 0xFF, 0xFF, /* 0x5f */
    '8' , '8' , 0xFF, 0xFF, /* 0x60 */
    '9' , '9' , 0xFF, 0xFF, /* 0x61 */
    '0' , 0x05 , 0xFF, 0xFF, /* 0x62     Insert*/
    '.' , 0x13 , 0xFF, 0xFF, /* 0x63     Delete*/

    '<' , '>' , 0xFF, '|' , /* 0x64 */
    0xFF, 0xFF ,0xFF, 0xFF, /* 0x65      Menu*/
    0xFF, 0xFF, 0xFF, 0xFF, /* 0x66      Power*/
    0xFF, 0xFF, 0xFF, 0xFF  /* 0x67 */
```

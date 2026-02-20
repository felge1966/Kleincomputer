## Monitorerweiterung picoAC1
EProm V 1.0.2
picoIO V1.0.2

### Kennbuchstaben, Argumente
Die Kennbuchstaben der Erweiterung sind i.d.R. Kleinbuchstaben.  
Diese werden wie im AC1 üblich in 1 bis 4-stelligen Hex-Zahlen angegeben.
Für die Zeichen 'A' bis 'F' sind Großbuchstaben zu verwenden.

### Zeichenketten
Einige Kommandos verlangen die Eingabe einer Zeichenkette.
Diese ist nach den Argumenten bzw. dem Kennbuchstaben einzugeben.
Vom einem Argument ist die Zeichenkette durch mindestens ein Leerzeichen zu trennen.
Nach einem Kennbuchstaben ist kein Leerzeichen erforderlich.
Bis zum Anfang der Zeichenkette sind bis zu 9 Leerzeichen zulässig.  
Die Zeichenkette wird durch ein Leerzeichen abgeschlossen.
Nachfolgende Zeichen werden ignoriert. 
D.h. Zeichenketten können keine Leerzeichen beinhalten.

### Datei- / Pfadnamen
Datei-/Pfadnamen sind Zeichenketten mit einigen Besonderheiten.  
Namen sind case**in**sensitive, d.h. es wird nicht zwischen Klein- und Großbuchstaben unterschieden.  
Dateinamen dürfen max. 16 Zeichen lang sein.  
Der '.' (Punkt) gilt als normales Zeichen und darf an beliebiger Stelle und beliebig oft vorkommen.
Ein '.' an erster Stelle kennzeichnet die Datei als "versteckt".
Diese werden in Auflistungen nicht angezeigt, können aber ansonsten normal verwandt werden.
Dieses Feature ist für Systemdateien und -verzeichnisse vorgesehen.  
Es dürfen Sonderzeichen enspr. der allgemeinen Regeln für FAT-Dateisysteme verwandt werden.
Die Verwendung von Wildcards ('*', '?') ist unzulässig.
Die Verwendung des Slash ('/') in Datei oder Pfadnamen ist nicht zulässig.   
Es wird empfohlen, Dateinamen nicht ausschließlich aus Ziffern zu bilden.

### SD-Karte / Dateien
Die SD-Karte ist am PC mit FAT32 oder exFAT zu formatieren.  
Es ist eine Verzeichnisebene unterhalb von Root nutzbar.
Auf weitere Unterverzeichnisse kann über die Monitorerweiterung nicht zugegriffen werden.
Es wird empfohlen auch am PC keine weiteren Verzeichnisebenen anzulegen.
Dies kann zu Kollisionen und Datenverlust beim Speichern von gleichnamigen Dateien führen.  
Dateien können sowohl im Root-Verzeichnis als auch in den Verzeichnissen der ersten Ebene gespeichert und geladen werden.  

Dateien werden im *Header-Save*-Format gespeichert.
Den Daten wird ein 32Byte-Header mit folgendem Inhalt vorangestellt:  

| Byte   | Bemerkungen                                       |
|--------|---------------------------------------------------|
| 00 - 01| Anfangsadresse                                    |
| 02 - 03| Endadresse                                        |
| 04 - 05| Startadresse                                      |
| 06 - 11| freies Textfeld                                   |
| 12     | Kennung Dateityp, im picoAC1 bisher ohne Bedeutung|
| 13 - 15| Magic Bytes 3x 0x0D                               |
| 16 - 31| Dateiname oder Infotext, 16Zeichen                 |

Durch den picoIO wird die Datei ".config" un das Verzeichnis ".ac1bin"automatisch angelegt.
Aus der ".config" wird die Konfiguration beim nächsten Mainboot zur Wiederherstellung gelesen.
Im Verzeichnis ".ac1bin" werden überschriebene Dateien abgelegt.
Der jeweilige Dateiname wird um einen Zeitstempel erweitert.
Eine Unterscheidung nach dem Ursprungsverzeichnis erfolgt nicht.
Die Dateien lassen sich am PC durch umbenennen und verschieben wieder herstellen.  

Die Anwendung der SD-Karte ist als experimentell zu betrachten.
Es ist dringend anzuraten Datensicherungen am PC durchzuführen.  
**Kein Backup, kein Mitleid !**  


### Daten auf SD-Karte schreiben
**s** AAAA EEEE SSSS Dateiname/Infotext  

  * AAAA Anfangsadresse  
  * EEEE Endadresse  
  * SSSS Startadresse  
  * Dateiname - zulässige Zeichen entspr. FAT32, keine Wildcards, nicht casesensitiv  
  * Infotext (optional)  
  
Dem Dateinamen kann ein Infotext angefügt werden.
Beide Teile werden durch '/' getrennt.
In diesem Fall wird im Header nicht der Dateiname sondern die Info gespeichert,
die beim Laden angezeigt wird.
Leerzeichen sind in der Gesamtheit nicht möglich.  
Die Speicherung erfolgt im aktuell gewählten Verzeichnis.
Überschriebene Dateien werden mit einem Suffix-Zeitstempel (YYMMDDhhmmss) erweitert und nach ".ac1bin" geschoben<br>   
Im Root-Verzeichnis kann eine Datei nicht gespeichert werden, wenn bereits ein gleichnamiges Verzeichnis existiert. 

### Daten von SD-Karte laden
**l** Dateiname (kleines "L")  

Die Startadresse wird nach ARG1 geladen, sodass bei korrekt gesetzter Adresse mit "J:" gestartet werden kann.  
Die restlichen Headerparameter werden nur angezeigt.  
Es sind keine Wildcards zulässig.
Es ist kein Laden mit Offset möglich.  
Geladen wird aus dem aktuell gewählten Verzeichnis.


### Dateiinhalt des aktuellen Verzeichnisses auflisten
l *     --> gesamten Inhalt anzeigen. Der "\*" kann entfallen.  
l XX\*   --> alle Dateien anzeigen, die mit "XX" beginnen  
l *.bas --> alle Dateien anzeigen, die mit ".bas" enden 
Das "l"-Kommando bezieht sich auf das aktuell ausgewählte Verzeichnis.  


### Verzeichnisse
d Verzeichnisname --> Setzen des aktuellen Arbeitsverzeichnisses  
d \* --> Auflisten aller Verzeichnisse  
d \*abc\* --> auflisten aller Ordner, die die Zeichenfolge "abc" im Namen enthalten<br>
d / --> wechseln ins Root-Verzeichnis<br>
Es wird mit einer Verzeichnisebene unterhalb von Root gearbeitet. 
Weitere Unterverzeichnisse werden nicht unterstützt.<br>
Beim Auflisten wird das aktuell gewählte Verzeichnis mit einem '*' markiert.<br>
Es ist möglich direkt von einem in ein anderes Verzeichnis zu wechseln.
Ein Umweg über das Root-Verzeichnis ist nicht erforderlich.

m Foldername -> Anlegen eines neuen Verzecihnisses<br>
Es kann kein Verzeichnis angelegt werden, wenn bereits eine gleichnamige Datei im Wurzelverzeichnis existiert.<br>

### Zeitfunktionen
t 2023-09-03*18:05:45 --> Systemzeit setzen<br>
t --> Abruf der aktuellen Systemzeit<br>

Falls ein RTC-Modul installiert ist, wird die Zeit beim picoIO-Start übernommen.
Ein Zeitstempel wird derzeit nur für Speicheroperationen benötigt.
Die Systemzeit sollte in UTC gesetzt werden.
Die SD-Card-Funktionen rechnen diese in LocalTime um.  
Beim Setzen der Systemzeit ist das Format einzuhalten. 
Entscheidend ist die Position der Ziffern in der Zeichenkette.
Die Trennzeichen sind beliebig.
Die Eingabe erfolgt als Zeichenkette und unterliegt o.g. Einschränkungen, d.h.Leerzeichen sind unzulässig.

### Bildschirmfarben
c 7:0:3 -> Zeichen-, Hintergrund- und Rahmenfarbe<br>
c --> Farbliste ausgeben<br>
Der dritte Parameter ist optional. Bei weglassen wird '0' = Schwarz angenommen.

### Hilfetexte ausgeben (ToDo)
H --> Bedienung "Ur-"Monitor<br>
h --> Bedienung "Monitorerweiterungen"

### Drucken in Datei
Dabei handelt es sich um eine Hilfsfunktion, um Zeichen, die von Anwendungsprogrammen an eine Druckerschnittstelle im Monitor übergeben werden, in eine Textdatei umzulenken.
Diese Dateien können am PC betrachtet, bearbeitet oder gedruckt werden.   
Sie werden nicht im "Header-Save"-Format gespeichert und können daher auch nicht mit dem "l"-Kommando des AC1 wieder eingelesen werden.  
Getestet ist die Funktion mit der Druckerschnittstelle des EDAS.  
Gestartet wird die Funktion mit der Tastenkombination "LStrg + Alt + P".
Dabei wird automatisch ein Dateiname PXXXX.txt erzeugt, wobei XXXX eine fortlaufende Nummer ist, die in der `.config` gespeichert wird.
Danach ist das Anwenderprogramm zum Drucken zu veranlassen und nach Abschluss des Vorgangs ist wiederholt "LStrg + Alt + P" zu betätigen.
Erst dann wird die Datei auf der SD-Karte gespeichert.  
In der Statuszeile wird Dateiname und Fortschritt angezeigt.  
Am Beispiel von EDAS wäre das Vorgehen wie folgt:  
Grundsätzlich muss EDAS die Druckerschnittstelle in EDAS bekannt sein -> Addr 400AH --> 081CH  

```
  - J 4003       # Warmstart EDAS  
  - LCtrl+Alt+P  # Druck initialisieren  
  - O4           # Druckerausgabe EDAS aktivieren   
  - H1000        # Bildschirmausgabe durchscrollen lassen   
  - A            # Assemblerlauf  
  - LCtrl+Alt+P  # Druck abschließen und gepufferte Daten speichern  
```

Bei der Aktualisierung des Fortschritts kann der picoVDU an seine Leistungsgrenze stoßen.
Bei schneller Bytefolge und scrollendem Monitor mit voller Auflösung, wird die Fortschrittsanzeige verzögert gesetzt.

Das Ende der Druckfunktion wird auch mit dem nächsten Kommando der Monitorerweiterung ausgelöst.   
Es können derzeit max. 128kBytes gepuffert werden.  
Es werden keine Dateien ohne Inhalt gespeichert.  


### Externe Funktionen

Funktionen / Kommandos, die nicht im EPROM Platz gefunden haben oder weichen mussten, lassen sich im Flash des picoIO einbinden
und per Kommandozeichen über die ZCOM-Schnittstelle in den RAM laden und starten.

Aktuell eingebundene Kommandos:  
**Z** --> MiniBasic-Interpreter nach 0F000h laden und dort starten.  
Beim Verlassen wird angeboten, das Basic-Programm per Kommandozeile zu speichnern.
Hierzu ist das Prompt-Symbol # zu löschen und ein individueller Name zu vergeben.  


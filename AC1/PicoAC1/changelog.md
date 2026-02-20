### changelog  26.11.2023

#### pico_IO v1.0.2a
Bugfix : Anzeige leerer Verzeichnisse blockiert ZCOM-Schnittstelle

---

### changelog  25.11.2023

#### pico_IO v1.0.2
geändert: Migration Pico-SDK V1.5.0 --> 1.5.1  
Neu: User konfigurierbare Tastatur-Code-Tabelle  
Neu: Hilfsfunktion zur Anzeige der Tasten-Scancodes  
Neu: ScrollLock-Funktion: Einzelimpuls (30-40ms) je Tastendruck  
Fix: Entprellen der Lock-Tasten  
geändert: Änderung Keycodes entspr. Vorschlägen  
geändert: ext Save/Load, komplett überarbeitet  
neu: nachladen externer Kommandos aus pIO-Flash, Minibasic Kdo - "Z"  
fix: zeitgleicher Zugriff auf SD-Karte durch unterschiedliche Kerne geblockt  
fix: ZCOM-Blockade nach Print to File behoben  

#### picoVDU v1.0.2
Migration Pico-SDK V1.5.0 --> 1.5.1
Rahmen der Statuszeile links und rechts je 2px eingekürzt

#### EPROM v1.0.2
geändert: ext Save/Load, komplett überarbeitet  
geändert: Erweiterung Sprungverteiler, interne Verschiebungen !  
geändert: Monitorausschrift, V3.1 gepatcht  
neu: nachladen externer Kommandos, derzeit Kdo "Z" = MiniBasic -> F000h  

---------------------------------------------------------------------

### changelog 07.11.2023
Umzug des Repositories nach picoAC1  
Einführung Versionsnummern -> V1.0.x  

#### picoIO v1.0.1
Umbau ZCOM von Interrupt auf PIO-State-Mashine  
Feature: Unterdrücken des Win-Systemerz. "System Volume Information"  
Anzeige SD-Zugriffszeit beim Speichen entfällt (wg. Verlängerung Timeout)  
Neu: Print to file, Datei ohne Header  
Neu: extern Save, / Load folgt später  
Neu: Statuszeile  
Neu: speichern der Konfiguration und lesen nach MainReset (Monitorvariante, Takt, Lock-Tasten, ZG, Drucknummer)  
Geändert: AC1-Reset nach Monitorwechsel  
Geändert: neues Verzeichnis anlegen mit "m"-Kommando, "d" neues Verzeichnis entfällt  

#### picoVDU v1.0.1
Neu: Statuszeile  

#### EPROM V1.0.1
neu: Drucken in Datei  
entfallen: Mon11 Schnittstellen  
neu: extern Save, Load folgt in späterer Version  
geändert: Verlängerung Timeout f. langsame SD-Karten  

---------------------------------------------------------------

## Historie:

### changelog 24.10.2023
Alt(links) F5..F7 ZG - AC1, wie bisher, Alt+F8 frei<br>
AltGr(rechts) F5..F7 ZG - SCCH<br>

### changelog 04.10.2023
Fix: keine Fehlermeldung beim Versuch ohne SD-Karte zu speichern<br>
Fix: Monitorumschaltung mit LeftCTRL + LeftALT + F1..F4

### changelog 21.09.2023
Abhängigkeit: Monitorerw. monx_v0.9 muss gebrannt sein !<br> 
Fix: "d"-Kommando - Fehlermeldung bei nicht gesteckter SD-Karte<br>
Fix: löschen des letzten Rückgabestring bei der Initialisierung<br>
Fix: eindeutige Identifizierung des ZCOM-Masters durch 32Bit Masterkey

### changelog 20.09.2023 
Abhängigkeit: Monitorerw. monx_v0.9 muss gebrannt sein !<br>
Fix: Kommunkation ZCOM, Timeout<br>
Fix: Timeoutzeit in Z80 verlängert ca.750ms(8MHz) .. 3000ms(2MHz)<br>
Test: Anzeige der SD-Bearbeitungszeit beim Speichern<br>
Feature: FileInfo -> "s"-Kommando Filename(max 16Z)'/'Fileinfo(max 16Z), s. Z80/Read.me<br>
Feature: ext Save/Load - Kompatibilität Mon11 (Sinnahftigkeit prüfen))

### changelog 11.09.2023
Fix: Array-Overflow bei überlangen Zeichenkette von der ZCOM<br>
Fix: Timeout bei 8MHz, ZCOM ISR-Callback in timecritical function<br>
Fix: Hinweistext "Colors"

### changelog 10.09.2023 
(erfordert Aktualisierung picoVDU)
- Umbau der ZCOM-Ablaufsteuerung, grundlegende Änderungen in der Kommunikation --> Testen
- Aktualisierung ZG 9x12
- Einbau ZG 6x8 SCCH (Alt-F8)
- Einbau Directory-Funktion ("d"-Kommando)
- Bei "s"-Kommando überschriebene Datein nach ".ac1bin" verschieben
- automatisches Anlegen des Ordners ".ac1bin"
- Ausblenden versteckter Dateien in "d"- und "l"-Listen
- optionaler dritter Parameter im "c"-Kommando f. Rahmenfarbe

### changelog 05.09.2023
- Bug: 71 Minuten-Timeout, Variablentyp geändert --> Testen
- SD-Card-Polling: 3s
- Feature: "PICOM" -I2C picoIO (Master) -> picoVDU (Slave)
- Feature: Steuerung Zeichen-/Hintergrundfarbe - AC1-Kommando "c"
- Feature: Umschaltung Zeichengeneratoren
  - Alt + F5 -> ZG 6x8 - Ur-AC1 / 256Zeichen 
  - Alt + F6 -> ZG 9x12 - default  
  - Alt + F7 -> ZG 10x14 - Zeichensatz aus 9x12 übernommen, verwendung Graphikzeichen derzeit nicht sinnvoll
  - Alt + F8 -> ZG 6x8 - SCCH, Platzhalter, derzeit = Alt+F5 

### changelog 22.08.2023
- Bug: Timeout bei Dateioperationen --> Zeitverhalten Ringpuffer geändert, weiter beobachten<br>
- SD-Card-Polling im 100ms Stresstest
- Feature: Umschaltung EPROM-Bänke
  - Alt (links !) + F1 -> GPIO15 low (default nach Reset)
  - Alt + F2 -> GPIO15 high
- Feature: Z80 Taktfrequenz
  - Alt + F9 -> 2 MHz (default nach Reset)
  - Alt + F10 -> 4MHz
  - Alt + F11 -> 6Mhz (Testen !)
  - Alt + F12 -> 8MHz (mit aktuellem picoVDU nicht lauffähig)    
- Feature: Dateiliste 3-spaltig mit fortl. Nummer

---

## picoVDU

### changelog in progress
Neu: Statuszeile
geändert: Entfall des Rahmens bei den 10x14-Auflösungen
geändert: 10x14-Fenster nach oben gerückt wg Statuszeile

### changelog 26.10.2023
ACC: der „Eierkreis“ mit C7+C8 sind nun in 9x12 und 10x14 korrigiert und ergeben hoffentlich einen halbwegs ordentlichen Kreis.<br>
SCCH: das Zeichen 1Ah neigt sich jetzt zur richtigen Seite.<br>

### changelog 24.10.2023
neu: SCCH ZG 9x12 und 10x14

### changelog 17.10.2023
Aktualisierung ZG 9x12

### changelog 16.10.2023
Aktualisierung ZG 9x12 & ZG 10x14

### changelog 21.09.2023
aktualisierung ZG 10x14

### changelog 13.09.2023
Entfernt ZG 10x15
aktualisiert ZG 10x14

### changelog 11.09.2023
Aktualisierung ZG 9x12 und 10x15 (neu)

### changelog 10.09.2023 
(erfordert Aktualisierung pico_IO)
- Rahmenfarbe via PICOM wählbar 

### changelog 05.09.2023
 - Feature: "PICOM" -I2C picoIO (Master) -> picoVDU (Slave)
 - div Anpassungen an picoIO
 - gelber Rahmen nur noch um die Darstellungsfläche entspr. ZG<br>
   Im ZG10x14 wird die rechte und linke Begrenzung durch Hintergrund überschrieben. Vollständiger Rahmen ist systembedingt nicht möglich

### changelog 01. & 02.09.2023
- Auslagerung VDUSEL-Loop in "time_critcal_function" -> Halbierung der Looptime < 50ns 
- weitere Loop-Optimierung



### changelog 31.08.2023

- BWS-Trigger wird mit H/L -Flanke des VDUSEL ausgelöst

- Optimierung der Polling-Loop

- 

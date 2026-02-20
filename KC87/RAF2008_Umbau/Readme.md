Umbau RAF2014 auf RAF512

Basis ist die RAF2014 von SRN

Dafür standen mir die Gerberdaten zur Verfügung

Schritte für RAM-Änderung

Adressierung

von 6c4008 auf 628128

    Trennen TS12 (U14-Pin 1) nach RNW
    Trennen TS13 (U14-Pin 2) nach RNW

Die Widerstände R9 und R10 müssen am Decoder bleiben

    Trennen TS10 der RAMs unter RAM U3
    Verbinden Pin 30 der RAMs über 5K1 Wid mit Pin 32 (+5PS)

Neue Decodierung

    U14 (Pin 1) mit U12 (Pin 17) verbinden
    U14 (Pin 2) mit U12 (Pin 16) verbinden

Anpassung Trackregister

    U12 (Pin 13) ADV (org) trennen
    U12 (Pin 15) ADV (neu) mit U13 (Pin 8) verbinden

Bilder
Trackregister der RAF512

Trackregister der RAF2008 (RAF2014)

               :-----  Vollständige 19 bit RAM-Adresse (1 RAF 512)  ------:
    22 21 20 19:18 17 16 15   14 13 12 11 10  9  8  7: 6  5  4  3  2  1  0:
               :                                     :                    :
    15 14 13 12:11 10  9  8    7  6  5  4  3  2  1  0:                    :
   +--+--+--+--+--+--+--+--+ +--+--+--+--+--+--+--+--+                    :
   !       B-Register      ! !       r-Register      !                    :
   +--+--+--+--+--+--+--+--+_+--+--+--+--+--+--+--+--+                    :
     ! !!!!!  !    _________!_________              7: 6  5  4  3  2  1  0:
     ! für    !    ! OUT(C),r-Befehl !            +--+--+--+--+--+--+--+--+ 
     ! >512k  !    !__auf_Ctrl-Adr___!            !//:  B-Reg (INIR/OTIR) ! 
     !        !                                   +--+--+--+--+--+--+--+--+ 
     !        ADV                                   __________!__________
     !        Adressüberlauf-Bit (RAF 512)          ! oberer Adr.bus in !
     !              (Bit 10 bei RAF 128)            ! INIR-/OTIR-Befehl !
     PROT                                           !______(7_bit)______!
     Zugriffsschutz-Bit (1=geschützt) 
     

Ansteuerung

Die zur Ansteuerung nötige Adresse wird ähnlich, aber nicht genauso, wie bei der RAM-Disk nach mp 3/88 gebildet:

    Raf_C = RAF-Control Port zum Laden der Track- & Sector-Adresse „HiAdr“ via D-bus 0…7 und A-bus 8…14 (B-Reg).
    Raf_D = RAF-Data-I/O Port zum Schreiben/Lesen von max. 128 zusammenhängenden Bytes mit einem INIR-/OTIR-Befehl mit einem 7-bit Byte-Index „LoAdr“ auf dem A-bus 8…14 (B-Reg)

ADV an ABx	ADV an U12 Pin	Umfang RAF
AB12	15	512K
AB13	14	1024K
AB14	13	2048K

Mittels Port AX wird auf die zweite Hälfte der RAF2008 umgeschaltet
RAM-Decoder

RAM-Adressierung

Unterlagen
RAF2008

Schaltung RAF 2008
RAF512

raf512-schaltung.pdf
Jumper
Adresse	8xx2	0x1
Port 20h	zu	auf
Port 24h	zu	zu
Port 88h	auf	auf
Port 8Ch	auf	zu
Grundlagen

RAM Datenblatt

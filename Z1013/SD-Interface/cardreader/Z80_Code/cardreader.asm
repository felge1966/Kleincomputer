; 11.01.2025 Programme ueber SD Karte in den Z1013 laden
; Version V0.99
; je 0x100 byte ein * zur anzeige der Uebertragung
; Funktionen:
; J F800 Initialisierung der @ Programmaufrufe und NMI Resetadresse f800 eintragen
; @L LOAD - der Datei datei.z80 von SD-Karte
; @M Laden einer Datei die per Hand von Pico an den Z1013 gesendet wird
; @S SAVE - Abspeichern von Programmcode auf SD Karte
; @D Laden einer Datei datei.z80 (ohne Auflistung SD Inhalt)
; @U reserviert fuer UPLOAD

SIOAD:	equ	0x34		; SIO A Daten
SIODB:	equ	0x35		; SIO B Daten
SIOAS:	equ	0x36		; SIO A Steuerung
SIOBS:	equ	0x37		; SIO B Steuerung

	org	0xF800

START:	ld	hl,0x00b0	; @ Adressen hinterlegen
	ld	a,'S'
	ld	(hl),a
	inc	hl
	ld	bc,SAVE		; save file
	ld	a,c
	ld	(hl),a
	inc	hl
	ld	a,b
	ld	(hl),a
	inc	hl
	ld	a,'L'
	ld	(hl),a
	inc	hl
	ld	bc,LOAD		; load file
	ld	a,c
	ld	(hl),a
	inc	hl
	ld	a,b
	ld	(hl),a
	inc	hl
	ld	a,'M'
	ld	(hl),a
	inc	hl
	ld	bc,LOADD3	; load von hand gesendetes file
	ld	a,c
	ld	(hl),a
	inc	hl
	ld	a,b
	ld	(hl),a
	inc	hl
	ld	a,'D'
	ld	(hl),a
	inc	hl
	ld	bc,LOADD	; file datei.z80 von sd karte lesen
	ld	a,c
	ld	(hl),a
	inc	hl
	ld	a,b
	ld	(hl),a
	inc	hl
	ld	hl,0x0066	; nmi funktion aktivieren
	ld	a,0xc3
	ld	(hl),a
	inc	hl
	ld	a,0x00
	ld	(hl),a
	inc	hl
	ld	a,0xf0
	ld	(hl),a
	rst	0x20		; prst datum und version
	db	0x02
	db	"V0.99 11.01.2025 WWW.ICPLAN.DE"
	db	0x8d		; neue zeile
	ret

SIOIB:	db 0x00,0x18		; kanal ruecksetzen
	db 0x01,0x00		; interrupt aus
	db 0x03,11000001b	; 8 bit, empfaenger ein
	db 0x04,10000100b	; takt x32, 1 stopbit, ungerade patitaet
	db 0x05,01101000b	; 8 bit, sender ein

INIT:	ld	b,10		; 10 byte sio initialisierung
	ld	hl,SIOIB
INIT1:	ld	a,(hl)
	out	(SIOAS),a
	inc	hl
	djnz	INIT1
	ret

READ:	ld	a,0x00		; neue daten in sio ?
	out	(SIOAS),a
	in	a,(SIOAS)
	and	0x01
	jr	z,READ
	in	a,(SIOAD)
	ret

SEND:	push	af
SEND1:	ld	a,0x00		; sendepuffer leer?
	out	(SIOAS),a
	in	a,(SIOAS)
	and	0x04
	jr	z,SEND1
	pop	af
	out	(SIOAD),a	; senden
	ret

LOADD:	call	INIT		; sio initialisieren
	ld	a,'D'		; zeichen D versenden
	call	SEND
LOADD1:	ld	b,0x00		; zeitschleife
LOADD2:	push	bc
	ld	b,0x00
LOADD3:	nop
	nop
	djnz	LOADD3
	pop	bc
	djnz	LOADD2
	jr	LOADD5

LOADD4:	call	INIT		; sio initialisieren

LOADD5: rst	0x20		; prst7
	db	0x02
	db	0x0c,0x8d	; seite loeschen, neue zeile
	ld	b,0x40		; zwei zeilen ascii lesen
LOADD6:	call	READ		; byte in a seriell lesen
	rst	0x20
	db	0x00		; zeichen auf z1013 zeigen / darstellen
	djnz	LOADD6
	call	READ		; ram high byte lesen
	ld	h,a
	call	READ		; ram low byte
	ld	l,a

	call	READ		; anzahl high
	ld	b,a
	call	READ		; anzahl low
	ld	c,a
LOADD7:	call	READ
	ld	(hl),a
	inc	hl
	dec	bc
	ld	a,0x00		; bc low auf 0 testen
	cp	c
	jr	nz,LOADD7
	ld	a,'*'		; ein stern alle 0x100 byte
	rst	0x20
	db	0x00
	ld	a,0x00		; bc high auf 0 testen
	cp	b
	jr	nz,LOADD7

	ld	a,0x0d		; neue zeile vor ende
	rst	0x20
	db	0x00
	ret

; *************************************************************************
; LOAD : SD Karte anzeige / einlesen
; *************************************************************************

LOAD:	call	INIT		; sio initialisieren
	ld	a,'L'		; zeichen L versenden
	call	SEND
	rst	0x20		; prst7
	db	0x02
	db	0x0c, 0x8d	; bildschirm loeschen und neue zeile
	ld	b,0x00		; zeitschleife
LOAD01:	push	bc
	ld	b,0x00
LOAD02:	nop
	nop
	djnz	LOAD02
	pop	bc
	djnz	LOAD01
	ld	b,0x80		; 4 zeilen seriell empfangen
LOAD03:	call	READ
	rst	0x20
	db	0x00
	djnz	LOAD03
	ld	b,41		; schritte zurueck
	ld	a,0x08		; cursor links
LOAD04:	rst	0x20
	db	0x00
	djnz	LOAD04

LOAD05:	rst	0x20		; zeichen von tastatur lesen
	db	0x04
	cp	0x0d            ; enter ?
	jr	z,LOAD06
	cp	0x30		; kleiner ascii 0 ?
	jr	c,LOAD05        ; falsche tasten ignorieren
	push	af		; retten tastatureingabe
	rst	0x20            ; zahl zeichen ausgeben
	db	0x00
	ld	b,40            ; schritte weiter
	ld	a,0x09
	jr	LOAD07
LOAD06: push	af		; retten tastatureingabe
	ld	b,41
	ld	a,0x09		; cursor rechts
LOAD07:	rst	0x20
	db	0x00
	djnz	LOAD07
	pop	af		; tastatureingabe wiederherstellen
	call	SEND		; versenden
	ld	bc,704		; 22 zeilen = 704 zeichen ausgeben
LOAD08:	call	READ		; zeichen seriell lesen
	rst	0x20
	db	0x00		; ausgeben
	ld	a,0x00
	dec	bc
	cp	b
	jr	nz,LOAD08
	cp	c
	jr	nz,LOAD08

	ld	b,23		; cursor links
	ld	a,0x08
LOAD09: rst	0x20
	db	0x00
	djnz	LOAD09
	ld	b,0x02		; maximal 2 zahlen
	push	bc
LOAD10: rst	0x20		; zeichen von tastatur lesen
	db	0x04
	cp	0x0d		; enter ?
	jr	z,LOAD13
	cp	'E'		; e wie ende?
	jr	z,LOAD11
	cp	0x30		; kleiner ascii 0 ?
	jr	c,LOAD10
	cp	0x3a		; groesser ascii 9 ?
	jr	nc,LOAD10
	rst	0x20		; ausgeben
	db	0x00
        call	SEND		; versenden
	pop	bc		; wiederherstellen
	dec	b
	jr	z,LOAD16
	push	bc		; noch mal retten
	jr	LOAD10
LOAD11: pop	bc		; leerfunktion stack
	ld	a,'E'		; ein E fuer Ende versenden
	call	SEND
	ld	b,23            ; 23 mal cursor nach
	ld	a,0x09		; rechts
LOAD12: rst	0x20
	db	0x00
	djnz	LOAD12
	ret			; abbruch / ende
LOAD13: pop	bc		; wiederherstellen
	push	af		; retten
	ld	a,0x02		; zweite eingabe?
	cp	b
	jr	z,LOAD14
	ld	a,0x08		; cursor einmal zurueck
	rst	0x20
	db	0x00
LOAD14:	pop	af		; wiederhersstellen
	call	SEND            ; enter versenden -> zweite seite
	ld	bc,681		; cursor stellen zuruecksetzen
LOAD15: ld	a,0x08		; cursor links
	rst	0x20
	db	0x00
	dec	bc
	ld	a,0x00
	cp	b
	jr	nz,LOAD15
	cp	c
	jr	nz,LOAD15
	ld	bc,704		; 22 zeilen ausgeben
	jr	LOAD08
LOAD16: ld	b,22		; cursor rechts
	ld	a,0x09
LOAD17: rst	0x20
	db	0x00
	djnz	LOAD17
	jp	LOADD1		; file einlesen

; *************************************************************************
; SAVE : Speicherbereich auf SD Karte schreiben
;        Programmname ist im Headersave Kopf und wird Dateiname *.z80
; *************************************************************************

SAVE:	rst	0x20		; prst7 test ausgeben
	db	0x02
	defb	0x0d,"Programmnamen eingeben (16 Z.)",0x0d,"________________.Z80 (Enter)",0xa0
	ld	a,0x08		; Cursor nach links
	ld	b,29		; x mal
SA1:	rst	0x20
	db	0x00
	djnz	SA1

	ld	b,0x10		; 16 Zeichen moeglich
	ld	hl,0x0069	; als Zwischenspeicher Stackberech nutzen
SA2:	rst	0x20		; lesen
	db	0x01
	cp	0x08		; Cursor links nicht zulassen
	jr	z,SA2
	cp	0x09		; Cursor rechts nicht zulassen
	jr	z,SA2
	ld	(hl),a
	inc	hl
	rst	0x20
	db	0x00		; schreiben
	djnz	SA2
	rst	0x20		; prst7
	db	0x02
	db	".Z80",0x8d

	call	INIT		; sio initialisieren
	ld	a,'S'		; zeichen S versenden
	call	SEND
	ld	b,0x00		; zeitschleife
SA3:	push	bc
	ld	b,0x00
SA4:	nop
	nop
	djnz	SA4
	pop	bc
	djnz	SA3

	ld	a,(0x001b)	; low erster parameter -> bc
        ld	c,a
	call	SEND
	ld	a,(0x001c)	; high
	ld	b,a
	call	SEND
	ld	a,(0x001d)	; low zweiter parameter -> de
	ld	e,a
	call	SEND
	ld	a,(0x001e)	; high
	ld	d,a
	call	SEND
	ld	a,(0x0023)	; low dritter parameter
	call	SEND
	ld	a,(0x0024)	; high
	call	SEND
	push	bc		; retten

	ld	b,0x10		; 16 Zeichen
	ld	hl,0x0069	; Dateiname versenden (16 Zeichen)
SA5:	ld	a,(hl)
	call	SEND		; versenden
	inc	hl
	djnz	SA5

	pop	bc		; wiederherstellen
	inc	de		; erhöhen, um wirklich alle Bytes zu schreiben
	ld	h,d		; de -> hl kopieren
	ld	l,e
	sbc	hl,bc		; ergebnis ist anzahl programmbytes
	ld	a,h
	rst	0x20		; high als hex ausgeben
	db	0x06
	ld	a,l
	rst	0x20		; low als hex ausgeben
	db	0x06
	rst	0x20		; prst7
	db	0x02
	db	" BYTE",0x8d

SA6:	ld	a,0x00		; alle 100 Byte Sternchen ausgeben
	cp	c
	jr	nz,SA7
	ld	a,'*'		; Sternchen ausgben
	rst	0x20
	db	0x00
SA7:	ld	a,(bc)
	call	SEND
	inc	bc
	ld	a,b		; endadresse erreicht?
	cp	d
	jr	nz,SA6
	ld	a,c
	cp	e
	jr	nz,SA6

	rst	0x20		; zwei mal neue Zeile
	db	0x02
	db	0x0d,0x8d
	ret

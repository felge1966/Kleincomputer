;-----------------------------------------------------------------------------

;  Z1013 booten von Diskette mit Zander FDC

; Programmparameter A-F 1/2 4/8; Default A 2 8
; Bootlaufwerk, 1- oder 2-seitig, 40 oder 80 Spuren
; 
;-----------------------------------------------------------------------------

			cpu	z80
			page	0
		
			org 100h

;-----------------------------------------------------------------------------
; physischer Disketten-Transfer
;-----------------------------------------------------------------------------

		ld	a,2				; CPM-Kommando
		ld	(param12), a			; Defaultwert 2
		ld	a,8
		ld	(param48), a			; Defaultwert 8

; 4 MHz
		IN	A,(4)	
		SET	6,A	
		OUT	(4),A		;4 MHz - Peters Platine

		jp	inifd
		include biosfdc.inc

;-----------------------------------------------------------------------------
; Initialisierung U8272
;-----------------------------------------------------------------------------

inifd:
		ld	a, 100000b
		out	(FDCZ),	a
		ld	a, 10011b
		out	(FDCZ),	a
binit1:		ld	b, 0				; INITIALISIERUNG P8272
binit2:		djnz	binit2
		in	a, (FDCD)
		cp	80h
		jr	z, binit4
		in	a, (FDCC)
binit3:		jr	binit1

STAB:		db  	9Fh
		db  	3Fh

binit4:		ld	hl, stab-1			; PARAMETER LADEN
			ld	bc, 303h		; SPECIFY-COMM 3BYTES
			call	wcom1			; SCHREIBEN COMM
;
			xor	a
			ld	(UNIT), a		; Laufwerk 0 als Standard setzen
			ld	(dFDCZ1), a

			ld	a, 10h
			ld	(TRCK),	a
			call	seek2
			ld	a, 1
			ld	(UNIT),	a
			call	seek2
			xor	a
			ld	(UNIT),	a
			ld	(TRCK),	a
			call	recal2

			call	sds			; Prüfe	Laufwerk Status
			bit	4, a
			ld	a, 1
			jr	z, binit5
			ld	(dFDCZ1), a		; sonst teste Laufwerk 1
binit5:		ld	(UNIT), a
			call	recal2
			call	sds			; Prüfe	Laufwerk Status
			bit	4, a
			ld	a, (dFDCZ1)
			jr	z, binit6
		

			or	2

			ld	(dFDCZ1), a
binit6:		
			out	(FDCZ), A		; Motor an
			ei
			ld	hl, ftdir		; Bereitstellung der Parameter
			ld	de, ft.kom
			ld	bc, 0Bh
			ldir
			call	floppy			; ersten Sektor der Floppy laden
			or	a			; trat ein Fehler auf?
			jp	nz, error		; Fehlermeldung	anzeigen und zurück zum	OS
			;

; Anzeige erster Dateiname
			ld	hl, dskbuf+1
			ld	b,6
m1:			ld	a,(hl)
			rst 	20h
			db	0
			inc	hl
			djnz	m1

			ld	de, dskbuf+1		; speichere hier Dateinamen der	ersten
							; geladenen Datei .... sollte @cpmz9 sein
			ld	b, 6			; Länge	des Dateinamens
			ld	hl, acpmz9		; "@CPMZ9"

binit7:		ld	a, (de)				; nächstes Zeichen des Dateinamens

			and	7Fh 			; strip high bit
			cp	(hl)			; und vergleichen

			inc	hl
			inc	de

			ld	a, 'N'          	; Fehler "falsches System (Name!)"
			jp	nz, error		; Fehlermeldung	anzeigen und zurück zum	OS
			djnz	binit7
			ld	a,0dh
			RST	20H
			DB 0
			RST	20H
			DB	0
			ld	a, (dskbuf+15)		; Programmlänge als Blockanzahl (im CP/M-directory) 50h -> 10240 Byte
			ld	b, 0
			srl	a			; obere 4 Bits von A nach unten bringen, untere Bits nach B aufsammeln
			rr	b		
			srl	a		
			rr	b		
			srl	a		
			rr	b		
			rl	b			; obere vier bits von B nach unten bringen
			rl	b
			rl	b
			rl	b		
			ld	(blockanz), a		; Programmgröße in 2K-Blöcken
			or	a
			ld	a, 'L'         		; Fehler "falsche Laenge des Systems"
			jp	z, error		; Fehlermeldung	anzeigen und zurück zum	OS
			ld	a, b
			ld	(blockrest), a

; "ldcpm0" landet auf dem Stack (Push) ... ein pop wird es aber nicht geben. Vielmehr holt
; eines der folgenden "Ret" Opcode jenen Wert vom Stack und springt an diese
; Speicheradresse in der Annahme, daß vorher von dort aus ein Call Befehl in jene
; Subroutine ausgeführt wurde. Eventuell sollte so aufgrund der Kürze des Befehls
; und der größeren Anzahl nötiger Call-Befehle Speicherplatz (vielleicht auch
; Zeit) gespart werden.

; Bestimmen von Anfangssektor und Track (Default 2-8)
			ld	hl, ldcpm0
			push	hl
;
			ld	hl, param48		; 4 oder 8
			ld	a, (param12)		; 1 oder 2
			add	a, (hl)
			ld	h, 0
			cp	5
			ld	b, 3
			ret	z			; 1/4 -> B = 3, H = 0
			cp	9
			ld	b, 5
			ret	z			; 1/8 -> B = 5, H = 0
			cp	6
			ret	z			; 2/4 -> B = 5, H = 0
			ld	b, 2
			ld	h, 1			; 2/8 -> B = 2, H = 1
			ret
;
ldcpm0:		ld	a, b
			ld	(ft.sec), a
			ld	l, 0
			ld	(ft.trk), hl
			ld	hl, ft.kom
			ld	a, (ft.sid)
			rrca
			res	7, (hl)
			or	(hl)
			ld	(hl), a
			call	floppy			; Block lesen
			or	a
			jp	nz, error		; Fehlermeldung	anzeigen und zurück zum	OS

; Test auf korrektes @cpmz9
; als 1. Byte muß 11h stehen, dann folgt die Ladeadresse
; (also ursprünglich di und ld de, 8000h)
			ld	a, (dskbuf+1)
			cp	11h
			ld	a, '?'         		; Fehler "kein CPMZ9-System"
			jp	nz, error		; Fehlermeldung	anzeigen und zurück zum	OS
			ld	hl, (dskbuf+2)		; Parameter des Befehls LD DE, xxxx, also die Ladeadresse

			ld	(loadadr), hl
			ex	de, hl

; Auf "dskbuf" wird das CPM Betriebssystem geladen. Mit dabei noch der komplette
; Loader (128 Bytes). Ab "dskbuf+80h" gibt es dann den eigentlichen Programmcode.

			ld	hl, dskbuf+80h
			ld	bc, 380h		; Ein Sektor ist 400h (1024) Bytes groß. Header weg bleiben 380h Bytes.
			ldir				; Kopieren der ersten Bytes des CPMs nach loadadr
			ex	de, hl
			ld	(ft.adr), hl
			ld	hl, blockanz
			dec	(hl)
			ld	a, 'L'
			jp	z, error		; Fehlermeldung	anzeigen und zurück zum	OS
			ld	hl, ft.sec
			inc	(hl)

; Da das CPM noch nicht zur Verfügung steht, müssen die genutzten Sektoren und Tracks auf 
; manuelle Weise ermittelt und ausgelesen werden.

ldcpm1:		ld	hl, ft.sec
			ld	a, 5
			cp	(hl)
			jr	nc, ldcpm3
			ld	(hl), 1
			dec	hl
			ld	a, (param12)		; 1 oder 2
			dec	a
			jr	z, ldcpm2
			xor	(hl)
			ld	(hl), a
			jr	nz, ldcpm3
ldcpm2:		dec	hl
			inc	(hl)
ldcpm3:		ld	a, 6
			ld	hl, ft.sec
			sub	(hl)
			ld	hl, blockanz
			cp	(hl)
			jr	c, ldcpm4
			ld	a, (hl)
ldcpm4:		ld	(ft.anz), a
			ld	hl, ft.kom
			ld	a, (ft.sid)
			rrca
			res	7, (hl)
			or	(hl)
			ld	(hl), a
			call	floppy			; nächsten Sektor lesen
			or	a
			jp	nz, error		; Fehlermeldung	anzeigen und zurück zum	OS
			ld	hl, ft.anz
			ld	b, (hl)
			ld	hl, (ft.adr)
ldcpm5:		ld	de, 400h			; Länge ein Sektor
			add	hl, de
			djnz	ldcpm5
			ld	(ft.adr), hl
			ld	a, (ft.sec)
			ld	hl, ft.anz
			ld	de, ft.sec
			add	a, (hl)
			ex	de, hl
			ld	(hl), a
			ld	a, (blockanz)
			ex	de, hl
			sub	(hl)
			ld	(blockanz), a
			jr	c, ldcpm6
			jr	nz, ldcpm1
ldcpm6:		ld	a, (blockrest)
			or	a
			jr	z, ldcpm8
			bit	7, a
			jr	nz, ldcpm7
			set	7, a
			ld	(blockrest), a
			ld	a, 1
			ld	(blockanz), a
			ld	hl, (ft.adr)
			ld	(blockadr), hl
			ld	hl, dskbuf
			ld	(ft.adr), hl
			jp	ldcpm1
; letzten Sektor kopieren
ldcpm7:		and	7Fh
			ld	c, 0
			rra
			rr	c
			ld	b, a
			ld	hl, dskbuf
			ld	de, (blockadr)
			ldir

ldcpm8:		ld	hl, (loadadr)	
			;ld	a,h
			;cp	0fh
			;jr	nz,ldcpm81
			;jp	(hl)
ldcpm81:	ld	bc, 1600h			; Offset CCP+BDOS
			add	hl, bc			; zu Ladeadr. addieren
			
			rst 20h
			db	7	; OUTHL

			ld	a, (ftdir+3)		; Boot-Laufwerk holen
			
			jp	(hl)			; und starten des BIOS	; oder des Monitors
		; -- FINI --

;-----------------------------------------------------------------------------
; Fehlermeldung	anzeigen und zurück zum	OS
;-----------------------------------------------------------------------------
error:		push	af
			RST	20H			; "Boot-Error: "
			DB	2
aBootError:	db	0dh,"Boot-Error:" 
			db 20H+80H
			pop	af
			RST	20H
			DB	0
			;RET
			;jp	0f000H			; Systemwarmstart

			ld	a,0dh
			RST	20H
			DB	0
			rst 38h

;-----------------------------------------------------------------------------


; in loc_0_772 werden die 10 Byte nach ft.kom kopiert
ftdir:		db	39h 				; kommando
			dw	dskbuf 			; Transferadresse
			db	0			; phys. Laufwerksnummer
			db	0 			; track
			db	0 			; side
			db	1 			; Sektorlaenge
			db	3 			; Anzahl der zu uebertragenden Sektoren
			db	1 			; Anzahl der Stepimpulse von Spur zu Spur
			db	1 			; Schrittzeit von Spur zu Spur

			db	 'Z' 			; ???????

acpmz9:		db	"@Z1013"

loadadr:	dw	0				; Ziel-Ladeadr. des CPM (also i.allg. 8000h)

blockanz:	db	0				; Größe des CPMs in 2K-Blöcken
blockrest:	db	0				; Anzahl der restl. 128-Byte Blöcke
blockadr:	dw	0				; aktuelle Blockladeadresse


param12:	db	0				; 1 oder 2
param48:	db	0				; 4 oder 8

dskbuf:		equ 	$				; Sektor-Buffer für Floppy, 1K Bereich ! (2K?)

		end
;

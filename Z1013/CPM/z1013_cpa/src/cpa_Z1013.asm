;-----------------------------------------------------------------------------
; Z1013-BIOS
; Volker Pohlers 06.04.2007 10:12
; bearbeitet Tino Ziemke 2016
; VP 20170227 komplett neu gebaut
; das CCP wird von Diskette gelesen
;-----------------------------------------------------------------------------

		cpu	z80
		page	0

		title	"Z1013 BIOS"


;-----------------------------------------------------------------------------
; Konfiguration
;-----------------------------------------------------------------------------

condev	equ	1	; 0 - 32x32 original
			; 1 - 64x16 Peters-Platine
			; 2 - 64x32 H.P. K1520-BWS

lstdev	equ	1	; 0 - Sprungverteiler nutzen (DRAKK)
			; 1 - V24-Riesa-Modul

;-----------------------------------------------------------------------------
;
;-----------------------------------------------------------------------------

	if condev = 2
CCP		equ	0BF00h		; base of ccp
RAMEND		equ	0E7FFH		; Stackbereich	für BIOS (nur read disk)
; ab E800 Farb-BWS
	else
CCP		equ	0C300h		; base of ccp
RAMEND		equ	0EBFFH		; Stackbereich	für BIOS (nur read disk)

	endif
BDOS       	equ	CCP+0806h	; base of bdos
BIOS		equ	CCP+1600h	; base of bios
IOLOC	EQU	3		;i/o definition byte.
DISKA	EQU	4		;current drive name and user number.


LOADADRESS	equ	4000H		; Hierhin wird das Programm durch den Loader geladen





; Funktionen für AS
hi		function x,(x>>8)&255 	; oberes Byte eines 16-Bit-Wortes
lo		function x, x&255 	; unteres Byte eines 16-Bit-Wortes
;nextpage	function x, ((x+0ffh)/100h)*100h

;-----------------------------------------------------------------------------
; Initialisierung Loader (CPMLDR)
; vom aktuellen Boot-Loader wird dieser Code nicht ausgeführt, es wird nur
; die Ladeadresse entnommen.
; man sollte aber @OS auch von hier als CPM-Programm laden können
;-----------------------------------------------------------------------------

		org 	LOADADRESS

anfang:
		phase  100h

		di
		ld	de, LOADADRESS	; <- dieser Befehl muß stehen, damit der
					; Loader das OS als gültig erkennt
					; Gleichzeitig entnimmt der Loader hier
					; die initiale Ladeadresse.
		ld	hl, 180h
		ld	bc, biosend-LOADADRESS
		ldir

		xor	a		; Laufwerk 0
		jp	LOADADRESS+1600h	; COLD

		dephase

;-----------------------------------------------------------------------------
; CCP+BDOS
;-----------------------------------------------------------------------------

		align	80h		; 1 Sektor weiter

ccpstart:	equ	$

		phase	CCP

		; CP/A AdW
		LISTING	OFF
		section CCP
		public	dircol
		include	ccp_cpa.asm
		endsection
		section BDOS
		include	bdos_cpa.asm
		endsection
		LISTING	NOSKIPPED

		dephase

;-----------------------------------------------------------------------------
; BIOS
;-----------------------------------------------------------------------------

biosstart:	equ	$

		phase 	BIOS

		jp	cold		; wird in cold gepatcht durch jp cboot
					;BOOTF		cold boot function
		jp	wboot           ;WBOOTF		warm boot function
		jp	CONST           ;CONSTF		console status function
		jp	CONIN           ;CONINF		console input function
		jp	COOUT           ;CONOUTF	console output function
		jp	LIST           ;LISTF		list output function
		jp	PUNCH        ;PUNCHF		punch output function
		jp	READR        ;READERF	reader input function
		jp	home            ;HOMEF		disk home function
		jp	seldsk          ;SELDSKF	select disk function
		jp	settrk          ;SETTRKF	set track function
		jp	setsec          ;SETSECF	set sector function
		jp	setdma          ;SETDMAF	set dma function
		jp	_read1          ;READF		read disk function
		jp	_write1         ;WRITEF		write disk function
		jp	LSTST           ;LISTSTF	list status function
		jp	sectran         ;SECTRAN	sector translate

		db	"CPA"		; Kennung CPA
		db	"13"		; Z1013

; Konfiguration zum Auslesen
config:		db	condev		; con
		db	0		; rdr
		db	0		; pun
		db	lstdev		; lst
		db	2		; Anz. LW
		db	16		; A: 1.6er LW
		db	16		; B: 1.6er LW
		ds	12		; C..P


;-----------------------------------------------------------------------------
; I/O-Gerätetreiber
;-----------------------------------------------------------------------------

	; Konsole
	if condev = 0
		include	con_3232.inc
	elseif condev = 1
		include	con_6416.inc
	elseif condev = 2
		include	con_6432hp.inc
	endif

	; Drucker
	if lstdev = 0
		include	lst_drakk.inc
	elseif lstdev = 1
		include	lst_v24.inc
	endif

;-----------------------------------------------------------------------------
; Floppy-Treiber
;-----------------------------------------------------------------------------

		include biosdsk.inc


;-----------------------------
; Ausgabe Zeichenkette
biosms:		di
		call	prnst
		ei
		ret

prnst:		ex	de, hl
prnst1:		LD	A,(DE)
		OR	A
		RET	Z
		LD	C,A
		CALL	COOUT
		INC	DE
		JR	prnst1	;OUTX

;-----------------------------
; Kurze Warteschleife
wait:		push	bc
		ld	c, 0Ah
wait1:		ld	b, 0BDh
wait2:		djnz	wait2
		dec	c
		jr	nz, wait1
		pop	bc
		djnz	wait
		ret

;-----------------------------
; (HL) nach hex	konvertieren, Eintragen	nach (DE), 2x inc DE
mbreco:		ld	a, (hl)
hexa:		call	hexa1		; A nach hex konvertieren, Eintragen nach (DE),	2x inc DE
hexa1:		rrca
		rrca
		rrca
		rrca
		push	af
		and	0Fh
		sub	0Ah
		jr	c, hexa2
		add	a, 7
hexa2:		add	a, 3Ah
		ld	(de), a
		inc	de
		pop	af
		ret


;-----------------------------------------------------------------------------
; cboot boot
;-----------------------------------------------------------------------------

cboot:
		jp	0F000h		; Sprung in OS (Kaltstart)

;-----------------------------------------------------------------------------
; CCP von @OS.COM wiederhst.
;-----------------------------------------------------------------------------

;;wboot:


ccplod:
	ld	c,13		;;Reset Disksystem (LOGIN neu)
	call	bdos
	ld	a,0
ccpldv	equ	$-1		;;Kaltstart-Laufwerk (A=1,B=2,..)
	ld	(fcb_os),a
	xor	a
	ld	e,a		;;user 0
	ld	(fcb_os+12),a	;;extent
	inc	a		;;ab Satz 1 lesen
	ld	(fcb_os+32),a
	ld	c,32		;;set user 0
	call	bdos
	ld	c,15		;;open
	call	de_os
	inc	a		;;Datei da?
	jr	z,nosys_	;;nein
	ld	b,(800h+127)/128	;;128er records Länge CCP
	ld	hl,CCP		;;Zieladresse
ccpldz:	push	bc
	push	hl
	ex	de,hl
	ld	c,26		;;setdma
	call	bdos
	call	rd_os		;;read
	or	a		;;Fehler?
	jr	nz,nosyst	;;ja
	ld	hl,(CCP+1)	;;Test, ob richtiges @OS.COM
	ld	bc,0		;;bevor BDOS-Anfang ueberladen!
ccpjpm	equ	$-2		;;vom Kaltstart hinterlegt
	sbc	hl,bc		;;stimmt Sprungadresse?
	jr	nz,nosyst	;;nein, falsches CCP
	pop	hl
	ld	bc,80h
	add	hl,bc
	pop	bc
	djnz	ccpldz
;	jr	ccplde		;ok
ccplde:
;;	ld	hl, BDOS
;;	ld	bc, 5
;;	ld	(HL), 0
;;	ld	DE, BDOS+1
;;	ldir			;BDOS-Kopf wiederherstellen
	ret

nosyst:	pop	hl
	pop	bc
nosys_:
	ld	hl,nosysd
	call	biosms
	ret		;; test
;;	call	headup		;;Verriegelung oeffnen
	ld	b,200		;;200* 10ms
	call	wait1		;;warten
	jr	ccplod		;;neuer Versuch
nosysd:
	db	0dh,0ah,"No Sysdisk!",0

fcb_os:	db	01		;;LW
	db	"@Z1013  COM"
	db	21 dup(0)
rd_os:	ld	c,20
de_os:	ld	de,fcb_os
	jp	bdos


;-----------------------------------------------------------------------------
; wboot,
;-----------------------------------------------------------------------------

wboot:

wboot00:
		ld	hl, CCP+0003h

wboot3:		ld	(wboot3u1+1), hl

		di
		ld	a, hi(intvectab)	;E7H
		ld	i, a
		im	2

		ld	a, 0C3h		; Befehlscode JP
		ld	(0), a		; 0000h: jp wboot
		ld	(38h), a	; 0038h: RST 38H, jp wboot
		ld	hl, BIOS+3	; wboot	im upper Bios
		ld	(1), hl
		ld	(39h), hl
		ld	(5), a		; 0005h: jp bdos
wboot0:		ld	hl, BDOS
		ld	(6), hl

		;ld	a, 0C7h
		;out	(CTC3), a
		;ld	a, 40h
		;out	(CTC3), a

		ld	a, 0FFh
		ld	(dbdev), a

wboot1:		ld	hl, DISKA
		ld	c, (hl)
		push	bc
		ld	a, c
		and	0Fh
		ld	c, a
		xor	(hl)
wboot2:		or	0		; Std-Laufwerk, wird gepatcht
		ld	(hl), a
		ld	e, 1
		call	seldsk
		pop	bc
		ld	a, h
		or	l
		jr	z, wboot1		; bei SELDSK-Fehler ist HL=0

		;CCP laden
		ld	sp, 80h
		ld	a,(firstrun)
		or	a
		call	z,ccplod
		xor	a
		ld	(firstrun),a
		ld	hl, DISKA
		ld	c, (hl)
wboot3u1:	jp	CCP+0003h	; CLEAR: CCP-Aufruf mit	Löschen	des Befehlsbuffers

;-----------------------------------------------------------------------------
; write disk
;-----------------------------------------------------------------------------
_write1:	ld	hl, (ddma)
		ld	de, rwbuffer
		push	bc
		ld	bc, 80h
		ldir
		pop	bc
		jp	write			; WRITE	im Schattenbios

;-----------------------------------------------------------------------------
; read disk
;-----------------------------------------------------------------------------
_read1:
		ld	(stackp), sp	; Zwischenspeicher Stackpointer
		ld	sp, biosstack	; Adr. BIOS-Stackbereich
		call	read		; READ im Schattenbios
		ld	sp, (stackp)	; Zwischenspeicher Stackpointer
		ld	hl, rwbuffer
		ld	de, (ddma)
		ld	bc, 80h
		ldir
		or	a
		ret
;
;-----------------------------------------------------------------------------
; CPA-Disk-Parameter
;-----------------------------------------------------------------------------
;Disk-Parameter-Header
dph0:	dw	0		; XLT	translation table
		dw	0
		dw	0
		dw	0
		dw	dirbuf		; DIRBUF
		dw	dpb0		; DPB
		dw	CSV0		; CSV
		dw	ALV0		; ALV

dph1:	dw	0		; XLT	translation table
		dw	0
		dw	0
		dw	0
		dw	dirbuf		; DIRBUF
		dw	dpb1  		; DPB
		dw	CSV1		; CSV
		dw	ALV1		; ALV
;
DPHBER	EQU	$

dphtab:	dw	dph0
		dw	dph1


;Disp-Parameter-Blöcke
;800K-Laufwerk 80 Spuren DS, DD
dpb0:	dw	40		; SPT	40 Sektoren/Spur
		db 	4		; BSH	= log2(blocksize/128)
					;  => blocksize = (2^4)*128 = 2048
		db 	00001111b	; BLM	= 2^BSH-1
		db 	0		; EXM
		dw	400-1		; DSM	max. 400 Blöcke
					;  => also 400*2048 = 800K disc
		dw	192-1		; DRM	max 192 Dir. Einträge
		db 	11100000b	; AL0	also 3 Blöcke (192*32 / 2048)
		db 	0		; AL1	für DIR reservieren
		dw	48		; CKS	= (DRM+1)/4
		dw	0		; OFF	0 reservierte Spuren
;Erweiternung DBP des Z9001-CBIOS
		db  	00100000b 	; DPB-Steuerinformationen
					; bit 5=1 Double sided zu betreiben
		db    	3 		; Sektorlaengencode
		db    	7 		; Puffermaske 8*128
		db    	1 		; Zahl der Stepimpulse
		db    	0  		; keine Weiter-Numm. auf Rueckseite
		db  	80		; benutzte Zahl phys. Spuren
		db    	0  		; (dbp+15h) phys. LW-Nr. (0 --> A:)
		db  	80		; Gesamtzahl physische Spuren (wird in FORMATZ abgefragt)
		db	4*10		; Schrittzeit fuer 80 Tr. DS LW
		db	00111001b	; vom Laufwerkstyp abhaengige Flags
					; bit 0=0 bei SS, =1 bei DS
					; bit 3=0 bei SD (FM), =1 bei DD (MFM)
					; bit 4=0 bei 8", =1 bei 5"
					; bit 5=0 bei nicht 80-Spur, =1 bei 80-Spur
					; bit 6=0 ohne, =1 mit Verify nach Schreiben
					; bit 7=0 bei max 26 ,=1 bei max 52 Sekt./Spur (8" MFM)
;translation tab dbp0
		db	1,2,3,4,5,6,7,8,9,10,11,12,13,14
		db	15,16,17,18,19,20,21,22,23,24,25,26

dpb1:	dw	40		; SPT	40 Sektoren/Spur
		db 	4               ; BSH	= log2(blocksize/128)
                                        ;  => blocksize = (2^4)*128 = 2048
		db 	00001111b       ; BLM	= 2^BSH-1
		db 	0               ; EXM
		dw	400-1           ; DSM	max. 400 Blöcke
                                        ;  => also 400*2048 = 800K disc
		dw	192-1           ; DRM	max 192 Dir. Einträge
		db 	11100000b       ; AL0	also 3 Blöcke (192*32 / 2048)
		db 	0               ; AL1	für DIR reservieren
		dw	48              ; CKS	= (DRM+1)/4
		dw	0               ; OFF	0 reservierte Spuren
; CPA-Erweiterung
		db  	00100000b 	; DPB-Steuerinformationen
					; Bit5=1 Double sided zu betreiben
		db    	3 		; Sektorlaengencode
		db    	7 		; Puffermaske 8*128
		db    	1 		; Zahl der Stepimpulse
		db    	0  		; keine Weiter-Numm. auf Rueckseite
		db  	80		; benutzte Zahl phys. Spuren
		db    	1  		; (dbp+15h) phys. LW-Nr. (1 --> B:)
		db  	80		; Gesamtzahl physische Spuren (wird in FORMATZ abgefragt)
		db	4*10		; Schrittzeit fuer 80 Tr. DS LW
		db	00111001b	; vom Laufwerkstyp abhaengige Flags
					; bit 0=0 bei SS, =1 bei DS
					; bit 3=0 bei SD (FM), =1 bei DD (MFM)
					; bit 4=0 bei 8", =1 bei 5"
					; bit 5=0 bei nicht 80-Spur, =1 bei 80-Spur
					; bit 6=0 ohne, =1 mit Verify nach Schreiben
					; bit 7=0 bei max 26 ,=1 bei max 52 Sekt./Spur (8" MFM)
; translation tab dbp1
		db	1,2,3,4,5,6,7,8,9,10,11,12,13,14
		db	15,16,17,18,19,20,21,22,23,24,25,26

firstrun	db	1

ubiosend:	equ	$
;-----------------------------------------------------------------------------
		align	10h
		;align	80h		; align 100h geht irgendwie nicht, nextpage auch nicht wg. phase
					; intvectab muß aber auf ..00-Adresse liegen!
		;align 100H

intvectab	equ	$		; Interruptvektortabelle, 12 Byte

		;if	intvectab # 100h <> 0
		;ERROR  "intvectab % 100h"
		;endif


stackp:		equ	intvectab+12	; Zwischenspeicher Stackpointer
ddma:		equ	stackp+2	; aktuelle DMA-Adresse
dirbuf:		equ	ddma+2		; Bereich 128 Byte

ALV0:		equ	dirbuf+128	; = DSM/8+1 = 399/8+1 = 50
CSV0:		equ	ALV0+50 	; = CKS (also 48)
ALV1:		equ	CSV0+48
CSV1:		equ	ALV1+50
rwbuffer:	equ	CSV1+48		;128 Byte Buffer für _read/_write

fdcbuffer:	equ	rwbuffer+80h 	; Buffer für FDC-IO-Operation (1K? 2K?)

ubiosend0:	equ	fdcbuffer+400h

		if	ubiosend0 > RAMEND-20
		ERROR "ubiosend0 > RAMEND"
		endif

biosstack	equ	RAMEND		; Stackbereich	für BIOS (nur read disk)


; ENDE BIOS
;-----------------------------------------------------------------------------


		dephase

ccpende		equ	$

		phase	loadadress+ccpende-ccpstart

;-----------------------------------------------------------------------------
;EINMALIGE AUSFÜHRUNG BEIM INITIALEN LADEN


;>>>>>>>>>>>>>>>>>>
;-----------------------------------------------------------------------------
; cold boot
; Einsprung durch Init nach Bootloader, Initialisierung von cold und BIOS
; IN A: Boot-Laufwerk (A=0, B=1, ..)
;-----------------------------------------------------------------------------

cold:	di
		ld	sp, 80h

		push	af		; boot-Laufwerk merken

		; CCP und BDOS und BIOS kopieren
		ld	de, CCP
		ld	hl, LOADADRESS	;ccpstart
		ld	bc, biosend-ccpstart	;Länge CCP+BDOS
		ldir
;		call BCLS	;Init Statuszeile
;		call UHRINI
;		call Zeit1
		;call RPinit
		ld	a,0H	;00000010b
		ld	(IOLOC),a

;-----------------------------------------------------------------------------
;
; Startmeldung,
; Initialisieren Geräte,
; starten des CCP-Systems
; Register A: untere 2 Bit Laufwerk; Bit 7 = 1 Warmstart
; Bei Bit7=0 Kaltstart mit kompletter Initialisierung, es
; kann ein Kommando beim start des CCP ausgeführt werden
;
;-----------------------------------------------------------------------------

		; CRT-Gerätetreiber init
		call	INIT_CRT
		call	INIT_PRN

		pop	af		; boot-Laufwerk

		and	3
		ld	(DISKA), a		; Standard-Laufwerk
		ld	(wboot2+1), a

	; f. @OS-Load
		inc	a		;von Kaltstart-Laufwerk
		ld	(ccpldv),a
  		ld	hl,(CCP+1)	;fuer Warmstart-Kontrolle
		ld	(ccpjpm),hl	;Sprungadresse aus CCP hinterlegen

		ld	a, hi(intvectab); Interrupttabelle
		ld	i, a		; Interruptregister setzen
		im	2

; 4 MHz
		IN	A,(4)	
		SET	6,A	
		OUT	(4),A		;4 MHz - Peters Platine
;

; Initialisierung FDC
		ld	a, 20h		; 0010 0000 FDC	Reset
		out	(FDCZ),	a
		ld	a, 13h		; 0001 0011 Terminal Count aktivieren, Motor LW	1+2 an
		out	(FDCZ),	a
;

binit1:		ld	b, 0		;INITIALISIERUNG P8272
binit2:		djnz	binit2
		in	a, (FDCD)
		cp	80h
		jr	z, binit4
		in	a, (FDCC)
		jr	binit1
;

stab:
		db  	10011111b	;XXXX=Schrittratenzeit SRT,XXXX= Kopfladezeit HUT
		db  	00111111b	;XXXXXXX=Kopfladezeit HLT,X=no dma ND

binit4:		ld	hl, stab-1	;PARAMETER LADEN
		ld	bc, 303h	;SPECIFY-COMM 3BYTES
		call	wcom1		;SCHREIBEN COMM
		xor	a
		ld	(UNIT), a
		ld	(dFDCZ1), a
		call	recal2
		call	sds
		bit	4, a
		ld	a, 1
		jr	z, binit5
		ld	(dFDCZ1), a
binit5:		ld	(UNIT), a
		call	recal2
		call	sds
		bit	4, a
		ld	a, (dFDCZ1)
		jr	z, binit6
		or	2
		ld	(dFDCZ1), a
binit6:
		out	(FDCZ), a	; ZusatzRegister FDC schreiben

		ei
binit7:
		ld	hl, cboot	; Patchen BIOS-Verteiler (JP cboot)
		ld	(BIOS+1), hl

		ld	hl, bootmsg	; Anzeige Boot-Meldung

		call	prnst		; Stringausgabe

binit12:	ld	hl, startkdo	; start-Kommando
		ld	de, CCP+0007h	; CCP-Befehlsbuffer
		ld	bc, 81h		; 80 Byte + 1 Längenbyte
		ldir

		ld	hl, CCP		; cboot:	CCP-start mit Ausführung des startkdo :-))
		;ld	hl, CCP+0003	; cboot:	CCP-Aufruf mit Löschen des Befehlsbuffers

		jp	wboot3		; WBOOT	im Bios


;-----------------------------------------------------------------------------
;
;-----------------------------------------------------------------------------

bootmsg:	;db  	0Ch
		db	"CP/A Z1013   ", DATE,0Dh, 0Ah
		db  	"F.S., V.P., H.P, T.Z.",0Dh, 0Ah
		db	0Dh, 0Ah
		db	"TPA:"," 100H - \{BDOS-1}H",0Dh, 0Ah
;		db	0Dh, 0Ah
;		db	"Laufwerke:",0Dh, 0Ah
;		db	0Dh, 0Ah
;		db	"A: Floppy-Disk 3,5/5", '"', "(80,DS)",0Dh, 0Ah
;		db	"B: Floppy-Disk 3,5/5", '"', "(80,DS)",0Dh, 0Ah
;		db	0Dh, 0Ah
;
;	if condev = 1
;		db	"Peters-Platine 64x16",0Dh, 0Ah
;	elseif condev = 2
;		db	"K1520-BWS H.P.",0Dh, 0Ah
;	endif
;	if lstdev = 1
;		db	"LPT: V24 9600 Baud",0Dh, 0Ah
;	endif
;		db	0Dh, 0Ah
		db 	0

; hier kann ein	Befehl eingetragen werden, der beim Start des CCP ausgeführt werden soll
startkdo:	db  	7Fh	; Länge	des Befehls(buffers)
			db	"SUBMIT AUTOEXEC"	;db 	"STAT"
			db	128-($-startkdo-1) dup (0)	; mit 00 auffüllen

biosend:	equ	$

ende:		equ	$

	if MOMPASS > 1
	outradix	16
	message	       "====================="
	message	       "cpm:		\{ccp}H"
	message	       "bdos:		\{bdos}H"
	message	       "bios:		\{bios}H - \{ubiosend0}H"
	message        "RAM end:        \{RAMEND}H"
	message	       "====================="
	endif


;------------------------------------------------------------------
; PATCHES

	; Konsole
	if condev = 0
		;patch CCP DIR 2 Spalten
		org dircol - ccp +  anfang + 80h
		db	1
	endif
	
		end

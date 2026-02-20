/*
 * Z1013Ps2Tastatur_nach_Gubsch.asm
 *
 *
 *  Idee und 1.Realisierung : Uwe Gubsch 
 *	Korrekturen				: Ralph Hänsel ralphhaensel@gmx.de
 */ 
;
; Stand 04.12.2012
;
; Diese Version entspricht der von Ralph Hänsel korrigierten Version
; Basis war die von Uwe Gubsch entwickelte 1.Version der Firmware für
; den Z1013 Monitor 2.02.
; Es exisitiert eine weitere Version von Ralph Hänsel die dann auch
; die Brosig-Monitore unterstützt.
; 
;- die Control-Taste ist derzeitig noch ohne Funktion:
;- Ctrl-C: S4+K wird liegt derzeitig auf ALT-C
;- F1-F12 sind noch unbelegt.
;- Numlock noch ohne Funktion, auf dem Zahlenfeld werden nur Zahlen erzeugt
;- LED auf der PS/2 Tastatur werden nicht angesteuert.


; Register definieren

.def	spalte0	=	r0
.def	spalte1	=	r1
.def	spalte2	=	r2
.def	spalte3	=	r3
.def	spalte4	=	r4
.def	spalte5	=	r5
.def	spalte6	=	r6
.def	spalte7	=	r7
.def	zero	=	r8						; R2 Konstante 0x00
.def	nozero	=	r9						; R3 Konstante 0xFF
.def	maske	=	r10						; R4 Konstante 0b01111000


; .				=	r13
.def	code_alt=	r14
; def			=	r15
.def	temp1 	= 	r16
.def 	mtemp1 	= 	r17
.def	mtemp2	=	r18
.def	Spalten	=	r19
.def	zeichenn	=	r20
.def	itemp1	=	r21
.def	itemp2	=	r22
.def	itemp3	=	r23
.def	SREG1	=	r24
.def	Status	=	r25
.def	code	=   r26			;in Code steht das auszugebende Zeichen als Spalten/ZeilenInfo
.def	zaehler	=   r27

		.equ	SHIFT1			=	0		; linke SHIFT-Taste gedrückt
		.equ	SHIFT2			=	1		; rechte SHIFT-Taste gedrückt
		.equ	ALTGR			=	2		; ALTGR gedrückt
		.equ	BREAKCODE		=	3		; BREAKCODE (wenn Taste losgelassen wurde)
		.equ	CAPSLOCK		=	4		; CAPSLOCK aktiv
		.equ	CAPSLOCK_AUS	=	5		; CAPSLOCK-Taste losgelassen
		.equ	E0CODE			=	6		; ERweiterter Code

.equ XTAL = 8000000    	                    ; Systemtakt in Hz


;.org 0x0000
;		rjmp 	init
;.org URXCaddr						;Einsprungpunkt Interrupt USART
;		rjmp	Tastatur_Interrupt_Routine	;ISR Routine Zeichen empfangen
;.org PCIaddr						;Einsprungpunkt Interrupt Zähler PCI
;		rjmp	Matrix1				;ISR Routine Zählerinterrupt

;Interrupttabelle
.org 0x0000
		rjmp 	init		; Reset
		reti				; ISR INT0
		reti				; ISR INT1 
		reti				; ISR TIM1_CAPT 
		reti				; ISR TIM1_COMPA vergleich A
		reti				; ISR TIM1_OVF Overflow
		reti				; ISR TIM0_OVF Overflow
		reti ;rjmp	Tastatur_Interrupt_Routine	; ISR U0RX Routine Zeichen empfangen
		reti				; ISR U0UD Usart leer
		reti				; ISR U0TX USART Zeichen gesendet
		reti				; ISR ANA_COMP Analog Comparator
		rjmp	Matrix1		; ISR PCINT Portwechsel an B Routine Zählerinterrupt ; Pin Change Interrupt
		reti			  	; ISR TIMER1_COMPB ; Timer1 Compare B Handler
		reti			 	; ISR TIMER0_COMPA ; Timer0 Compare A Handler
		reti				; ISR TIMER0_COMPB ; Timer0 Compare B Handler
		reti				; ISR USI_START ; USI Start Handler
		reti				; ISR USI_OVERFLOW ; USI Overflow Handler
		reti				; ISR EE_READY ; EEPROM Ready Handler
		reti				; ISR WDT_OVERFLOW ; Watchdog Overflow Handler
;



; Initialsierungen
init:
		clr		zero				;Zero=00H
		ldi		temp1, 0xff
		mov		nozero, temp1		;nozero=FFH
;		ldi		temp1, 0b01111000	;Bitmuster 78H
;		mov		maske, temp1		;Maske=78H
		clr		spalte0				;Spalten löschen
		clr		spalte1
		clr		spalte2
		clr		spalte3
		clr		spalte4
		clr		spalte5
		clr		spalte6
		clr		spalte7
		clr		Status				; TastaturStatusRegister löschen
		ldi		Code,kein_Zeichen

; Stackpointer initialisieren		
		ldi     temp1, LOW(RAMEND)  ;LowByte Stack
        out     SPL, temp1			;Stack auf RAMEnde einstellen
        
; Ports initialisieren
		out		DDRB, 	zero				; Port B auf Eingang schalten
		out		PORTB,	zero				; Pull-Up-Widerstände PortB deaktivieren
		out		DDRD,	zero				; Port D auf Eingang schalten
		out		PORTD,  zero				; Pull-Up-Widerstände PortD deaktivieren
		out		DDRA, nozero				; debug
		out		PORTA, zero

; USART Einstellungen
; synchron, 8 bit-Mode , odd Parity, 1 Stop Bit, Takt auf fallende Flanke
 			
		ldi     temp1, (1<<UMSEL)|(1<<UPM0)|(1<<UPM1)|(1<<UCSZ0)|(1<<UCSZ1)
	    out     UCSRC, temp1

; USART Receiver einschalten

 		ldi		temp1,(1<<RXEN)			;|(1<<RXCIE) 
		out		UCSRB, temp1
	
; PIN-Change-Interrupt		
		out		PCMSK, nozero			;jedes Bit von 0..7 löst Interrupt aus
		ldi		temp1, (1<<PCIE)		;PinChangeInterrupt freigabe
		out		GIMSK,	temp1			;nun freigeben

		sei								; Interrupts global erlauben
		rjmp	main_loop				; Hauptschleife

;***********************************************************************************
;*******        Interruptroutine Tastenmatrix-Ausgabe                            ***
;
;               Hier wird das in Code stehenden Zeichen ausgegeben
;
Matrix1:
		out		DDRD,zero		;RichtungsPortregister D=00 = Eingabe für Spalte
		sbis	PINB,0			;überspringe nächsten Befehl wenn Port B0=0=L
		out		DDRD,spalte0	;Spalte 0 ausgeben
		sbis	PINB,1			;überspringe nächsten Befehl wenn Port B1=0=L
		out		DDRD,spalte1	;Spalte 1 ausgeben
		sbis	PINB,2			;überspringe nächsten Befehl wenn Port B2=0=L
		out		DDRD,spalte2	;Spalte 2 ausgeben
		sbis	PINB,3			;überspringe nächsten Befehl wenn Port B3=0=L
		out		DDRD,spalte3	;Spalte 3 ausgeben
		sbis	PINB,4			;überspringe nächsten Befehl wenn Port B4=0=L
		out		DDRD,spalte4	;Spalte 4 ausgeben
		sbis	PINB,5			;überspringe nächsten Befehl wenn Port B5=0=L
		out		DDRD,spalte5	;Spalte 5 ausgeben
		sbis	PINB,6			;überspringe nächsten Befehl wenn Port B6=0=L
		out		DDRD,spalte6	;Spalte 6 ausgeben
		sbis	PINB,7			;überspringe nächsten Befehl wenn Port B7=0=L
		out		DDRD,spalte7	;Spalte 7 ausgeben
		sbis	PINB,7			;überspringe nächsten Befehl wenn Port B7=0=L
		rjmp    Decode			;zum Decodieren springen
		dec		zaehler		    ;Zähler runterzählen
		breq	Decode			;wenn Zaehler=0  (überspringe Reti)
		reti				    ;Rückkehr aus Interrupt

Decode:							;UP muss hier stehen !!
		sbi		porta, 0		;Tastatur StatusBit=L=rücksetzen
		in		SREG1, SREG		;Statusregister zurücksichern
		cp		code, code_alt	;
		breq	_decode_ende	;wenn Code=code_alt dann Decodieren fertig
		clr		spalte0			;Spaltenregs. löschen 
		clr		spalte1
		clr		spalte2
		clr		spalte3
		clr		spalte4
		clr		spalte5
		clr		spalte6
		clr		spalte7
		cpi		code, kein_zeichen	;wenn kein_Zeichen
		breq	_decode_ende		;dann Decoderen zuende
;		Zeilen-Code-Auswertung
		mov		mtemp1, code		;ZeichenCode holen
		andi 	mtemp1, 0b00000011		; Bit 0 und 1 für Zeileninformation isolieren
		ldi		mtemp2, 0b00000100
_decode1:
		lsl		mtemp2						; Bit bis zu viermal nach links schieben
		dec		mtemp1
		brpl	_decode1

;		Spalten-Code-Auswertung		
		mov		mtemp1, code
		andi	mtemp1, 0b00011100		; Bit 2 bis 4 für Spalteninfomation isolieren
		lsr		mtemp1					; zweimal nach rechts verschieben
		lsr		mtemp1
		clr		YH		
		clr		YL						; Achtung: Register werden über Pointer adressiert
		add		YL,mtemp1				; Spaltencode addieren
		st		Y, mtemp2				; Zeilencode in Register

;		SHIFT-Code-Auswertung	
		mov		mtemp1, code
		andi	mtemp1, 0b11100000		; Bit 5 bis 7 für SHIFT-Infomation isolieren
		breq	_decode_ende			; wenn keine SHIFT-Taste gedrückt 
		swap	mtemp1					; Registerhälften tauschen und
		lsr		mtemp1					; einmal nach rechts
		clr		YH		
		clr		YL						; Achtung: Register werden über Pointer adressiert
		dec		mtemp1
		add		YL,	mtemp1				; Spaltencode addieren
		ld		mtemp2, Y
		ori		mtemp2, 0b01000000
		st		Y, mtemp2
_decode_ende:
		mov		code_alt, code
		out		SREG, SREG1
		cbi		porta, 0
		ldi		zaehler, 0x08
		reti	

;***            Ende Interruptroutine Tastenmatrix-Ausgabe                       ***
;***********************************************************************************
;***********************************************************************************
;***                  Hauptprogramm                                              ***
;								einziger Zweck ist das warten auf einen Tastendruck	
Main_loop:
		cbi		porta,1			; Debug .. Ausgang A1 auf L
		USART_Receive:
		sbis UCSRA, RXC			; warten bis Daten von Tastatur empfangen
		rjmp Main_loop
;
;***********************************************************************************
;***                  Routine Tastaturabfrage			                         ***
;
;		Routine die ein von der Tastatur empfangenes Zeichen verarbeitet
;
Tastatur_Interrupt_Routine:
		sbi		porta,1				; Debug .. Ausgang A1 auf H
		in 		itemp1,UDR			; Zeichen aus Empfangsregister holen
		cpi		itemp1, 0xF0		; Test Break-Code
		breq	SET_BREAK_CODE
		cpi		itemp1, 0xE0		; Test Erweiterter Code ?
		breq	SET_E0_CODE
		cpi		itemp1,	0x12		; Test SHIFT-Taste1 ?
		breq	SET_SHIFT1
		cpi		itemp1,	0x59		; Test SHIFT-Taste2 ?
		breq	SET_SHIFT2
		cpi		itemp1, 0x11		; Test ALTGR-Taste ?
		breq	SET_ALTGR1
		cpi		itemp1, 0x58		; Test CAPSLOCK-Taste?
		breq	SET_CAPSLOCK
		rjmp	Zeichen_holen		

SET_BREAK_CODE:
		sbr		status,	(1<<BREAKCODE)
		ldi 	code, kein_zeichen
		rjmp Main_loop

SET_E0_CODE:
		sbr		status, (1<<E0CODE)
		rjmp Main_loop		

; ************************* Sondertastenauswertung *********************************
; wenn BREAK_CODE (F0) oder ERWEITERUNGSCODE (E0) gesendet wurde, werden nur die 
; entsprechende Bits im Statusregister gesetzt

; SHIFT-Tasten auswerten

SET_SHIFT1:
		sbrc	status, BREAKCODE			; testen ob SHIFT1-TASTE losgelassen
		rjmp	SET_SHIFT1_loeschen			; SHIFT1-Bit im Statusregister loeschen
		sbr		status, (1<<SHIFT1)			; SHIFT1-Bit im Statusregister setzen
		rjmp Main_loop

SET_SHIFT1_loeschen:						
		cbr		status, (1<<SHIFT1)|(1<<BREAKCODE)
		rjmp Main_loop

SET_SHIFT2:
		sbrc	status, BREAKCODE			; testen ob SHIFT2-TASTE losgelassen
		rjmp	SET_SHIFT2_loeschen			; SHIFT2-Bit im Statusregister loeschen
		sbr		status, (1<<SHIFT2)			; SHIFT2-Bit im Statusregister setzen
		rjmp Main_loop

SET_SHIFT2_loeschen:						
		cbr		status, (1<<SHIFT2)|(1<<BREAKCODE)
		rjmp Main_loop

; ALTGR-Taste auswerten	
			
SET_ALTGR1:
		sbrs	status, E0CODE				; testen ob es wirklich die ALTGR-Taste war
		rjmp	Zeichen_holen				; sie war es nicht!			
		sbrc	status, BREAKCODE			; testen ob ALTGR-TASTE losgelassen
		rjmp	SET_ALTGR1_loeschen			; ALTGR-Bit im Statusregister loeschen
		sbr		status, (1<<ALTGR)			; ALTGR-Bit im Statusregister setzen
		cbr		status, (1<<E0Code)
		rjmp Main_loop

SET_ALTGR1_loeschen:						
		cbr		status, (1<<ALTGR)|(1<<BREAKCODE)|(1<<E0Code)
		rjmp Main_loop
		
; CAPSLOCK-Taste auswerten

SET_CAPSLOCK:
		sbrs	status, BREAKCODE 
		rjmp	SET_CAPSLOCK_Status_aendern
		sbr		status, (1<<CAPSLOCK_AUS)
		cbr		status, (1<<BREAKCODE)
		rjmp Main_loop

SET_CAPSLOCK_Status_aendern:
		sbrs	status, CAPSLOCK_AUS
		reti
		sbrs	status, CAPSLOCK
		rjmp	SET_CAPSLOCK_einschalten
		cbr		status,(1<<CAPSLOCK)|(1<<CAPSLOCK_AUS)
		rjmp Main_loop

SET_CAPSLOCK_einschalten:		
		cbr		status,(1<<CAPSLOCK_AUS)
		sbr		status,(1<<CAPSLOCK)
		rjmp Main_loop
		
		

Zeichen_holen:
		sbrs	status, BREAKCODE	; wenn nur Taste losgelassen sofort zurück
		rjmp	Zeichen_holen1
		cbr		status,(1<<BREAKCODE)|(1<<E0CODE)
		ldi		code, kein_Zeichen
		rjmp Main_loop		
								
Zeichen_holen1:	
		sbrc	status, ALTGR		; auf ALTGR-Taste gedrückt testen
		rjmp	ALTGR_Suche			; wenn ja Suche in Alternativtabelle
		
		sbrc	status, E0CODE		; auf eventuellen E0-Code testen
		rjmp	ALTGR_Suche			; wenn ja Suche in Alternativtabelle
		
		ldi   	ZL, LOW (Zeichentabelle*2)
        ldi   	ZH, HIGH(Zeichentabelle*2)
		ldi		itemp2,((ALTGR_E0_Tabelle-Zeichentabelle)/3)*2
		
Suche:		
		lpm		itemp3,Z+
		cp		itemp1,itemp3
		breq	scancode_gefunden
		adiw	Z,2
		dec		itemp2
		brne	Suche
		rjmp	kein_scancode_gefunden

scancode_gefunden:
		sbrc	status,	SHIFT1
		rjmp	Abfrage_CAPSLOCK_mit_SHIFT
		sbrc	status,	SHIFT2
		rjmp	Abfrage_CAPSLOCK_mit_SHIFT

Abfrage_CAPSLOCK_ohne_SHIFT:
		sbrc	status,	CAPSLOCK
		rjmp	Zeichen_holen_mit_SHIFT
		rjmp	Zeichen_holen_ohne_SHIFT

Abfrage_CAPSLOCK_mit_SHIFT:
		sbrc	status,	CAPSLOCK
		rjmp	Zeichen_holen_ohne_SHIFT
		
Zeichen_holen_mit_SHIFT:
		adiw	Z,1

Zeichen_holen_ohne_SHIFT:
		lpm		code,Z
		rjmp Main_loop
		
ALTGR_Suche:
		cbr		status, (1<<E0CODE)		; E0-Statusbit löschen
		ldi   	ZL, LOW (ALTGR_E0_Tabelle*2)
        ldi   	ZH, HIGH(ALTGR_E0_Tabelle*2)
		ldi		itemp2,(ENDE_Tabelle-ALTGR_E0_Tabelle)
		
ALTGR_Suche1:		
		lpm		itemp3,Z+
		cp		itemp1,itemp3
		breq	ALTGR_scancode_gefunden
		adiw	Z,1
		dec		itemp2
		brne	ALTGR_Suche1
		rjmp	kein_scancode_gefunden

ALTGR_scancode_gefunden:

		lpm		code,Z
		rjmp Main_loop
		
kein_scancode_gefunden:
		ldi		code, kein_zeichen
		rjmp Main_loop
;**************************Register Tastenmatrix setzen*****************************

;***					Ende Routine Tastaturabfrage                            ***
;***********************************************************************************

;***********************************************************************************
;***      
;
.equ		Z0	= 0b00000000					; Zeile0
.equ		Z1	= 0b00000001					; Zeile1
.equ		Z2	= 0b00000010					; Zeile2
.equ		Z3	= 0b00000011					; Zeile3
.equ		S0	= 0b00000000					; Spalte0
.equ		S1	= 0b00000100					; Spalte1
.equ		S2	= 0b00001000					; Spalte2
.equ		S3	= 0b00001100					; Spalte3
.equ		S4	= 0b00010000					; Spalte4
.equ		S5	= 0b00010100					; Spalte5
.equ		S6	= 0b00011000					; Spalte6
.equ		S7	= 0b00011100					; Spalte7
.equ		SH0	= 0b00000000					; Ohne Shift
.equ		SH1	= 0b00100000					; SHIFT1
.equ		SH2	= 0b01000000					; SHIFT2
.equ		SH3	= 0b01100000					; SHIFT3
.equ		SH4	= 0b10000000					; SHIFT4
.equ		kein_Zeichen = 0b11111111			; kein Zeichen ausgeben
;
;
;**************************  Zeichentabellen ******************************************
;
Zeichentabelle:
	.db		0x0E,	SH1+Z0+S6, SH1+Z0+S6, 	0x16,	SH1+Z1+S1, SH2+Z1+S1	; Tasten ^ 1
	.db		0x1E,	SH1+Z1+S2, SH2+Z1+S2, 	0x26,	SH1+Z1+S3, SH1+Z1+S3	; Tasten 2 3
	.db		0x25,	SH1+Z1+S4, SH2+Z1+S4, 	0x2E,	SH1+Z1+S5, SH2+Z1+S5	; Tasten 4 5
	.db		0x36,	SH1+Z1+S6, SH2+Z1+S6, 	0x3D,	SH1+Z1+S7, SH2+Z2+S7	; Tasten 6 7
	.db		0x3E,	SH1+Z2+S0, SH2+Z2+S0, 	0x46,	SH1+Z2+S1, SH2+Z2+S1	; Tasten 8 9
	.db		0x45,	SH1+Z1+S0, SH1+Z2+S5, 	0x4E,	SH1+Z2+S7, SH1+Z2+S7	; Tasten 0 ß
	.db		0x15,	SH0+Z2+S1, SH3+Z2+S1, 	0x1D,	SH0+Z2+S7, SH3+Z2+S7	; Tasten Q W
	.db		0x24,	SH0+Z0+S5, SH3+Z0+S5, 	0x2D,	SH0+Z2+S2, SH3+Z2+S2	; Tasten E R
	.db		0x2C,	SH0+Z2+S4, SH3+Z2+S4, 	0x35,	SH1+Z0+S2, SH2+Z0+S2	; Tasten T Z
	.db		0x3C,	SH0+Z2+S5, SH3+Z2+S5, 	0x43,	SH0+Z1+S1, SH3+Z1+S1	; Tasten U I
	.db		0x44,	SH0+Z1+S7, SH3+Z1+S7, 	0x4D,	SH0+Z2+S0, SH3+Z2+S0	; Tasten O P
	.db		0x5B,	SH2+Z2+S3, SH2+Z2+S2, 	0x1C,	SH0+Z0+S1, SH3+Z0+S1	; Tasten + A
	.db		0x1B,	SH0+Z2+S3, SH3+Z2+S3, 	0x23,	SH0+Z0+S4, SH3+Z0+S4	; Tasten S D
	.db		0x2B,	SH0+Z0+S6, SH3+Z0+S6, 	0x34,	SH0+Z0+S7, SH3+Z0+S7	; Tasten F G
	.db		0x33,	SH0+Z1+S0, SH3+Z1+S0, 	0x3B,	SH0+Z1+S2, SH3+Z1+S2	; Tasten H J
	.db		0x42,	SH0+Z1+S3, SH3+Z1+S3,	0x4B,	SH0+Z1+S4, SH3+Z1+S4	; Tasten K L
	.db		0x5D,	SH2+Z1+S3, SH2+Z1+S7,	0x61,	SH1+Z2+S4, SH1+Z2+S6	; Tasten # <
	.db		0x1A,	SH1+Z0+S1, SH2+Z0+S1,	0x22,	SH1+Z0+S0, SH2+Z0+S0	; Tasten Y X
	.db		0x21,	SH0+Z0+S3, SH3+Z0+S3,	0x2A,	SH0+Z2+S6, SH3+Z2+S6	; Tasten C V
	.db		0x32,	SH0+Z0+S2, SH3+Z0+S2,	0x31,	SH0+Z1+S6, SH3+Z1+S6	; Tasten B N
	.db		0x3A,	SH0+Z1+S5, SH3+Z1+S5,	0x41,	SH2+Z2+S4, SH1+Z2+S3	; Tasten M ,
	.db		0x49,	SH2+Z2+S6, SH1+Z2+S2,	0x4A,	SH2+Z2+S5, SH1+Z0+S7	; Tasten . -
	.db		0x29,	SH0+Z3+S5, SH0+Z3+S5,	0x5A,	SH0+Z3+S7, SH0+Z3+S7	; Leertaste ENTER
	.db		0x76,	SH4+Z1+S3, SH4+Z1+S3,	0x66,	SH0+Z3+S4, SH0+Z3+S4	; ESC BACKSPACE
	.db		0x0D,	SH0+Z3+S6, SH0+Z3+S6,	0x7C,	SH2+Z2+S2, SH2+Z2+S2	; TAB NB *
	.db		0x7B,	SH2+Z2+S5, SH2+Z2+S5,	0x79,	SH2+Z2+S3, SH2+Z2+S3	; NB - NB +
	.db		0x6C,	SH1+Z1+S7, SH1+Z1+S7,	0x75,	SH1+Z2+S0, SH1+Z2+S0	; NB 7 NB 8
	.db		0x7D,	SH1+Z2+S1, SH1+Z2+S1,	0x6B,	SH1+Z1+S4, SH1+Z1+S4	; NB 9 NB 4
	.db		0x73,	SH1+Z1+S5, SH1+Z1+S5,	0x74,	SH1+Z1+S6, SH1+Z1+S6	; NB 5 NB 6
	.db		0x69,	SH1+Z1+S1, SH1+Z1+S1,	0x72,	SH1+Z1+S2, SH1+Z1+S2	; NB 1 NB 2
	.db		0x7A,	SH1+Z1+S3, SH1+Z1+S1,	0x70,	SH1+Z1+S0, SH1+Z1+S0	; NB 3 NB 0
	.db		0x71,	SH2+Z2+S4, SH2+Z2+S4,	0x55,	SH2+Z1+S7, SH2+Z1+S7	; NB , Taste ´
	.db		0x05,	SH0+Z3+S0, SH0+Z3+S0,   0x06,	SH0+Z3+S1, SH0+Z3+S1	; F1 F2
	.db		0x04,	SH0+Z3+S2, SH0+Z3+S2,	0x0C,	SH0+Z3+S3, SH0+Z3+S3	; F3 F4
ALTGR_E0_Tabelle:
	.db		0x3D,	SH2+Z0+S3					; Taste 7
	.db		0x3E,	SH1+Z0+S3					; Taste 8
	.db		0x46,	SH1+Z0+S5					; Taste 9
	.db		0x45,	SH2+Z0+S5					; Taste 0
	.db		0x4E,	SH1+Z0+S4					; Taste ß
	.db		0x15,	SH0+Z0+S0					; Taste Q
	.db		0x5B,	SH0+Z0+S0					; Taste +
	.db		0x61,	SH2+Z0+S4					; Taste <
	.db		0x75,	SH4+Z2+S3					; Pfeil oben
	.db		0x72,	SH4+Z2+S2					; Pfeil unten
	.db		0x6B,	SH0+Z3+S4					; Pfeil links
	.db		0x74,	SH0+Z3+S6					; Pfeil rechts
	.db		0x71,	SH2+Z2+S4					; NB ,
	.db		0x5A,	SH0+Z3+S7					; NB ENTER
	.db		0x4A,	SH2+Z2+S7					; NB /
ENDE_Tabelle:

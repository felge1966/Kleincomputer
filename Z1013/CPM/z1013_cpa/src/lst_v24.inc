;DRUCKEREINBINDUNG V.24-MODUL RIESA
;9600 Baud, 8N1
;PIO A3 CTS-SIGNAL
;PIO A0 TxD Daten
; s.a. http://hc-ddr.hucki.net/wiki/doku.php/z1013:handbuecher:bedienungsanleitung64#v24_-_drucker_-_anpassung_an_z_1013_und_einbindung_ins_10k-basic
; Bit 0 führt zu RxD des Druckers
; Bit 4 führt zu DTR des Druckers
; Masse der Zusatzbaugruppe an Betriebserde 

; --- DEF

F2_4:	DEFB	0		;SCHALTER TAKT 0=AUTOANPASSUNG		
	;			;2=2MHz, 4=4MHz;


PIOD	EQU	34h		;ADR.V.24 E/A-MOD.
PIOC	EQU	35h


; --- CODE

;
;DRUCKEREINBINDUNG V.24-MODUL RIESA
;
LIST:	LD	A,C	
ZDR1:	PUSH	HL	
	PUSH	BC	
	LD	L,A	
	LD	A,0CFH	
	OUT	(PIOC),A	
	LD	A,0FEH	
	OUT	(PIOC),A	
PRNT1:	PUSH	HL	
	XOR	A	
	LD	(TAPUF),A	;BLINDE BREAK-ABFRAGE
	CALL	CONS1	
	CP	A, 1BH	;ESCAPE
	SCF		
	POP	HL	
	JR	Z,PRE	
	IN	A,(PIOD)	;DRUCKERSTATUS LESEN
	AND	A, 8	;A3=CTS
	JR	NZ,PRNT1	
	LD	B,10	;10 BITS
	LD	H,0FFH	;STOP-BITS
	SLA	L	;STARTBIT EINSCHIEBEN
	RL	H	
	DI		
	PUSH	DE	
	LD	A,(F2_4)	
	CP	A, 4	;4MHz
	JR	Z,F4	
	CP	A, 2	;2MHz
	JR	Z,F2	
	IN	A,(4)	
	BIT	6,A	
F2:	LD	D,10	;ZK 2MHz
	JR	Z,SEND	
F4:	LD	D,23	;ZK 4MHz
SEND:	LD	A,L	
	OUT	(PIOD),A	
	SRL	H	
	RR	L	
	LD	C,D	;ZK
TIME0:	DEC	C	
	JR	NZ,TIME0	
	DJNZ	SEND	
	EI		
	OR	A	;CY=0
	POP	DE	
PRE:	POP	BC	
	POP	HL	
	RET		
;
;DRUCKERSTATUS V.24-MODUL RIESA
LSTST:	IN	A,(PIOD)	;DRUCKERSTATUS
	AND	A, 8	;CTS-SIGNAL
	LD	A,0FFH	
	RET	Z	;BEREIT
	XOR	A	
	RET		
;
PUNCH:	RET		
;
READR:	RET		
;



; --- RAM



; --- INIT

INIT_PRN:	
;
;INIT PIO f. Drucker
;
	LD	A,0CFH	
	OUT	(PIOC),A	
	LD	A,0FEH	
	OUT	(PIOC),A	
	LD	A,0FFH	
	OUT	(PIOD),A	;ANFANGSINIT

	RET

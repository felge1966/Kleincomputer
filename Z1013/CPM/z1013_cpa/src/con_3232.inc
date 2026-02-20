; aus CP/A VLE 1.0


; --- DEF

CZSP:	EQU	0001FH
CURSR:	EQU	0002BH	
BWS:	EQU	0EC00H

; --- CODE


INCH:	RST	20H	
	DB	1	
	RET		

OUTCH:	RST	20H	
	DB	0	
	RET		

CONST:	CALL	CONS1	
	OR	A	
	RET	Z	
	LD	A,0FFH	
	RET		
;
CONS1:	LD	A,(DISKA)	
	LD	(IOBPF),A	
	LD	A,(TAPUF)	
	LD	(DISKA),A
	PUSH	HL	
	PUSH	DE	
	PUSH	BC	
	RST	20H	
	DB	4	
	POP	BC	
	POP	DE	
	POP	HL	
	PUSH	AF	
	XOR	A	
	LD	(TAPUF),A	
	LD	A,(IOBPF)	
	LD	(DISKA),A	
	POP	AF	
	RET		


CONIN:	LD	A,(DISKA)	;Zeicheneingabe
	LD	(IOBPF),A	
	LD	A,(TAPUF)	
	LD	(DISKA),A	
	CALL	INCH	
	PUSH	AF	
	LD	A,(DISKA)	
	LD	(TAPUF),A	
	LD	A,(IOBPF)	
	LD	(DISKA),A	
	POP	AF	
	RET		

COOUT:	PUSH	AF	;Zeichenausgabe
	CALL	ZAG	
	POP	AF	
	RET		

ZAG:	LD	A,C	
	CP	A, 16H	
	JP	Z, DELLN	
	CP	A, 18H	
	JP	Z, INSLN	
	CP	A, 1AH	
	JP	Z, CUUP	
	CP	A, 14H	
	JP	Z, CLCU	
	CP	A, 82H	
	JP	Z, CZSET	
	CP	A, 83H	
	JP	Z, PUABL	
	CP	A, 0DH	
	JP	Z, CR	
	CP	A, 0AH	
	JP	Z, OUTLF	
	CP	A, 1	
	JP	Z, CHOME	
	CP	A, 15H	
	CALL	Z, CURR	
	CALL	OUTCH	
	JP	ZRET	

ZPOS:	LD	HL,(CURSR)	;holt ZPos. in Zeile
	LD	A,L	
	RES	0,A	
	RES	1,A	
	RES	2,A	
	RES	3,A	
	RES	4,A	
	LD	C,A	
	LD	B,H	
	SBC	HL,BC	
	RET		

CR:	CALL	ZPOS	;Cursor auf Zeilenanfang
	JP	Z, ZRET	
CR1:	LD	A,8	
	CALL	OUTCH	
	DEC	L	
	JP	NZ, CR1	
ZRET:	RET		

OUTLF:	LD	BC,20H	;Zeilenvorschub
OTLF1:	LD	A,9	
	CALL	OUTCH	
	DEC	C	
	JP	NZ, OTLF1	
	JP	ZRET	

CHOME:	LD	HL,(CURSR)	;Cursor home
	LD	BC,BWS	
	SBC	HL,BC	
	JP	Z, ZRET	
	LD	BC,1	
CHOM1:	LD	A,8	
	CALL	OUTCH	
	SBC	HL,BC	
	JP	NZ, CHOM1	
	JP	ZRET	

CURR:	LD	A,9	;Cursor rechts
	RET		

CLCU:	LD	BC,(CURSR)	;Bildrest loeschen
	LD	HL,BWS+3FFH	
	SBC	HL,BC	
CLCU2:	LD	DE,1	
	LD	A,' '	
	LD	BC,(CURSR)	
CLCU1:	LD	(BC),A	
	INC	BC	
	SBC	HL,DE	
	JP	NZ, CLCU1	
CLCU3:	LD	HL,(CURSR)	
	LD	A,'>'	
	LD	(HL),A	
	LD	A,' '	
	LD	HL,(CURSR)	
	LD	A,0FFH	
	LD	(HL),A	
	JP	ZRET	

DELLN:	CALL	ZPOS	;Zeilenrest loeschen
	EX	DE,HL	
	LD	HL,20H	
	SBC	HL,DE	
	JP	Z, CLCU3	
	JP	CLCU2	

INSLN:	CALL	ZPOS	;Zeile loeschen
	EX	DE,HL	
	LD	HL,(CURSR)	
	SBC	HL,DE	
	LD	A,' '	
	LD	(HL),A	
	LD	D,H	
	LD	E,L	
	INC	DE	
	LD	BC,31	
	LDIR		
	LD	HL,(CURSR)	
	LD	(HL),A	
	LD	(CZSP),A	
	JP	CR	

CUUP:	LD	BC,20H	;Cursor hoch
ZRET1:	LD	A,8	
	CALL	OUTCH	
	DEC	C	
	JP	NZ, ZRET1	
	JP	ZRET	

CZSET:	LD	A,0FFH	;Cursor ein
CZST1:	LD	HL,(CURSR)	
	LD	(HL),A	
	JP	ZRET	

PUABL:	LD	A,(CZSP)	;Cursor aus
	JP	CZST1	

; --- RAM

IOBPF:	DB	0	
TAPUF:	DB	0	

; --- INIT

INIT_CRT:	
	LD	A,(4)	
	LD	(TAPUF),A	

	ld	c,0ch
	call	COOUT
	ld	HL,BWS
	ld	(CURSR),HL

	RET		

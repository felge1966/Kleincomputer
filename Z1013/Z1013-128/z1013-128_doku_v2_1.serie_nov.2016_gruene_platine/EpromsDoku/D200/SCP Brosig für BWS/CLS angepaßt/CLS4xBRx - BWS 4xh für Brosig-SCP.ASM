;CLS-Routine ab E7D0H fuer BWS-Platine mit SCP-Start
;I/O-ADRESSE 1Xh
;BWS Adresse E800h Aufloesung 64x32 (neuer CPLD)
;gruene Schrift auf schwarzem Hintergrund
;Syntax an M80MS / L80MS angepasst
;Matthias H./MHC "Lötspitze" 16.11.2016
;***************************************************
;
BEGIN	EQU	0E7D0H  ;Beginn CLS Routine
BWSA	EQU	0E800H	;ANFANG BWS
BWSE	EQU	0F000H	;ENDE BWS + 1
ADR1	EQU	   42H	;I/O-AdRESSE BWS 4Xh 2=Schreiben BIT 0
ADR2	EQU	   41H	;I/O-AdRESSE BWS 4Xh 1=Schreiben BIT 1-3
STSCP	EQU	0DE00H	;Startadresse SCP Brosig
;
	ASEG
	.PHASE BEGIN
;
	JP	CLS
CLS:	LD	C,ADR1
	LD	A,1
	OUT	(C),A	;COLOR-RAM ON
	LD	B,2	;GRUEN/SCHWARZ
;
	call	fill
;
	LD	A,0
	OUT	(C),A	;TEXT-RAM ON
	LD	B,20H	;LEERZEICHEN
;
	call 	fill
;
	LD	C,ADR2
	LD	A,0	;Bit 1-3 = Low
	OUT	(C),A	;Bit 1=0 entspricht 64x32
;
	CALL	STSCP	;STARTE SCP
	RET
	;
	; BWS mit Inhalt von B fuellen
	; evtl. HL und DE vorher retten
	;
fill:	ld	hl,bwsa		;Beginn BWS
	ld	de,bwse-bwsa	;Laenge BWS
fil1:	ld	(hl),b
	inc hl
	dec de
	ld a,d
	or e
	jr nz,fil1
	ret
	;
	END	;
	;
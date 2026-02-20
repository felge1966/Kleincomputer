;Umladeroutine für 32k-Eprom des Z1013-128
;umzuladen nach EC00h in den RAM (BWS)
;Bedingung: Eprom an FlipFlop von D5 aktiv nach RESET
;(das bedeutet, JP8 mit Brücke 2-3)
;Syntax an M80MS / L80MS angepasst
;Matthias H./MHC "Lötspitze" 15.12.2016
;***************************************************
;umzuladendes Programm: SCP64HP8 von H.Poppe
;***************************************************
;
BEGIN	EQU	0EC00H  ;Anfangsadresse dieser Routine
UMLANF	EQU	0C000H	;Anfangsadresse des Programmes
UMLEND	EQU	0E7FFH	;Endadresse des Programmes
PIO	EQU	   04H	;I/O-ADRESSE PIO für /IOSEL1
EPRON	EQU	   00H	;FlipFlop/D5 Eprom ein (da JP8/2-3)
EPROFF	EQU	   20H	;FlipFlop/D5 Eprom aus (da JP8/2-3)
STADR	EQU	0D600H	;Startadresse des umgeladenen Programmes
;
	ASEG
	.PHASE BEGIN
;
	JP	UML
UML:	ld	hl,UMLANF		;Anfangsadresse
	ld	de,UMLEND-UMLANF+1	;Menge Umladebytes
	call	UML1
;
	call	STADR			;Programm starten
;
UML1:	LD	c,PIO
	LD	a,EPRON
	OUT	(c),a	;FlipFlop Eprom ein
	NOP
	LD	b,(hl)
	LD	a,EPROFF
	OUT	(c),a	;FlipFlop Eprom aus
	NOP
	ld	(hl),b
	inc hl
	dec de
	ld a,d
	or e
	jr nz,UML1
	ret
	;
	END	;
	;

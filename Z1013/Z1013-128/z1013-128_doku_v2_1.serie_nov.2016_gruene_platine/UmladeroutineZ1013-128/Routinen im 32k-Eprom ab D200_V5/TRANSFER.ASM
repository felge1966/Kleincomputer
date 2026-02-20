;Transferroutine für 32k-Eprom des Z1013-128
;Bedingung: Eprom an FlipFlop von D5 aktiv nach RESET
;(das bedeutet, JP8 mit Brücke 2-3)
;zu transferierendes Programm: Umladeroutine für xyz
;Syntax an M80MS / L80MS angepasst
;Matthias H./MHC "Lötspitze" 14.11.2016
;***************************************************
;
BEGIN	EQU	0BFB0H  ;Anfangsadresse dieser Transferroutine
			;(32 Byte vor Beginn der Umladeroutine)
			;(80 Byte vor Beginn des Hauptprogramms)
ANFUML	EQU	0BFD0H  ;Anfangsadresse der Umladeroutine
			;(32 Byte nach Beginn der Transferroutine)
			;(48 Byte vor Beginn des Hauptprogramms)
ANZUML	EQU	   30H  ;Länge der Umladeroutine (konstant)
STUML	EQU	0EC00H  ;Ziel- und Startadresse der Umladeroutine
                        ;(immer gleich)
;
	ASEG
	.PHASE BEGIN
;
	jp	TRANS
TRANS:	ld	hl,ANFUML
	ld	de,STUML
	ld	bc,ANZUML
	ldir
;
	call STUML
;
	end	;
	;

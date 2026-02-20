;****************************************
;ZS-Umschaltung für Z1013-128 an FF D7
;Syntax an M80MS / L80MS angepasst
;Matthias H./MHC "Lötspitze" 21.12.2016
;****************************************
;
	.Z80
;
ZEISA	EQU	0100h
;
	ASEG
	.phase	ZEISA
;
	JP	AUS
;
AUS:	IN	A,(4)
	RES	7,A
	OUT	(4),A
	RET
;
	END
;
;
;
;
;
;----------------------------------------
;EIN:	IN	A,(4)
;	SET	7,A
;	OUT	(4),A
;	RET
;
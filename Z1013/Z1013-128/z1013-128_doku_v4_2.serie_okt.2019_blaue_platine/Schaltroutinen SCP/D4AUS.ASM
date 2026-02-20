;****************************************
;Takt-Umschaltung für Z1013-128 an FF D4
;Syntax an M80MS / L80MS angepasst
;Matthias H./MHC "Lötspitze" 21.12.2016
;****************************************
;
	.Z80
;
TAKT	EQU	0100h
;
	ASEG
	.phase	TAKT
;
	JP	AUS
;
AUS:	IN	A,(4)
	RES	4,A
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
;	SET	4,A
;	OUT	(4),A
;	RET
;
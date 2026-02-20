;****************************************
;Takt-Umschaltung für Z1013-128 an FF D6
;Syntax an M80MS / L80MS angepasst
;Matthias H./MHC "Lötspitze" 23.12.2016
;****************************************
;
	.Z80
;
TAKT	EQU	E7F0h
;
	ASEG
	.phase	TAKT
;
	JP	EIN
;
EIN:	IN	A,(4)
	SET	6,A
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
;AUS:	IN	A,(4)
;	RES	6,A
;	OUT	(4),A
;	RET
;
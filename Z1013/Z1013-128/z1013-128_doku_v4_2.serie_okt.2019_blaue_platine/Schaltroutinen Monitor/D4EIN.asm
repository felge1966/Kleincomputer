;****************************************
;ROM-Abschaltung für Z1013-128 an FF D4
;Syntax an M80MS / L80MS angepasst
;Matthias H./MHC "Lötspitze" 16.02.2017
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
	SET	4,A
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
;	RES	4,A
;	OUT	(4),A
;	RET
;
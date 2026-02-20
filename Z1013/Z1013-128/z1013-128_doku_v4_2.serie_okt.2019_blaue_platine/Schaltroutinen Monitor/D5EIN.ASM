;****************************************
;Eprom-Umschaltung für Z1013-128 an FF D5
;Syntax an M80MS / L80MS angepasst
;Matthias H./MHC "Lötspitze" 11.03.2017
;****************************************
;
	.Z80
;
EPROM	EQU	E7F0h
;
	ASEG
	.phase	EPROM
;
	JP	EIN
;
EIN:	IN	A,(4)
	SET	5,A
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
;	RES	5,A
;	OUT	(4),A
;	RET
;
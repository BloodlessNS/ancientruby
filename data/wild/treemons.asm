TreeMons:
; entries correspond to TREEMON_SET_* constants
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	dw TreeMonSet_City

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
TreeMonSet_Canyon:
; common
	db 50, TAILLOW,    10
	db 15, TAILLOW,    10
	db 15, TAILLOW,    10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1
; rare
	db 50, TAILLOW,    10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1

TreeMonSet_Town:
; common
	db 50, TAILLOW,    10
	db 15, EKANS,      10
	db 15, TAILLOW,    10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1
; rare
	db 50, TAILLOW,    10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1

TreeMonSet_Route:
; common
	db 50, VIGOROTH,   10
	db 15, SPINARAK,   10
	db 15, LEDYBA,     10
	db 10, SEEDOT,  10
	db  5, SEEDOT,  10
	db  5, SEEDOT,  10
	db -1
; rare
	db 50, VIGOROTH,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, SEEDOT,  10
	db  5, SEEDOT,  10
	db  5, SEEDOT,  10
	db -1

TreeMonSet_Kanto:
; common
	db 50, VIGOROTH,   10
	db 15, EKANS,      10
	db 15, VIGOROTH,   10
	db 10, SEEDOT,  10
	db  5, SEEDOT,  10
	db  5, SEEDOT,  10
	db -1
; rare
	db 50, VIGOROTH,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, SEEDOT,  10
	db  5, SEEDOT,  10
	db  5, SEEDOT,  10
	db -1

TreeMonSet_Lake:
; common
	db 50, VIGOROTH,   10
	db 15, VENONAT,    10
	db 15, VIGOROTH,   10
	db 10, SEEDOT,  10
	db  5, SEEDOT,  10
	db  5, SEEDOT,  10
	db -1
; rare
	db 50, VIGOROTH,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, SEEDOT,  10
	db  5, SEEDOT,  10
	db  5, SEEDOT,  10
	db -1

TreeMonSet_Forest:
; common
	db 50, VIGOROTH,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, SLAKING,    10
	db  5, BEAUTIFLY, 10
	db  5, DUSTOX,   10
	db -1
; rare
	db 50, VIGOROTH,   10
	db 15, WURMPLE,   10
	db 15, WEEDLE,     10
	db 10, VIGOROTH,   10
	db  5, SILCOON,    10
	db  5, CASCOON,     10
	db -1

TreeMonSet_Rock:
	db 90, KRABBY,     15
	db 10, SHUCKLE,    15
	db -1

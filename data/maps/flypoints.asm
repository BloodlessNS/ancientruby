flypoint: MACRO
	const FLY_\1
	db \2, SPAWN_\1
ENDM

Flypoints:
; landmark, spawn point
	const_def
; Johto
	flypoint LITTLEROOT,   LITTLEROOT_TOWN
	flypoint OLDALE,       OLDALE_TOWN
	flypoint PETALBURG,    PETALBURG_CITY
	flypoint GOLDENROD,    GOLDENROD_CITY
	flypoint CIANWOOD,     CIANWOOD_CITY
	flypoint MT_SILVER,    SILVER_CAVE

; Kanto
KANTO_FLYPOINT EQU const_value
	flypoint VIRIDIAN,     VIRIDIAN_CITY
	flypoint VERMILION,    VERMILION_CITY
	flypoint ROCK_TUNNEL,  ROCK_TUNNEL
	flypoint LAVENDER,     LAVENDER_TOWN
	flypoint CELADON,      CELADON_CITY
	flypoint SAFFRON,      SAFFRON_CITY
	flypoint FUCHSIA,      FUCHSIA_CITY
	flypoint INDIGO,       INDIGO_PLATEAU
	db -1

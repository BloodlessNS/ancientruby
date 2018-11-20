spawn: MACRO
; map, x, y
	map_id \1
	db \2, \3
ENDM

SpawnPoints:
; entries correspond to SPAWN_* constants

	spawn MOVING_TRUCK,            3,  2
	spawn VIRIDIAN_POKECENTER_1F,      5,  3

	spawn VIRIDIAN_CITY,              23, 26
	spawn VERMILION_CITY,              9,  6
	spawn LAVENDER_TOWN,               5,  6
	spawn SAFFRON_CITY,                9, 30
	spawn CELADON_CITY,               29, 10
	spawn FUCHSIA_CITY,               19, 28
	spawn ROUTE_23,                    9,  6

	spawn LITTLEROOT_TOWN,             5, 10
	spawn OLDALE_TOWN,                 5, 14
	spawn PETALBURG_CITY,             17, 15
	spawn CIANWOOD_CITY,              23, 44
	spawn GOLDENROD_CITY,             15, 28
	spawn SILVER_CAVE_OUTSIDE,        23, 20
	spawn FAST_SHIP_CABINS_SW_SSW_NW,  6,  2
	spawn N_A,                        -1, -1

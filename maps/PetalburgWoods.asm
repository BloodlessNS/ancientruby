	const_def 2 ; object constants

PetalburgWoods_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PetalburgWoods_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  14, 37, ROUTE_104_SOUTH, 1
	warp_event  15, 37, ROUTE_104_SOUTH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

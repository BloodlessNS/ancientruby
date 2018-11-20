	const_def 2 ; object constants

LittlerootTownIntro_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LittlerootTownIntro_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 11, MOVING_TRUCK, 1
	warp_event  5,  9, PLAYERS_HOUSE_1F, 1

	db 0 ; coord events

	db 0 ; bg events
	
	db 0 ; object events
	
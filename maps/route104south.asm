	const_def 2 ; object constants

Route104South_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route104South_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 4, PETALBURG_WOODS, 1
	warp_event  9, 4, PETALBURG_WOODS, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
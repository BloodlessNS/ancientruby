	const_def 2 ; object constants

BrineysCabin_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BrineysCabin_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 7, ROUTE_104_SOUTH, 5
	warp_event  5, 7, ROUTE_104_SOUTH, 5

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

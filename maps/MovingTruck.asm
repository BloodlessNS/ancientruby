	const_def 2 ; object constants
	
MovingTruck_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .InitializeRoom
	
.InitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd initializeevents
	return

.SkipInitialization:
	return


MovingTruck_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 1, LITTLEROOT_TOWN_INTRO, 1
	warp_event  5, 2, LITTLEROOT_TOWN_INTRO, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

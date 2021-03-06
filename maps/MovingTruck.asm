	const_def 2 ; object constants
	
MovingTruck_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene0     ; SCENE_MOVING
	scene_script .DummyScene ; SCENE_NOTHING

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

.Scene0:
	priorityjump .TruckMoving
	setscene SCENE_NOTHING
	end

.DummyScene:
	end
	
.TruckMoving:
	playsound SFX_TRUCK
	earthquake 60
	waitsfx
	pause 20
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $07
	changeblock 4, 0, $08
	reloadmappart
	waitsfx
	end

MovingTruck_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 1, LITTLEROOT_TOWN_INTRO, 1
	warp_event  5, 2, LITTLEROOT_TOWN_INTRO, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

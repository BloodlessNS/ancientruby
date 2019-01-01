	const_def 2 ; object constants
	const LITTLEROOTTOWNINTRO_MOM

LittlerootTownIntro_MapScripts:
	db 1 ; scene scripts
	scene_script .Mom

	db 0 ; callbacks
	
.Mom:
	priorityjump .WalkInToHouse
	end

.WalkInToHouse:
	setscene SCENE_WALK_IN_TO_HOUSE
	return
	
WalkInToHouse:
	appear LITTLEROOTTOWNINTRO_MOM
	applymovement LITTLEROOTTOWNINTRO_MOM, MovementData_Mom
	opentext
	writetext MomText_Intro
	waitbutton
	closetext
	turnobject LITTLEROOTTOWNINTRO_MOM, UP
	applymovement LITTLEROOTTOWNINTRO_MOM, MovementData_Mom2
	disappear LITTLEROOTTOWNINTRO_MOM
	turnobject PLAYER, UP
	applymovement PLAYER, LittleRootTown_WalkInToHouseMovement
	warpcheck
	end
	
MomText_Intro:
	text "MOM: We're here,"
	line "honey!"
	
	para "It must be tiring"
	line "riding with our"
	cont "things in the"
	cont "moving truck."
	
	para "Well, this is"
	line "LITTLEROOT TOWN."
	
	para "How do you like"
	line "it?"
	
	para "This is our new"
	line "home!"
	
	para "It has a quaint"
	line "feel, but it seems"
	cont "to be an easy"
	cont "place to live,"
	cont "don't you think?"
	
	para "And, you get your"
	line "own room, <PLAY_G>!"
	
	para "Let's go inside."
	done
	
MovementData_Mom:
	slow_step DOWN
	slow_step RIGHT
	slow_step DOWN
	turn_head LEFT
	step_end
	
MovementData_Mom2:
	slow_step UP
	slow_step LEFT
	slow_step UP
	step_end
	
LittleRootTown_WalkInToHouseMovement:
	step UP
	step UP
	step_end

LittlerootTownIntro_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 11, MOVING_TRUCK, 1
	warp_event  5,  9, PLAYERS_HOUSE_1F, 1

	db 1 ; coord events
	coord_event  5, 11, SCENE_WALK_IN_TO_HOUSE, WalkInToHouse

	db 0 ; bg events
	
	db 1 ; object events
	object_event  5,  9, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WalkInToHouse, EVENT_BIRCH_ATTACK
	
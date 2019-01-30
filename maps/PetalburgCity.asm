	const_def 2 ; object constants
	const PETALBURGCITY_GENTLEMAN
	const PETALBURGCITY_TEACHER
	const PETALBURGCITY_WALLY
	const PETALBURGCITY_COOLTAINER_M

PetalburgCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_PETALBURG
	return
	
StoppedByNPC:
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue .End
	showemote EMOTE_SHOCK, PETALBURGCITY_WALLY, 15
	applymovement PETALBURGCITY_WALLY, MovementData_StoppedByNPC
	opentext
	writetext PetalburgCityText_StoppedByNPC
	waitbutton
	closetext
	applymovement PETALBURGCITY_WALLY, MovementData_StoppedByNPC8
	follow PETALBURGCITY_WALLY, PLAYER
	applymovement PETALBURGCITY_WALLY, MovementData_StoppedByNPC2
	stopfollow
	turnobject PLAYER, UP
	opentext
	writetext PetalburgCityText_StoppedByNPC2
	waitbutton
	turnobject PETALBURGCITY_WALLY, RIGHT
	turnobject PLAYER, RIGHT
	writetext PetalburgCityText_StoppedByNPC3
	waitbutton
	closetext
	applymovement PETALBURGCITY_WALLY, MovementData_StoppedByNPC3
	disappear PETALBURGCITY_WALLY
	moveobject PETALBURGCITY_WALLY, 4, 10
	appear PETALBURGCITY_WALLY
.End
	end
	
StoppedByNPC2:
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue .End2
	showemote EMOTE_SHOCK, PETALBURGCITY_WALLY, 15
	applymovement PETALBURGCITY_WALLY, MovementData_StoppedByNPC4
	opentext
	writetext PetalburgCityText_StoppedByNPC
	waitbutton
	closetext
	applymovement PETALBURGCITY_WALLY, MovementData_StoppedByNPC9
	follow PETALBURGCITY_WALLY, PLAYER
	applymovement PETALBURGCITY_WALLY, MovementData_StoppedByNPC5
	stopfollow
	turnobject PLAYER, UP
	opentext
	writetext PetalburgCityText_StoppedByNPC2
	waitbutton
	turnobject PETALBURGCITY_WALLY, RIGHT
	turnobject PLAYER, RIGHT
	writetext PetalburgCityText_StoppedByNPC3
	waitbutton
	closetext
	applymovement PETALBURGCITY_WALLY, MovementData_StoppedByNPC3
	disappear PETALBURGCITY_WALLY
	moveobject PETALBURGCITY_WALLY, 4, 10
	appear PETALBURGCITY_WALLY
.End2
	end
	
StoppedByNPC3:
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue .End3
	showemote EMOTE_SHOCK, PETALBURGCITY_WALLY, 15
	applymovement PETALBURGCITY_WALLY, MovementData_StoppedByNPC6
	opentext
	writetext PetalburgCityText_StoppedByNPC
	waitbutton
	closetext
	applymovement PETALBURGCITY_WALLY, MovementData_StoppedByNPC10
	follow PETALBURGCITY_WALLY, PLAYER
	applymovement PETALBURGCITY_WALLY, MovementData_StoppedByNPC7
	stopfollow
	turnobject PLAYER, UP
	opentext
	writetext PetalburgCityText_StoppedByNPC2
	waitbutton
	turnobject PETALBURGCITY_WALLY, RIGHT
	turnobject PLAYER, RIGHT
	writetext PetalburgCityText_StoppedByNPC3
	waitbutton
	closetext
	applymovement PETALBURGCITY_WALLY, MovementData_StoppedByNPC3
	disappear PETALBURGCITY_WALLY
	moveobject PETALBURGCITY_WALLY, 4, 10
	appear PETALBURGCITY_WALLY
.End3
	end
	
PetalburgCityGentlemanScript:
	jumptextfaceplayer PetalburgCityGentlemanText
	
WallyGoneScript:
	jumptextfaceplayer WallyGoneText
	
WallyAlphaEndScript:
	jumptextfaceplayer PetalburgCityText_StoppedByNPC
	
PetalburgCityCooltrainerMScript:
	jumptextfaceplayer CooltrainerMText
	
PetalburgCitySign:
	jumptext PetalburgCitySignText

PetalburgGymSign:
	jumptext PetalburgGymSignText
	
WallysHouseSign:
	jumptext WallysHouseSignText
	
PetalburgCitySignText:
	text "PETALBURG CITY"

	para "“Where people"
	line "mingle with"
	cont "nature.”"
	done
	
PetalburgGymSignText:
	text "PETALBURG CITY"
	line "#MON GYM"
	cont "LEADER: NORMAN"

	para "A man in pursuit"
	line "of power!"
	done
	
WallysHouseSignText:
	text "WALLY'S HOUSE"
	done

PetalburgCityGentlemanText:
	text "Let's say you have"
	line "six #MON. If"
	cont "you catch another…"
	
	para "It is"
	line "automatically sent"
	cont "to a STORAGE BOX"
	cont "over a PC"
	cont "connection."
	done
	
WallyGoneText:
	text "Where has our"
	line "WALLY gone?"
	
	para "We have to leave"
	line "for VERDANTURF"
	cont "TOWN very soon…"
	done
	
CooltrainerMText:
	text "My face is"
	line "reflected in the"
	cont "water."
	
	para "It's a shining"
	line "grin full of hope…"
	
	para "Or it could be a"
	line "somber look of"
	cont "silence struggling"
	cont "with fear…"
	
	para "What do you see"
	line "reflected in your"
	cont "face?"
	done
	
PetalburgCityText_StoppedByNPC:
	text "Hiya! Are you"
	line "maybe…"
	
	para "A rookie TRAINER?"
	
	para "Do you know what"
	line "#MON TRAINERS"
	cont "do when they reach"
	cont "a new town?"
	
	para "They first check"
	line "what type of GYM"
	cont "is in the town."
	done
	
PetalburgCityText_StoppedByNPC2:
	text "See? This is"
	line "PETALBURG CITY's"
	cont "GYM."
	done
	
PetalburgCityText_StoppedByNPC3:
	text "This is the GYM's"
	line "sign. Look for it"
	cont "whenever you're"
	cont "looking for a GYM."
	done
	
MovementData_StoppedByNPC:
	step UP
	step RIGHT
	step RIGHT
	step_end
	
MovementData_StoppedByNPC2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end
	
MovementData_StoppedByNPC4:
	step RIGHT
	step RIGHT
	step_end
	
MovementData_StoppedByNPC5:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	turn_head UP
	step_end
	
MovementData_StoppedByNPC6:
	step DOWN
	step RIGHT
	step RIGHT
	step_end
	
MovementData_StoppedByNPC7:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step RIGHT
	turn_head UP
	step_end
	
MovementData_StoppedByNPC3:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
MovementData_StoppedByNPC8:
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step_end
	
MovementData_StoppedByNPC9:
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step_end
	
MovementData_StoppedByNPC10:
	step UP
	step RIGHT
	step RIGHT
	step DOWN
	step_end
	
PetalburgHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_PETALBURG_HIDDEN_RARE_CANDY
	
PetalburgCityMaxRevive:
	itemball MAX_REVIVE
	
PetalburgCityEther:
	itemball ETHER

PetalburgCity_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  19, 21, PETALBURG_HOUSE_1, 1
	warp_event  9, 17, PETALBURG_HOUSE_2, 1
	warp_event  17, 15, PETALBURG_POKECENTER_1F, 2
	warp_event  23, 11, PETALBURG_MART, 1
	warp_event  13, 7, PETALBURG_GYM, 1
	warp_event  5, 5, WALLYS_HOUSE, 1
	
	db 3 ; coord events
	coord_event  7, 9, SCENE_DEFAULT, StoppedByNPC
	coord_event  7, 10, SCENE_DEFAULT, StoppedByNPC2
	coord_event  7, 11, SCENE_DEFAULT, StoppedByNPC3

	db 4 ; bg events
	bg_event  14,  15, BGEVENT_READ, PetalburgCitySign
	bg_event  15,  9, BGEVENT_READ, PetalburgGymSign
	bg_event  7,  8, BGEVENT_READ, WallysHouseSign
	bg_event  9,  25, BGEVENT_ITEM, PetalburgHiddenRareCandy

	db 6 ; object events
	object_event 20,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PetalburgCityGentlemanScript, -1
	object_event 14,  16, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WallyGoneScript, EVENT_DUDE_TALKED_TO_YOU
	object_event 4,  10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WallyAlphaEndScript, -1	
	object_event 7,  19, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PetalburgCityCooltrainerMScript, -1
	object_event  18,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgCityMaxRevive, EVENT_PETALBURG_MAX_REVIVE
	object_event  2,  24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgCityEther, EVENT_PETALBURG_ETHER

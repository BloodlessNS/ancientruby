	const_def 2 ; object constants
	const LITTLEROOTTOWN_YOUNGSTER
	const LITTLEROOTTOWN_FISHER
	const LITTLEROOTTOWN_COOLTRAINER_M
	const LITTLEROOTTOWN_YOUNGSTER2

LittlerootTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_NEWMAP, .SetSpawn

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_LITTLEROOT
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return
	
.SetSpawn:
	return
	
LittlerootTown_YoungsterStopsYouScene1:
	checkevent EVENT_MET_RIVAL
	iftrue .End
	turnobject LITTLEROOTTOWN_YOUNGSTER, RIGHT
	applymovement LITTLEROOTTOWN_YOUNGSTER, Movement_YoungsterRunsToYou1_NBT
	turnobject PLAYER, DOWN
	opentext
	writetext Text_TallMon
	waitbutton
	closetext
	follow LITTLEROOTTOWN_YOUNGSTER, PLAYER
	applymovement LITTLEROOTTOWN_YOUNGSTER, Movement_YoungsterBringsYouBack1_NBT
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
.End
	end

LittlerootTown_YoungsterStopsYouScene2:
	checkevent EVENT_MET_RIVAL
	iftrue LittlerootTown_YoungsterStopsYouScene3
	turnobject LITTLEROOTTOWN_YOUNGSTER, RIGHT
	applymovement LITTLEROOTTOWN_YOUNGSTER, Movement_YoungsterRunsToYou2_NBT
	turnobject PLAYER, DOWN
	opentext
	writetext Text_TallMon
	waitbutton
	closetext
	follow LITTLEROOTTOWN_YOUNGSTER, PLAYER
	applymovement LITTLEROOTTOWN_YOUNGSTER, Movement_YoungsterBringsYouBack2_NBT
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
.End2
	end
	
LittlerootTown_YoungsterStopsYouScene3:
	checkevent EVENT_MET_RIVAL
	iffalse .Done
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .Done
	turnobject PLAYER, LEFT
	opentext
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_ELM
	special LoadUsedSpritesGFX
	writetext Text_BirchAttack
	waitbutton
	closetext
.Done
	end
	
LittlerootTownYoungsterScript:
	faceplayer
	opentext
	writetext Text_TallMon
	waitbutton
	closetext
	end
	
LittlerootTownYoungsterScript2:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .AfterAttack
	writetext Text_BirchAttack
	waitbutton
	closetext
	end

.AfterAttack:
	writetext Text_AfterAttack
	waitbutton
	closetext
	end
	
LittlerootTownFisherScript:
	jumptextfaceplayer Text_StoreItemsTip
	
LittlerootTownCooltrainerMScript:
	jumptextfaceplayer Text_BusyProfBirch
	
LittlerootTownSign:
	jumptext LittlerootTownSignText

LittlerootTownPlayersHouseSign:
	jumptext LittlerootTownPlayersHouseSignText

LittlerootTownBirchsLabSign:
	jumptext LittlerootTownBirchsLabSignText

LittlerootTownBirchsHouseSign:
	jumptext LittlerootTownBirchsHouseSignText
	
Movement_YoungsterRunsToYou1_NBT:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

Movement_YoungsterRunsToYou2_NBT:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

Movement_YoungsterBringsYouBack1_NBT:
	step LEFT
	step LEFT
	turn_head RIGHT
	step_end

Movement_YoungsterBringsYouBack2_NBT:
	step LEFT
	step LEFT
	step LEFT
	turn_head RIGHT
	step_end
	
Text_TallMon:
	text "If you go in the"
	line "tall grass at the"
	cont "sides of this"
	cont "road, wild #MON"
	cont "will appear."
	done

Text_ItsDangerousToGoAlone:
	text "It's not safe to"
	line "go out there if"
	cont "you dont have any"
	cont "#MON with you."
	done

Text_AfterAttack:
	text "Boy, am I glad you"
	line "went and rescued"
	cont "the PROFESSOR."
	done

Text_BirchAttack:
	text "I can hear someone"
	line "shouting down the"
	cont "road here."

	para "What should I do?"
	line "What should we do?"
	
	para "Somebody has to go"
	line "help…"
	done
	
Text_StoreItemsTip:
	text "If you use a PC,"
	line "you can store"
	cont "items and #MON."

	para "The power of"
	line "science is"
	cont "staggering!"
	done
	
Text_BusyProfBirch:
	text "PROF. BIRCH spends"
	line "days in his LAB"
	cont "studying, then"
	cont "he'll suddenly go"
	cont "out in the wild"
	cont "to do more"
	cont "research…"

	para "When does he spend"
	line "time at home?"
	done
	
LittlerootTownSignText:
	text "LITTLEROOT TOWN"

	para "“A town that can't"
	line "be shaded any"
	cont "any hue.”"
	done

LittlerootTownPlayersHouseSignText:
	text "<PLAYER>'s HOUSE"
	done

LittlerootTownBirchsLabSignText:
	text "PROF. BIRCH's"
	line "#MON LAB"
	done

LittlerootTownBirchsHouseSignText:
	text "PROF. BIRCH'S"
	line "HOUSE"
	done

LittlerootTown_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 8, MOVING_TRUCK, 1
	warp_event  8,  13, ELMS_LAB, 1
	warp_event  5,  7, PLAYERS_HOUSE_1F, 1
	warp_event  13, 7, RIVALS_HOUSE, 1

	db 4 ; coord events
	coord_event  10,  1, SCENE_DEFAULT, LittlerootTown_YoungsterStopsYouScene1
	coord_event  11,  1, SCENE_DEFAULT, LittlerootTown_YoungsterStopsYouScene2
	coord_event  10,  1, SCENE_FINISHED, LittlerootTown_YoungsterStopsYouScene1
	coord_event  11,  1, SCENE_FINISHED, LittlerootTown_YoungsterStopsYouScene2

	db 4 ; bg events
	bg_event  15,  11, BGEVENT_READ, LittlerootTownSign
	bg_event  8,  7,   BGEVENT_READ, LittlerootTownPlayersHouseSign
	bg_event  7,  14,  BGEVENT_READ, LittlerootTownBirchsLabSign
	bg_event  11,  7,   BGEVENT_READ, LittlerootTownBirchsHouseSign
	
	db 5 ; object events
	object_event  8,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LittlerootTownYoungsterScript, EVENT_MET_RIVAL
	object_event 11,  11, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LittlerootTownFisherScript, -1
	object_event 14,  14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LittlerootTownCooltrainerMScript, -1
	object_event 10,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LittlerootTownYoungsterScript2, EVENT_BIRCH_ATTACK
	object_event 15,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LittlerootTownYoungsterScript2, EVENT_AFTER_ATTACK
	
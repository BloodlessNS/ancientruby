	const_def 2 ; object constants
	const LITTLEROOTTOWN_YOUNGSTER
	const LITTLEROOTTOWN_FISHER
	const LITTLEROOTTOWN_COOLTRAINER_M

LittlerootTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_LITTLEROOT
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return
	
LittlerootTown_YoungsterStopsYouScene1:
	playmusic MUSIC_MOM
	turnobject LITTLEROOTTOWN_YOUNGSTER, RIGHT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement LITTLEROOTTOWN_YOUNGSTER, Movement_YoungsterRunsToYou1_NBT
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow LITTLEROOTTOWN_YOUNGSTER, PLAYER
	applymovement LITTLEROOTTOWN_YOUNGSTER, Movement_YoungsterBringsYouBack1_NBT
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

LittlerootTown_YoungsterStopsYouScene2:
	playmusic MUSIC_MOM
	turnobject LITTLEROOTTOWN_YOUNGSTER, RIGHT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement LITTLEROOTTOWN_YOUNGSTER, Movement_YoungsterRunsToYou2_NBT
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow LITTLEROOTTOWN_YOUNGSTER, PLAYER
	applymovement LITTLEROOTTOWN_YOUNGSTER, Movement_YoungsterBringsYouBack2_NBT
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

LittlerootTownYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .CallMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .TellMomYoureLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

.TellMomYoureLeaving:
	writetext Text_TellMomIfLeaving
	waitbutton
	closetext
	end

.CallMom:
	writetext Text_CallMomOnGear
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
	step DOWN
	step_end

Movement_YoungsterBringsYouBack2_NBT:
	step DOWN
	step_end
	
Text_GearIsImpressive:
	text "Wow, your #GEAR"
	line "is impressive!"

	para "Did your mom get"
	line "it for you?"
	done

Text_WaitPlayer:
	text "Wait, <PLAY_G>!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "What do you think"
	line "you're doing?"
	done

Text_ItsDangerousToGoAlone:
	text "It's dangerous to"
	line "go out without a"
	cont "#MON!"

	para "Wild #MON"
	line "jump out of the"

	para "grass on the way"
	line "to the next town."
	done

Text_YourMonIsAdorable:
	text "Oh! Your #MON"
	line "is adorable!"
	cont "I wish I had one!"
	done

Text_TellMomIfLeaving:
	text "Hi, <PLAY_G>!"
	line "Leaving again?"

	para "You should tell"
	line "your mom if you"
	cont "are leaving."
	done

Text_CallMomOnGear:
	text "Call your mom on"
	line "your #GEAR to"

	para "let her know how"
	line "you're doing."
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
	text "PROF.BIRCH spends"
	line "days in his LAB"
	cont "studying, then"
	cont "he'll suddenly go"
	cont "out in the wild"
	cont "to do more"
	cont "research..."

	para "When does he spend"
	line "time at home?"
	done
	
LittlerootTownSignText:
	text "LITTLEROOT TOWN"

	para "A town that can't"
	line "be shaded any"
	cont "any hue."
	done

LittlerootTownPlayersHouseSignText:
	text "<PLAYER>'s House"
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
	warp_event  4, 10, MOVING_TRUCK, 1
	warp_event  8,  15, ELMS_LAB, 1
	warp_event  5,  9, PLAYERS_HOUSE_1F, 1
	warp_event  13, 9, ELMS_HOUSE, 1

	db 2 ; coord events
	coord_event  10,  3, SCENE_DEFAULT, LittlerootTown_YoungsterStopsYouScene1
	coord_event  11,  3, SCENE_DEFAULT, LittlerootTown_YoungsterStopsYouScene2

	db 4 ; bg events
	bg_event  15,  13, BGEVENT_READ, LittlerootTownSign
	bg_event  8,  9,   BGEVENT_READ, LittlerootTownPlayersHouseSign
	bg_event  7,  16,  BGEVENT_READ, LittlerootTownBirchsLabSign
	bg_event  11,  9,   BGEVENT_READ, LittlerootTownBirchsHouseSign
	
	db 3 ; object events
	object_event  8,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LittlerootTownYoungsterScript, -1
	object_event 11,  13, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LittlerootTownFisherScript, -1
	object_event 14,  16, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, -1, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LittlerootTownCooltrainerMScript, -1	
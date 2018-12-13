	const_def 2 ; object constants
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4

PlayersHouse1F_MapScripts:
	db 3 ; scene scripts
	scene_script .mom
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks
	
.mom:
	priorityjump MeetMomLeftScript
	end

.DummyScene0:
	end

.DummyScene1:
	end

MomScript2:
	jumptext MomScript2Text

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	jump MeetMomScript

MeetMomScript:
	turnobject PLAYER, RIGHT
	opentext
	writetext UnknownText_0x7a604
	buttonsound
	stringtotext GearName, MEM_BUFFER_1
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_FINISHED
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext UnknownText_0x7a6bd
	buttonsound
	special SetDayOfWeek
.SetDayOfWeek:
	writetext UnknownText_0x7a742
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	jump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext UnknownText_0x7a763
	waitbutton
	closetext
	jump .Finish

.Finish:
	special RestartMapMusic
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	jump MeetMomScript

GearName:
	db "#GEAR@"

PlayersHouse1FReceiveItemStd:
	jumpstd receiveitem
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_DEFAULT
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext UnknownText_0x7a8b5
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext UnknownText_0x7a8e5
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext UnknownText_0x7a957
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

.MornScript:
	writetext NeighborMornIntroText
	buttonsound
	jump .Main

.DayScript:
	writetext NeighborDayIntroText
	buttonsound
	jump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	buttonsound
	jump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	end

TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

UnknownText_0x7a604:
	text "See, <PLAYER>?"
	line "Isn't it nice"
	cont "here, too?"

	para "The mover's"
	line "#MON do all the"
	cont "of moving us in"
	cont "and cleaning up"
	cont "after."

	para "This is so"
	line "convenient!"

	para "Oh! I almost for-"
	line "got! Your #MON"

	para "GEAR is back from"
	line "the repair shop."

	para "Here you go!"
	done

UnknownText_0x7a6bd:
	text "#MON GEAR, or"
	line "just #GEAR."

	para "It's essential if"
	line "you want to be a"
	cont "good trainer."

	para "Oh, the day of the"
	line "week isn't set."

	para "You mustn't forget"
	line "that!"
	done

UnknownText_0x7a742:
	text "Is it Daylight"
	line "Saving Time now?"
	done

UnknownText_0x7a763:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."
	
	para "<PLAYER>, your"
	line "room is upstairs."
	
	para "Go check it out,"
	line "dear!"
	done

UnknownText_0x7a8b5:
	text "See you, honey!"
	done

UnknownText_0x7a8e5:
	text "So, what was PROF."
	line "ELM's errand?"

	para "…"

	para "That does sound"
	line "challenging."

	para "But, you should be"
	line "proud that people"
	cont "rely on you."
	done

UnknownText_0x7a957:
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
	done

NeighborMornIntroText:
	text "Good morning,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborDayIntroText:
	text "Hello, <PLAY_G>!"
	line "I'm visiting!"
	done

NeighborNiteIntroText:
	text "Good evening,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborText:
	text "<PLAY_G>, have you"
	line "heard?"

	para "My daughter is"
	line "adamant about"

	para "becoming PROF."
	line "ELM's assistant."

	para "She really loves"
	line "#MON!"
	done

StoveText:
	text "Mom's specialty!"

	para "CINNABAR VOLCANO"
	line "BURGER!"
	done

SinkText:
	text "The sink is spot-"
	line "less. Mom likes it"
	cont "clean."
	done

FridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done

TVText:
	text "There's a movie on"
	line "TV: Stars dot the"

	para "sky as two boys"
	line "ride on a train…"

	para "I'd better get"
	line "rolling too!"
	done
	
MomScript2Text:
	text "See, <PLAYER>?"
	line "Isn't it nice in"
	cont "here, too?"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, LITTLEROOT_TOWN, 3
	warp_event  7,  7, LITTLEROOT_TOWN, 3
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	db 2 ; coord events
	coord_event  7,  7, SCENE_DEFAULT, MeetMomLeftScript
	coord_event  7,  7, SCENE_DEFAULT, MeetMomRightScript

	db 4 ; bg events
	bg_event  2,  1, BGEVENT_READ, StoveScript
	bg_event  1,  1, BGEVENT_READ, SinkScript
	bg_event  0,  1, BGEVENT_READ, FridgeScript
	bg_event  4,  3, BGEVENT_READ, TVScript

	db 4 ; object events
	object_event  7,  7, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript2, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  2,  5, SPRITE_MOM, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2

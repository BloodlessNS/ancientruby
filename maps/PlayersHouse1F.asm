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
	jump MeetMomScript

MeetMomScript:
	turnobject PLAYER, RIGHT
	opentext
	writetext MomText_MoversMon
	buttonsound
	stringtotext GearName, MEM_BUFFER_1
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_FINISHED
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_3
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
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	writetext MomText_RoomsUpstairs
	waitbutton
	closetext
	applymovement PLAYER, SetClockMovement
	jump .Finish
	
.Female:
	writetext MomText_RoomsUpstairs
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_CHRIS
	special LoadUsedSpritesGFX
	waitbutton
	closetext
	applymovement PLAYER, SetClockMovement
	jump .Finish

.Finish:
	special RestartMapMusic
	end

MeetMomTalkedScript:
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
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext UnknownText_0x7a8b5
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext MomText_Tired
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext MomText_TakeCare
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext UnknownText_0x7a957
	waitbutton
	closetext
	end

.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end
	
MachokeScript:
	jumptext MachokeText

TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText
	
DadOnTv:
	checkevent EVENT_DAD_ON_TV
	iffalse .continued
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	setevent EVENT_PLAYERS_HOUSE_MOM_3
	opentext
	writetext DadOnTVText
	waitbutton
	closetext
	applymovement PLAYER, WalkToHouseTvMovement
	turnobject PLAYERSHOUSE1F_MOM3, RIGHT
	opentext
	writetext DadOnTVText2
	waitbutton
	closetext
	playmusic MUSIC_MOM
	follow PLAYERSHOUSE1F_MOM3, PLAYER
	applymovement PLAYERSHOUSE1F_MOM3, WalkToHouseTvMovement2
	stopfollow
	turnobject PLAYER, UP
	opentext
	writetext DadOnTVText3
	waitbutton
	turnobject PLAYER, LEFT
	special FadeOutMusic
	special RestartMapMusic
	writetext DadOnTVText4
	waitbutton
	closetext
	clearevent EVENT_DAD_ON_TV
.continued
	end

SetClockScript:
	checkevent EVENT_CLOCK_SET
	iftrue .Done
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	opentext
	writetext MomText_GoSetClock
	waitbutton
	closetext
	applymovement PLAYER, SetClockMovement
.Done
	end
	
WalkToHouseTvMovement:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
WalkToHouseTvMovement2:
	step LEFT
	turn_head RIGHT
	turn_head RIGHT
	step_end
	
SetClockMovement:
	step UP
	step_end
	
DadOnTVText:
	text "MOM: Oh! <PLAYER>,"
	line "<PLAYER>! Quick!"
	cont "Come quickly!"
	done
	
DadOnTVText2:
	text "MOM: Look! It's"
	line "PETALBURG GYM!"
	
	para "Maybe DAD will be"
	line "on!"
	done
	
DadOnTVText3:
	text "INTERVIEWER: …We"
	line "brought you this"
	cont "report from in"
	cont "front of PETALBURG"
	cont "GYM."
	done
	
DadOnTVText4:
	text "Oh… It's over."
	
	para "I think DAD was"
	line "on, but we missed"
	cont "him. Too bad."
	
	para "Oh, yes. One of"
	line "DAD's friends"
	cont "lives in town."
	
	para "PROF. BIRCH is his"
	line "name."
	
	para "He lives right"
	line "next door, so you"
	cont "should go over and"
	cont "introduce"
	cont "yourself."
	done

MomText_MoversMon:
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

MomText_RoomsUpstairs:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."
	
	para "<PLAYER>, your"
	line "room is upstairs."
	
	para "Go check it out,"
	line "dear!"
	
	para "DAD bought you a"
	line "new clock to mark"
	cont "our move here."
	
	para "Don't forget to"
	line "set it!"
	done
	
MomText_GoSetClock:
	text "MOM: <PLAYER>."
	
	para "Go set the clock"
	line "in your room,"
	cont "honey."
	done

UnknownText_0x7a8b5:
	text "See you, honey!"
	done

MomText_Tired:
	text "Mom: How are you"
	line "doing, <PLAYER>?"

	para "You look a little"
	line "tired."

	para "I think you should"
	line "rest a bit."
	done
	
MomText_TakeCare:
	text "MOM: Take care,"
	line "honey!"
	done

UnknownText_0x7a957:
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
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

MachokeText
	text "Gyao, gyoa gyaoh…"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, LITTLEROOT_TOWN, 3
	warp_event  7,  7, LITTLEROOT_TOWN, 3
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	db 5 ; coord events
	coord_event  7,  7, SCENE_DEFAULT, MeetMomLeftScript
	coord_event  7,  7, SCENE_DEFAULT, MeetMomRightScript
	coord_event  9,  1, SCENE_FINISHED, DadOnTv
	coord_event  6,  7, SCENE_FINISHED, SetClockScript
	coord_event  7,  7, SCENE_FINISHED, SetClockScript

	db 4 ; bg events
	bg_event  2,  1, BGEVENT_READ, StoveScript
	bg_event  1,  1, BGEVENT_READ, SinkScript
	bg_event  0,  1, BGEVENT_READ, FridgeScript
	bg_event  4,  3, BGEVENT_READ, TVScript

	db 5 ; object events
	object_event  7,  7, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript2, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  5, SPRITE_MOM, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_3
	object_event  1,  2, SPRITE_MACHOKE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MachokeScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  4,  4, SPRITE_MACHOKE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MachokeScript, EVENT_PLAYERS_HOUSE_MOM_1

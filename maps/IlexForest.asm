	const_def 2 ; object constants
	const ILEXFOREST_SLAKOTH
	const ILEXFOREST_YOUNGSTER1
	const ILEXFOREST_BLACK_BELT
	const ILEXFOREST_ROCKER
	const ILEXFOREST_POKE_BALL1
	const ILEXFOREST_KURT
	const ILEXFOREST_LASS
	const ILEXFOREST_YOUNGSTER2
	const ILEXFOREST_POKE_BALL2
	const ILEXFOREST_POKE_BALL3
	const ILEXFOREST_POKE_BALL4

IlexForest_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .FarfetchdCallback

.FarfetchdCallback:
	checkevent EVENT_GOT_HM01_CUT
	iftrue .Static
	copybytetovar wSlakothPosition
	ifequal  1, .PositionOne
	ifequal  2, .PositionTwo
	ifequal  3, .PositionThree
	ifequal  4, .PositionFour
	ifequal  5, .PositionFive
	ifequal  6, .PositionSix
	ifequal  7, .PositionSeven
	ifequal  8, .PositionEight
	ifequal  9, .PositionNine
	ifequal 10, .PositionTen
.Static:
	return

.PositionOne:
	moveobject ILEXFOREST_SLAKOTH, 14, 31
	appear ILEXFOREST_SLAKOTH
	return

.PositionTwo:
	moveobject ILEXFOREST_SLAKOTH, 15, 25
	appear ILEXFOREST_SLAKOTH
	return

.PositionThree:
	moveobject ILEXFOREST_SLAKOTH, 20, 24
	appear ILEXFOREST_SLAKOTH
	return

.PositionFour:
	moveobject ILEXFOREST_SLAKOTH, 29, 22
	appear ILEXFOREST_SLAKOTH
	return

.PositionFive:
	moveobject ILEXFOREST_SLAKOTH, 28, 31
	appear ILEXFOREST_SLAKOTH
	return

.PositionSix:
	moveobject ILEXFOREST_SLAKOTH, 24, 35
	appear ILEXFOREST_SLAKOTH
	return

.PositionSeven:
	moveobject ILEXFOREST_SLAKOTH, 22, 31
	appear ILEXFOREST_SLAKOTH
	return

.PositionEight:
	moveobject ILEXFOREST_SLAKOTH, 15, 29
	appear ILEXFOREST_SLAKOTH
	return

.PositionNine:
	moveobject ILEXFOREST_SLAKOTH, 10, 35
	appear ILEXFOREST_SLAKOTH
	return

.PositionTen:
	moveobject ILEXFOREST_SLAKOTH, 6, 28
	appear ILEXFOREST_SLAKOTH
	return

IlexForestCharcoalApprenticeScript:
	faceplayer
	opentext
	writetext UnknownText_0x6ef5c
	waitbutton
	closetext
	end

.DoneFarfetchd:
	writetext UnknownText_0x6f019
	waitbutton
	closetext
	end

IlexForestFarfetchdScript:
	copybytetovar wSlakothPosition
	ifequal  1, .Position1
	ifequal  2, .Position2
	ifequal  3, .Position3
	ifequal  4, .Position4
	ifequal  5, .Position5
	ifequal  6, .Position6
	ifequal  7, .Position7
	ifequal  8, .Position8
	ifequal  9, .Position9
	ifequal 10, .Position10

.Position1:
	faceplayer
	opentext
	writetext Text_ItsTheMissingPokemon
	buttonsound
	writetext Text_Kwaaaa
	cry SLAKOTH
	waitbutton
	closetext
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetchd_Pos1_Pos2
	moveobject ILEXFOREST_SLAKOTH, 15, 25
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 2
	end

.Position2:
	scall .CryAndCheckFacing
	ifequal DOWN, .Position2_Down
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetchd_Pos2_Pos3
	moveobject ILEXFOREST_SLAKOTH, 20, 24
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 3
	end

.Position2_Down:
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetchd_Pos2_Pos8
	moveobject ILEXFOREST_SLAKOTH, 15, 29
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 8
	end

.Position3:
	scall .CryAndCheckFacing
	ifequal LEFT, .Position3_Left
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetchd_Pos3_Pos4
	moveobject ILEXFOREST_SLAKOTH, 29, 22
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 4
	end

.Position3_Left:
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetchd_Pos3_Pos2
	moveobject ILEXFOREST_SLAKOTH, 15, 25
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 2
	end

.Position4:
	scall .CryAndCheckFacing
	ifequal UP, .Position4_Up
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetchd_Pos4_Pos5
	moveobject ILEXFOREST_SLAKOTH, 28, 31
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 5
	end

.Position4_Up:
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetchd_Pos4_Pos3
	moveobject ILEXFOREST_SLAKOTH, 20, 24
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 3
	end

.Position5:
	scall .CryAndCheckFacing
	ifequal UP, .Position5_Up
	ifequal LEFT, .Position5_Left
	ifequal RIGHT, .Position5_Right
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetchd_Pos5_Pos6
	moveobject ILEXFOREST_SLAKOTH, 24, 35
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 6
	end

.Position5_Left:
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetchd_Pos5_Pos7
	moveobject ILEXFOREST_SLAKOTH, 22, 31
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 7
	end

.Position5_Up:
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetched_Pos5_Pos4_Up
	moveobject ILEXFOREST_SLAKOTH, 29, 22
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 4
	end

.Position5_Right:
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetched_Pos5_Pos4_Right
	moveobject ILEXFOREST_SLAKOTH, 29, 22
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 4
	end

.Position6:
	scall .CryAndCheckFacing
	ifequal RIGHT, .Position6_Right
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetched_Pos6_Pos7
	moveobject ILEXFOREST_SLAKOTH, 22, 31
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 7
	end

.Position6_Right:
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetched_Pos6_Pos5
	moveobject ILEXFOREST_SLAKOTH, 28, 31
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 5
	end

.Position7:
	scall .CryAndCheckFacing
	ifequal DOWN, .Position7_Down
	ifequal LEFT, .Position7_Left
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetched_Pos7_Pos8
	moveobject ILEXFOREST_SLAKOTH, 15, 29
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 8
	end

.Position7_Left:
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetched_Pos7_Pos6
	moveobject ILEXFOREST_SLAKOTH, 24, 35
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 6
	end

.Position7_Down:
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetched_Pos7_Pos5
	moveobject ILEXFOREST_SLAKOTH, 28, 31
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 5
	end

.Position8:
	scall .CryAndCheckFacing
	ifequal UP, .Position8_Up
	ifequal LEFT, .Position8_Left
	ifequal RIGHT, .Position8_Right
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetched_Pos8_Pos9
	moveobject ILEXFOREST_SLAKOTH, 10, 35
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 9
	end

.Position8_Right:
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetched_Pos8_Pos7
	moveobject ILEXFOREST_SLAKOTH, 22, 31
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 7
	end

.Position8_Up:
.Position8_Left:
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetched_Pos8_Pos2
	moveobject ILEXFOREST_SLAKOTH, 15, 25
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 2
	end

.Position9:
	scall .CryAndCheckFacing
	ifequal DOWN, .Position9_Down
	ifequal RIGHT, .Position9_Right
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetched_Pos9_Pos10
	moveobject ILEXFOREST_SLAKOTH, 6, 28
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 10
	appear ILEXFOREST_BLACK_BELT
	setevent EVENT_CHARCOAL_KILN_BOSS
	end

.Position9_Right:
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetched_Pos9_Pos8_Right
	moveobject ILEXFOREST_SLAKOTH, 15, 29
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 8
	end

.Position9_Down:
	applymovement ILEXFOREST_SLAKOTH, MovementData_Farfetched_Pos9_Pos8_Down
	moveobject ILEXFOREST_SLAKOTH, 15, 29
	disappear ILEXFOREST_SLAKOTH
	appear ILEXFOREST_SLAKOTH
	loadvar wSlakothPosition, 8
	end

.Position10:
	faceplayer
	opentext
	writetext Text_Kwaaaa
	cry SLAKOTH
	waitbutton
	closetext
	end

.CryAndCheckFacing:
	faceplayer
	opentext
	writetext Text_Kwaaaa
	cry SLAKOTH
	waitbutton
	closetext
	checkcode VAR_FACING
	end

IlexForestCharcoalMasterScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .AlreadyGotCut
	writetext Text_CharcoalMasterIntro
	buttonsound
	verbosegiveitem HM_CUT
	setevent EVENT_GOT_HM01_CUT
	writetext Text_CharcoalMasterOutro
	waitbutton
	closetext
	setevent EVENT_ILEX_FOREST_SLAKOTH
	setevent EVENT_ILEX_FOREST_APPRENTICE
	setevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
	clearevent EVENT_CHARCOAL_KILN_SLAKOTH
	clearevent EVENT_CHARCOAL_KILN_APPRENTICE
	clearevent EVENT_CHARCOAL_KILN_BOSS
	end

.AlreadyGotCut:
	writetext Text_CharcoalMasterTalkAfter
	waitbutton
	closetext
	end

IlexForestHeadbuttGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue .AlreadyGotHeadbutt
	writetext Text_HeadbuttIntro
	buttonsound
	verbosegiveitem TM_HEADBUTT
	iffalse .BagFull
	setevent EVENT_GOT_TM02_HEADBUTT
.AlreadyGotHeadbutt:
	writetext Text_HeadbuttOutro
	waitbutton
.BagFull:
	closetext
	end

TrainerBugCatcherWayne:
	trainer BUG_CATCHER, WAYNE, EVENT_BEAT_BUG_CATCHER_WAYNE, BugCatcherWayneSeenText, BugCatcherWayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherWayneAfterBattleText
	waitbutton
	closetext
	end

IlexForestLassScript:
	jumptextfaceplayer Text_IlexForestLass

IlexForestRevive:
	itemball REVIVE

IlexForestXAttack:
	itemball X_ATTACK

IlexForestAntidote:
	itemball ANTIDOTE

IlexForestEther:
	itemball ETHER

IlexForestHiddenEther:
	hiddenitem ETHER, EVENT_ILEX_FOREST_HIDDEN_ETHER

IlexForestHiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ILEX_FOREST_HIDDEN_SUPER_POTION

IlexForestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ILEX_FOREST_HIDDEN_FULL_HEAL

IlexForestBoulder:
; unused
	jumpstd strengthboulder

IlexForestSignpost:
	jumptext IlexForestSignpostText

IlexForestShrineScript:
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .ForestIsRestless
	jump .DontDoCelebiEvent

.ForestIsRestless:
	checkitem GS_BALL
	iftrue .AskCelebiEvent
.DontDoCelebiEvent:
	jumptext Text_IlexForestShrine

.AskCelebiEvent:
	opentext
	writetext Text_ShrineCelebiEvent
	yesorno
	iftrue .CelebiEvent
	closetext
	end

.CelebiEvent:
	takeitem GS_BALL
	clearevent EVENT_FOREST_IS_RESTLESS
	setevent EVENT_AZALEA_TOWN_KURT
	disappear ILEXFOREST_LASS
	clearevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	writetext Text_InsertGSBall
	waitbutton
	closetext
	pause 20
	showemote EMOTE_SHOCK, PLAYER, 20
	special FadeOutMusic
	applymovement PLAYER, MovementData_0x6ef58
	pause 30
	turnobject PLAYER, DOWN
	pause 20
	clearflag ENGINE_FOREST_IS_RESTLESS
	special CelebiShrineEvent
	loadwildmon CELEBI, 30
	startbattle
	reloadmapafterbattle
	pause 20
	special CheckCaughtCelebi
	iffalse .DidntCatchCelebi
	appear ILEXFOREST_KURT
	applymovement ILEXFOREST_KURT, MovementData_0x6ef4e
	opentext
	writetext Text_KurtCaughtCelebi
	waitbutton
	closetext
	applymovement ILEXFOREST_KURT, MovementData_0x6ef53
	disappear ILEXFOREST_KURT
.DidntCatchCelebi:
	end

MovementData_Farfetchd_Pos1_Pos2:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetchd_Pos2_Pos3:
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos2_Pos8:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos3_Pos4:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetchd_Pos3_Pos2:
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetchd_Pos4_Pos5:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos4_Pos3:
	big_step LEFT
	jump_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetchd_Pos5_Pos6:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetchd_Pos5_Pos7:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetched_Pos5_Pos4_Up:
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	step_end

MovementData_Farfetched_Pos5_Pos4_Right:
	big_step RIGHT
	turn_head UP
	step_sleep 1
	turn_head DOWN
	step_sleep 1
	turn_head UP
	step_sleep 1
	big_step DOWN
	big_step DOWN
	fix_facing
	jump_step UP
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos6_Pos7:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos6_Pos5:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos7_Pos8:
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetched_Pos7_Pos6:
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetched_Pos7_Pos5:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetched_Pos8_Pos9:
	big_step DOWN
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetched_Pos8_Pos7:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetched_Pos8_Pos2:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos9_Pos10:
	big_step LEFT
	big_step LEFT
	fix_facing
	jump_step RIGHT
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos9_Pos8_Right:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos9_Pos8_Down:
	big_step LEFT
	big_step LEFT
	fix_facing
	jump_step RIGHT
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_0x6ef4e:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x6ef53:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x6ef58:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

UnknownText_0x6ef5c:
	text "Oh, man… My boss"
	line "is going to be"
	cont "steaming…"

	para "The FARFETCH'D"
	line "that CUTS trees"

	para "for charcoal took"
	line "off on me."

	para "I can't go looking"
	line "for it here in the"
	cont "ILEX FOREST."

	para "It's too big, dark"
	line "and scary for me…"
	done

UnknownText_0x6f019:
	text "Wow! Thanks a"
	line "whole bunch!"

	para "My boss's #MON"
	line "won't obey me be-"
	cont "cause I don't have"
	cont "a BADGE."
	done

Text_ItsTheMissingPokemon:
	text "It's the missing"
	line "#MON!"
	done

Text_Kwaaaa:
	text "FARFETCH'D: Kwaa!"
	done

Text_CharcoalMasterIntro:
	text "Ah! My FARFETCH'D!"

	para "You found it for"
	line "us, kid?"

	para "Without it, we"
	line "wouldn't be able"

	para "to CUT trees for"
	line "charcoal."

	para "Thanks, kid!"

	para "Now, how can I"
	line "thank you…"

	para "I know! Here, take"
	line "this."
	done

Text_CharcoalMasterOutro:
	text "That's the CUT HM."
	line "Teach that to a"

	para "#MON to clear"
	line "small trees."

	para "Of course, you"
	line "have to have the"

	para "GYM BADGE from"
	line "AZALEA to use it."
	done

Text_CharcoalMasterTalkAfter:
	text "Do you want to"
	line "apprentice as a"

	para "charcoal maker"
	line "with me?"

	para "You'll be first-"
	line "rate in ten years!"
	done

Text_HeadbuttIntro:
	text "What am I doing?"

	para "I'm shaking trees"
	line "using HEADBUTT."

	para "It's fun. Here,"
	line "you try it too!"
	done

Text_HeadbuttOutro:
	text "Rattle trees with"
	line "HEADBUTT. Some-"
	cont "times, sleeping"
	cont "#MON fall out."
	done

Text_IlexForestLass:
	text "Did something"
	line "happen to the"
	cont "forest's guardian?"
	done

IlexForestSignpostText:
	text "ILEX FOREST is"
	line "so overgrown with"

	para "trees that you"
	line "can't see the sky."

	para "Please watch out"
	line "for items that may"
	cont "have been dropped."
	done

Text_IlexForestShrine:
	text "ILEX FOREST"
	line "SHRINE…"

	para "It's in honor of"
	line "the forest's"
	cont "protector…"
	done

Text_ShrineCelebiEvent:
	text "ILEX FOREST"
	line "SHRINE…"

	para "It's in honor of"
	line "the forest's"
	cont "protector…"

	para "Oh? What is this?"

	para "It's a hole."
	line "It looks like the"

	para "GS BALL would fit"
	line "inside it."

	para "Want to put the GS"
	line "BALL here?"
	done

Text_InsertGSBall:
	text "<PLAYER> put in the"
	line "GS BALL."
	done

Text_KurtCaughtCelebi:
	text "Whew, wasn't that"
	line "something!"

	para "<PLAYER>, that was"
	line "fantastic. Thanks!"

	para "The legends about"
	line "that SHRINE were"
	cont "real after all."

	para "I feel inspired by"
	line "what I just saw."

	para "It motivates me to"
	line "make better BALLS!"

	para "I'm going!"
	done

BugCatcherWayneSeenText:
	text "Don't sneak up on"
	line "me like that!"

	para "You frightened a"
	line "#MON away!"
	done

BugCatcherWayneBeatenText:
	text "I hadn't seen that"
	line "#MON before…"
	done

BugCatcherWayneAfterBattleText:
	text "A #MON I've"
	line "never seen before"

	para "fell out of the"
	line "tree when I used"
	cont "HEADBUTT."

	para "I ought to use"
	line "HEADBUTT in other"
	cont "places too."
	done

IlexForest_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  1,  5, ROUTE_34_ILEX_FOREST_GATE, 3
	warp_event  3, 42, ILEX_FOREST_AZALEA_GATE, 1
	warp_event  3, 43, ILEX_FOREST_AZALEA_GATE, 2

	db 0 ; coord events

	db 5 ; bg events
	bg_event  3, 17, BGEVENT_READ, IlexForestSignpost
	bg_event 11,  7, BGEVENT_ITEM, IlexForestHiddenEther
	bg_event 22, 14, BGEVENT_ITEM, IlexForestHiddenSuperPotion
	bg_event  1, 17, BGEVENT_ITEM, IlexForestHiddenFullHeal
	bg_event  8, 22, BGEVENT_UP, IlexForestShrineScript

	db 11 ; object events
	object_event 14, 31, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, IlexForestFarfetchdScript, EVENT_ILEX_FOREST_SLAKOTH
	object_event  7, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestCharcoalApprenticeScript, EVENT_ILEX_FOREST_APPRENTICE
	object_event  5, 28, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestCharcoalMasterScript, EVENT_ILEX_FOREST_CHARCOAL_MASTER
	object_event 15, 14, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestHeadbuttGuyScript, -1
	object_event 20, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestRevive, EVENT_ILEX_FOREST_REVIVE
	object_event  8, 29, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_KURT
	object_event  3, 24, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestLassScript, EVENT_ILEX_FOREST_LASS
	object_event 12,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerBugCatcherWayne, -1
	object_event  9, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestXAttack, EVENT_ILEX_FOREST_X_ATTACK
	object_event 17,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestAntidote, EVENT_ILEX_FOREST_ANTIDOTE
	object_event 27,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestEther, EVENT_ILEX_FOREST_ETHER

	const_def 2 ; object constants
	const ROUTE103_FISHER
	const ROUTE103_RIVAL

Route103_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route103RivalScript:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	special FadeOutMusic
	pause 15
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext Route103RivalText_Seen
	waitbutton
	showemote EMOTE_SHOCK, ROUTE103_RIVAL, 15
	faceplayer
	writetext Route103RivalText_Seen2
	waitbutton
	closetext
	checkevent EVENT_GOT_MUDKIP_FROM_ELM
	iftrue .Mudkip
	checkevent EVENT_GOT_TREECKO_FROM_ELM
	iftrue .Treecko
	winlosstext Route103RivalWinText, Route103RivalLossText
	setlasttalked ROUTE103_RIVAL
	loadtrainer RIVAL1, RIVAL1_1_MUDKIP
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Mudkip:
	winlosstext Route103RivalWinText, Route103RivalLossText
	setlasttalked ROUTE103_RIVAL
	loadtrainer RIVAL1, RIVAL1_1_TREECKO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Treecko:
	winlosstext Route103RivalWinText, Route103RivalLossText
	setlasttalked ROUTE103_RIVAL
	loadtrainer RIVAL1, RIVAL1_1_TORCHIC
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle
	
.Female
	special FadeOutMusic
	pause 15
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route103RivalText_MaleSeen
	waitbutton
	showemote EMOTE_SHOCK, ROUTE103_RIVAL, 15
	faceplayer
	writetext Route103RivalText_MaleSeen2
	waitbutton
	closetext
	checkevent EVENT_GOT_MUDKIP_FROM_ELM
	iftrue .FemaleMudkip
	checkevent EVENT_GOT_TREECKO_FROM_ELM
	iftrue .FemaleTreecko
	winlosstext Route103RivalMaleWinText, Route103RivalMaleLossText
	setlasttalked ROUTE103_RIVAL
	loadtrainer RIVAL2, RIVAL1_1_MUDKIP
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattleFemale

.FemaleMudkip:
	winlosstext Route103RivalMaleWinText, Route103RivalMaleLossText
	setlasttalked ROUTE103_RIVAL
	loadtrainer RIVAL2, RIVAL1_1_TREECKO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattleFemale

.FemaleTreecko:
	winlosstext Route103RivalMaleWinText, Route103RivalMaleLossText
	setlasttalked ROUTE103_RIVAL
	loadtrainer RIVAL2, RIVAL1_1_TORCHIC
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattleFemale

.FinishBattle
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext Route103RivalText_YouWon
	waitbutton
	closetext
	checkcode VAR_YCOORD
	ifgreater 2, BelowRival
	applymovement ROUTE103_RIVAL, Route103_RivalExits
	disappear ROUTE103_RIVAL
	setevent EVENT_RIVAL_ROUTE_103
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
	setmapscene OLDALE_TOWN, SCENE_OLDALETOWN_STOPPED_BY_RIVAL
	clearevent EVENT_COP_IN_ELMS_LAB
	clearevent EVENT_RIVAL_OLDALE_TOWN
	special HealParty
	playmapmusic
	end
	
.FinishBattleFemale
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route103RivalText_MaleYouWon
	waitbutton
	closetext
	checkcode VAR_YCOORD
	ifgreater 2, BelowRival
	applymovement ROUTE103_RIVAL, Route103_RivalExits
	disappear ROUTE103_RIVAL
	setevent EVENT_RIVAL_ROUTE_103
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
	setmapscene OLDALE_TOWN, SCENE_OLDALETOWN_STOPPED_BY_RIVAL
	clearevent EVENT_COP_IN_ELMS_LAB
	clearevent EVENT_RIVAL_OLDALE_TOWN
	special HealParty
	playmapmusic
	end
	
BelowRival:
	applymovement ROUTE103_RIVAL, Route103_RivalExits2
	disappear ROUTE103_RIVAL
	setevent EVENT_RIVAL_ROUTE_103
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
	setmapscene OLDALE_TOWN, SCENE_OLDALETOWN_STOPPED_BY_RIVAL
	clearevent EVENT_COP_IN_ELMS_LAB
	clearevent EVENT_RIVAL_OLDALE_TOWN
	special HealParty
	playmapmusic
	end
	
Route103FisherScript:
	jumptextfaceplayer Route103FisherText
	
Route103Sign1:
	jumptext Route103Sign1Text

Route103_RivalExits:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	jump_step DOWN
	step DOWN
	step_end
	
Route103_RivalExits2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	jump_step DOWN
	step DOWN
	step_end
	
Route103FisherText:
	text "My #MON is"
	line "staggeringly"
	cont "tired…"
	
	para "I should have"
	line "brought a potion…"
	done
	
Route103Sign1Text:
	text "ROUTE 103"
	line "↓ OLDALE TOWN"
	done
	
Route103RivalText_Seen:
	text "<RIVAL>: Let's see…"
	line "The #MON on"
	cont "ROUTE 103 include…"
	done
	
Route103RivalText_MaleSeen:
	text "<RIVAL>: Okay, so"
	line "it's this one and"
	cont "that one that live"
	cont "on ROUTE 103…"
	done
	
Route103RivalText_Seen2:
	text "Oh, hi, <PLAYER>!"

	para "…Oh, I see, my dad"
	line "gave you a #MON"
	cont "as a gift."

	para "Since we're here,"
	line "let's have a quick"
	cont "battle!"

	para "I'll give you a"
	line "taste of what"
	cont "being a TRAINER"
	cont "is like."
	done
	
Route103RivalText_MaleSeen2:
	text "Hey, it's <PLAYER>!"

	para "…Oh, yeah, Dad"
	line "gave you a"
	cont "#MON."

	para "Since we're here,"
	line "how about a little"
	cont "battle?"

	para "I'll teach you"
	line "what being a"
	cont "TRAINER's all"
	cont "about!"
	done

Route103RivalWinText:
	text "Wow! That's great!"
	line "<PLAYER>, you're"
	cont "pretty good!"
	done
	
Route103RivalMaleWinText:
	text "Huh, <PLAYER>,"
	line "you're not too"
	cont "shabby."
	done

Route103RivalLossText:
	text "Wow! That's great!"
	line "<PLAYER>, you're"
	cont "pretty good!"
	done
	
Route103RivalMaleLossText:
	text "Huh, <PLAYER>,"
	line "you're not too"
	cont "shabby."
	done

Route103RivalText_YouWon:
	text "<RIVAL>: I think I"
	line "know why my dad"
	cont "has an eye out for"
	cont "you now."

	para "I mean, you just"
	line "got that #MON"
	cont "but it already"
	cont "likes you."

	para "You might be able"
	line "to befriend any"
	cont "kind of #MON"
	cont "easily."
	
	para "Well, it's time to"
	line "head back to the"
	cont "LAB."
	done
	
Route103RivalText_MaleYouWon:
	text "<RIVAL>: I think I"
	line "get. I think I"
	cont "know why my dad"
	cont "has his eye out"
	cont "for you now."

	para "Look, your #MON"
	line "already likes you,"
	cont "even though you"
	cont "just got it."

	para "<PLAYER>, I get the"
	line "feeling you could"
	cont "befriend any kind"
	cont "of #MON with"
	cont "ease."
	
	para "We should head"
	line "back to the LAB."
	done
	
Route103_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11,  10, BGEVENT_READ, Route103Sign1

	db 2 ; object events
	object_event 18,  8, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, -1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route103FisherScript, -1
	object_event 10,  2, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route103RivalScript, EVENT_RIVAL_ROUTE_103
	
	const_def 2 ; object constants
	const RIVALSROOM_RIVAL

RivalsRoom_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Callback

.Callback:
	checkevent EVENT_MET_RIVAL
	iftrue .RivalMet
	return
	
.RivalMet:
	disappear RIVALSROOM_RIVAL
	return
	
RivalScript_MeetRival:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .RivalScript_MeetRivalFemale
	opentext
	writetext MeetRivalText1
	showemote EMOTE_SHOCK, RIVALSROOM_RIVAL, 15
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	writetext MeetRivalText2
	waitbutton
	closetext
	checkcode VAR_YCOORD
	ifgreater 2, UnderRival
	applymovement RIVALSROOM_RIVAL, MovementData_Rival
	disappear RIVALSROOM_RIVAL
	special FadeOutMusic
	special RestartMapMusic
	setevent EVENT_MET_RIVAL
	clearevent EVENT_BIRCH_ATTACK
	end
	
.RivalScript_MeetRivalFemale:
	opentext
	writetext MeetMaleRivalText1
	showemote EMOTE_SHOCK, RIVALSROOM_RIVAL, 15
	playmusic MUSIC_RIVAL_AFTER
	faceplayer
	writetext MeetMaleRivalText2
	waitbutton
	closetext
	checkcode VAR_YCOORD
	ifgreater 2, UnderRival
	applymovement RIVALSROOM_RIVAL, MovementData_Rival
	disappear RIVALSROOM_RIVAL
	special FadeOutMusic
	special RestartMapMusic
	setevent EVENT_MET_RIVAL
	clearevent EVENT_BIRCH_ATTACK
	end
	
UnderRival:
	applymovement RIVALSROOM_RIVAL, MovementData_Rival2
	disappear RIVALSROOM_RIVAL
	special FadeOutMusic
	special RestartMapMusic
	setevent EVENT_MET_RIVAL
	clearevent EVENT_BIRCH_ATTACK
	end
	
MovementData_Rival:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step_end
	
MovementData_Rival2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end	
	
RivalsEmail:
	jumptext RivalsEmailText
	
RivalsNotebook:
	jumptext RivalsNotebookText
	
RivalsGamecube:
	jumptext RivalsGamecubeText
	
RivalsEmailText:
	text "There's an e-mail"
	line "from #MON"
	cont "TRAINER SCHOOL."
	
	para "… … …"
	
	para "A #MON may"
	line "learn up to four"
	cont "moves."
	
	para "A TRAINER's"
	line "expertise is"
	cont "tested on the move"
	cont "sets chosen for"
	cont "#MON."
	
	para "… … … …"
	done
	
RivalsNotebookText:
	text "<PLAYER>"
	line "flipped open the"
	cont "notebook."
	
	para "ADVENTURE RULE"
	line "NO. 1"
	
	para "Open the MENU"
	line "with START."
	
	para "ADVENTURE RULE"
	line "NO. 2"
	
	para "Record your"
	line "progress with"
	cont "SAVE."
	
	para "The remaining"
	line "pages are blank…"
	done
	
RivalsGamecubeText:
	text "It's a Nintendo"
	line "GameCube."

	para "A Gameboy Advance"
	line "is connected to"
	cont "serve as the"
	cont "controller."
	done
	
MeetRivalText1:
	text "#MON fully"
	line "restored!"
	
	para "Items ready, and…"
	line "Huh?"
	done
	
MeetMaleRivalText1:
	text "#MON fully"
	line "restored…"
	
	para "Items all packed,"
	line "and…"
	done
	
MeetRivalText2:
	text "Who… Who are you?"
	
	para "… … … … … … …"
	line "… … … … … … …"
	
	para "Oh, You're"
	line "<PLAYER>. So your"
	cont "move was today."
	
	para "Um… I'm <RIVAL>."
	line "Glad to meet you!"
	
	para "I…"
	line "I have this dream"
	cont "of becoming"
	cont "friends with"
	cont "#MON all over"
	cont "the world."
	
	para "I… I heard about"
	line "you, <PLAYER>, from"
	cont "my dad, PROF."
	cont "BIRCH."
	
	para "I was hoping that"
	line "you would be nice,"
	cont "<PLAYER>, and that"
	cont "we could be"
	cont "friends."
	
	para "Oh, this is silly,"
	line "isn't it?"
	
	para "I… I've just met"
	line "you, <PLAYER>."
	
	para "Eheheh…"
	
	para "Oh, no! I forgot!"
	
	para "I was supposed to"
	line "go help Dad catch"
	cont "some wild #MON!"
	
	para "<PLAYER>, I'll"
	line "catch you later!"
	done
	
MeetMaleRivalText2:
	text "Hey!"
	line "You…"
	
	para "Who are you?"
	
	para "Oh, you're"
	line "<PLAYER>, aren't"
	cont "you?"
	
	para "Moved in next"
	line "door, right?"
	
	para "I didn't know that"
	line "you're a girl."
	
	para "Dad, PROF. BIRCH,"
	line "said that our new"
	cont "next-door neighbor"
	cont "is a GYM LEADER's"
	cont "kid, so I assumed"
	cont "you'd be a guy."
	
	para "My name's <RIVAL>."
	line "So, hi, neighbor!"
	
	para "Huh? Hey, <PLAYER>,"
	line "don't you have a"
	cont "#MON?"
	
	para "Do you want me to"
	line "go cacth you one?"
	
	para "Aw, darn, I"
	line "forgot…"
	
	para "I'm supposed to go"
	line "help my dad catch"
	cont "some wild #MON."
	
	para "Some other time,"
	line "okay?"
	done

RivalsRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  0, 0, RIVALS_HOUSE, 3
	
	db 0 ; coord events

	db 3 ; bg events
	bg_event  7,  1, BGEVENT_READ, RivalsEmail
	bg_event  6,  1, BGEVENT_READ, RivalsNotebook
	bg_event  4,  1, BGEVENT_READ, RivalsGamecube

	db 1 ; object events
	object_event  6,  2, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RivalScript_MeetRival, EVENT_MET_RIVAL
	
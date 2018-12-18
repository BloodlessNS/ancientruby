	const_def 2 ; object constants
	const RIVALS_MOM

RivalsHouse_MapScripts:
	db 2 ; scene scripts
	scene_script .rivalsmom
	scene_script .DummyScene0 ; SCENE_DEFAULT

	db 0 ; callbacks
	
.rivalsmom
	priorityjump RivalsMomScript
	end
	
.DummyScene0:
	end
	
RivalsMomScript:
	showemote EMOTE_SHOCK, RIVALS_MOM, 15
	applymovement RIVALS_MOM, MovementData_RivalsMom
	turnobject PLAYER, RIGHT
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .RivalsMomFemale
	opentext
	writetext TestRivalsMomTextMale
	waitbutton
	special NameRival
	writetext RivalsMomText3
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end
.RivalsMomFemale:
	opentext
	writetext TestRivalsMomTextFemale
	waitbutton
	special NameRival
	writetext RivalsMomText3
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end
	
MovementData_RivalsMom:
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	step_end

RivalsMom:
	checkevent EVENT_MET_RIVAL
	iffalse .upstairs
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	jumptextfaceplayer RivalsMomText
	
.upstairs
	jumptextfaceplayer RivalsMomText3
	
.GotAPokemon
	jumptextfaceplayer RivalsMomText2

RivalsHousePC:
	jumptext RivalsHousePCText

RivalsHouseBookshelf:
	jumpstd difficultbookshelf
	
TestRivalsMomTextMale:
	text "Oh, hello. And you"
	line "are?"
	
	para "… … … … … … … …"
	line "… … … … … … … …"
	
	para "Oh, you're"
	line "<PLAY_G>, our new"
	cont "next door"
	cont "neighbor! Hi!"
	
	para "We have a daughter"
	line "about the same age"
	cont "age as you."
	
	para "Our daughter was"
	line "was excited about"
	cont "making a new"
	cont "friend."
	done
	
TestRivalsMomTextFemale:
	text "Oh, hello. And you"
	line "are?"
	
	para "… … … … … … … …"
	line "… … … … … … … …"
	
	para "Oh, you're"
	line "<PLAY_G>, our new"
	cont "next door"
	cont "neighbor! Hi!"
	
	para "We have a son"
	line "about the same age"
	cont "age as you."
	
	para "Our son was"
	line "was excited about"
	cont "making a new"
	cont "friend."
	done

RivalsMomText:
	text "Where has my"
	line "husband gone?"

	para "Just when <PLAYER>"
	line "is visiting, too…"

	para "That man can never"
	line "sit still for"
	cont "long…"

	para "He might be at his"
	line "LAB."
	done
	
RivalsMomText2:
	text "Oh, <RIVAL> has"
	line "gone out"
	cont "somewhere."
	
	para "Like father, like"
	line "child."
	
	para "<RIVAL> can't stay"
	line "quietly at home."
	done
	
RivalsMomText3:
	text "<RIVAL>'s"
	line "upstairs, I think."
	done

RivalsHousePCText:
	text "#MON. Where do"
	line "they come from? "

	para "Where are they"
	line "going?"

	para "Why has no one"
	line "ever witnessed a"
	cont "#MON's birth?"

	para "I want to know! I"
	line "will dedicate my"

	para "life to the study"
	line "of #MON!"

	para "…"

	para "It's a part of"
	line "PROF.ELM's re-"
	cont "search papers."
	done

RivalsHouse_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, LITTLEROOT_TOWN, 4
	warp_event  3,  7, LITTLEROOT_TOWN, 4
	warp_event  0,  0, RIVALS_ROOM, 1
	
	db 1 ; coord events
	coord_event  2,  7, SCENE_DEFAULT, RivalsMomScript

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, RivalsHousePC
	bg_event  6,  1, BGEVENT_READ, RivalsHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, RivalsHouseBookshelf

	db 1 ; object events
	object_event  7,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RivalsMom, -1

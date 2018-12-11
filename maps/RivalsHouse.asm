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
	applymovement RIVALS_MOM, MovementData_RivalsMom
	turnobject PLAYER, RIGHT
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .RivalsMomFemale
	opentext
	writetext TestRivalsMomTextMale
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end
.RivalsMomFemale:
	opentext
	writetext TestRivalsMomTextFemale
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
	jumptextfaceplayer RivalsMomText

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
	
	para "Our daughter is"
	line "upstairs, I think."
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
	
	para "Our son is"
	line "upstairs, I think."
	done

RivalsMomText:
	text "Hi, <PLAY_G>! My"
	line "husband's always"

	para "so busy--I hope"
	line "he's OK."

	para "When he's caught"
	line "up in his #MON"

	para "research, he even"
	line "forgets to eat."
	done

RivalsHouseLabFoodText:
; unused
	text "There's some food"
	line "here. It must be"
	cont "for the LAB."
	done

RivalsHousePokemonFoodText:
; unused
	text "There's some food"
	line "here. This must be"
	cont "for #MON."
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

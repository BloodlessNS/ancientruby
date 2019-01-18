	const_def 2 ; object constants
	const PETALBURGGYM_WALLY
	const PETALBURGGYM_NORMAN
	const PETALBURGGYM_WALLY2

PetalburgGym_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene1 ; SCENE_PETALBURGGYM_NOTHING
	scene_script .CatchTutorialFinish ; SCENE_PETALBURGGYM_CATCH_TUTORIAL

	db 0 ; callbacks
	
.DummyScene1:
	end
	
.CatchTutorialFinish:
	priorityjump PetalburgGymCatchTutorialFinish
	end
	
PetalburgGymCatchTutorialFinish:
	turnobject PLAYER, UP
	opentext
	writetext PetalburgGymText_NormanTextCaughtPoke
	waitbutton
	writetext PetalburgGymText_WallyTextCaughtPoke
	waitbutton
	closetext
	applymovement PETALBURGGYM_WALLY2, Movement_PetalburgGymWally2
	disappear PETALBURGGYM_WALLY2
	opentext
	writetext PetalburgGymText_NormanTextCaughtPoke2
	waitbutton
	closetext
	setscene SCENE_PETALBURGGYM_NOTHING
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	setevent EVENT_DUDE_TALKED_TO_YOU
	setevent EVENT_COP_IN_ELMS_LAB
	
PetalburgGymWallyScript:
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue MortyScript
	disappear PETALBURGGYM_WALLY
	opentext
	writetext PetalburgGymText_NormanText
	waitbutton
	closetext
	moveobject PETALBURGGYM_WALLY, 3, 7
	appear PETALBURGGYM_WALLY
	applymovement PETALBURGGYM_WALLY, Movement_PetalburgGymWally
	turnobject PETALBURGGYM_NORMAN, RIGHT
	turnobject PLAYER, RIGHT
	opentext
	writetext PetalburgGymText_WallyText
	waitbutton
	turnobject PETALBURGGYM_NORMAN, DOWN
	turnobject PLAYER, UP
	writetext PetalburgGymText_NormanText2
	waitbutton
	turnobject PETALBURGGYM_NORMAN, RIGHT
	writetext PetalburgGymText_NormanText3
	waitbutton
	turnobject PETALBURGGYM_NORMAN, DOWN
	turnobject PETALBURGGYM_WALLY, DOWN
	writetext PetalburgGymText_WallyText2
	waitbutton
	closetext
	setmapscene ROUTE_102, SCENE_ROUTE102_CATCH_TUTORIAL
	warp ROUTE_102, 4, 5
	end
	
MortyScript:
	jumptextfaceplayer PetalburgGymText_NormanTextAfter
	
PetalburgGymText_NormanText:
	text "DAD: Hm?"
	
	para "Well, if it isn't"
	line "<PLAYER>!"
	
	para "So you're all"
	line "finished moving"
	cont "in?"
	
	para "I'm surprised that"
	line "you managed to get"
	cont "here by yourself."
	
	para "Oh, I see. You're"
	line "with a #MON."
	
	para "Hm… Then I guess"
	line "you're going to"
	cont "become a trainer"
	cont "like me, <PLAYER>."
	
	para "That's great news!"
	line "I'll be looking"
	cont "forward to it!"
	done
	
PetalburgGymText_WallyText:
	text "Um… I… I'd like to"
	line "get a #MON,"
	cont "please…"
	
	para "DAD: Hm, you're…"
	line "Uh… Oh, right."
	
	para "You're WALLY," 
	line "right?"
	
	para "WALLY: I'm going"
	line "to stay with my"
	cont "relatives in"
	cont "VERDANTURF TOWN."
	
	para "I thought I would"
	line "be lonely by"
	cont "myself, so I"
	cont "wanted to take a"
	cont "#MON along."
	
	para "But I've never"
	line "caught a #MON"
	cont "before. I don't"
	cont "know how…"
	
	para "DAD: Hm, I see."
	done
	
PetalburgGymText_NormanText2:
	text "DAD: <PLAYER>, you"
	line "heard that right?"
	
	para "Go with WALLY and"
	line "make sure he"
	cont "safely catches a"
	cont "#MON."
	done
	
PetalburgGymText_NormanText3:
	text "Hm, I'll give you"
	line "a #BALL, too."
	
	para "Go for it!"
	done
	
PetalburgGymText_WallyText2:
	text "WALLY: <PLAYER>…"
	line "Would you really"
	cont "come with me?"
	done
	
PetalburgGymText_NormanTextCaughtPoke:
	text "DAD: So, did it"
	line "work out?"
	done

PetalburgGymText_WallyTextCaughtPoke:
	text "WALLY: Thank you,"
	line "yes, it did."
	
	para "<PLAYER>, thank you"
	line "for coming along"
	cont "with me."
	
	para "You two are why I"
	line "was able to catch"
	cont "my #MON."
	
	para "I promise I'll"
	line "take really good"
	cont "care of it."
	
	para "Oh! My mom's"
	line "waiting for me so"
	cont "I have to go!"
	
	para "Bye, <PLAYER>!"
	done
	
PetalburgGymText_NormanTextCaughtPoke2:
	text "DAD: Now…"
	
	para "<PLAYER>, if you"
	line "want to become a"
	cont "strong TRAINER,"
	cont "here's my advice."
	
	para "Head for RUSTBORO"
	line "CITY beyond this"
	cont "town."
	
	para "There, you should"
	line "challenge the GYM"
	cont "LEADER, ROXANNE."
	
	para "After her, go on"
	line "to other #MON"
	cont "GYMS and defeat"
	cont "their LEADERS."
	
	para "Collect BADGES"
	line "from them,"
	cont "understood?"
	
	para "Of course, I'm a"
	line "GYM LEADER, too."
	
	para "We'll battle one"
	line "day, <PLAYER>."
	
	para "But that's only"
	line "after you become"
	cont "stronger, <PLAYER>."
	done
	
PetalburgGymText_NormanTextAfter:
	text "DAD: Hm? Aren't"
	line "you going to the"
	cont "#MON GYM in"
	cont "RUSTBORO CITY?"
	
	para "There's no"
	line "challenge for me"
	cont "to battle a"
	cont "greenhorn TRAINER."
	
	para "<PLAYER>, I want"
	line "you to challenge"
	cont "when you become a"
	cont "lot stronger."
	
	para "I'll battle you,"
	line "<PLAYER>, when you"
	cont "can show me four"
	cont "GYM BADGES, okay?"
	done
	
Movement_PetalburgGymWally:
	slow_step UP
	step UP
	step RIGHT
	slow_step UP
	step UP
	turn_head LEFT
	step_end
	
Movement_PetalburgGymWally2:
	step DOWN
	step DOWN
	step DOWN
	step_end

PetalburgGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 7, PETALBURG_CITY, 5
	warp_event  4, 7, PETALBURG_CITY, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 2,  14, SPRITE_WALLY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PetalburgGymWallyScript, EVENT_LEARNED_TO_CATCH_POKEMON
	object_event 3,  3, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PetalburgGymWallyScript, EVENT_BEAT_MORTY
	object_event 4,  4, SPRITE_WALLY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PetalburgGymWallyScript, EVENT_DUDE_TALKED_TO_YOU

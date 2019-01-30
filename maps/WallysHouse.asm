	const_def 2 ; object constants

WallysHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
WallysHouseDadScript:
	jumptextfaceplayer WallyHouseDadText
	end

WallysHouseMomScript:
	jumptextfaceplayer WallyHouseMomText
	end
	
WallyHouseDadText:
	text "You're…"
	line "Ah, you must be" 
	cont "<PLAYER>, right?"
	
	para "Thank you for" 
	line "playing with WALLY"
	cont "little while" 
	cont "ago."
	
	para "He's been frail"
	line "and sickly ever"
	cont "since he was a"
	cont "baby."
	
	para "We've sent him to" 
	line "stay with my"
	cont "relatives in"
	cont "VERDANTURF TOWN"
	cont "for a while."
	
	para "The air is a lot" 
	line "cleaner there than"
	cont "it is here."
	
	para "What's that?"
	line "Where's WALLY?"
	
	para "He's already left,"
	line "our WALLY."
	
	para "I wonder where he"
	line "could have gotten"
	cont "by now?"
	done

WallyHouseMomText:
	text "WALLY was really"
	line "happy when he told"
	cont "us that he caught"
	cont "a POKéMON."
	
	para "It's been ages"
	line "since I've seen"
	cont "him smile like"
	cont "that."
	done

WallysHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 7, PETALBURG_CITY, 6
	warp_event  3, 7, PETALBURG_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WallysHouseDadScript, -1
	object_event  6,  5, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WallysHouseMomScript, -1

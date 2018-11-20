	const_def 2 ; object constants

PetalburgHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PetalburgHouse1TeacherScript:
	jumptextfaceplayer PetalburgHouse1TeacherText
	
PetalburgHouse1ScientistScript:
	jumptextfaceplayer PetalburgHouse1ScientistText

PetalburgHouse1TeacherText:
	text "NORMAN became our"
	line "town's new GYM"
	cont "LEADER."
	
	para "I think he called"
	line "his family over"
	cont "from the JOHTO"
	cont "region."
	done
	
PetalburgHouse1ScientistText:
	text "I battled NORMAN"
	line "once, but whew, he"
	cont "he was way too"
	cont "strong."
	
	para "How would I put"
	line "it?"
	
	para "I just got the"
	line "feeling he lives"
	cont "for #MON."
	done

PetalburgHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 7, PETALBURG_CITY, 1
	warp_event  3, 7, PETALBURG_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, -1, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PetalburgHouse1TeacherScript, -1	
	object_event 5,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PetalburgHouse1ScientistScript, -1	
	
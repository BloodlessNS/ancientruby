	const_def 2 ; object constants

OldaleHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
OldaleHouse1TeacherScript:
	jumptextfaceplayer OldaleHouse1TeacherText

OldaleHouse1TeacherText:
	text "When a #MON"
	line "battle starts, the"
	cont "one at the top of"
	cont "the list goes out"
	cont "first."
	
	para "So, when you get"
	line "get more #MON"
	cont "in your party, try"
	cont "switching around"
	cont "the order of your"
	cont "#MON."
	done

OldaleHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 7, OLDALE_TOWN, 3
	warp_event  3, 7, OLDALE_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 6,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, -1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OldaleHouse1TeacherScript, -1	
	
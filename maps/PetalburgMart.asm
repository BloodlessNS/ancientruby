	const_def 2 ; object constants
	const PETALBURGMART_CLERK

PetalburgMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PetalburgMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_PETALBURG
	closetext
	end
	
PetalburgMartPokefanMScript:
	jumptextfaceplayer PetalburgMartPokefanMText
	
PetalburgMartTeacherScript:
	jumptextfaceplayer PetalburgMartTeacherText
	
PetalburgMartRockerScript:
	jumptextfaceplayer PetalburgMartRockerText
	
PetalburgMartPokefanMText:
	text "Do you have any"
	line "ANTIDOTES with"
	cont "you?"
	
	para "If you walk around"
	line "with a poisoned"
	cont "#MON, it will"
	cont "lose HP until it"
	cont "faints."
	
	para "Take some"
	line "ANTIDOTES with"
	cont "you."
	done
	
PetalburgMartTeacherText:
	text "Even if a #MON"
	line "is weak now, it"
	cont "will grow"
	cont "stronger."
	
	para "The most important"
	line "thing is love!"
	
	para "Love for your"
	line "#MON!"
	done
	
PetalburgMartRockerText:
	text "Do you use REPEL?"
	
	para "It keeps #MON"
	line "away, so it's"
	cont "useful when you're"
	cont "in a hurry."
	done

PetalburgMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PETALBURG_CITY, 4
	warp_event  3,  7, PETALBURG_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PetalburgMartClerkScript, -1
	object_event  8,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PetalburgMartPokefanMScript, -1
	object_event  4,  5, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PetalburgMartTeacherScript, -1
	object_event  5,  3, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PetalburgMartRockerScript, -1

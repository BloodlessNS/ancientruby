	const_def 2 ; object constants
	const OLDALEMART_CLERK

OldaleMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OldaleMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_OLDALE
	closetext
	end
	
OldaleMartRockerScript:
	jumptextfaceplayer OldaleMartRockerText
	
OldaleMartTeacherScript:
	jumptextfaceplayer OldaleMartTeacherText
	
OldaleMartRockerText:
	text "If a #MON gets"
	line "hurt and loses it's"
	cont "HP and faints it"
	cont "won't be able to"
	cont "battle."
	
	para "To prevent your"
	line "#MON from"
	cont "fainting, restore"
	cont "it's HP with a"
	cont "POTION."
	done
	
OldaleMartTeacherText:
	text "I'm going to buy a"
	line "bunch of POKé"
	cont "BALLS and catch a"
	cont "bunch of #MON."
	done

OldaleMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLDALE_TOWN, 2
	warp_event  3,  7, OLDALE_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldaleMartClerkScript, -1
	object_event  8,  4, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OldaleMartRockerScript, -1
	object_event  4,  5, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldaleMartTeacherScript, -1

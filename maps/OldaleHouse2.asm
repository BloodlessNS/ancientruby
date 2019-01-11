	const_def 2 ; object constants

OldaleHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
OldaleHouse2ScientistScript:
	jumptextfaceplayer OldaleHouse2ScientistText
	
OldaleHouse2LassScript:
	jumptextfaceplayer OldaleHouse2LassText

OldaleHouse2ScientistText:
	text "If the #MON"
	line "with you become"
	cont "stronger, you'll"
	cont "be able to go"
	cont "farther away from"
	cont "here."
	done
	
OldaleHouse2LassText:
	text "When #MON"
	line "battle, they"
	cont "eventually level"
	cont "up and get"
	cont "stronger."
	done

OldaleHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 7, OLDALE_TOWN, 4
	warp_event  3, 7, OLDALE_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 5,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OldaleHouse2ScientistScript, -1	
	object_event 2,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OldaleHouse2LassScript, -1	
	
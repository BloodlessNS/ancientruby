	const_def 2 ; object constants
	const ROUTE101_COOLTRAINER_M
	const ROUTE101_YOUNGSTER

Route101_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route101CooltrainerMScript:
	jumptextfaceplayer Text_TallGrass
	
Route101YoungsterScript:
	jumptextfaceplayer Text_PokeCentreTip
	
Route101Sign:
	jumptext Route101SignText
	
Text_TallGrass:
	text "Wild #MON will"
	line "jump out out at"
	cont "you in tall grass."

	para "If you want to"
	line "catch #MON,"
	cont "you have to go"
	cont "into the tall"
	cont "grass and search."
	done
	
Text_PokeCentreTip:
	text "If #MON get"
	line "tired, take them"
	cont "to a #MON"
	cont "CENTRE."
	
	para "There's a #MON"
	line "CENTRE in OLDALE"
	cont "TOWN right close"
	cont "by."
	done
	
Route101SignText:
	text "ROUTE 101"

	para "LITTLEROOT TOWN -"
	line "OLDALE TOWN"
	done

Route101_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 5,  9, BGEVENT_READ, Route101Sign
	
	db 3 ; object events
	object_event  10,  21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LittlerootTownYoungsterScript, EVENT_BIRCH_ATTACK
	object_event 2,  14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, -1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route101CooltrainerMScript, -1
	object_event 15,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, -1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route101YoungsterScript, -1
	
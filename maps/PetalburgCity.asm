	const_def 2 ; object constants
	const PETALBURGCITY_GENTLEMAN
	const PETALBURGCITY_TEACHER
	const PETALBURGCITY_SILVER
	const PETALBURGCITY_COOLTAINER_M

PetalburgCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_PETALBURG
	return
	
PetalburgCityGentlemanScript:
	jumptextfaceplayer PetalburgCityGentlemanText
	
WallyGoneScript:
	jumptextfaceplayer WallyGoneText
	
WallyAlphaEndScript:
	jumptextfaceplayer WallyAlphaEndText
	
PetalburgCityCooltrainerMScript:
	jumptextfaceplayer CooltrainerMText
	
PetalburgCitySign:
	jumptext PetalburgCitySignText

PetalburgGymSign:
	jumptext PetalburgGymSignText
	
WallysHouseSign:
	jumptext WallysHouseSignText
	
PetalburgCitySignText:
	text "PETALBURG CITY"

	para "Where people"
	line "mingle with"
	cont "nature."
	done
	
PetalburgGymSignText:
	text "PETALBURG CITY"
	line "#MON GYM"
	cont "LEADER: NORMAN"

	para "A man in pursuit"
	line "of power!"
	done
	
WallysHouseSignText:
	text "WALLY'S HOUSE"
	done

PetalburgCityGentlemanText:
	text "Let's say you have"
	line "six #MON. If"
	cont "you catch another…"
	
	para "It is"
	line "automatically sent"
	cont "to a STORAGE BOX"
	cont "over a PC"
	cont "connection."
	done
	
WallyGoneText:
	text "Where has our"
	line "WALLY gone?"
	
	para "We have to leave"
	line "for VERDANTURF"
	cont "TOWN very soon…"
	done
	
WallyAlphaEndText
	text "I'm waiting to"
	line "recieve my first"
	cont "#MON but your"
	cont "dad's out right"
	cont "now."
	
	para "Check back later!"
	done
	
CooltrainerMText:
	text "My face is"
	line "reflected in the"
	cont "water."
	
	para "It's a shining"
	line "grin full of hope…"
	
	para "Or it could be a"
	line "somber look of"
	cont "silence struggling"
	cont "with fear…"
	
	para "What do you see"
	line "reflected in your"
	cont "face?"
	done

PetalburgCity_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  19, 21, PETALBURG_HOUSE_1, 1
	warp_event  9, 17, PETALBURG_HOUSE_2, 1
	warp_event  17, 15, PETALBURG_POKECENTER_1F, 1
	warp_event  23, 11, PETALBURG_MART, 1
	
	db 0 ; coord events

	db 3 ; bg events
	bg_event  14,  15, BGEVENT_READ, PetalburgCitySign
	bg_event  15,  9, BGEVENT_READ, PetalburgGymSign
	bg_event  7,  8, BGEVENT_READ, WallysHouseSign

	db 4 ; object events
	object_event 20,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PetalburgCityGentlemanScript, -1
	object_event 14,  16, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WallyGoneScript, -1
	object_event 13,  8, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WallyAlphaEndScript, -1	
	object_event 7,  19, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PetalburgCityCooltrainerMScript, -1
	
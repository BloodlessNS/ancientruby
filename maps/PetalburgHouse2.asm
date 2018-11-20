	const_def 2 ; object constants

PetalburgHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PetalburgHouse2PokefanFScript:
	jumptextfaceplayer PetalburgHouse2PokefanFText
	
PetalburgHouse2GrampsScript:
	jumptextfaceplayer PetalburgHouse2GrampsText

PetalburgHouse2PokefanFText:
	text "Sigh…"
	
	para "I wish I could go"
	line "on an adventure"
	cont "with some #MON."
	
	para "Crawl through some"
	line "damp grass…"
	cont "Climb rocky,"
	cont "rugged mountains…"
	
	para "Cross the raging"
	line "seas…"
	cont "Wander about in"
	cont "dark caves…"
	
	para "And, somtimes,"
	line "even get a little"
	cont "homesick…"
	
	para "It must be"
	line "fabulous to"
	cont "travel!"
	done
	
PetalburgHouse2GrampsText:
	text "Traveling is"
	line "wonderful!"
	
	para "When I was young,"
	line "I roamed the seas"
	cont "and the mountains!"
	done

PetalburgHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 7, PETALBURG_CITY, 2
	warp_event  3, 7, PETALBURG_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 6,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, -1, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PetalburgHouse2PokefanFScript, -1	
	object_event 5,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PetalburgHouse2GrampsScript, -1	
	
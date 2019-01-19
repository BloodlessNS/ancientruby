	const_def 2 ; object constants
	const ROUTE30BERRYHOUSE_POKEFAN_M

Route30BerryHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route30BerryHousePokefanMScript:
	faceplayer
	opentext
	writetext Route30BerrySpeechHouseMonEatBerriesText
	buttonsound
	verbosegiveitem BERRY
	iffalse .NoRoom
	writetext Route30BerrySpeechHouseCheckTreesText
	waitbutton
.NoRoom:
	closetext
	end

Route30BerryHouseBookshelf:
	jumpstd magazinebookshelf

Route30BerrySpeechHouseMonEatBerriesText:
	text "You know, #MON"
	line "eat BERRIES."

	para "Well, my #MON"
	line "got healthier by"
	cont "eating a BERRY."

	para "Here. I'll share"
	line "one with you!"
	done

Route30BerrySpeechHouseCheckTreesText:
	text "Check trees for"
	line "BERRIES. They just"
	cont "drop right off."
	done

Route30BerryHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_30, 1
	warp_event  3,  7, ROUTE_30, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, Route30BerryHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, Route30BerryHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route30BerryHousePokefanMScript, -1

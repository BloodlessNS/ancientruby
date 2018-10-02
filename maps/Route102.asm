	const_def 2 ; object constants
	const ROUTE102_POKE_BALL
	const ROUTE102_FISHER
	const ROUTE102_BUG_CATCHER

Route102_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route102FisherScript:
	jumptextfaceplayer Route102FisherText
	
Route102BugCatcherScript:
	jumptextfaceplayer Route102BugCatcherText
	
Route102Sign1:
	jumptext Route102Sign1Text
	
Route102Sign2:
	jumptext Route102Sign2Text
	
Route102Potion:
	itemball POTION
	
Route102Sign1Text:
	text "ROUTE 101-"
	line "PETALBURG CITY"
	done
	
Route102Sign2Text:
	text "ROUTE 101-"
	line "OLDALE TOWN"
	done
	
Route102FisherText:
	text "I'm going to catch"
	line "a whole bunch of"
	cont "#MON!"
	done
	
Route102BugCatcherText:
	text "I'm... not very"
	line "tall, so I sink"
	cont "right in to tall"
	cont "grass."
	
	para "The grass goes"
	line "right up my nose"
	cont "and..."
	cont "Fwafwafwafwafwa..."
	
	para "Fwatchoo!"
	done

Route102_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event 36,  7, BGEVENT_READ, Route102Sign1
	bg_event 15,  2, BGEVENT_READ, Route102Sign2

	db 3 ; object events
	object_event  9,  15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route102Potion, EVENT_ROUTE_102_POTION
	object_event 33,  3, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, -1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route102FisherScript, -1
	object_event 16,  10, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, -1, 1, -1,PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route102BugCatcherScript, -1

	const_def 2 ; object constants
	const ROUTE103_FISHER

Route103_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route103FisherScript:
	jumptextfaceplayer Route103FisherText
	
Route103Sign1:
	jumptext Route103Sign1Text
	
Route103FisherText:
	text "My #MON is"
	line "staggeringly"
	cont "tired…"
	
	para "I should have"
	line "brought a potion…"
	done
	
Route103Sign1Text:
	text "ROUTE 103-"
	line "OLDALE TOWN"
	done

Route103_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11,  10, BGEVENT_READ, Route103Sign1

	db 1 ; object events
	object_event 18,  8, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, -1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route103FisherScript, -1
	
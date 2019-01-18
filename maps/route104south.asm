	const_def 2 ; object constants

Route104South_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route104Sign
	jumptext Route104SignText
	
Route104SignText:
	text "ROUTE 104"
	line "→ PETALBURG CITY"
	done

Route104South_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 4, PETALBURG_WOODS, 1
	warp_event  9, 4, PETALBURG_WOODS, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  20,  28, BGEVENT_READ, Route104Sign

	db 0 ; object events

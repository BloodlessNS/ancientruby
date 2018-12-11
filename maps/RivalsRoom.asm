	const_def 2 ; object constants

RivalsRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RivalsEmail:
	jumptext RivalsEmailText
	
RivalsEmailText:
	text "There's an e-mail"
	line "from #MON"
	cont "TRAINER SCHOOL."
	
	para "… … …"
	
	para "A #MON may"
	line "learn up to four"
	cont "moves."
	
	para "A TRAINER's"
	line "expertise is"
	cont "tested on the move"
	cont "sets chosen for"
	cont "#MON."
	
	para "… … … …"
	done

RivalsRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  0, 0, RIVALS_HOUSE, 3
	
	db 0 ; coord events

	db 1 ; bg events
	bg_event  7,  1, BGEVENT_READ, RivalsEmail

	db 0 ; object events
	
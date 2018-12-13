	const_def 2 ; object constants

RivalsRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RivalsEmail:
	jumptext RivalsEmailText
	
RivalsNotebook:
	jumptext RivalsNotebookText
	
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
	
RivalsNotebookText:
	text "<PLAYER>"
	line "flipped open the"
	cont "notebook."
	
	para "ADVENTURE RULE"
	line "NO. 1"
	
	para "Open the MENU"
	line "with START."
	
	para "ADVENTURE RULE"
	line "NO. 2"
	
	para "Record your"
	line "progress with"
	cont "SAVE."
	
	para "The remaining"
	line "pages are blank…"
	done

RivalsRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  0, 0, RIVALS_HOUSE, 3
	
	db 0 ; coord events

	db 2 ; bg events
	bg_event  7,  1, BGEVENT_READ, RivalsEmail
	bg_event  6,  1, BGEVENT_READ, RivalsNotebook

	db 0 ; object events
	
	const_def 2 ; object constants
	const ROUTE42ECRUTEAKGATE_OFFICER

Route42EcruteakGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route42EcruteakGateOfficerScript:
	jumptextfaceplayer Route42EcruteakGateOfficerText

Route42EcruteakGateOfficerText:
	text "MT.MORTAR is like"
	line "a maze inside."

	para "Be careful. Don't"
	line "get lost in there."
	done

Route42EcruteakGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route42EcruteakGateOfficerScript, -1

	const_def 2 ; object constants
	const RALTSWELLB2F_GYM_GUY
	const RALTSWELLB2F_POKE_BALL

RaltsWellB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RaltsWellB2FGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_KINGS_ROCK_IN_RALTS_WELL
	iftrue .GotKingsRock
	writetext RaltsWellB2FGymGuyText
	buttonsound
	verbosegiveitem KINGS_ROCK
	iffalse .NoRoom
	setevent EVENT_GOT_KINGS_ROCK_IN_RALTS_WELL
.NoRoom:
	closetext
	end

.GotKingsRock:
	writetext RaltsWellB2FGymGuyText_GotKingsRock
	waitbutton
	closetext
	end

RaltsWellB2FTMRainDance:
	itemball TM_RAIN_DANCE

RaltsWellB2FGymGuyText:
	text "I'm waiting to see"
	line "RALTS's moment"
	cont "of evolution."

	para "Through observa-"
	line "tion, I made a new"
	cont "discovery."

	para "A RALTS with a"
	line "KING'S ROCK often"

	para "gets bitten by a"
	line "SHELLDER."

	para "Here, I'll share a"
	line "KING'S ROCK with"
	cont "you."
	done

RaltsWellB2FGymGuyText_GotKingsRock:
	text "I'm going to be"
	line "like RALTS."

	para "I'll wait patient-"
	line "ly, so I can see"
	cont "one evolve."
	done

RaltsWellB2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9, 11, RALTS_WELL_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, RaltsWellB2FGymGuyScript, -1
	object_event 15,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RaltsWellB2FTMRainDance, EVENT_RALTS_WELL_B2F_TM_RAIN_DANCE

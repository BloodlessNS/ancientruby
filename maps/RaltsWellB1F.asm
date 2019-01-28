	const_def 2 ; object constants
	const RALTSWELLB1F_ROCKET1
	const RALTSWELLB1F_ROCKET2
	const RALTSWELLB1F_ROCKET3
	const RALTSWELLB1F_ROCKET_GIRL
	const RALTSWELLB1F_RALTS1
	const RALTSWELLB1F_RALTS2
	const RALTSWELLB1F_KURT
	const RALTSWELLB1F_BOULDER
	const RALTSWELLB1F_POKE_BALL

RaltsWellB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RaltsWellB1FKurtScript:
	jumptextfaceplayer RaltsWellB1FKurtText

TrainerGruntM29:
	trainer GRUNTM, GRUNTM_29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM29AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end

RaltsWellB1FRaltsWithMailScript:
	faceplayer
	opentext
	cry RALTS
	writetext RaltsWellB1FRaltsWithMailText
	yesorno
	iftrue .ReadMail
	closetext
	end

.ReadMail:
	writetext RaltsWellB1FRaltsMailText
	waitbutton
	closetext
	end

RaltsWellB1FTaillessRaltsScript:
	faceplayer
	opentext
	writetext RaltsWellB1FTaillessRaltsText
	cry RALTS
	waitbutton
	closetext
	end

RaltsWellB1FBoulder:
	jumpstd strengthboulder

RaltsWellB1FSuperPotion:
	itemball SUPER_POTION

KurtRaltsWellVictoryMovementData:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	step LEFT
	step UP
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	turn_head LEFT
	step_end

RaltsWellB1FKurtText:
	text "KURT: Hey there,"
	line "<PLAYER>!"

	para "The guard up top"
	line "took off when I"
	cont "shouted at him."

	para "But then I took a"
	line "tumble down the"
	cont "WELL."

	para "I slammed down"
	line "hard on my back,"
	cont "so I can't move."

	para "Rats! If I were"
	line "fit, my #MON"

	para "would've punished"
	line "them…"

	para "Ah, it can't be"
	line "helped."

	para "<PLAYER>, show them"
	line "how gutsy you are"
	cont "in my place!"
	done

KurtLeaveRaltsWellText:
	text "KURT: Way to go,"
	line "<PLAYER>!"

	para "TEAM ROCKET has"
	line "taken off."

	para "My back's better"
	line "too. Let's get out"
	cont "of here."
	done

GruntM29SeenText:
	text "Darn! I was stand-"
	line "ing guard up top"

	para "when some old coot"
	line "yelled at me."

	para "He startled me so"
	line "much that I fell"
	cont "down here."

	para "I think I'll vent"
	line "my anger by taking"
	cont "it out on you!"
	done

GruntM29BeatenText:
	text "Arrgh! This is NOT"
	line "my day!"
	done

GruntM29AfterBattleText:
	text "Sure, we've been"
	line "hacking the tails"

	para "off RALTS and"
	line "selling them."

	para "Everything we do"
	line "is for profit."

	para "That's right!"
	line "We're TEAM ROCKET,"

	para "and we'll do any-"
	line "thing for money!"
	done

GruntM1SeenText:
	text "What do you want?"

	para "If you interrupt"
	line "our work, don't"
	cont "expect any mercy!"
	done

GruntM1BeatenText:
	text "You did OK today,"
	line "but wait till next"
	cont "time!"
	done

TrainerGruntM1WhenTalkText:
	text "Yeah, TEAM ROCKET"
	line "was broken up"
	cont "three years ago."

	para "But we continued"
	line "our activities"
	cont "underground."

	para "Now you can have"
	line "fun watching us"
	cont "stir up trouble!"
	done

GruntM2SeenText:
	text "Quit taking SLOW-"
	line "POKETAILS?"

	para "If we obeyed you,"
	line "TEAM ROCKET's rep"
	cont "would be ruined!"
	done

GruntM2BeatenText:
	text "Just…"
	line "Too strong…"
	done

GruntM2AfterBattleText:
	text "We need the money,"
	line "but selling SLOW-"
	cont "POKETAILS?"

	para "It's tough being a"
	line "ROCKET GRUNT!"
	done

GruntF1SeenText:
	text "Stop taking TAILS?"

	para "Yeah, just try to"
	line "defeat all of us!"
	done

GruntF1BeatenText:
	text "You rotten brat!"
	done

GruntF1AfterBattleText:
	text "SLOWPOKETAILS"
	line "grow back fast!"

	para "What's wrong with"
	line "selling them?"
	done

RaltsWellB1FRaltsWithMailText:
	text "A RALTS with"
	line "its TAIL cut off…"

	para "Huh? It has MAIL."
	line "Read it?"
	done

RaltsWellB1FRaltsMailText:
	text "<PLAYER> read the"
	line "MAIL."

	para "Be good and look"
	line "after the house"

	para "with Grandpa and"
	line "RALTS."

	para "Love, Dad"
	done

RaltsWellB1FTaillessRaltsText:
	text "A RALTS with"
	line "its TAIL cut off…"
	done

RaltsWellB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7, 11, RALTS_WELL_B2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event 15,  7, SPRITE_GRUNT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM29, EVENT_RALTS_WELL_ROCKETS
	object_event  5,  2, SPRITE_GRUNT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM1, EVENT_RALTS_WELL_ROCKETS
	object_event  5,  6, SPRITE_GRUNT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM2, EVENT_RALTS_WELL_ROCKETS
	object_event 10,  4, SPRITE_GRUNT_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF1, EVENT_RALTS_WELL_ROCKETS
	object_event  7,  4, SPRITE_RALTS, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RaltsWellB1FRaltsWithMailScript, EVENT_RALTS_WELL_RALTSS
	object_event  6,  2, SPRITE_RALTS, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RaltsWellB1FTaillessRaltsScript, EVENT_RALTS_WELL_RALTSS
	object_event 16, 14, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RaltsWellB1FKurtScript, EVENT_RALTS_WELL_KURT
	object_event  3,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RaltsWellB1FBoulder, -1
	object_event 10,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RaltsWellB1FSuperPotion, EVENT_RALTS_WELL_B1F_SUPER_POTION

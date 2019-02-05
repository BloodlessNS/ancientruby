	const_def 2 ; object constants
	const ROUTE104SOUTH_COOLTRAINERM1
	const ROUTE104SOUTH_POKEBALL
	const ROUTE104SOUTH_COOLTRAINERF
	const ROUTE104SOUTH_TEACHER
	const ROUTE104SOUTH_YOUNGSTER
	const ROUTE104SOUTH_COOLTRAINERM2
	const ROUTE104SOUTH_FISHER
	const ROUTE104SOUTH_RICHBOY
	const ROUTE104SOUTH_YOUNGSTER2

Route104South_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route104SouthSign:
	jumptext Route104SouthSignText
	
BrineysCottageSign:
	jumptext BrineysCottageSignText
	
Route104SouthCooltrainerFScript:
	jumptextfaceplayer Route104SouthCooltrainerFText
	
Route104SouthTeaherScript:
	jumptextfaceplayer Route104SouthTeaherText
	
Route104SouthYoungsterScript:
	jumptextfaceplayer Route104SouthYoungsterText
	
Route104SouthCooltrainerMScript:
	jumptextfaceplayer Route104SouthCooltrainerMText
	
Route104SouthFisherScript:
	jumptext Route104SouthFisherText
	
TrainerRichBoyWinston:
	trainer RICH_BOY, WINSTON, EVENT_BEAT_RICHBOY_WINSTON, RichBoyWinstonSeenText, RichBoyWinstonBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext RichBoyWinstonAfterText
	waitbutton
	closetext
	end
	
TrainerYoungsterBilly:
	trainer YOUNGSTER, BILLY, EVENT_BEAT_YOUNGSTER_BILLY, YoungsterBillySeenText, YoungsterBillyBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext YoungsterBillyAfterText
	waitbutton
	closetext
	end
	
Route104SouthSignText:
	text "ROUTE 104"
	line "→ PETALBURG CITY"
	done
	
BrineysCottageSignText:
	text "MR. BRINEY'S"
	line "COTTAGE"
	done
	
Route104SouthCooltrainerFText:
	text "That seaside"
	line "cottage is where"
	cont "MR. BRINEY lives."
	
	para "He was once a"
	line "mighty sailor who"
	cont "never feared the"
	cont "sea, however"
	cont "stormy."
	done
	
Route104SouthTeaherText:
	text "You're a thief if"
	line "you try to steal"
	cont "someone else's"
	cont "#MON."
	
	para "You should throw"
	line "# BALLS only at"
	cont "wild #MON."
	done
	
Route104SouthYoungsterText:
	text "If you're going to"
	line "throw a # BALL,"
	cont "weaken the wild"
	cont "#MON first."
	
	para "It will be easier"
	line "to catch if it's"
	cont "been poisoned,"
	cont "burned, or lulled"
	cont "to sleep."
	done
	
Route104SouthCooltrainerMText:
	text "Oh, no, I'm not a"
	line "TRAINER."
	
	para "But that's right,"
	line "if TRAINERS lock"
	cont "eyes, it's a"
	cont "challenge to"
	cont "battle."
	
	para "If you don't want"
	line "to battle, stay"
	cont "out of their"
	cont "sight."
	done
	
Route104SouthFisherText:
	text "The sea, huh?"
	
	para "I wonder what it's"
	line "like at the bottom"
	cont "of the sea?"
	done
	
RichBoyWinstonSeenText:
	text "Oh, sure, I'll"
	line "accept your"
	cont "challenge."
	
	para "I have a lot of"
	line "money."
	done
	
RichBoyWinstonBeatenText:
	text "Why couldn't I"
	line "win?"
	done
	
RichBoyWinstonAfterText:
	text "There are some"
	line "things money can't"
	cont "buy."
	
	para "That's #MON…"
	done
	
YoungsterBillySeenText:
	text "Leaving footprints"
	line "in the sand is so"
	cont "fun!"
	done
	
YoungsterBillyBeatenText:
	text "Waah! I got sand"
	line "in my runners!"
	
	para "They're all"
	line "gritty!"
	done
	
YoungsterBillyAfterText:
	text "I want to leave my"
	line "footprints in the"
	cont "sand everywhere,"
	cont "but they disappear"
	cont "quickly…"
	done
	
Route104SouthPokeball:
	itemball POKE_BALL
	
Route104SouthHiddenPotion:
	hiddenitem POTION, EVENT_ROUTE104SOUTH_HIDDEN_POTION

Route104SouthHiddenAntidote:
	hiddenitem ANTIDOTE, EVENT_ROUTE104SOUTH_HIDDEN_ANTIDOTE

Route104South_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  8, 4, PETALBURG_WOODS, 1
	warp_event  9, 4, PETALBURG_WOODS, 2
	warp_event  24, 6, PETALBURG_WOODS, 3
	warp_event  25, 6, PETALBURG_WOODS, 4
	warp_event  11, 15, BRINEYS_CABIN, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  20,  28, BGEVENT_READ, Route104SouthSign
	bg_event  9,  19, BGEVENT_ITEM, Route104SouthHiddenPotion
	bg_event  12,  35, BGEVENT_ITEM, Route104SouthHiddenAntidote
	bg_event  14,  15, BGEVENT_READ, BrineysCottageSign

	db 9 ; object events
	object_event 36,  24, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WallyAlphaEndScript, -1
	object_event  21,  17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route104SouthPokeball, EVENT_ROUTE104SOUTH_POKEBALL
	object_event 18,  14, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, -1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route104SouthCooltrainerFScript, -1
	object_event 22,  14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route104SouthTeaherScript, -1
	object_event 20,  25, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route104SouthYoungsterScript, -1
	object_event 21,  35, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route104SouthCooltrainerMScript, -1
	object_event 10,  24, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route104SouthFisherScript, -1
	object_event 9,  9, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, -1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerRichBoyWinston, -1
	object_event 16,  32, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, -1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterBilly, -1
	
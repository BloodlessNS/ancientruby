	const_def 2 ; object constants
	const ROUTE102_POKE_BALL
	const ROUTE102_FISHER
	const ROUTE102_BUG_CATCHER
	const ROUTE102_YOUNGSTER
	const ROUTE102_BUG_CATCHER2
	const ROUTE102_YOUNGSTER2
	const ROUTE102_LASS

Route102_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route102FisherScript:
	jumptextfaceplayer Route102FisherText
	
Route102BugCatcherScript:
	jumptextfaceplayer Route102BugCatcherText
	
TrainerYoungsterCalvin:
	trainer YOUNGSTER, CALVIN, EVENT_BEAT_YOUNGSTER_CALVIN, YoungsterCalvinSeenText, YoungsterCalvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterCalvinAfterText
	waitbutton
	closetext
	end
	
TrainerBugCatcherRick:
	trainer BUG_CATCHER, RICK, EVENT_BEAT_BUG_CATCHER_RICK, BugCatcherRickSeenText, BugCatcherRickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherRickAfterText
	waitbutton
	closetext
	end
	
TrainerYoungsterAllen:
	trainer YOUNGSTER, ALLEN, EVENT_BEAT_YOUNGSTER_ALLEN, YoungsterAllenSeenText, YoungsterAllenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterAllenAfterText
	waitbutton
	closetext
	end
	
TrainerLassTiana:
	trainer LASS, TIANA, EVENT_BEAT_LASS_TIANA, LassTianaSeenText, LassTianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassTianaAfterText
	waitbutton
	closetext
	end
	
Route102Sign1:
	jumptext Route102Sign1Text
	
Route102Sign2:
	jumptext Route102Sign2Text
	
Route102Potion:
	itemball POTION
	
YoungsterCalvinSeenText:
	text "If you have"
	line "#MON with you,"
	cont "then you're an"
	cont "official #MON"
	cont "TRAINER!"

	para "You can't say no"
	line "my challenge!"
	done

YoungsterCalvinBeatenText:
	text "Argh, I lost…"
	line "I should have"
	cont "trained more…"
	done

YoungsterCalvinAfterText:
	text "Listen, you. If"
	line "you're strong you"
	cont "should have told"
	cont "me before!"
	done
	
BugCatcherRickSeenText:
	text "Hahah! Our eyes"
	line "met!"
	
	para "I'll take you on"
	line "with my bug"
	cont "#MON!"
	done

BugCatcherRickBeatenText:
	text "Ow! Down and out!"
	line ""
	done

BugCatcherRickAfterText:
	text "If you lock eyes"
	line "with a TRAINER,"
	cont "you have to"
	cont "challenge!"

	para "It's a rule!"
	line ""
	done
	
YoungsterAllenSeenText:
	text "Did you just"
	line "become a trainer?"

	para "We're both"
	line "beginners!"
	done

YoungsterAllenBeatenText:
	text "I called you"
	line "because I thought"
	cont "I could beat you…"
	done

YoungsterAllenAfterText:
	text "I haven't won"
	line "once yet…"
	
	para "I wish I would"
	line "win soon…"
	done
	
LassTianaSeenText:
	text "I'm going to keep"
	line "training and aim"
	cont "to be the best"
	cont "TRAINER."

	para "Help me further"
	line "my career!"
	done

LassTianaBeatenText:
	text "I ended up"
	line "furthering your"
	cont "career…"
	done

LassTianaAfterText:
	text "To keep winning"
	line "my way up, I see"
	cont "that I have to"
	cont "catch more"
	cont "#MON."
	done
	
Route102Sign1Text:
	text "ROUTE 102-"
	line "PETALBURG CITY"
	done
	
Route102Sign2Text:
	text "ROUTE 102-"
	line "OLDALE TOWN"
	done
	
Route102FisherText:
	text "I'm going to catch"
	line "a whole bunch of"
	cont "#MON!"
	done
	
Route102BugCatcherText:
	text "I'm… not very"
	line "tall, so I sink"
	cont "right in to tall"
	cont "grass."
	
	para "The grass goes"
	line "right up my nose"
	cont "and..."
	cont "Fwafwafwafwafwa…"
	
	para "Fwatchoo!"
	done

Route102_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event 36,  7, BGEVENT_READ, Route102Sign1
	bg_event 15,  2, BGEVENT_READ, Route102Sign2

	db 7 ; object events
	object_event  9,  15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route102Potion, EVENT_ROUTE_102_POTION
	object_event 33,  3, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, -1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route102FisherScript, -1
	object_event 16,  10, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, -1, 1, -1,PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route102BugCatcherScript, -1
	object_event  29, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterCalvin, -1
	object_event  22,  13, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherRick, -1
	object_event  17, 5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerYoungsterAllen, -1
	object_event  8, 6, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, -1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassTiana, -1

	const_def 2 ; object constants
	const OLDALETOWN_CLERK
	const OLDALETOWN_SCIENTIST
	const OLDALETOWN_SCIENTIST2
	const OLDALETOWN_COOLTRAINER_F

OldaleTown_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint
	
.Flypoint:
	setflag ENGINE_FLYPOINT_OLDALE
	return
	
LittlerootTown_ScientistStopsYouScene1:
	checkevent EVENT_GOT_POKEDEX
	iftrue .end
	applymovement OLDALETOWN_SCIENTIST, GrabPlayerMovement
	turnobject PLAYER, RIGHT
	follow OLDALETOWN_SCIENTIST, PLAYER
	applymovement OLDALETOWN_SCIENTIST, GrabPlayerMovement2
	stopfollow
	opentext
	writetext WaitText
	waitbutton
	writetext WaitText2
	closetext
	applymovement OLDALETOWN_SCIENTIST, GrabPlayerMovement3
.end
	end
	
ClerkScript_ClerkWithPotion:
	faceplayer
	opentext
	checkevent EVENT_GOT_POTION
	iftrue .GotPotion
	writetext ClerkText_PromotionalItem
	buttonsound
	verbosegiveitem POTION
	iffalse .NoRoomForPotion
	setevent EVENT_GOT_POTION
	closetext
	end

.GotPotion:
	writetext ClerkText_Potion
	waitbutton
.NoRoomForPotion:
	closetext
	end
	
GrabPlayerMovement:
	step UP
	turn_head LEFT
	step_end
	
GrabPlayerMovement2:
	step RIGHT
	turn_head LEFT
	step_end
	
GrabPlayerMovement3:
	step DOWN
	step LEFT
	step_end
	
OldaleTownScientistScript:
	jumptextfaceplayer WaitText2
	
OldaleTownScientistScript2:
	jumptextfaceplayer OldaleTownScientistText
	
OldaleTownCooltrainerFScript:
	jumptextfaceplayer OldaleTownCooltrainerFText
	
OldaleTownSign:
	jumptext OldaleTownSignText
	
WaitText:
	text "Aaaaah! Wait!"
	
	para "Please don't come"
	line "in here."
	done
	
WaitText2:
	text "I just discovered"
	line "the footprints of"
	cont "a rare #MON!"
	
	para "wait until I"
	line "finish sketching"
	cont "them, okay?"
	done
	
ClerkText_PromotionalItem:
	text "Hi!"
	line "I work at the"
	cont "#MON MART."

	para "This is a #MON"
	line "MART. Just look"
	cont "for our blue roof."

	para "We sell a variety"
	line "of goods including"
	cont "POKé BALLS for"
	cont "catching #MON."
	
	para "Here, I'd like you"
	line "to have this as a"
	cont "promotional item."
	done

Text_ReceivedPotion:
	text "<PLAYER> received"
	line "POTION."
	done

ClerkText_Potion:
	text "A POTION can be"
	line "used anytime, so"
	cont "it's even more"
	cont "useful than a"
	cont "#MON CENTER in"
	cont "certain"
	cont "situations."
	done
	
OldaleTownScientistText:
	text "I finished"
	line "sketching the"
	cont "footprints of a"
	cont "rare #MON."

	para "But it turns out"
	line "they were only my"
	cont "own footprints…"
	done
	
OldaleTownCooltrainerFText:
	text "I want to take"
	line "a rest, so I'm"
	cont "saving my"
	cont "progress."
	done
	
OldaleTownSignText:
	text "OLDALE TOWN"
	
	para "Where things start"
	line "off scarce."
	done

OldaleTown_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 5, 13, OLDALE_POKECENTER_1F, 2
	warp_event 15,  7, OLDALE_MART, 2
	warp_event 5,  7, OLDALE_HOUSE_1, 1
	warp_event 15,  13, OLDALE_HOUSE_2, 1

	db 1 ; coord events
	
	coord_event  0,  8, SCENE_DEFAULT, LittlerootTown_ScientistStopsYouScene1

	db 1 ; bg events
	bg_event 11,  8, BGEVENT_READ, OldaleTownSign

	db 4 ; object events
	object_event  14,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ClerkScript_ClerkWithPotion, -1
	object_event  1,  9, SPRITE_WALLY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldaleTownScientistScript, EVENT_GOT_POKEDEX
	object_event  8,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldaleTownScientistScript2, EVENT_NOT_GOT_POKEDEX
	object_event  13, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldaleTownCooltrainerFScript, -1
	
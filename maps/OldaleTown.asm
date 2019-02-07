	const_def 2 ; object constants
	const OLDALETOWN_CLERK
	const OLDALETOWN_SCIENTIST
	const OLDALETOWN_SCIENTIST2
	const OLDALETOWN_COOLTRAINER_F
	const OLDALETOWN_RIVAL

OldaleTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene1 ; SCENE_OLDALETOWN_NOTHING
	scene_script .RivalOldaleTown ; SCENE_OLDALETOWN_STOPPED_BY_RIVAL

	db 0 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint
	
.Flypoint:
	setflag ENGINE_FLYPOINT_OLDALE
	return
	
.DummyScene1:
	end
	
.RivalOldaleTown:
	end
	
OldaleTown_ScientistStopsYouScene1:
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
	
OldaleTownRival:
	faceplayer
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue OldaleTown_RivalFemale
	writetext OldaleTownText_RivalHurryMale
	waitbutton
	closetext
	applymovement OLDALETOWN_RIVAL, Movement_OldaleTownRival1
	setevent EVENT_RIVAL_OLDALE_TOWN
	disappear OLDALETOWN_RIVAL
	setscene SCENE_OLDALETOWN_NOTHING
	end
	
OldaleTown_Rival1:
	turnobject OLDALETOWN_RIVAL, LEFT
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue OldaleTown_RivalFemale
	writetext OldaleTownText_RivalHurryMale
	waitbutton
	closetext
	applymovement OLDALETOWN_RIVAL, Movement_OldaleTownRival1
	setevent EVENT_RIVAL_OLDALE_TOWN
	disappear OLDALETOWN_RIVAL
	setscene SCENE_OLDALETOWN_NOTHING
	end
	
OldaleTown_Rival2:
	turnobject OLDALETOWN_RIVAL, LEFT
	applymovement OLDALETOWN_RIVAL, Movement_OldaleTownRival2
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue OldaleTown_RivalFemale
	writetext OldaleTownText_RivalHurryMale
	waitbutton
	closetext
	applymovement OLDALETOWN_RIVAL, Movement_OldaleTownRival1
	setevent EVENT_RIVAL_OLDALE_TOWN
	disappear OLDALETOWN_RIVAL
	setscene SCENE_OLDALETOWN_NOTHING
	end
	
OldaleTown_Rival3:
	turnobject OLDALETOWN_RIVAL, LEFT
	applymovement OLDALETOWN_RIVAL, Movement_OldaleTownRival3
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue OldaleTown_RivalFemale
	writetext OldaleTownText_RivalHurryMale
	waitbutton
	closetext
	applymovement OLDALETOWN_RIVAL, Movement_OldaleTownRival1
	setevent EVENT_RIVAL_OLDALE_TOWN
	disappear OLDALETOWN_RIVAL
	setscene SCENE_OLDALETOWN_NOTHING
	end
	
OldaleTown_RivalFemale:
	writetext OldaleTownText_RivalHurryFemale
	waitbutton
	closetext
	applymovement OLDALETOWN_RIVAL, Movement_OldaleTownRival1
	setevent EVENT_RIVAL_OLDALE_TOWN
	disappear OLDALETOWN_RIVAL
	setscene SCENE_OLDALETOWN_NOTHING
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
	
Movement_OldaleTownRival1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
Movement_OldaleTownRival2:
	step LEFT
	step_end
	
Movement_OldaleTownRival3:
	step LEFT
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
	
	para "“Where things"
	line "start off scarce.”"
	done
	
OldaleTownText_RivalHurryMale:
	text "<RIVAL>: <PLAYER>!"
	line "Over here!"
	cont "Let's hurry home!"
	done
	
OldaleTownText_RivalHurryFemale:
	text "<RIVAL>: I'm"
	line "heading back to my"
	cont "dad's LAB now."
	
	para "<PLAYER>, you"
	line "should hustle"
	cont "back, too."
	done

OldaleTown_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 5, 13, OLDALE_POKECENTER_1F, 2
	warp_event 15,  7, OLDALE_MART, 2
	warp_event 5,  7, OLDALE_HOUSE_1, 1
	warp_event 15,  13, OLDALE_HOUSE_2, 1

	db 5 ; coord events
	coord_event  0,  8, SCENE_OLDALETOWN_NOTHING, OldaleTown_ScientistStopsYouScene1
	coord_event  0,  8, SCENE_OLDALETOWN_STOPPED_BY_RIVAL, OldaleTown_ScientistStopsYouScene1
	coord_event  10,  17, SCENE_OLDALETOWN_STOPPED_BY_RIVAL, OldaleTown_Rival1
	coord_event  9,  17, SCENE_OLDALETOWN_STOPPED_BY_RIVAL, OldaleTown_Rival2
	coord_event  8,  17, SCENE_OLDALETOWN_STOPPED_BY_RIVAL, OldaleTown_Rival3

	db 1 ; bg events
	bg_event 11,  8, BGEVENT_READ, OldaleTownSign

	db 5 ; object events
	object_event  14,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ClerkScript_ClerkWithPotion, -1
	object_event  1,  9, SPRITE_WALLY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldaleTownScientistScript, EVENT_GOT_POKEDEX
	object_event  8,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldaleTownScientistScript2, EVENT_NOT_GOT_POKEDEX
	object_event  13, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldaleTownCooltrainerFScript, -1
	object_event 11,  17, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldaleTownRival, EVENT_RIVAL_OLDALE_TOWN
	
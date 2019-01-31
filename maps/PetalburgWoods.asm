	const_def 2 ; object constants
	const PETALBURGWOODS_PARLYZHEAL
	const PETALBURGWOODS_YOUNGSTER
	const PETALBURGWOODS_ETHER
	const PETALBURGWOODS_GREATBALL
	const PETALBURGWOODS_XATTACK
	const PETALBURGWOODS_COOLTRAINER_M
	const PETALBURGWOODS_GRUNT
	const PETALBURGWOODS_BUGCATCHERLYLE
	const PETALBURGWOODS_BUGCATCHERJAMES
	const PETALBURGWOODS_DEVONEMPLOYEE

PetalburgWoods_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PetalburgWoodsTrainerTipSign:
	jumptext PetalburgWoodsTrainerTipText
	
PetalburgWoodsTrainerTip2Sign:
	jumptext PetalburgWoodsTrainerTip2Text
	
PetalburgWoodsHiddenPotion:
	hiddenitem POTION, EVENT_PETALBURGWOODS_HIDDEN_POTION
	
PetalburgWoodsHiddenPokeball:
	hiddenitem POKE_BALL, EVENT_PETALBURGWOODS_HIDDEN_POKEBALL
	
PetalburgWoodsHiddenTinyMushroom1:
	hiddenitem TINYMUSHROOM, EVENT_PETALBURGWOODS_HIDDEN_TINYMUSHROOM1

PetalburgWoodsHiddenTinyMushroom2:
	hiddenitem TINYMUSHROOM, EVENT_PETALBURGWOODS_HIDDEN_TINYMUSHROOM2
	
PetalburgWoodsYoungsterScript:
	jumptextfaceplayer  PetalburgWoodsYoungsterText
	
PetalburgWoodsCooltrainerMScript:
	jumptextfaceplayer PetalburgWoodsCooltrainerMText
	
PetalburgWoodsParlyzHeal:
	itemball PARLYZ_HEAL
	
PetalburgWoodsEther:
	itemball ETHER
	
PetalburgWoodsGreatBall:
	itemball GREAT_BALL
	
PetalburgWoodsXAttack:
	itemball X_ATTACK
	
TrainerGruntM1:
	checkevent EVENT_BEAT_GRUNTM_1
	iftrue .End
	jump DevonEvent
.End
	end
	
DevonEvent:
	turnobject PETALBURGWOODS_DEVONEMPLOYEE, LEFT
	pause 15
	turnobject PETALBURGWOODS_DEVONEMPLOYEE, UP
	pause 15
	turnobject PETALBURGWOODS_DEVONEMPLOYEE, RIGHT
	pause 15
	turnobject PETALBURGWOODS_DEVONEMPLOYEE, DOWN
	pause 15
	turnobject PETALBURGWOODS_DEVONEMPLOYEE, RIGHT
	pause 15
	turnobject PETALBURGWOODS_DEVONEMPLOYEE, UP
	opentext
	writetext PetalburgWoodsDevonEmployeeText1
	waitbutton
	closetext
	turnobject PETALBURGWOODS_DEVONEMPLOYEE, DOWN
	pause 15
	checkcode VAR_XCOORD
	ifgreater 22, EnterGrunt2
	applymovement PETALBURGWOODS_DEVONEMPLOYEE, MovementData_DevonEmployee1
	opentext
	writetext PetalburgWoodsDevonEmployeeText2
	waitbutton
	closetext
	jump EnterGrunt
	end
	
EnterGrunt:
	applymovement PETALBURGWOODS_GRUNT, MovementData_GruntM1
	opentext
	writetext PetalburgWoodsGruntM1Text1
	waitbutton
	closetext
	applymovement PETALBURGWOODS_GRUNT, MovementData_GruntM2
	turnobject PETALBURGWOODS_DEVONEMPLOYEE, UP
	opentext
	writetext PetalburgWoodsGruntM1Text2
	waitbutton
	closetext
	applymovement PETALBURGWOODS_DEVONEMPLOYEE, MovementData_DevonEmployee2
	opentext
	writetext PetalburgWoodsDevonEmployeeText3
	waitbutton
	closetext
	applymovement PETALBURGWOODS_GRUNT, MovementData_GruntM1
	opentext
if DEF(_SAPPHIRE)
	writetext PetalburgWoodsGruntM1Text3
else
	writetext PetalburgWoodsGruntM1Text4
endc
	waitbutton
	winlosstext PetalburgWoodsGruntM1WinText, PetalburgWoodsGruntM1LossText
	setlasttalked ROUTE103_RIVAL
	loadtrainer GRUNTM, GRUNTM_1,
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	applymovement PETALBURGWOODS_GRUNT, MovementData_GruntM3
	opentext
if DEF(_SAPPHIRE)
	writetext PetalburgWoodsGruntM1Text_YouWonAqua
else
	writetext PetalburgWoodsGruntM1Text_YouWonMagma
endc
	waitbutton
	closetext
	applymovement PETALBURGWOODS_GRUNT, MovementData_GruntM4
	disappear PETALBURGWOODS_GRUNT
	turnobject PLAYER, DOWN
	opentext
	writetext PetalburgWoodsDevonEmployeeText4
	waitbutton
	verbosegiveitem GREAT_BALL
	iffalse .NoRoomForGreatBall
if DEF(_SAPPHIRE)
	writetext PetalburgWoodsDevonEmployeeText5Aqua
else
	writetext PetalburgWoodsDevonEmployeeText5Magma
endc
	waitbutton
	closetext
	turnobject PETALBURGWOODS_DEVONEMPLOYEE, DOWN
	pause 15
	turnobject PETALBURGWOODS_DEVONEMPLOYEE, UP
	opentext
	writetext PetalburgWoodsDevonEmployeeText6
	waitbutton
	closetext
	applymovement PETALBURGWOODS_DEVONEMPLOYEE, MovementData_DevonEmployee3
	disappear PETALBURGWOODS_DEVONEMPLOYEE
	setevent EVENT_BEAT_GRUNTM_1
	end
	
.NoRoomForGreatBall:
	writetext NoRoomForGreatBallText
	setevent EVENT_BEAT_GRUNTM_1
	disappear PETALBURGWOODS_DEVONEMPLOYEE
	end

EnterGrunt2:	
	applymovement PETALBURGWOODS_DEVONEMPLOYEE, MovementData_DevonEmployee1Right
	turnobject PLAYER, LEFT
	opentext
	writetext PetalburgWoodsDevonEmployeeText2
	waitbutton
	closetext
	applymovement PETALBURGWOODS_GRUNT, MovementData_GruntM1
	opentext
	writetext PetalburgWoodsGruntM1Text1
	waitbutton
	closetext
	applymovement PETALBURGWOODS_GRUNT, MovementData_GruntM2Right
	turnobject PETALBURGWOODS_DEVONEMPLOYEE, UP
	opentext
	writetext PetalburgWoodsGruntM1Text2
	waitbutton
	closetext
	applymovement PETALBURGWOODS_DEVONEMPLOYEE, MovementData_DevonEmployee2Right
	opentext
	writetext PetalburgWoodsDevonEmployeeText3
	waitbutton
	closetext
	turnobject PLAYER, UP
	opentext
if DEF(_SAPPHIRE)
	writetext PetalburgWoodsGruntM1Text3
else
	writetext PetalburgWoodsGruntM1Text4
endc
	waitbutton
	winlosstext PetalburgWoodsGruntM1WinText, PetalburgWoodsGruntM1LossText
	setlasttalked ROUTE103_RIVAL
	loadtrainer GRUNTM, GRUNTM_1,
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	applymovement PETALBURGWOODS_GRUNT, MovementData_GruntM3
	opentext
if DEF(_SAPPHIRE)
	writetext PetalburgWoodsGruntM1Text_YouWonAqua
else
	writetext PetalburgWoodsGruntM1Text_YouWonMagma
endc
	waitbutton
	closetext
	applymovement PETALBURGWOODS_GRUNT, MovementData_GruntM4
	disappear PETALBURGWOODS_GRUNT
	turnobject PLAYER, DOWN
	opentext
	writetext PetalburgWoodsDevonEmployeeText4
	waitbutton
	verbosegiveitem GREAT_BALL
	iffalse .NoRoomForGreatBall
if DEF(_SAPPHIRE)
	writetext PetalburgWoodsDevonEmployeeText5Aqua
else
	writetext PetalburgWoodsDevonEmployeeText5Magma
endc
	waitbutton
	closetext
	turnobject PETALBURGWOODS_DEVONEMPLOYEE, DOWN
	pause 15
	turnobject PETALBURGWOODS_DEVONEMPLOYEE, UP
	opentext
	writetext PetalburgWoodsDevonEmployeeText6
	waitbutton
	closetext
	applymovement PETALBURGWOODS_DEVONEMPLOYEE, MovementData_DevonEmployee3Right
	disappear PETALBURGWOODS_DEVONEMPLOYEE
	setevent EVENT_BEAT_GRUNTM_1
	end
	
.NoRoomForGreatBall:
	writetext NoRoomForGreatBallText
	setevent EVENT_BEAT_GRUNTM_1
	disappear PETALBURGWOODS_DEVONEMPLOYEE
	end
	
TrainerBugCatcherLyle:
	trainer BUG_CATCHER, LYLE, EVENT_BEAT_BUG_CATCHER_LYLE, BugCatcherLyleSeenText, BugCatcherLyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherLyleAfterText
	waitbutton
	closetext
	end
	
TrainerBugCatcherJames:
	trainer BUG_CATCHER, JAMES, EVENT_BEAT_BUG_CATCHER_JAMES, BugCatcherJamesSeenText, BugCatcherJamesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherJamesAfterText
	waitbutton
	closetext
	end
	
PetalburgWoodsTrainerTipText:
	text "TRAINER TIPS"
	
	para "Any #MON that"
	line "appears even once"
	cont "is awarded EXP"
	cont "Points."
	
	para "To raise a weak"
	line "#MON, put it at"
	cont "the top of the"
	cont "team list."
	
	para "As soon as the"
	line "battle starts,"
	cont "switch it out."
	
	para "It will earn EXP"
	line "Points without"
	cont "being exposed to"
	cont "any harm."
	done
	
PetalburgWoodsTrainerTip2Text:
	text "TRAINER TIPS"
	
	para "In addition to Hit"
	line "Points (HP),"
	cont "#MON have Power"
	cont "Points (PP) that"
	cont "are used to make"
	cont "moves during"
	cont "battle."
	
	para "If a #MON runs"
	line "out of PP, it must"
	cont "be taken to a"
	cont "#MON CENTER."
	done
	
PetalburgWoodsYoungsterText:
	text "Yo there!"
	
	para "Your #MON"
	line "doing okay?"
	
	para "If your #MON"
	line "are weak and you"
	cont "want to avoid"
	cont "battles, you"
	cont "should stay out of"
	cont "tall grass."
	done
	
PetalburgWoodsCooltrainerMText:
	text "Sometimes, there"
	line "are things on the"
	cont "ground even if you"
	cont "can't see them."
	
	para "That's why I"
	line "always check where"
	cont "I'm walking."
	done
	
BugCatcherLyleSeenText:
	text "I caught a whole"
	line "bunch of #MON!"
	
	para "Go, go, go!"
	line "My BUG #MON"
	cont "team!"
	done
	
BugCatcherLyleBeatenText:
	text "I have all these"
	line "#MON but I"
	cont "couldn't win…"
	done
	
BugCatcherLyleAfterText:
	text "I caught a bunch"
	line "of #MON."
	
	para "Now I'm out of"
	line "# BALLS."
	done
	
BugCatcherJamesSeenText:
	text "If you take BUG"
	line "#MON to school,"
	cont "you get to be"
	cont "instantly popular!"
	done
	
BugCatcherJamesBeatenText:
	text "I can't be popular"
	line "if I lose."
	done
	
BugCatcherJamesAfterText:
	text "If you have BUG"
	line "#MON, people"
	cont "respect you for"
	cont "it."
	done
	
PetalburgWoodsDevonEmployeeText1:
	text "Hmmm…"
	
	para "Not a one to be"
	line "found…"
	done
	
PetalburgWoodsDevonEmployeeText2:
	text "Hello, have you"
	line "seen any #MON"
	cont "called SHROOMISH"
	cont "around here?"
	
	para "I really love that"
	line "#MON."
	done
	
PetalburgWoodsDevonEmployeeText3:
	text "Aiyeeeh!"
	
	para "You're a #MON"
	line "trainer, aren't"
	cont "you?"
	
	para "You've got to help"
	line "me, please!"
	done
	
PetalburgWoodsDevonEmployeeText4:
	text "Whew…"
	
	para "That was awfully"
	line "close!"
	
	para "Thanks to you, he"
	line "didn't rob me of"
	cont "these important"
	cont "papers."
	
	para "I know, I'll give"
	line "you a GREAT BALL"
	cont "as my thanks!"
	done
	
PetalburgWoodsDevonEmployeeText5Aqua:
	text "Didn't that TEAM"
	line "AQUA thug say"
	cont "they were after"
	cont "something in"
	cont "RUSTBORO, too?"
	done
	
PetalburgWoodsDevonEmployeeText5Magma:
	text "Didn't that TEAM"
	line "MAGMA thug say"
	cont "they were after"
	cont "something in"
	cont "RUSTBORO, too?"
	done
	
PetalburgWoodsDevonEmployeeText6:
	text "Uh-oh! It's a"
	line "crisis!"
	
	para "I can't be wasting"
	line "time!"
	done
	
NoRoomForGreatBallText:
	text "You're loaded with"
	line "items."
	
	para "I can't give you"
	line "this GREAT BALL."
	done
	
PetalburgWoodsGruntM1Text1:
	text "I was going to"
	line "ambush you, but"
	cont "you had to dawdle"
	cont "in PETALBURG WOODS"
	cont "forever, didn't"
	cont "you?"
	
	para "I got sick of"
	line "waiting, so here I"
	cont "am!"
	done
	
PetalburgWoodsGruntM1Text2:
	text "You! DEVON"
	line "RESEARCHER!"
	
	para "Hand over those"
	line "papers!"
	done
	
PetalburgWoodsGruntM1Text3:
	text "Hunh? What do you"
	line "think you're"
	cont "doing?"
	
	para "What, you're going"
	line "to protect him?"
	
	para "No one who crosses"
	line "TEAM AQUA gets"
	cont "any mercy, not"
	cont "even a kid!"
	
	para "Come on and battle"
	line "me!"
	done
	
PetalburgWoodsGruntM1Text4:
	text "Hunh? What do you"
	line "think you're"
	cont "doing?"
	
	para "What, you're going"
	line "to protect him?"
	
	para "No one who crosses"
	line "TEAM MAGMA gets"
	cont "any mercy, not"
	cont "even a kid!"
	
	para "Come on and battle"
	line "me!"
	done
	
PetalburgWoodsGruntM1WinText:
	text "You're kidding me!"
	line "You're tough!"
	done

PetalburgWoodsGruntM1LossText:
	text "You're kidding me!"
	line "You're tough!"
	done

PetalburgWoodsGruntM1Text_YouWonAqua:
	text "Grrr… You've got"
	line "some nerve"
	cont "meddling with TEAM"
	cont "AQUA!"
	
	para "Come on and"
	line "battle me again!"
	
	para "I wish I could say"
	line "that, but I'm out"
	cont "of #MON…"
	
	para "And, hey, we of"
	line "TEAM AQUA are"
	cont "are also after"
	cont "something in"
	cont "RUSTBORO."
	
	para "I'll let you go"
	line "today!"
	done
	
PetalburgWoodsGruntM1Text_YouWonMagma:
	text "Grrr… You've got"
	line "some nerve"
	cont "meddling with TEAM"
	cont "MAGMA!"
	
	para "Come on and"
	line "battle me again!"
	
	para "I wish I could say"
	line "that, but I'm out"
	cont "of #MON…"
	
	para "And, hey, we of"
	line "TEAM MAGMA are"
	cont "are also after"
	cont "something in"
	cont "RUSTBORO."
	
	para "I'll let you go"
	line "today!"
	done
	
MovementData_DevonEmployee1:
	step DOWN
	step DOWN
	step_end
	
MovementData_DevonEmployee1Right:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end
	
MovementData_DevonEmployee2:
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	turn_head UP
	step_end
	
MovementData_DevonEmployee2Right:
	step DOWN
	step RIGHT
	turn_head UP
	step_end
	
MovementData_DevonEmployee3:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
MovementData_DevonEmployee3Right:
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
MovementData_GruntM1:
	step DOWN
	step_end
	
MovementData_GruntM2:
	step DOWN
	step DOWN
	step_end
	
MovementData_GruntM2Right:
	step DOWN
	step DOWN
	step DOWN
	step_end
	
MovementData_GruntM3:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end
	
MovementData_GruntM4
	step UP
	step UP
	step_end

PetalburgWoods_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  14, 37, ROUTE_104_SOUTH, 1
	warp_event  15, 37, ROUTE_104_SOUTH, 2
	warp_event  30, 37, ROUTE_104_SOUTH, 3
	warp_event  31, 37, ROUTE_104_SOUTH, 4

	db 2 ; coord events
	coord_event  22,  19, SCENE_DEFAULT, TrainerGruntM1
	coord_event  23,  19, SCENE_DEFAULT, TrainerGruntM1

	db 6 ; bg events
	bg_event  13,  28, BGEVENT_READ, PetalburgWoodsTrainerTipSign
	bg_event  9,  4, BGEVENT_READ, PetalburgWoodsTrainerTip2Sign
	bg_event 33,  31, BGEVENT_ITEM, PetalburgWoodsHiddenPotion
	bg_event 2,  15, BGEVENT_ITEM, PetalburgWoodsHiddenPokeball
	bg_event 24,  2, BGEVENT_ITEM, PetalburgWoodsHiddenTinyMushroom1
	bg_event 34,  23, BGEVENT_ITEM, PetalburgWoodsHiddenTinyMushroom2

	db 10 ; object events
	object_event  2,  22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgWoodsParlyzHeal, EVENT_PETALBURGWOODS_PARLYZHEAL
	object_event 11,  16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PetalburgWoodsYoungsterScript, -1
	object_event  2,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgWoodsEther, EVENT_PETALBURGWOODS_ETHER
	object_event  37,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgWoodsGreatBall, EVENT_PETALBURGWOODS_GREATBALL
	object_event  31,  16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgWoodsXAttack, EVENT_PETALBURGWOODS_XATTACK
	object_event 27,  30, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PetalburgWoodsCooltrainerMScript, -1
	object_event 22,  14, SPRITE_GRUNT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, -1, 1, -1, 0, OBJECTTYPE_SCRIPT, 3, TrainerGruntM1, EVENT_BEAT_GRUNTM_1
	object_event 5,  28, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, -1, 1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherLyle, -1
	object_event 2,  10, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, -1, 1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherJames, -1
	object_event 22,  16, SPRITE_DEVON_EMPLOYEE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, -1, 1, -1, 0, OBJECTTYPE_SCRIPT, 3, TrainerGruntM1, EVENT_BEAT_GRUNTM_1

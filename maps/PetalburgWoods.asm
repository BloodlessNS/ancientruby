	const_def 2 ; object constants
	const PETALBURGWOODS_PARLYZHEAL
	const PETALBURGWOODS_YOUNGSTER
	const PETALBURGWOODS_ETHER
	const PETALBURGWOODS_GREATBALL
	const PETALBURGWOODS_XATTACK
	const PETALBURGWOODS_COOLTRAINER_M
	const PETALBURGWOODS_GRUNT

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
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, PetalburgWoodsTrainerTipText, PetalburgWoodsTrainerTipText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext PetalburgWoodsTrainerTipText
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

PetalburgWoods_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  14, 37, ROUTE_104_SOUTH, 1
	warp_event  15, 37, ROUTE_104_SOUTH, 2
	warp_event  30, 37, ROUTE_104_SOUTH, 3
	warp_event  31, 37, ROUTE_104_SOUTH, 4

	db 0 ; coord events

	db 6 ; bg events
	bg_event  13,  28, BGEVENT_READ, PetalburgWoodsTrainerTipSign
	bg_event  9,  4, BGEVENT_READ, PetalburgWoodsTrainerTip2Sign
	bg_event 33,  31, BGEVENT_ITEM, PetalburgWoodsHiddenPotion
	bg_event 2,  15, BGEVENT_ITEM, PetalburgWoodsHiddenPokeball
	bg_event 24,  2, BGEVENT_ITEM, PetalburgWoodsHiddenTinyMushroom1
	bg_event 34,  23, BGEVENT_ITEM, PetalburgWoodsHiddenTinyMushroom2

	db 7 ; object events
	object_event  2,  22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgWoodsParlyzHeal, EVENT_PETALBURGWOODS_PARLYZHEAL
	object_event 11,  16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PetalburgWoodsYoungsterScript, -1
	object_event  2,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgWoodsEther, EVENT_PETALBURGWOODS_ETHER
	object_event  37,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgWoodsGreatBall, EVENT_PETALBURGWOODS_GREATBALL
	object_event  31,  16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PetalburgWoodsXAttack, EVENT_PETALBURGWOODS_XATTACK
	object_event 27,  30, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PetalburgWoodsCooltrainerMScript, -1
	object_event 22,  16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, -1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerGruntM1, -1

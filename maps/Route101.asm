	const_def 2 ; object constants
	const ROUTE101_COOLTRAINER_M
	const ROUTE101_YOUNGSTER
	const LITTLEROOT_YOUNGSTER
	const ROUTE101_BIRCH
	const ROUTE101_BAG
	const ROUTE101_POOCHYENA

Route101_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route101_BirchAttack:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .End
	playmusic MUSIC_HELP
	opentext
	writetext BirchHelpText
	waitbutton
	closetext
	variablesprite SPRITE_WALLY, SPRITE_POOCHYENA
	special LoadUsedSpritesGFX
	checkcode VAR_XCOORD
	ifless 11, LessSteps
	applymovement PLAYER, Movement_BirchAttack
	follow ROUTE101_BIRCH, ROUTE101_POOCHYENA
	applymovement ROUTE101_BIRCH, Momvement_BirchRun
	stopfollow
	turnobject ROUTE101_BIRCH, RIGHT
	opentext
	writetext BirchHelpText2
	waitbutton
	closetext
.End
	end
	
LessSteps:
	applymovement PLAYER, Movement_BirchAttackShorter
	follow ROUTE101_BIRCH, ROUTE101_POOCHYENA
	applymovement ROUTE101_BIRCH, Momvement_BirchRun
	stopfollow
	turnobject ROUTE101_BIRCH, RIGHT
	opentext
	writetext BirchHelpText2
	waitbutton
	closetext
	end
	
Route101_BirchAttack2:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .End2
	opentext
	writetext BirchHelpText3
	waitbutton
	closetext
	applymovement PLAYER, Movement_BirchAttack2
.End2
	end
	
Route101_BirchAttack3:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .End3
	opentext
	writetext BirchHelpText3
	waitbutton
	closetext
	applymovement PLAYER, Movement_BirchAttack3
.End3
	end
	
Route101BirchScript:
	opentext
.loop
	writetext BirchInTroubleText
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .treecko
	ifequal 2, .torchic
	ifequal 3, .mudkip
	jump .BirchInTrouble_cancel
	
.BirchInTrouble_cancel
	writetext BirchHelpText3
	waitbutton
	jump .loop

.treecko
	writetext ThisPokemonText
	yesorno
	iffalse .loop
	pokenamemem TREECKO, MEM_BUFFER_0
	givepoke TREECKO, 5
	setevent EVENT_GOT_TREECKO_FROM_ELM
	playsound SFX_CAUGHT_MON
	waitsfx
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	closetext
	jump .ElmAttackFinish

.torchic
	writetext ThisPokemonText
	yesorno
	iffalse .loop
	pokenamemem TORCHIC, MEM_BUFFER_0
	givepoke TORCHIC, 5
	setevent EVENT_GOT_TORCHIC_FROM_ELM
	playsound SFX_CAUGHT_MON
	waitsfx
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	closetext
	jump .ElmAttackFinish

.mudkip
	writetext ThisPokemonText
	yesorno
	iffalse .loop
	pokenamemem MUDKIP, MEM_BUFFER_0
	givepoke MUDKIP, 5
	setevent EVENT_GOT_MUDKIP_FROM_ELM
	playsound SFX_CAUGHT_MON
	waitsfx
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	closetext
	jump .ElmAttackFinish
	
.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "TREECKO@"
	db "TORCHIC@"
	db "MUDKIP@"
	db "CANCEL@"
	
.ElmAttackFinish:
	winlosstext PoochyenaWinText, PoochyenaLossText
	setlasttalked ROUTE101_BIRCH
	cry POOCHYENA
	loadwildmon POOCHYENA, 2
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	iftrue .Aftervictorious
	jump .AfterYourDefeat
	
.Aftervictorious:
	playmapmusic
	disappear ROUTE101_POOCHYENA
	setmapscene ELMS_LAB, SCENE_ELMSLAB_CANT_LEAVE
	applymovement ROUTE101_BIRCH, Movement_BirchAttack4
	opentext
	turnobject PLAYER, LEFT
	writetext BirchSavedText
	waitbutton
	closetext
	clearevent EVENT_AFTER_ATTACK
	warp ELMS_LAB, 4, 3
	end
	
.AfterYourDefeat:
	playmapmusic
	disappear ROUTE101_POOCHYENA
	setmapscene ELMS_LAB, SCENE_ELMSLAB_CANT_LEAVE
	applymovement ROUTE101_BIRCH, Movement_BirchAttack4
	opentext
	turnobject PLAYER, LEFT
	writetext BirchSavedText
	waitbutton
	closetext
	clearevent EVENT_AFTER_ATTACK
	warp ELMS_LAB, 4, 3
	end
	
Route101CooltrainerMScript:
	jumptextfaceplayer Text_TallGrass
	
Route101YoungsterScript:
	jumptextfaceplayer Text_PokeCentreTip
	
Route101Sign:
	jumptext Route101SignText
	
BirchHelpText:
	text "H-help me!"
	done
	
BirchHelpText2:
	text "Hello! you over"
	line "there!"
	
	para "Please! Help!"
	
	para "In my bag there's"
	line "a # BALL!"
	done
	
BirchHelpText3:
	text "Wh-Where are you"
	line "going?!"
	
	para "Don't leave me"
	line "like this!"
	done
	
BirchInTroubleText:
	text "PROF. BIRCH is"
	line "in trouble!"
	
	para "Release a #MON"
	line "and rescue him!"
	done
	
ThisPokemonText:
	text "Do you choose this"
	line "#MON?"
	done
	
BirchSavedText:
	text "PROF. BIRCH: Whew…"
	
	para "I was in the tall"
	line "grass studying"
	cont "wild #MON when"
	cont "I was jumped."
	
	para "You saved me."
	line "Thanks a lot!"
	
	para "Oh?"
	
	para "Hi, you're"
	line "<PLAYER>!"
	
	para "This is not the"
	line "place to chat, so"
	cont "come by my #MON"
	cont "LAB, later, okay?"
	done
	
Text_TallGrass:
	text "Wild #MON will"
	line "jump out out at"
	cont "you in tall grass."

	para "If you want to"
	line "catch #MON,"
	cont "you have to go"
	cont "into the tall"
	cont "grass and search."
	done
	
Text_PokeCentreTip:
	text "If #MON get"
	line "tired, take them"
	cont "to a #MON"
	cont "CENTRE."
	
	para "There's a #MON"
	line "CENTRE in OLDALE"
	cont "TOWN right close"
	cont "by."
	done
	
PoochyenaWinText:
	text "POOCHYENA FLED."
	done
	
PoochyenaLossText:
	text "POOCHYENA FLED."
	done
	
Route101SignText:
	text "ROUTE 101"
	line "↑ OLDALE TOWN"
	done
	
Movement_BirchAttack:
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
Movement_BirchAttackShorter:
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end
	
Momvement_BirchRun:
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end
	
Movement_BirchAttack2:
	step UP
	step_end
	
Movement_BirchAttack3:
	step RIGHT
	step_end
	
Movement_BirchAttack4:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end

Route101_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 7 ; coord events
	coord_event  11,  19, SCENE_DEFAULT, Route101_BirchAttack
	coord_event  10,  19, SCENE_DEFAULT, Route101_BirchAttack
	coord_event  10,  18, SCENE_DEFAULT, Route101_BirchAttack2
	coord_event  11,  18, SCENE_DEFAULT, Route101_BirchAttack2
	coord_event  6,  15, SCENE_DEFAULT, Route101_BirchAttack3
	coord_event  6,  16, SCENE_DEFAULT, Route101_BirchAttack3
	coord_event  6,  17, SCENE_DEFAULT, Route101_BirchAttack3

	db 1 ; bg events
	bg_event 5,  9, BGEVENT_READ, Route101Sign
	
	db 6 ; object events
	object_event  10,  21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LittlerootTownYoungsterScript, EVENT_BIRCH_ATTACK
	object_event 2,  14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, -1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route101CooltrainerMScript, EVENT_AFTER_ATTACK
	object_event 15,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, -1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route101YoungsterScript, -1
	object_event 4,  13, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route101BirchScript, EVENT_GOT_A_POKEMON_FROM_ELM
	object_event 7,  14, SPRITE_BAG, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, -1, OBJECTTYPE_SCRIPT, 0, Route101BirchScript, EVENT_GOT_A_POKEMON_FROM_ELM
	object_event 5,  13, SPRITE_WALLY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, Route101BirchScript, EVENT_GOT_A_POKEMON_FROM_ELM
	
	const_def 2 ; object constants
	const PLAYERSHOUSE2F_CONSOLE
	const PLAYERSHOUSE2F_DOLL_1
	const PLAYERSHOUSE2F_DOLL_2
	const PLAYERSHOUSE2F_BIG_DOLL
	const PLAYERSHOUSE2F_MOM

PlayersHouse2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SetSpawn
	
.SetSpawn:
	special ToggleMaptileDecorations
	return

	db 0, 0, 0 ; filler

Doll1Script:
	describedecoration DECODESC_LEFT_DOLL

Doll2Script:
	describedecoration DECODESC_RIGHT_DOLL

BigDollScript:
	describedecoration DECODESC_BIG_DOLL

GameConsoleScript:
	describedecoration DECODESC_CONSOLE

PlayersHousePosterScript:
	conditional_event EVENT_PLAYERS_ROOM_POSTER, .Script

.Script:
	describedecoration DECODESC_POSTER
	
PlayersClockScript:
	checkevent EVENT_CLOCK_SET
	iftrue .Done
	blackoutmod PLAYERS_HOUSE_2F
	opentext
	writetext ClockSet
	appear PLAYERSHOUSE2F_MOM
	setevent EVENT_CLOCK_SET
	setevent EVENT_DAD_ON_TV
	waitbutton
	applymovement PLAYERSHOUSE2F_MOM, WalkToPlayerMovement
	turnobject PLAYER, RIGHT
	writetext MomText
	waitbutton
	closetext
	applymovement PLAYERSHOUSE2F_MOM, MomLeaveMovement
	disappear PLAYERSHOUSE2F_MOM
	closetext
.Done
	end

PlayersHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayersRadioText1
	pause 45
	writetext PlayersRadioText2
	pause 45
	writetext PlayersRadioText3
	pause 45
	musicfadeout MUSIC_LITTLEROOT_TOWN, 16
	writetext PlayersRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.NormalRadio:
	jumpstd radio1

.AbbreviatedRadio:
	opentext
	writetext PlayersRadioText4
	pause 45
	closetext
	end

PlayersHousePCScript:
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, 0, 0
	end
	
WalkToPlayerMovement:
	step DOWN
	step LEFT
	step_end
	
MomLeaveMovement:
	step RIGHT
	step UP
	step_end

PlayersRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

PlayersRadioText2:
	text "#MON CHANNEL!"
	done

PlayersRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

PlayersRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done
	
PlayersGameCubeScript:
	jumptext PlayersGameCubeScriptText
	
PlayersTVScript:
	jumptext PlayersTVScriptText
	
PlayersGameCubeScriptText:
	text "It's a Nintendo"
	line "GameCube."

	para "A Gameboy Advance"
	line "is connected to"
	cont "serve as the"
	cont "controller."
	done
	
PlayersTVScriptText:
	text "Dad might like"
	line "this program..."
	
	para "better get going!"
	done
	
ClockSet:
	text "CLOCK SET"
	done
	
MomText:
	text "MOM: <PLAYER>, how"
	line "do you like your"
	cont "new room?"
	
	para "Good! Everything's"
	line "put away neatly!"
	
	para "They finished"
	line "moving everything"
	cont "in downstairs"
	cont "too."
	
	para "#MON movers are"
	line "so convenient!"
	
	para "Oh, you should"
	line "make sure that"
	cont "everything's all"
	cont "there on your"
	cont "desk."
	done

PlayersHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, PLAYERS_HOUSE_1F, 3

	db 0 ; coord events

	db 6 ; bg events
	bg_event  0,  1, BGEVENT_UP, PlayersHousePCScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouseRadioScript
	bg_event  2,  0, BGEVENT_IFSET, PlayersHousePosterScript
	bg_event  3,  1, BGEVENT_READ, PlayersGameCubeScript
	bg_event  4,  1, BGEVENT_READ, PlayersTVScript
	bg_event  5,  0, BGEVENT_READ, PlayersClockScript

	db 5 ; object events
	object_event  4,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GameConsoleScript, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	object_event  4,  4, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll1Script, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	object_event  5,  4, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll2Script, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	object_event  0,  1, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BigDollScript, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	object_event  7,  0, SPRITE_MOM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1

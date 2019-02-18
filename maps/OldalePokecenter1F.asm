	const_def 2 ; object constants
	const OLDALEPOKECENTER1F_NURSE

OldalePokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OldalePokecenter1FNurseScript:
	jumpstd pokecenternurse
	
OldalePokecentreLassScript:
	jumptextfaceplayer OldalePokecentreLassText
	
OldalePokecentreGentlemanScript:
	jumptextfaceplayer OldalePokecentreGentlemanText
	
OldalePokecentreFisherScript:
	jumptextfaceplayer OldalePokecentreFisherText
	
OldalePokecentreLassText:
	text "The #MON CABLE"
	line "CLUB on the second"
	cont "second floor was"
	cont "built recently."
	
	para "I traded #MON"
	line "right away."
	done
	
OldalePokecentreGentlemanText:
	text "That PC in the"
	line "corner there is"
	cont "for any #MON"
	cont "TRAINER to use."
	
	para "Naturally, that"
	line "means you're"
	cont "welcome to use it,"
	cont "too."
	done
	
OldalePokecentreFisherText:
	text "#MON CENTERS"
	line "are great!"
	
	para "You can use their"
	line "services as much"
	cont "as you like, and"
	cont "it's all for free."
	
	para "You never have to"
	line "worry!"
	done

OldalePokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4,  7, OLDALE_TOWN, 1
	warp_event  5,  7, OLDALE_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldalePokecenter1FNurseScript, -1
	object_event  1,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldalePokecentreLassScript, -1
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldalePokecentreGentlemanScript, -1
	object_event  6,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OldalePokecentreFisherScript, -1
	
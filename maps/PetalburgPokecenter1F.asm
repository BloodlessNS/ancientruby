	const_def 2 ; object constants
	const PETALBURGPOKECENTER1F_NURSE

PetalburgPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PetalburgPokecenter1FNurseScript:
	jumpstd pokecenternurse
	
PetalburgPokecentreLassScript:
	checkevent EVENT_GOT_TORCHIC_FROM_ELM
	iftrue .torchictext
	checkevent EVENT_GOT_MUDKIP_FROM_ELM
	iftrue .mudkiptext
	jumptextfaceplayer PetalburgPokecentreLassText
.torchictext
	jumptextfaceplayer PetalburgPokecentreLassText2
.mudkiptext
	jumptextfaceplayer PetalburgPokecentreLassText3
	
PetalburgPokecentreYoungsterScript:
	jumptextfaceplayer PetalburgPokecentreYoungsterText
	
PetalburgPokecentreFisherScript:
	jumptextfaceplayer PetalburgPokecentreFisherText
	
PetalburgPokecentreLassText:
	text "There a many types"
	line "of #MON."
	
	para "All types have"
	line "their strengths"
	cont "and weaknesses"
	cont "against other"
	cont "types."
	
	para "Depending on the"
	line "types of #MON,"
	cont "a battle could be"
	cont "easy or hard."
	
	para "For example,"
	line "TREECKO is a grass"
	cont "type."
	
	para "It's strong"
	line "against the WATER"
	cont "and GROUND types."
	
	para "But, it's weak"
	line "against FIRE-TYPE"
	cont "#MON." 
	done
	
PetalburgPokecentreLassText2:
	text "There a many types"
	line "of #MON."
	
	para "All types have"
	line "their strengths"
	cont "and weaknesses"
	cont "against other"
	cont "types."
	
	para "Depending on the"
	line "types of #MON,"
	cont "a battle could be"
	cont "easy or hard."
	
	para "For example,"
	line "TORCHIC is a fire"
	cont "type."
	
	para "It's strong"
	line "against the GRASS"
	cont "and ICE types."
	
	para "But, it's weak"
	line "against WATER-TYPE"
	cont "#MON." 
	done
	
PetalburgPokecentreLassText3:
	text "There a many types"
	line "of #MON."
	
	para "All types have"
	line "their strengths"
	cont "and weaknesses"
	cont "against other"
	cont "types."
	
	para "Depending on the"
	line "types of #MON,"
	cont "a battle could be"
	cont "easy or hard."
	
	para "For example,"
	line "MUDKIP is a water"
	cont "type."
	
	para "It's strong"
	line "against the FIRE"
	cont "and ROCK types."
	
	para "But, it's weak"
	line "against GRASS-TYPE"
	cont "#MON." 
	done
	
PetalburgPokecentreYoungsterText:
	text "When my #MON"
	line "ate an ORAN BERRY,"
	cont "it regained HP!"
	done
	
PetalburgPokecentreFisherText:
	text "That PC-based"
	line "#MON storage"
	cont "system…"
	
	para "Whoever made it"
	line "must be some kind"
	cont "of a scientific"
	cont "wizard!"
	done

PetalburgPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4,  7, PETALBURG_CITY, 3
	warp_event  5,  7, PETALBURG_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PetalburgPokecenter1FNurseScript, -1
	object_event  3,  3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, -1, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PetalburgPokecentreLassScript, -1
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, -1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PetalburgPokecentreYoungsterScript, -1
	object_event  1,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PetalburgPokecentreFisherScript, -1
	
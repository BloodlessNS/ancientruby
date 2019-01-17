	db WINGULL ; 090

	db  40,  30, 30,  85,  55,  30
	;   hp  atk  def  spd  sat  sdf

	db WATER, FLYING ; type
	db 190 ; catch rate
	db 64 ; base exp
	db PEARL, BIG_PEARL ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/wingull/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SNORE, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, RETURN, DOUBLE_TEAM, SWIFT, REST, ATTRACT, ICE_BEAM, FLY, THIEF, STEEL_WING
	; end

	db SURSKIT ; 046

	db  40,  30,  32,  65,  50,  52
	;   hp  atk  def  spd  sat  sdf

	db BUG, WATER ; type
	db 200 ; catch rate
	db 63 ; base exp
	db TINYMUSHROOM, BIG_MUSHROOM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 15 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/surskit/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, ICE_BEAM, BLIZZARD, PROTECT, GIGA_DRAIN, RAIN_DANCE, FRUSTRATION, SOLARBEAM, RETURN, SHADOW_BALL, DOUBLE_TEAM, REST, ATTRACT, THIEF, FURY_CUTTER, FLASH
	; end

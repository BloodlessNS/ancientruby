_Squirtbottle:
	ld hl, .SquirtbottleScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret

.SquirtbottleScript:
	reloadmappart
	special UpdateTimePals
	callasm .CheckCanUseSquirtbottle
	iffalse .NothingHappenedScript

.NothingHappenedScript:
	jumptext .NothingHappenedText

.NothingHappenedText:
	; sprinkled water. But nothing happened…
	text_jump UnknownText_0x1c0b3b
	db "@"

.CheckCanUseSquirtbottle:
	ld a, [wMapGroup]
	cp GROUP_ROUTE_101
	jr nz, .nope

	ld a, [wMapNumber]
	cp MAP_ROUTE_101
	jr nz, .nope

	farcall GetFacingObject
	jr c, .nope

	ld a, d
	cp SPRITEMOVEDATA_SUDOWOODO
	jr nz, .nope

	ld a, 1
	ld [wScriptVar], a
	ret

.nope
	xor a
	ld [wScriptVar], a
	ret

; These functions deal with miscellaneous statistics
; which were used for Trainer Rankings in Pokémon News.

; Copies certain values at the time the player enters the Hall of Fame.
StubbedTrainerRankings_HallOfFame2::
	ret
	ld a, BANK(sTrainerRankingGameTimeHOF)
	call GetSRAMBank

	ld hl, wGameTimeHours
	ld de, sTrainerRankingGameTimeHOF
	ld bc, 4
	call CopyBytes

	ld hl, sTrainerRankingStepCount
	ld de, sTrainerRankingStepCountHOF
	ld bc, 4
	call CopyBytes

	; sTrainerRankingHealings is only a 3-byte value.
	; One extraneous byte is copied from sTrainerRankingMysteryGift.
	ld hl, sTrainerRankingHealings
	ld de, sTrainerRankingHealingsHOF
	ld bc, 4
	call CopyBytes

	ld hl, sTrainerRankingBattles
	ld de, sTrainerRankingBattlesHOF
	ld bc, 3
	call CopyBytes

	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret

StubbedTrainerRankings_MagikarpLength:
	ret
	ld a, BANK(sTrainerRankingLongestMagikarp)
	call GetSRAMBank
	ld de, wBuffer1
	ld hl, sTrainerRankingLongestMagikarp

	; Is this Magikarp the longest measured?
	ld a, [de]
	cp [hl]
	jr z, .isLowByteHigher
	jr nc, .newRecordLongest
	jr .checkShortest

.isLowByteHigher
	inc hl
	inc de
	ld a, [de]
	cp [hl]
	dec hl
	dec de
	jr c, .checkShortest

.newRecordLongest
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	dec de
	ld [hl], a

.checkShortest
	; First, check if the record for shortest Magikarp is 0.
	; This seems unnecessary, because the value is initialized to 100.0 cm.
	ld hl, sTrainerRankingShortestMagikarp
	ld a, [hli]
	or [hl]
	dec hl
	jr z, .newRecordShortest

	; Now check if this Magikarp is the shortest
	ld a, [de]
	cp [hl]
	jr z, .isLowByteLower
	jr c, .newRecordShortest
	jr .done

.isLowByteLower
	inc hl
	inc de
	ld a, [de]
	cp [hl]
	jr nc, .done
	dec hl
	dec de

.newRecordShortest
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a

.done
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret

StubbedTrainerRankings_BugContestScore:
	ret
	ld a, BANK(sTrainerRankingBugContestScore)
	call GetSRAMBank
	ld a, [hProduct]
	ld hl, sTrainerRankingBugContestScore
	cp [hl]
	jr z, .isLowByteHigher
	jr nc, .newHighScore
	jr .done

.isLowByteHigher
	inc hl
	ld a, [hMultiplicand]
	cp [hl]
	jr c, .done
	dec hl

.newHighScore
	ld a, [hProduct]
	ld [hli], a
	ld a, [hMultiplicand]
	ld [hl], a

.done
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret

StubbedTrainerRankings_AddToSlotsWinStreak:
	ret
	ld a, BANK(sTrainerRankingCurrentSlotsStreak)
	call GetSRAMBank

	; Increment the current streak
	ld hl, sTrainerRankingCurrentSlotsStreak + 1
	inc [hl]
	jr nz, .noCarry
	dec hl
	inc [hl]
	inc hl

.noCarry
	dec hl
	; Now check if this is a new record for longest streak
	ld a, [sTrainerRankingLongestSlotsStreak]
	cp [hl]
	jr z, .isLowByteHigher
	jr c, .newRecordStreak
	jr .done

.isLowByteHigher
	inc hl
	ld a, [sTrainerRankingLongestSlotsStreak + 1]
	cp [hl]
	jr nc, .done
	dec hl

.newRecordStreak
	ld a, [hli]
	ld [sTrainerRankingLongestSlotsStreak], a
	ld a, [hl]
	ld [sTrainerRankingLongestSlotsStreak + 1], a

.done
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret

StubbedTrainerRankings_EndSlotsWinStreak:
	ret
	ld a, BANK(sTrainerRankingCurrentSlotsStreak)
	call GetSRAMBank
	ld hl, sTrainerRankingCurrentSlotsStreak
	xor a
	ld [hli], a
	ld [hl], a
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret

StubbedTrainerRankings_AddToSlotsPayouts:
	ret
	ld a, BANK(sTrainerRankingTotalSlotsPayouts)
	call GetSRAMBank
	ld hl, sTrainerRankingTotalSlotsPayouts + 3
	ld a, e
	add [hl]
	ld [hld], a
	ld a, d
	adc [hl]
	ld [hld], a
	jr nc, .done
	inc [hl]
	jr nz, .done
	dec hl
	inc [hl]
	jr nz, .done
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

.done
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret

StubbedTrainerRankings_AddToBattlePayouts:
	ret
	ld a, BANK(sTrainerRankingTotalBattlePayouts)
	call GetSRAMBank
	ld hl, sTrainerRankingTotalBattlePayouts + 3
	ld a, [bc]
	dec bc
	add [hl]
	ld [hld], a
	ld a, [bc]
	dec bc
	adc [hl]
	ld [hld], a
	ld a, [bc]
	adc [hl]
	ld [hld], a
	jr nc, .done
	inc [hl]
	jr nz, .done
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

.done
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret

StubbedTrainerRankings_StepCount:
	ret
	ld hl, sTrainerRankingStepCount
	jp StubbedTrainerRankings_Increment4Byte

Unreferenced_StubbedTrainerRankings_BattleTowerWins:
	ret
	ld a, $5
	call GetSRAMBank
	ld a, [$aa8d]
	and a
	call CloseSRAM
	ret nz
	ld hl, sTrainerRankingBattleTowerWins
	jp StubbedTrainerRankings_Increment2Byte

StubbedTrainerRankings_TMsHMsTaught:
	ret
	ld hl, sTrainerRankingTMsHMsTaught
	jp StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_Battles:
	ret
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL ; Exclude the Dude’s tutorial battle
	ret z
	ld hl, sTrainerRankingBattles
	jp StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_WildBattles:
	ret
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL ; Exclude the Dude’s tutorial battle
	ret z
	ld hl, sTrainerRankingWildBattles
	jp StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_TrainerBattles:
	ret
	ld hl, sTrainerRankingTrainerBattles
	jp StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_Unused1:
	ret
	ld hl, sTrainerRankingUnused1
	jp StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_HallOfFame::
	ret
	ld hl, sTrainerRankingHOFEntries
	jp StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_WildMonsCaught:
	ret
	ld hl, sTrainerRankingWildMonsCaught
	jp StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_HookedEncounters:
	ret
	ld hl, sTrainerRankingHookedEncounters
	jp StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_EggsHatched:
	ret
	ld hl, sTrainerRankingEggsHatched
	jp StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_MonsEvolved:
	ret
	ld hl, sTrainerRankingMonsEvolved
	jp StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_FruitPicked:
	ret
	ld hl, sTrainerRankingFruitPicked
	jp StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_Healings:
	ret
	ld hl, sTrainerRankingHealings
	jp StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_MysteryGift:
	ret
	ld hl, sTrainerRankingMysteryGift
	jr StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_Trades:
	ret
	ld hl, sTrainerRankingTrades
	jr StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_Fly:
	ret
	ld hl, sTrainerRankingFly
	jr StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_Surf:
	ret
	ld hl, sTrainerRankingSurf
	jr StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_Waterfall:
	ret
	ld hl, sTrainerRankingWaterfall
	jr StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_WhiteOuts:
	ret
	ld hl, sTrainerRankingWhiteOuts
	jr StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_LuckyNumberShow:
	ret
	ld hl, sTrainerRankingLuckyNumberShow
	jr StubbedTrainerRankings_Increment2Byte

StubbedTrainerRankings_PhoneCalls:
	ret
	ld hl, sTrainerRankingPhoneCalls
	jr StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_Unused2:
	ret
	ld hl, sTrainerRankingUnused2
	jr StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_LinkBattles:
	ret
	ld hl, sTrainerRankingLinkBattles
	jr StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_Splash:
	ret
	; Only counts if it’s the player’s turn
	ld a, [hBattleTurn]
	and a
	ret nz
	ld hl, sTrainerRankingSplash
	jr StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_TreeEncounters:
	ret
	ld hl, sTrainerRankingTreeEncounters
	jr StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_Unused3:
	ret
	ld hl, sTrainerRankingUnused3
	jr StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_ColosseumWins: ; win
	ret
	ld hl, sTrainerRankingColosseumWins
	jr StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_ColosseumLosses: ; lose
	ret
	ld hl, sTrainerRankingColosseumLosses
	jr StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_ColosseumDraws: ; draw
	ret
	ld hl, sTrainerRankingColosseumDraws
	jr StubbedTrainerRankings_Increment3Byte

; Counts uses of both Selfdestruct and Explosion.
StubbedTrainerRankings_Selfdestruct:
	ret
	; Only counts if it’s the player’s turn
	ld a, [hBattleTurn]
	and a
	ret nz
	ld hl, sTrainerRankingSelfdestruct
	jr StubbedTrainerRankings_Increment3Byte

StubbedTrainerRankings_Increment4Byte:
	push bc
	ld bc, 3
	jr StubbedTrainerRankings_Increment

StubbedTrainerRankings_Increment3Byte:
	push bc
	ld bc, 2
	jr StubbedTrainerRankings_Increment

StubbedTrainerRankings_Increment2Byte:
	push bc
	ld bc, 1
	jr StubbedTrainerRankings_Increment

; unused
StubbedTrainerRankings_Increment1Byte:
	push bc
	ld bc, 0

; Increments a big-endian value of bc + 1 bytes at hl
StubbedTrainerRankings_Increment:
	ld a, BANK(sTrainerRankings)
	call GetSRAMBank
	push hl
	push de
	ld e, c
	inc e
.asm_106136
	ld a, [hli]
	inc a
	jr nz, .asm_10613d
	dec e
	jr nz, .asm_106136

.asm_10613d
	pop de
	pop hl
	jr z, .asm_10614d
	add hl, bc
.asm_106142
	inc [hl]
	jr nz, .asm_10614d
	ld a, c
	and a
	jr z, .asm_10614d
	dec hl
	dec c
	jr .asm_106142

.asm_10614d
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	pop bc
	ret

; Used when SRAM bank 5 isn’t already loaded — what’s the point of this?
UpdateTrainerRankingsChecksum2:
	ret
	ld a, BANK(sTrainerRankings)
	call GetSRAMBank
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	ret

UpdateTrainerRankingsChecksum:
	push de
	call CalculateTrainerRankingsChecksum
	ld hl, sTrainerRankingsChecksum
	ld [hl], d
	inc hl
	ld [hl], e
	pop de
	ret

CalculateTrainerRankingsChecksum:
	push bc
	ld hl, sTrainerRankings
	ld bc, sTrainerRankingsChecksum - sTrainerRankings
	xor a
	ld de, 0
.asm_106179
	ld a, e
	add [hl]
	ld e, a
	jr nc, .asm_10617f
	inc d

.asm_10617f
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .asm_106179
	pop bc
	ret

BackupMobileEventIndex:
	ld a, BANK(sMobileEventIndex)
	call GetSRAMBank
	ld a, [sMobileEventIndex]
	push af
	ld a, BANK(sMobileEventIndexBackup)
	call GetSRAMBank
	pop af
	ld [sMobileEventIndexBackup], a
	call CloseSRAM
	ret

RestoreMobileEventIndex:
	ld a, BANK(sMobileEventIndexBackup)
	call GetSRAMBank
	ld a, [sMobileEventIndexBackup]
	push af
	ld a, BANK(sMobileEventIndex)
	call GetSRAMBank
	pop af
	ld [sMobileEventIndex], a
	call CloseSRAM
	ret

Unreferenced_VerifyTrainerRankingsChecksum:
	call CalculateTrainerRankingsChecksum
	ld hl, sTrainerRankingsChecksum
	ld a, d
	cp [hl]
	ret nz
	inc hl
	ld a, e
	cp [hl]
	ret

DeleteMobileEventIndex:
	ld a, BANK(sMobileEventIndex)
	call GetSRAMBank
	xor a
	ld [sMobileEventIndex], a
	call CloseSRAM
	ret

; Used in the Japanese version to initialize Trainer Rankings data
; for a new save file. Unreferenced in the English version.
InitializeTrainerRankings:
	ld hl, sTrainerRankings
	ld bc, sTrainerRankingsEnd - sTrainerRankings
	xor a
	call ByteFill

	; Initialize the shortest Magikarp to 100.0 cm
	ld hl, sTrainerRankingShortestMagikarp
	ld a, $3
	ld [hli], a
	ld [hl], $e8

	call UpdateTrainerRankingsChecksum
	ld hl, sTrainerRankings
	ld de, sTrainerRankingsBackup
	ld bc, sTrainerRankingsEnd - sTrainerRankings
	call CopyBytes
	ret

_MobilePrintNum::
; Supports signed 31-bit integers (up to 10 digits)
; b: Bits 0-4 = # bytes
;    Bit 7 = set if negative
; c: Number of digits
; de: highest byte of number to convert
; hl: where to print the converted string
	push bc
	xor a
	ld [hPrintNum1], a
	ld [hPrintNum2], a
	ld [hPrintNum3], a
	ld a, b
	and $f
	cp $1
	jr z, .one_byte
	cp $2
	jr z, .two_bytes
	cp $3
	jr z, .three_bytes
; four bytes
	ld a, [de]
	ld [hPrintNum1], a
	inc de

.three_bytes
	ld a, [de]
	ld [hPrintNum2], a
	inc de

.two_bytes
	ld a, [de]
	ld [hPrintNum3], a
	inc de

.one_byte
	ld a, [de]
	ld [hPrintNum4], a
	inc de

	push de
	xor a
	ld [hPrintNum9], a
	ld a, b
	ld [hPrintNum10], a
	ld a, c
	cp 2
	jr z, .two_digits
	ld de, ._2
	cp 3
	jr z, .three_to_nine_digits
	ld de, ._3
	cp 4
	jr z, .three_to_nine_digits
	ld de, ._4
	cp 5
	jr z, .three_to_nine_digits
	ld de, ._5
	cp 6
	jr z, .three_to_nine_digits
	ld de, ._6
	cp 7
	jr z, .three_to_nine_digits
	ld de, ._7
	cp 8
	jr z, .three_to_nine_digits
	ld de, ._8
	cp 9
	jr z, .three_to_nine_digits
	ld de, ._9

.three_to_nine_digits
	inc de
	inc de
	inc de
	dec a
	dec a

.digit_loop
	push af
	call .Function1062b2
	call .Function1062ff
rept 4
	inc de
endr
	pop af
	dec a
	jr nz, .digit_loop

.two_digits
	ld c, 0
	ld a, [hPrintNum4]
.mod_ten_loop
	cp 10
	jr c, .simple_divide_done
	sub 10
	inc c
	jr .mod_ten_loop

.simple_divide_done
	ld b, a
	ld a, [hPrintNum9]
	or c
	ld [hPrintNum9], a
	jr nz, .create_digit
	call .LoadMinusTenIfNegative
	jr .done

.create_digit
	ld a, "0"
	add c
	ld [hl], a

.done
	call .Function1062ff
	ld a, "0"
	add b
	ld [hli], a
	pop de
	pop bc
	ret

._9	dd 1000000000
._8	dd 100000000
._7	dd 10000000
._6	dd 1000000
._5	dd 100000
._4	dd 10000
._3	dd 1000
._2	dd 100

.Function1062b2:
	ld c, $0
.asm_1062b4
	ld a, [de]
	dec de
	ld b, a
	ld a, [hPrintNum4]
	sub b
	ld [hPrintNum8], a
	ld a, [de]
	dec de
	ld b, a
	ld a, [hPrintNum3]
	sbc b
	ld [hPrintNum7], a
	ld a, [de]
	dec de
	ld b, a
	ld a, [hPrintNum2]
	sbc b
	ld [hPrintNum6], a
	ld a, [de]
	inc de
	inc de
	inc de
	ld b, a
	ld a, [hPrintNum1]
	sbc b
	ld [hPrintNum5], a
	jr c, .asm_1062eb
	ld a, [hPrintNum5]
	ld [hPrintNum1], a
	ld a, [hPrintNum6]
	ld [hPrintNum2], a
	ld a, [hPrintNum7]
	ld [hPrintNum3], a
	ld a, [hPrintNum8]
	ld [hPrintNum4], a
	inc c
	jr .asm_1062b4

.asm_1062eb
	ld a, [hPrintNum9]
	or c
	jr z, .LoadMinusTenIfNegative
	ld a, -10
	add c
	ld [hl], a
	ld [hPrintNum9], a
	ret

.LoadMinusTenIfNegative:
	ld a, [hPrintNum10]
	bit 7, a
	ret z

	ld [hl], -10
	ret

.Function1062ff:
	ld a, [hPrintNum10]
	bit 7, a
	jr nz, .asm_10630d
	bit 6, a
	jr z, .asm_10630d
	ld a, [hPrintNum9]
	and a
	ret z

.asm_10630d
	inc hl
	ret

; functions related to the cable club and various NPC scripts referencing communications

Mobile_DummyReturnFalse:
	xor a
	ld [wScriptVar], a
	ret

Stubbed_Function106314:
	ret
	ld a, $4
	call GetSRAMBank
	ld a, c
	cpl
	ld [$b000], a
	call CloseSRAM
	ld a, $7
	call GetSRAMBank
	ld a, c
	ld [$a800], a
	call CloseSRAM
	ret

Mobile_AlwaysReturnNotCarry:
	or a
	ret

Function106331:
; called by Mobile_DummyReturnFalse in Crystal-J
	; check ~[4:b000] == [7:a800]
	ld a, $4
	call GetSRAMBank
	ld a, [$b000]
	cpl
	ld b, a
	call CloseSRAM
	ld a, $7
	call GetSRAMBank
	ld a, [$a800]
	ld c, a
	call CloseSRAM
	ld a, c
	cp b
	jr nz, .nope

	; check [7:a800] != 0
	and a
	jr z, .nope

	; check !([7:a800] & %01110000)
	and %10001111
	cp c
	jr nz, .nope

	ld c, a
	scf
	ret

.nope
	xor a
	ld c, a
	ret

Function10635c:
	ld a, [wMobileCommsJumptableIndex]
	bit 7, a
	ret nz
	ld a, [wMobileCommsJumptableIndex]
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable:
	dw .init
	dw Function106392
	dw Function1063cc
	dw Function1063d8
	dw Function1063e5
	dw Function1063f3
	dw Function106403
	dw Function106442
	dw Function106453

.init:
	ld de, wcd30
	ld hl, $41
	ld bc, $41
	ld a, $40
	call Function3e32
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function106392:
	xor a
	ld [wcf64], a
	ld a, [wc821]
	bit 1, a
	jr nz, .asm_1063a2
	bit 0, a
	jr z, .asm_1063bf
	ret

.asm_1063a2
	call Mobile_AlwaysReturnNotCarry
	ld a, c
	and a
	jr nz, .asm_1063b4
	ld a, $b
	ld [wcf64], a
	ld a, $7
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_1063b4
	ld a, $7
	ld [wcf64], a
	ld a, $7
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_1063bf
	ld a, $1
	ld [wcf64], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function1063cc:
	ld a, $78
	ld [wcd42], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a

Function1063d8:
	ld hl, wcd42
	dec [hl]
	ret nz
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function1063e5:
	ld a, [wcf64]
	cp $3
	ret nz
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function1063f3:
	ld de, wcd31
	ld a, $32
	call Function3e32
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function106403:
	ld a, [wc821]
	bit 1, a
	jr nz, .asm_106426
	bit 0, a
	jr z, .asm_10640f
	ret

.asm_10640f
	ld a, [wcd31]
	and $80
	ld c, a
	ld a, [wcd30]
	or c
	inc a
	ld c, a
	call Stubbed_Function106314
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_106426
	call Mobile_AlwaysReturnNotCarry
	ld a, c
	and a
	jr z, .asm_106435
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

.asm_106435
	ld c, $0
	call Stubbed_Function106314
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a
	ret

Function106442:
	ld a, $36
	call Function3e32
	xor a
	ld [hMobile], a
	ld [hMobileReceive], a
	ld a, [wMobileCommsJumptableIndex]
	inc a
	ld [wMobileCommsJumptableIndex], a

Function106453:
	ld a, [wMobileCommsJumptableIndex]
	set 7, a
	ld [wMobileCommsJumptableIndex], a
	nop
	ld a, $4
	ld [wcf64], a
	ret

Stubbed_Function106462:
	ret
	ret

Function106464::
	ld de, GFX_106514
	ld hl, vTiles2 tile "☎" ; $62
	ld c, 9
	ld b, BANK(GFX_106514)
	call Get2bpp
	ld de, $40b0
	ld hl, vTiles2 tile $6b
	ld b, $f ; XXX no graphics at 0f:40b0
	call Get2bpp
	farcall LoadFrame
	ret

Function10649b:
	ld a, [wTextBoxFrame]
	maskbits NUM_FRAMES
	ld bc, 6 * LEN_1BPP_TILE
	ld hl, Frames
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles0 tile "┌" ; $ba
	ld c, 6 ; "┌" to "┘"
	ld b, BANK(Frames)
	call Function1064c3
	ld hl, vTiles2 tile " " ; $7f
	ld de, TextBoxSpaceGFX
	ld c, 1
	ld b, BANK(TextBoxSpaceGFX)
	call Function1064c3
	ret

Function1064c3:
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	push bc
	push hl
	ld hl, Function3f88
	ld a, b
	rst FarCall
	pop hl
	pop bc
	pop af
	ld [rSVBK], a
	jr asm_1064ed

Function1064d8:
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	push bc
	push hl
	ld hl, Function3f9f
	ld a, b
	rst FarCall
	pop hl
	pop bc
	pop af
	ld [rSVBK], a
	jr asm_1064ed

asm_1064ed
	ld de, wDecompressScratch
	ld b, $0
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a
	call Get2bpp
	pop af
	ld [rVBK], a
	pop af
	ld [rSVBK], a
	ret

Function10650a:
	ld de, MobilePhoneTilesGFX
	lb bc, BANK(MobilePhoneTilesGFX), 17
	call Get2bpp
	ret

GFX_106514:
INCBIN "gfx/unknown/106514.2bpp"

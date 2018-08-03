Copyright_GFPresents:
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearBGPalettes
	call ClearTileMap
	ld a, HIGH(vBGMap0)
	ld [hBGMapAddress + 1], a
	xor a ; LOW(vBGMap0)
	ld [hBGMapAddress], a
	ld [hJoyDown], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $90
	ld [hWY], a
	call WaitBGMap
	ld b, SCGB_GAMEFREAK_LOGO
	call GetSGBLayout
	call SetPalettes
	ld c, 10
	call DelayFrames
	callfar Copyright
	call WaitBGMap
	ld c, 100
	call DelayFrames
	call ClearTileMap
	farcall GBCOnlyScreen
	call .GetGFLogoGFX
.joy_loop
	call JoyTextDelay
	ld a, [hJoyLast]
	and BUTTONS
	jr nz, .pressed_button
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finish
	call PlaceGameFreakPresents
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .joy_loop

.pressed_button
	call .StopGamefreakAnim
	scf
	ret

.finish
	call .StopGamefreakAnim
	and a
	ret

.GetGFLogoGFX:
	ld de, GameFreakLogo
	ld hl, vTiles2
	lb bc, BANK(GameFreakLogo), 28
	call Get1bpp

	ld a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ld [rSVBK], a

	ld hl, IntroLogoGFX
	ld de, wDecompressScratch
	ld a, BANK(IntroLogoGFX)
	call FarDecompress

	ld hl, vTiles0
	ld de, wDecompressScratch
	lb bc, 1, 8 tiles
	call Request2bpp

	ld hl, vTiles1
	ld de, wDecompressScratch + $80 tiles
	lb bc, 1, 8 tiles
	call Request2bpp

	pop af
	ld [rSVBK], a

	farcall ClearSpriteAnims
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_GAMEFREAK_LOGO
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $a0
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $60
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $30
	xor a
	ld [wJumptableIndex], a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $1
	ld [hBGMapMode], a
	ld a, $90
	ld [hWY], a
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	ret

.StopGamefreakAnim:
	farcall ClearSpriteAnims
	call ClearTileMap
	call ClearSprites
	ld c, 16
	call DelayFrames
	ret

PlaceGameFreakPresents:
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.dw
	dw PlaceGameFreakPresents_0
	dw PlaceGameFreakPresents_1
	dw PlaceGameFreakPresents_2
	dw PlaceGameFreakPresents_3

PlaceGameFreakPresents_AdvanceIndex:
	ld hl, wJumptableIndex
	inc [hl]
	ret

PlaceGameFreakPresents_0:
	ret

PlaceGameFreakPresents_1:
	ld hl, wIntroSceneTimer
	ld a, [hl]
	cp $20
	jr nc, .PlaceGameFreak
	inc [hl]
	ret

.PlaceGameFreak:
	ld [hl], 0
	ld hl, .GAME_FREAK
	decoord 5, 10
	ld bc, .end - .GAME_FREAK
	call CopyBytes
	call PlaceGameFreakPresents_AdvanceIndex
	ld de, SFX_GAME_FREAK_PRESENTS
	call PlaySFX
	ret

.GAME_FREAK:
	;  G  A  M  E   _  F  R  E  A  K
	db 0, 1, 2, 3, 13, 4, 5, 3, 1, 6
.end
	db "@"

PlaceGameFreakPresents_2:
	ld hl, wIntroSceneTimer
	ld a, [hl]
	cp $40
	jr nc, .place_presents
	inc [hl]
	ret

.place_presents
	ld [hl], 0
	ld hl, .presents
	decoord 7, 11
	ld bc, .end - .presents
	call CopyBytes
	call PlaceGameFreakPresents_AdvanceIndex
	ret

.presents
	db 7, 8, 9, 10, 11, 12
.end
	db "@"

PlaceGameFreakPresents_3:
	ld hl, wIntroSceneTimer
	ld a, [hl]
	cp $80
	jr nc, .finish
	inc [hl]
	ret

.finish
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

GameFreakLogoJumper:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, GameFreakLogoScenes
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

GameFreakLogoScenes:
	dw GameFreakLogoScene1
	dw GameFreakLogoScene2
	dw GameFreakLogoScene3
	dw GameFreakLogoScene4
	dw GameFreakLogoScene5

GameFreakLogoScene1:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ret

GameFreakLogoScene2:
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_e4747
	ld d, a
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and %111111
	cp %100000
	jr nc, .asm_e4723
	add %100000
.asm_e4723
	ld e, a
	farcall BattleAnim_Sine_e
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	dec [hl]
	and $1f
	ret nz
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	sub $30
	ld [hl], a
	ld de, SFX_DITTO_BOUNCE
	call PlaySFX
	ret

.asm_e4747
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $0
	ld de, SFX_DITTO_POP_UP
	call PlaySFX
	ret

GameFreakLogoScene3:
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .asm_e4764
	inc [hl]
	ret

.asm_e4764
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $0
	ld de, SFX_DITTO_TRANSFORM
	call PlaySFX
	ret

GameFreakLogoScene4:
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	cp $40
	jr z, .asm_e47a3
	inc [hl]
	srl a
	srl a
	ld e, a
	ld d, $0
	ld hl, GameFreakLogoPalettes
	add hl, de
	add hl, de
	ld a, [rSVBK]
	push af
	ld a, BANK(wOBPals2)
	ld [rSVBK], a
	ld a, [hli]
	ld [wOBPals2 + 12], a
	ld a, [hli]
	ld [wOBPals2 + 13], a
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

.asm_e47a3
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	call PlaceGameFreakPresents_AdvanceIndex
GameFreakLogoScene5:
	ret

GameFreakLogoPalettes:
INCLUDE "gfx/intro/gamefreak_logo.pal"

GameFreakLogo:
INCBIN "gfx/splash/logo1.1bpp"
INCBIN "gfx/splash/logo2.1bpp"

CrystalIntro:
	ld a, [rSVBK]
	push af
	ld a, BANK(wGBCPalettes)
	ld [rSVBK], a
	ld a, [hInMenu]
	push af
	ld a, [hVBlank]
	push af
	call .InitRAMAddrs
.loop
	call JoyTextDelay
	ld a, [hJoyLast]
	and BUTTONS
	jr nz, .ShutOffMusic
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call IntroSceneJumper
	farcall PlaySpriteAnimations
	call DelayFrame
	jp .loop

.ShutOffMusic:
	ld de, MUSIC_NONE
	call PlayMusic

.done
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	pop af
	ld [hVBlank], a
	pop af
	ld [hInMenu], a
	pop af
	ld [rSVBK], a
	ret

.InitRAMAddrs:
	xor a
	ld [hVBlank], a
	ld a, $1
	ld [hInMenu], a
	xor a
	ld [hMapAnims], a
	ld [wJumptableIndex], a
	ret

IntroSceneJumper:
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, IntroScenes
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

IntroScenes:
	dw IntroScene1
	dw IntroScene2
	dw IntroScene3
	dw IntroScene4
	dw IntroScene7
	dw IntroScene8
	dw IntroScene9
	dw IntroScene10
	dw IntroScene13
	dw IntroScene14
	dw IntroScene15
	dw IntroScene16
	dw IntroScene22
	dw IntroScene23
	dw IntroScene28

NextIntroScene:
	ld hl, wJumptableIndex
	inc [hl]
	ret

IntroScene1:
; Setup the next scene.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap001
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ld [rVBK], a
	ld hl, IntroUnownsGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroPulseGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroTilemap002
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ld [rSVBK], a
	ld hl, IntroPalette2
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, IntroPalette2
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	farcall ClearSpriteAnims
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene2:
; First Unown (A) fades in, pulses, then fades out.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $80
	jr nc, .endscene
	cp $60
	jr nz, .DontPlaySound
	push af
	depixel 11, 11
	call CrystalIntro_InitUnownAnim
	ld de, SFX_INTRO_UNOWN_1
	call PlaySFX
	pop af
.DontPlaySound:
	ld [wIntroSceneTimer], a
	xor a
	call CrystalIntro_UnownFade
	ret
.endscene
	call NextIntroScene
	ret

IntroScene3:
; More setup. Transition to the outdoor scene.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap003
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ld [rVBK], a
	ld hl, IntroBackgroundGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroTilemap004
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ld [rSVBK], a
	ld hl, IntroPalette1
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, IntroPalette1
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	call Intro_ResetLYOverrides
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	call NextIntroScene
	ret

IntroScene4:
; Scroll the outdoor panorama for a bit.
	call Intro_PerspectiveScrollBG
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	cp $80
	jr z, .endscene
	inc [hl]
	ret

.endscene
	call NextIntroScene
	ret

IntroScene7:
; Back to the outdoor scene.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a

	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap003
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles

	ld hl, IntroPichuWooperGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_128Tiles

	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneRunGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_255Tiles

	ld hl, IntroBackgroundGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles

	ld hl, IntroTilemap004
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles

	ld a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ld [rSVBK], a

	ld hl, IntroPalette1
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes

	ld hl, IntroPalette1
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes

	pop af
	ld [rSVBK], a

	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	call Intro_ResetLYOverrides
	farcall ClearSpriteAnims
	depixel 13, 27, 4, 0
	ld a, SPRITE_ANIM_INDEX_INTRO_SUICUNE
	call _InitSpriteAnimStruct
	ld a, $f0
	ld [wGlobalAnimXOffset], a
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene8:
; Scroll the scene, then show Suicune running across the screen.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $2
	jr z, .suicune_sound
	jr nc, .animate_suicune
	call Intro_PerspectiveScrollBG
	ret

.suicune_sound
	ld de, SFX_INTRO_SUICUNE_3
	call PlaySFX
.animate_suicune
	ld a, [wGlobalAnimXOffset]
	and a
	jr z, .finish
	sub $8
	ld [wGlobalAnimXOffset], a
	ret

.finish
	ld de, SFX_INTRO_SUICUNE_2
	call PlaySFX
	farcall DeinitializeAllSprites
	call NextIntroScene
	ret

IntroScene9:
; Set up the next scene (same bg).
	xor a
	ld [hLCDCPointer], a
	call ClearSprites
	hlcoord 0, 0, wAttrMap
	; first 12 rows have palette 1
	ld bc, 12 * SCREEN_WIDTH
	ld a, $1
	call ByteFill
	; middle 3 rows have palette 2
	ld bc, 3 * SCREEN_WIDTH
	ld a, $2
	call ByteFill
	; last three rows have palette 3
	ld bc, 3 * SCREEN_WIDTH
	ld a, $3
	call ByteFill
	ld a, $2
	ld [hBGMapMode], a
	ld a, $c ; $980c
	ld [hBGMapAddress], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ld [hBGMapMode], a
	ld [hBGMapAddress], a
	ld [wGlobalAnimXOffset], a
	xor a
	ld [wIntroSceneFrameCounter], a
	call NextIntroScene
	ret

IntroScene10:
; Wooper and Pichu enter.
	call Intro_RustleGrass
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $c0
	jr z, .done
	cp $20
	jr z, .wooper
	cp $40
	jr z, .pichu
	ret

.pichu
	depixel 21, 16, 1, 0
	ld a, SPRITE_ANIM_INDEX_INTRO_PICHU
	call _InitSpriteAnimStruct
	ld de, SFX_INTRO_PICHU
	call PlaySFX
	ret

.wooper
	depixel 22, 6
	ld a, SPRITE_ANIM_INDEX_INTRO_WOOPER
	call _InitSpriteAnimStruct
	ld de, SFX_INTRO_PICHU
	call PlaySFX
	ret
.done
	call NextIntroScene
	ret

IntroScene13:
; Switch scenes again.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap003
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneRunGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_255Tiles
	ld hl, IntroBackgroundGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroTilemap004
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ld [rSVBK], a
	ld hl, IntroPalette1
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, IntroPalette1
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	farcall ClearSpriteAnims
	depixel 13, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_INTRO_SUICUNE
	call _InitSpriteAnimStruct
	ld de, MUSIC_CRYSTAL_OPENING
	call PlayMusic
	xor a
	ld [wGlobalAnimXOffset], a
	call Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene14:
; Suicune runs then jumps.
	ld a, [hSCX]
	sub 10
	ld [hSCX], a
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $80
	jr z, .done
	cp $60
	jr z, .jump
	jr nc, .asm_e4e1a
	cp $40
	jr nc, .asm_e4e33
	ret

.jump
	ld de, SFX_INTRO_SUICUNE_4
	call PlaySFX

.asm_e4e1a
	ld a, $1
	ld [wIntroSceneTimer], a
	ld a, [wGlobalAnimXOffset]
	cp $88
	jr c, .asm_e4e2c
	sub $8
	ld [wGlobalAnimXOffset], a
	ret

.asm_e4e2c
	farcall DeinitializeAllSprites
	ret

.asm_e4e33
	ld a, [wGlobalAnimXOffset]
	sub $2
	ld [wGlobalAnimXOffset], a
	ret

.done
	call NextIntroScene
	ret

IntroScene15:
; Transition to a new scene.
	call Intro_ClearBGPals
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap009
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneJumpGFX
	ld de, vTiles2 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld hl, IntroUnownBackGFX
	ld de, vTiles0 tile $00
	call Intro_DecompressRequest2bpp_128Tiles
	ld de, IntroGrass4GFX
	ld hl, vTiles1 tile $00
	lb bc, BANK(IntroGrass4GFX), 1
	call Request2bpp
	ld hl, IntroTilemap010
	debgcoord 0, 0
	call Intro_DecompressRequest2bpp_64Tiles
	call Intro_LoadTilemap
	ld a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ld [rSVBK], a
	ld hl, IntroPalette5
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	ld hl, IntroPalette5
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld a, $90
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	farcall ClearSpriteAnims
	call Intro_SetCGBPalUpdate
	depixel 8, 5
	ld a, SPRITE_ANIM_INDEX_INTRO_UNOWN_F
	call _InitSpriteAnimStruct
	depixel 12, 0
	ld a, SPRITE_ANIM_INDEX_INTRO_SUICUNE_AWAY
	call _InitSpriteAnimStruct
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	call NextIntroScene
	ret

IntroScene16:
; Suicune shows its face. An Unown appears in front.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $80
	jr nc, .done
	call Intro_Scene16_AnimateSuicune
	ld a, [hSCY]
	and a
	ret z
	add 8
	ld [hSCY], a
	ret
.done
	call NextIntroScene
	ret

IntroScene22:
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $8
	jr nc, .done
	ret
.done
	farcall DeinitializeAllSprites
	call NextIntroScene
	ret

IntroScene23:
	xor a
	ld [wIntroSceneFrameCounter], a
	call NextIntroScene
	ret

IntroScene28:
; Cut out when the music ends, and lead into the title screen.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	cp $18
	jr z, .clear
	cp $8
	ret nz

	ld de, SFX_UNKNOWN_CB
	call PlaySFX
	ret

.clear
	call ClearBGPalettes
	ret

.done
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Intro_Scene24_ApplyPaletteFade:
; load the (a)th palette from .FadePals to all wBGPals2
	ld hl, .FadePals
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a

	ld a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ld [rSVBK], a
	ld de, wBGPals2
	ld b, 8 ; number of BG pals
.loop1
	push hl
	ld c, 1 palettes
.loop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop2
	pop hl
	dec b
	jr nz, .loop1
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

.FadePals:
INCLUDE "gfx/intro/fade.pal"

CrystalIntro_InitUnownAnim:
	push de
	ld a, SPRITE_ANIM_INDEX_INTRO_UNOWN
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $8
	ld a, SPRITE_ANIM_FRAMESET_INTRO_UNOWN_4
	call ReinitSpriteAnimFrame
	pop de

	push de
	ld a, SPRITE_ANIM_INDEX_INTRO_UNOWN
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $18
	ld a, SPRITE_ANIM_FRAMESET_INTRO_UNOWN_3
	call ReinitSpriteAnimFrame
	pop de

	push de
	ld a, SPRITE_ANIM_INDEX_INTRO_UNOWN
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $28
	ld a, SPRITE_ANIM_FRAMESET_INTRO_UNOWN_1
	call ReinitSpriteAnimFrame
	pop de

	ld a, SPRITE_ANIM_INDEX_INTRO_UNOWN
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $38
	ld a, SPRITE_ANIM_FRAMESET_INTRO_UNOWN_2
	call ReinitSpriteAnimFrame
	ret

CrystalIntro_UnownFade:
	add a
	add a
	add a
	ld e, a
	ld d, $0
	ld hl, wBGPals2
	add hl, de
	inc hl
	inc hl
	ld a, [wIntroSceneTimer]
	and %111111
	cp %011111
	jr z, .okay
	jr c, .okay
	ld c, a
	ld a, %111111
	sub c
.okay

	ld c, a
	ld b, $0
	ld a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ld [rSVBK], a

	push hl
	push bc
	ld hl, wBGPals2
	ld bc, 8 palettes
	xor a
	call ByteFill
	pop bc
	pop hl

	push hl
	ld hl, .BWFade
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a

	push hl
	ld hl, .BlackLBlueFade
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a

	push hl
	ld hl, .BlackBlueFade
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a

	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

.BWFade:
; Fade between black and white.
hue = 0
rept 32
	RGB hue, hue, hue
hue = hue + 1
endr

.BlackLBlueFade:
; Fade between black and light blue.
hue = 0
rept 32
	RGB 0, hue / 2, hue
hue = hue + 1
endr

.BlackBlueFade:
; Fade between black and blue.
hue = 0
rept 32
	RGB 0, 0, hue
hue = hue + 1
endr

Intro_Scene20_AppearUnown:
; Spawn the palette for the nth Unown
	and a
	jr nz, .load_pal_2

	ld hl, .pal1
	jr .got_pointer

.load_pal_2
	ld hl, .pal2

.got_pointer
	ld a, [wIntroSceneTimer]
	and $7
	add a
	add a
	add a
	ld c, a
	ld a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ld [rSVBK], a

	push bc
	ld de, wBGPals2

	ld a, c
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a

	ld bc, 1 palettes
	call CopyBytes
	pop bc

	ld de, wBGPals1
	ld a, c
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a

	ld bc, 1 palettes
	call CopyBytes

	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

.pal1
	RGB 20, 26, 27
	RGB 31, 31, 31
	RGB 12, 00, 31
	RGB 00, 00, 00

.pal2
	RGB 20, 26, 27
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

Intro_FadeUnownWordPals:
	add a
	add a
	add a
	ld e, a
	ld d, $0
	ld hl, wBGPals2
	add hl, de
rept 4
	inc hl
endr
	ld a, [wIntroSceneTimer]
	add a
	ld c, a
	ld b, $0

	ld a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ld [rSVBK], a

	push hl
	ld hl, .FastFadePalettes
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a

	push hl
	ld hl, .SlowFadePalettes
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a

	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

.FastFadePalettes:
hue = 31
rept 8
	RGB hue, hue, hue
hue = hue + -1
	RGB hue, hue, hue
hue = hue + -2
endr

.SlowFadePalettes:
hue = 31
rept 16
	RGB hue, hue, hue
hue = hue + -1
endr

Intro_LoadTilemap:
	ld a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ld [rSVBK], a

	ld hl, wDecompressScratch
	decoord 0, 0
	ld b, SCREEN_HEIGHT
.row
	ld c, SCREEN_WIDTH
.col
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .col
	ld a, BG_MAP_WIDTH - SCREEN_WIDTH
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	dec b
	jr nz, .row

	pop af
	ld [rSVBK], a
	ret

Intro_Scene16_AnimateSuicune:
	ld a, [wIntroSceneFrameCounter]
	and $3
	jr z, Intro_ColoredSuicuneFrameSwap
	cp $3
	jr z, .PrepareForSuicuneSwap
	ret

.PrepareForSuicuneSwap:
	xor a
	ld [hBGMapMode], a
	ret

Intro_ColoredSuicuneFrameSwap:
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
.loop
	ld a, [hl]
	and a
	jr z, .skip
	cp $80
	jr nc, .skip
	xor $8
	ld [hl], a
.skip
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ld a, $1
	ld [hBGMapMode], a
	ret

Intro_RustleGrass:
	ld a, [wIntroSceneFrameCounter]
	cp 36
	ret nc
	and $c
	srl a
	ld e, a
	ld d, $0
	ld hl, .RustlingGrassPointers
	add hl, de
	ld a, [hli]
	ld [wRequested2bppSource], a
	ld a, [hli]
	ld [wRequested2bppSource + 1], a
	ld a, LOW(vTiles2 tile $09)
	ld [wRequested2bppDest], a
	ld a, HIGH(vTiles2 tile $09)
	ld [wRequested2bppDest + 1], a
	ld a, 4
	ld [wRequested2bppSize], a
	ret

.RustlingGrassPointers:
	dw IntroGrass1GFX
	dw IntroGrass2GFX
	dw IntroGrass3GFX
	dw IntroGrass2GFX

Intro_SetCGBPalUpdate:
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

Intro_ClearBGPals:
	ld a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ld [rSVBK], a

	ld hl, wBGPals2
	ld bc, 16 palettes
	xor a
	call ByteFill

	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	call DelayFrame
	call DelayFrame
	ret

Intro_DecompressRequest2bpp_128Tiles:
	ld a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ld [rSVBK], a

	push de
	ld de, wDecompressScratch
	call Decompress
	pop hl

	ld de, wDecompressScratch
	lb bc, $01, $80
	call Request2bpp

	pop af
	ld [rSVBK], a
	ret

Intro_DecompressRequest2bpp_255Tiles:
	ld a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ld [rSVBK], a

	push de
	ld de, wDecompressScratch
	call Decompress
	pop hl

	ld de, wDecompressScratch
	lb bc, $01, $ff
	call Request2bpp

	pop af
	ld [rSVBK], a
	ret

Intro_DecompressRequest2bpp_64Tiles:
	ld a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ld [rSVBK], a

	push de
	ld de, wDecompressScratch
	call Decompress
	pop hl

	ld de, wDecompressScratch
	lb bc, $01, $40
	call Request2bpp

	pop af
	ld [rSVBK], a
	ret

Intro_ResetLYOverrides:
	ld a, [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ld [rSVBK], a

	ld hl, wLYOverrides
	ld bc, wLYOverridesEnd - wLYOverrides
	xor a
	call ByteFill

	pop af
	ld [rSVBK], a
	ld a, rSCX - $ff00
	ld [hLCDCPointer], a
	ret

Intro_PerspectiveScrollBG:
	ld a, [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ld [rSVBK], a
	; Scroll the grass every frame.
	; Scroll the trees every other frame and at half speed.
	; This creates an illusion of perspective.
	ld a, [wIntroSceneFrameCounter]
	and $1
	jr z, .skip
	; trees in the back
	ld hl, wLYOverrides
	ld a, [hl]
	inc a
	ld bc, $5f
	call ByteFill
.skip
	; grass in the front
	ld hl, wLYOverrides + $5f
	ld a, [hl]
	inc a
	inc a
	ld bc, $31
	call ByteFill
	ld a, [wLYOverrides + 0]
	ld [hSCX], a
	pop af
	ld [rSVBK], a
	ret

IntroSuicuneRunGFX:
INCBIN "gfx/intro/suicune_run.2bpp.lz"

IntroPichuWooperGFX:
INCBIN "gfx/intro/pichu_wooper.2bpp.lz"

IntroBackgroundGFX:
INCBIN "gfx/intro/background.2bpp.lz"

IntroTilemap004:
INCBIN "gfx/intro/004.tilemap.lz"

IntroTilemap003:
INCBIN "gfx/intro/003.tilemap.lz"

IntroPalette1:
INCLUDE "gfx/intro/intro_1.pal"

IntroUnownsGFX:
INCBIN "gfx/intro/unowns.2bpp.lz"

IntroPulseGFX:
INCBIN "gfx/intro/pulse.2bpp.lz"

IntroTilemap002:
INCBIN "gfx/intro/002.tilemap.lz"

IntroTilemap001:
INCBIN "gfx/intro/001.tilemap.lz"

IntroTilemap006:
INCBIN "gfx/intro/006.tilemap.lz"

IntroTilemap005:
INCBIN "gfx/intro/005.tilemap.lz"

IntroTilemap008:
INCBIN "gfx/intro/008.tilemap.lz"

IntroTilemap007:
INCBIN "gfx/intro/007.tilemap.lz"

IntroPalette2:
INCLUDE "gfx/intro/intro_2.pal"

IntroCrystalUnownsGFX:
INCBIN "gfx/intro/crystal_unowns.2bpp.lz"

IntroTilemap017:
INCBIN "gfx/intro/017.tilemap.lz"

IntroTilemap015:
INCBIN "gfx/intro/015.tilemap.lz"

IntroPalette3:
INCLUDE "gfx/intro/intro_3.pal"

IntroSuicuneCloseGFX:
INCBIN "gfx/intro/suicune_close.2bpp.lz"

IntroTilemap012:
INCBIN "gfx/intro/012.tilemap.lz"

IntroTilemap011:
INCBIN "gfx/intro/011.tilemap.lz"

IntroPalette4:
INCLUDE "gfx/intro/intro_4.pal"

IntroSuicuneJumpGFX:
INCBIN "gfx/intro/suicune_jump.2bpp.lz"

IntroSuicuneBackGFX:
INCBIN "gfx/intro/suicune_back.2bpp.lz"

IntroTilemap010:
INCBIN "gfx/intro/010.tilemap.lz"

IntroTilemap009:
INCBIN "gfx/intro/009.tilemap.lz"

IntroTilemap014:
INCBIN "gfx/intro/014.tilemap.lz"

IntroTilemap013:
INCBIN "gfx/intro/013.tilemap.lz"

IntroPalette5:
INCLUDE "gfx/intro/intro_5.pal"

IntroUnownBackGFX:
INCBIN "gfx/intro/unown_back.2bpp.lz"

IntroGrass1GFX:
INCBIN "gfx/intro/grass1.2bpp"
IntroGrass2GFX:
INCBIN "gfx/intro/grass2.2bpp"
IntroGrass3GFX:
INCBIN "gfx/intro/grass3.2bpp"
IntroGrass4GFX:
INCBIN "gfx/intro/grass4.2bpp"

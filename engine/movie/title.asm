_TitleScreen:
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap

; Turn BG Map update off
	xor a
	ld [hBGMapMode], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wIntroSceneFrameCounter
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1

; Turn LCD off
	call DisableLCD

; VRAM bank 1
	ld a, 1
	ld [rVBK], a
	
; Decompress Legend gfx
if DEF(_SAPPHIRE)
	ld hl, TitleKyogreGFX
	ld de, vTiles1
	call Decompress
else
	ld hl, TitleGroudonGFX
	ld de, vTiles1
	call Decompress
endc

; Clear screen palettes
	hlbgcoord 0, 0
	ld bc, 20 * BG_MAP_WIDTH
	xor a
	call ByteFill

; Fill tile palettes:

; BG Map 1:

; line 0 (copyright)
	hlbgcoord 0, 0, vBGMap1
	ld bc, BG_MAP_WIDTH
	ld a, 7 ; palette
	call ByteFill

; BG Map 0:

; Apply logo gradient:

; lines 3-4
	hlbgcoord 0, 1
	ld bc, 2 * BG_MAP_WIDTH
	ld a, 2
	call ByteFill
; line 5
	hlbgcoord 0, 3
	ld bc, BG_MAP_WIDTH
	ld a, 3
	call ByteFill
; line 6
	hlbgcoord 0, 4
	ld bc, BG_MAP_WIDTH
	ld a, 4
	call ByteFill
; line 7
	hlbgcoord 0, 5
	ld bc, BG_MAP_WIDTH
	ld a, 5
	call ByteFill
; lines 8-9
	hlbgcoord 0, 6
	ld bc, 2 * BG_MAP_WIDTH
	ld a, 6
	call ByteFill

; 'CRYSTAL VERSION'
	hlbgcoord 5, 7
	ld bc, NAME_LENGTH ; length of version text
	ld a, 1
	call ByteFill
	
; Groudon gfx
	hlbgcoord 0, 8
	ld bc, 10 * BG_MAP_WIDTH ; the rest of the screen
	ld a, 0 | VRAM_BANK_1
	call ByteFill

; Back to VRAM bank 0
	ld a, $0
	ld [rVBK], a

; Decompress logo
if DEF(_SAPPHIRE)
	ld hl, TitleLogoSapphireGFX
	ld de, vTiles1
	call Decompress
else
	ld hl, TitleLogoGFX
	ld de, vTiles1
	call Decompress
endc

; Clear screen tiles
	hlbgcoord 0, 0
	ld bc, 64 * BG_MAP_WIDTH
	ld a, " "
	call ByteFill

; Draw Pokemon logo
	hlcoord 0, 1
	lb bc, 7, 20
	ld d, $80
	ld e, $14
	call DrawTitleGraphic
	
; Draw Groudon
	hlcoord 0, 8
	lb bc, 10, 20
	ld d, $80
	ld e, $14
	call DrawTitleGraphic

; Draw copyright text
	hlbgcoord 3, 0, vBGMap1
	lb bc, 1, 13
	ld d, $c
	ld e, $10
	call DrawTitleGraphic

; Save WRAM bank
	ld a, [rSVBK]
	push af
; WRAM bank 5
	ld a, BANK(wBGPals1)
	ld [rSVBK], a

; Update palette colors
if DEF(_SAPPHIRE)
	ld hl, TitleScreenSapphirePalettes
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes

	ld hl, TitleScreenSapphirePalettes
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
else
	ld hl, TitleScreenPalettes
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes

	ld hl, TitleScreenPalettes
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
endc

; Restore WRAM bank
	pop af
	ld [rSVBK], a

; LY/SCX trickery starts here

	ld a, [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ld [rSVBK], a

; Make alternating lines come in from opposite sides

; (This part is actually totally pointless, you can't
;  see anything until these values are overwritten!)

	ld b, 80 / 2 ; alternate for 80 lines
	ld hl, wLYOverrides
.loop
; $00 is the middle position
	ld [hl], +0 ; coming from the left
	inc hl
	ld [hl], -0 ; coming from the right
	inc hl
	dec b
	jr nz, .loop

; Make sure the rest of the buffer is empty
	ld hl, wLYOverrides + 80
	xor a
	ld bc, wLYOverridesEnd - (wLYOverrides + 80)
	call ByteFill

; Let LCD Stat know we're messing around with SCX
	ld a, rSCX - $ff00
	ld [hLCDCPointer], a

	pop af
	ld [rSVBK], a

; Reset audio
	call ChannelsOff
	call EnableLCD

; Set sprite size to 8x16
	ld a, [rLCDC]
	set rLCDC_SPRITE_SIZE, a
	ld [rLCDC], a

	ld a, +0
	ld [hSCX], a
	ld a, 8
	ld [hSCY], a
	ld a, 7
	ld [hWX], a
	ld a, -0
	ld [hWY], a

	ld a, $1
	ld [hCGBPalUpdate], a

; Update BG Map 0 (bank 0)
	ld [hBGMapMode], a

	xor a
	ld [wd002], a

	ret
	
GroudonFrameIterator:
	ld hl, wd002
	ld a, [hl]
	ld c, a
	inc [hl]
	
	; Only do this once every eight frames
	and %111
	ret nz
GroudonFade:
	ld hl, wBGPals2 + 4
	ld a, [wd002]
	and %11111111
	cp %01111111
	jr z, .okay
	jr c, .okay
	ld c, a
	ld a, %11111111
	sub c
.okay
	srl a
	srl a
	ld c, a
	ld b, $0
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a

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
	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret
	

.BWFade:
; Fade between black and white.
if DEF(_SAPPHIRE)
hue = 0
rept 32
	RGB hue, 0, 0
hue = hue + 1
endr
else
hue = 0
rept 32
	RGB 0, 0, hue
hue = hue + 1
endr
endc

DrawTitleGraphic:
; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each bgrows
.bgrows
	push de
	push bc
	push hl
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	pop de
	ld a, e
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret

InitializeBackground:
	ld hl, wVirtualOAMSprite00
	ld d, -$22
	ld e, $0
	ld c, 5
.loop
	push bc
	call .InitColumn
	pop bc
	ld a, $10
	add d
	ld d, a
	dec c
	jr nz, .loop
	ret

.InitColumn:
	ld c, $6
	ld b, $40
.loop2
	ld a, d
	ld [hli], a ; y
	ld a, b
	ld [hli], a ; x
	add $8
	ld b, a
	ld a, e
	ld [hli], a ; tile id
	inc e
	inc e
	ld a, 0 | PRIORITY
	ld [hli], a ; attributes
	dec c
	jr nz, .loop2
	ret

TitleLogoGFX:
INCBIN "gfx/title/logo.2bpp.lz"

TitleLogoSapphireGFX:
INCBIN "gfx/title/logosapphire.2bpp.lz"

TitleScreenPalettes:
INCLUDE "gfx/title/title.pal"

TitleScreenSapphirePalettes:
INCLUDE "gfx/title/titlesapphire.pal"

TitleGroudonGFX:
INCBIN "gfx/title/groudon.2bpp.lz"

TitleKyogreGFX:
INCBIN "gfx/title/kyogre.2bpp.lz"

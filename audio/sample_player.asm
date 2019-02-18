; ================================================================
; Sample player defines
; ================================================================

Sample:		macro
	dw	\1,\1End-\1
	db	Bank(\1)
	endm

section "Sample RAM",wram0

SamplePlaying		ds	1
SamplePtr			ds	2
SampleSize			ds	2
SampleBank			ds	1
SampleBankCount		ds	1
SampleVolume		ds	1
TimerInterruptFlag	ds	1

; ================================================================
; Sample player
; ================================================================

section "Sample player stubs",rom0

PlaySample:
	ldh	a,[hROMBank]
	push	af
	ld	a,bank(_PlaySample)
	push	hl
	rst	Bankswitch
	pop	hl
	call	_PlaySample
	pop	af
	rst	Bankswitch
	ret

SamplePlayer_CopyWave:
	ldh	a,[hROMBank]
	push	af
	ld	a,[SampleBank]
	rst	Bankswitch
	push	bc
	ld	bc,$1030
.loop
	ld	a,[hl+]
	ld	[c],a
	inc	c
	dec	b
	jr	nz,.loop
	pop	bc
	pop	af
	rst	Bankswitch
	ret
	
Timer::
	push af
	push bc
	push de
	push hl
	ldh	a,[hROMBank]
	push	af
	ld	a,bank(_DoSample)
	rst	Bankswitch
	call	_DoSample
	pop	af
	rst	Bankswitch
.done
	pop hl
	pop de
	pop bc
	pop af
	reti

section "Sample player",romx

_PlaySample:
	ld	c,low(rNR52)
	xor	a
	ld	[c],a
	or	%10000000
	ld	[c],a
	dec	c
	or	%01111111
	ld	[c],a
	dec	c
	xor	%10001000
	ld	[c],a
	
	ld	a,%00100000
	ldh	[rNR32],a
	
	ld	hl,SampleTable
	add	hl,de
	add	hl,de
	add	hl,de
	add	hl,de
	add	hl,de
	ld	a,[hl+]
	ld	[SamplePtr],a
	ld	a,[hl+]
	ld	[SamplePtr+1],a
	ld	a,[hl+]
	ld	[SampleSize],a
	ld	a,[hl+]
	ld	[SampleSize+1],a
	ld	a,[hl+]
	ld	[SampleBank],a
	ld	a,1
	ld	[SamplePlaying],a
	ret
	
; Sample playback system.
; Make sure to set TMA to $00, set TAC to $06, and enable timer interrupt!
_DoSample:
	push	af
	ld	a,[SamplePlaying]
	and	a
	jr	nz,.doplay
	ld	a,1
	ld	[TimerInterruptFlag],a
	pop	af
	reti
.doplay
	push	de
	push	hl
	ld	hl,SampleSize
	ld	a,[hl+]
	ld	d,[hl]
	ld	e,a
	ld	hl,SamplePtr
	ld	a,[hl+]
	ld	h,[hl]
	ld	l,a
	xor	a
	ldh	[rNR30],a	; disable CH3
	ldh	a,[rNR51]
	ld	c,a
	and	%10111011
	ldh	[rNR51],a	; prevents spike on GBA
	call	SamplePlayer_CopyWave
	ld	a,%10000000
	ldh	[rNR30],a
	ld	a,c
	ldh	[rNR51],a
	if	!def(DoubleSpeed)
	xor	a
	else
	ld	a,$80
	endc
	ldh	[rNR33],a
	ld	a,$87
	ldh	[rNR34],a
	; optimization by pigdevil2010 (was originally 16x dec de)
	ld	a,e
	sub	16
	ld	e,a
	jr	nc,.nocarry
	dec	d
.nocarry
	ld	a,h
	cp	$80
	jr	nz,.noreset
	ld	a,[SampleBank]
	inc	a
	ld	[SampleBank],a
	ld	a,$40
.noreset
	ld	[SamplePtr+1],a
	ld	a,l
	ld	[SamplePtr],a
	
	ld	a,d
	cp	$ff
	jr	nz,.noreset2
	xor	a
	ld	[SamplePlaying],a
	ldh	[rNR30],a
.noreset2
	ld	a,d
	ld	[SampleSize+1],a
	ld	a,e
	ld	[SampleSize],a
	
	ld	a,1
	ld	[TimerInterruptFlag],a
	
	ld	a,$80
	ldh	[rTMA],a
	or	7
	ldh	[rTAC],a
	
	pop	hl
	pop	de
	pop	af
	reti
	
; ================================================================

SampleTable:
	Sample	Sample_Treecko
	Sample	Sample_Grovyle
	Sample	Sample_Sceptile
	Sample	Sample_Torchic
	Sample	Sample_Combusken
	Sample	Sample_Blaziken
	Sample	Sample_Mudkip
	Sample	Sample_Marshtomp
	Sample	Sample_Swampert
	Sample	Sample_Poochyena
	Sample	Sample_Mightyena
	Sample	Sample_Zigzagoon
	Sample	Sample_Linoone
	Sample	Sample_Wurmple
	Sample	Sample_Silcoon
	Sample	Sample_Beautifly
	Sample	Sample_Cascoon
	Sample	Sample_Dustox
	Sample	Sample_Lotad
	Sample	Sample_Lombre
	Sample	Sample_Ludicolo
	Sample	Sample_Seedot
	Sample	Sample_Nuzleaf
	Sample	Sample_Shiftry

section	"Sample bank 1",romx
Sample_Treecko:		incbin	"audio/samples/treecko.pcm"
Sample_TreeckoEnd

Sample_Grovyle:		incbin	"audio/samples/grovyle.pcm"
Sample_GrovyleEnd

Sample_Sceptile:	incbin	"audio/samples/sceptile.pcm"
Sample_SceptileEnd

Sample_Torchic:		incbin	"audio/samples/torchic.pcm"
Sample_TorchicEnd
; ================
section "Sample bank 2",romx
Sample_Combusken:	incbin	"audio/samples/combusken.pcm"
Sample_CombuskenEnd

Sample_Blaziken:	incbin	"audio/samples/blaziken.pcm"
Sample_BlazikenEnd

Sample_Mudkip:		incbin	"audio/samples/mudkip.pcm"
Sample_MudkipEnd

Sample_Marshtomp:	incbin	"audio/samples/marshtomp.pcm"
Sample_MarshtompEnd
; ================
section "Sample bank 3",romx
Sample_Swampert:	incbin	"audio/samples/swampert.pcm"
Sample_SwampertEnd

Sample_Poochyena:	incbin	"audio/samples/poochyena.pcm"
Sample_PoochyenaEnd

Sample_Mightyena:	incbin	"audio/samples/mightyena.pcm"
Sample_MightyenaEnd

Sample_Zigzagoon:	incbin	"audio/samples/zigzagoon.pcm"
Sample_ZigzagoonEnd
; ================
section "Sample bank 4",romx
Sample_Linoone:		incbin	"audio/samples/linoone.pcm"
Sample_LinooneEnd

Sample_Wurmple:		incbin	"audio/samples/wurmple.pcm"
Sample_WurmpleEnd

Sample_Silcoon:		incbin	"audio/samples/silcoon.pcm"
Sample_SilcoonEnd

Sample_Beautifly:	incbin	"audio/samples/beautifly.pcm"
Sample_BeautiflyEnd

Sample_Cascoon:		incbin	"audio/samples/cascoon.pcm"
Sample_CascoonEnd
; ================
section "Sample bank 5",romx
Sample_Dustox:		incbin	"audio/samples/dustox.pcm"
Sample_DustoxEnd

Sample_Lotad:		incbin	"audio/samples/lotad.pcm"
Sample_LotadEnd

Sample_Lombre:		incbin	"audio/samples/lombre.pcm"
Sample_LombreEnd

Sample_Ludicolo:	incbin	"audio/samples/ludicolo.pcm"
Sample_LudicoloEnd

Sample_Seedot:		incbin	"audio/samples/seedot.pcm"
Sample_SeedotEnd

Sample_Nuzleaf:		incbin	"audio/samples/nuzleaf.pcm"
Sample_NuzleafEnd
; ================
section "Sample bank 6",romx
Sample_Shiftry:		incbin	"audio/samples/shiftry.pcm"
Sample_ShiftryEnd
; ================================================================
; Sample player defines
; ================================================================

Sample:		macro
	dw	\1,\2
	db	\3
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
	ld	c,low(rNR51)
	ld	a,$ff
	ld	[c],a
	dec	c
	ld	a,$77
	ld	[c],a
	ld	a,$20
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
	Sample	Sample_Treecko,		Sample_TreeckoEnd-Sample_Treecko,		Bank(Sample_Treecko)
	Sample	Sample_Grovyle,		Sample_GrovyleEnd-Sample_Grovyle,		Bank(Sample_Grovyle)
	Sample	Sample_Sceptile,	Sample_SceptileEnd-Sample_Sceptile,		Bank(Sample_Sceptile)
	Sample	Sample_Torchic,		Sample_TorchicEnd-Sample_Torchic,		Bank(Sample_Torchic)
	Sample	Sample_Combusken,	Sample_CombuskenEnd-Sample_Combusken,	Bank(Sample_Combusken)
	Sample	Sample_Blaziken,	Sample_BlazikenEnd-Sample_Blaziken,		Bank(Sample_Blaziken)
	Sample	Sample_Mudkip,		Sample_MudkipEnd-Sample_Mudkip,			Bank(Sample_Mudkip)
	Sample	Sample_Marshtomp,	Sample_MarshtompEnd-Sample_Marshtomp,	Bank(Sample_Marshtomp)
	Sample	Sample_Swampert,	Sample_SwampertEnd-Sample_Swampert,		Bank(Sample_Swampert)

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
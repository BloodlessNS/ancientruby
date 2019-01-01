Music_MayEncounter:
	musicheader 4, 1, Music_MayEncounter_Ch1
	musicheader 1, 2, Music_MayEncounter_Ch2
	musicheader 1, 3, Music_MayEncounter_Ch3
	musicheader 1, 4, Music_MayEncounter_Ch4


Music_MayEncounter_Ch1:
	dutycycle $3
	vibrato $12, $15
	tone $0001
	tempo 156
	notetype $6, $92
	octave 3
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	intensity $61
	note G#, 1
	note F#, 1
	note F_, 1
	note D#, 2
	intensity $92
	note A_, 1
	note A#, 4
	note F#, 4
	note D#, 4
	note G#, 8
	note A#, 8
	note B_, 8
	octave 4
	note C_, 4
	note D#, 2
	intensity $61
	note C#, 1
	note C_, 1
	octave 3
	note A#, 4
Music_MayEncounter_Ch1_loop_main:
	dutycycle 2
	octave 4
	intensity $40
Music_MayEncounter_Ch1_loop_1:
	note C#, 8
	note __, 2
	note C#, 2
	note __, 2
	octave 3
	note G#, 2
	octave 4
	note C#, 8
	note __, 4
	note C#, 2
	note C_, 2
	octave 3
	note B_, 10
	octave 4
	note C#, 1
	note D_, 1
	note D#, 7
	note D_, 1
	note C#, 3
	note C_, 1
	octave 3
	note B_, 3
	octave 4
	note C_, 1
	note C#, 3
	note D#, 1
	note F#, 8
	note __, 2
	note C#, 2
	note __, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 4
	note F#, 1
	note F_, 3
	note E_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note C_, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	note F_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note F#, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note D#, 1
	note __, 1
	note C_, 1
	octave 3
	note G#, 1
	note D#, 1
	note __, 1
	note G#, 1
	octave 4
	note C_, 1
	loopchannel 2, Music_MayEncounter_Ch1_loop_1
	dutycycle 3
	callchannel Music_MayEncounter_Ch1_branch_1
	intensity $85
	note D#, 6
	callchannel Music_MayEncounter_Ch1_branch_1
	note D#, 2
	note F_, 2
	note F#, 2
	
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	intensity $80
	note G#, 2
	intensity $57
	note F#, 1
	note F_, 1
	note D#, 1
	note C#, 3
	intensity $87
	note G#, 4
	intensity $82
	note F#, 4
	intensity $87
	note F_, 4
	intensity $82
	note D#, 4
	octave 3
	note B_, 2
	note A#, 2
	note B_, 2
	octave 4
	note D#, 2
	note F_, 2
	note D#, 2
	note F_, 2
	note F#, 2
	intensity $a7
	note G#, 4
	intensity $a2
	note A#, 4
	note G#, 2
	note F#, 2
	note F_, 2
	note D#, 2
	intensity $90
	note C#, 8
	intensity $95
	note C#, 4
	note C_, 2
	note C#, 2
	octave 3
	intensity $90
	note A#, 4
	intensity $97
	note A#, 4
	octave 4
	note C_, 6
	note C#, 2
	intensity $a0
	note D#, 8
	intensity $a5
	note D#, 4
	note C#, 2
	note D#, 2
	octave 3
	intensity $a7
	note A#, 8
	octave 4
	note C#, 4
	note D#, 2
	note E_, 2
	callchannel Music_MayEncounter_Ch2_branch_1
	note D#, 4
	loopchannel 0, Music_MayEncounter_Ch1_loop_main
	
Music_MayEncounter_Ch1_branch_1:
	intensity $81
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	intensity $80
	note F_, 2
	intensity $57
	note D#, 1
	note C#, 1
	note C_, 1
	octave 3
	note A#, 3
	octave 4
	intensity $82
	note F_, 4
	note D#, 4
	note C#, 2
	endchannel
	
Music_MayEncounter_Ch2:
	dutycycle $3
	vibrato $12, $15
	tone $0001
	callchannel Music_MayEncounter_Ch2_branch_1
Music_MayEncounter_Ch2_loop:
	dutycycle $0
	octave 4
	intensity $93
	note C#, 2
	note D#, 2
	note F_, 4
	note F#, 3
	intensity $66
	note A_, 1
	intensity $93
	note G#, 4
	intensity $96
	note G#, 8
	note F#, 4
	note F_, 4
	note F#, 2
	note F_, 2
	intensity $66
	note E_, 1
	intensity $97
	note D#, 14
	note E_, 1
	note F_, 4
	intensity $70
	note E_, 1
	intensity $60
	note D#, 1
	intensity $50
	note D_, 1
	intensity $40
	note C#, 1
	octave 3
	intensity $93
	note A#, 2
	note A#, 2
	note G#, 2
	note A#, 2
	octave 4
	note C#, 8
	note C#, 8
	note C#, 8
	note C#, 4
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note G#, 4
	octave 4
	note G#, 4
	note F#, 4
	intensity $95
	note F_, 8
	note F#, 2
	note F_, 2
	note D#, 8
	intensity $93
	note F_, 4
	note F#, 4
	note G#, 4
	octave 5
	intensity $70
	note C_, 1
	intensity $97
	note C#, 5
	octave 4
	intensity $70
	note A#, 1
	intensity $50
	note G#, 1
	intensity $93
	note F_, 4
	note F#, 2
	intensity $97
	note F_, 6
	note D#, 10
	octave 3
	note G#, 2
	intensity $40
	note B_, 1
	octave 4
	intensity $50
	note C#, 1
	intensity $60
	note D#, 1
	intensity $70
	note F#, 1
	intensity $97
	note G#, 8
	intensity $93
	note F#, 4
	note G#, 2
	note F#, 2
	note F_, 8
	note F_, 8
	note F_, 2
	note F_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	note F_, 2
	octave 3
	note F#, 2
	octave 4
	note C#, 2
	note F_, 6
	note G#, 4
	note F#, 4
	note F_, 8
	note F#, 2
	note F_, 2
	intensity $97
	note D#, 8 ;;;;;;;;;
	dutycycle 2
	intensity $90
	note F_, 8
	intensity $94
	note F_, 4
	octave 3
	intensity $92
	note A#, 2
	note A#, 2
	octave 4
	note C#, 4
	octave 3
	note A#, 4
	octave 4
	note C#, 2
	intensity $90
	note D#, 6
	note F_, 8
	intensity $94
	note F_, 6
	octave 3
	intensity $92
	note G#, 2
	octave 4
	note C#, 4
	note D#, 4
	note F#, 2
	intensity $90
	note F_, 6
	note G#, 2
	intensity $70
	note G_, 1
	intensity $60
	note F#, 1
	intensity $50
	note F_, 1
	intensity $40
	note E_, 1
	intensity $37
	note D#, 10
	intensity $90
	note G#, 4
	note F#, 2
	note __, 2
	note F_, 2
	note D#, 2
	octave 3
	note G#, 2
	note A#, 2
	note B_, 10
	note G#, 2
	note B_, 2
	octave 4
	note F_, 2
	note G#, 4
	note A#, 2
	note __, 2
	note G#, 2
	note F#, 2
	note F_, 2
	note D#, 2
	note F_, 8
	intensity $94
	note F_, 4
	intensity $90
	note E_, 2
	note F_, 2
	note C#, 6
	intensity $97
	note C#, 2
	note D#, 6
	note __, 2
	note F_, 2
	note __, 2
	note D#, 2
	note F_, 2
	note C#, 8
	intensity $92
	note D#, 2
	note D#, 2
	note C#, 2
	note D#, 2
	note F_, 2
	note F_, 2
	note D#, 2
	note F_, 1
	note F#, 1
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	intensity $90
	note G#, 2
	intensity $70
	note F#, 1
	intensity $60
	note E_, 1
	intensity $50
	note D#, 1
	intensity $47
	note C#, 2
	dutycycle 0
	intensity $77
	note G_, 1
	note G#, 5
	note G_, 1
	note G#, 5
	note G_, 1
	note G#, 3
	octave 5
	note C#, 1
	note C_, 8
	octave 4
	note B_, 2
	note A#, 2
	note G#, 2
	note F#, 2
	note G#, 10
	note F#, 1
	note F_, 1
	loopchannel 0, Music_MayEncounter_Ch2_loop
	
Music_MayEncounter_Ch2_branch_1:
	notetype $6, $a2
	octave 4
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	intensity $71
	note D#, 1
	note C#, 1
	note C_, 1
	octave 3
	note A#, 2
	octave 4
	intensity $a2
	note E_, 1
	note F_, 4
	note D#, 4
	note C#, 4
	note C_, 8
	note C#, 8
	note D_, 8
	note D#, 4
	note G#, 2
	intensity $71
	note F#, 1
	note F_, 1
	endchannel
	
Music_MayEncounter_Ch3:
	notetype $6, $11
	octave 3
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note D#, 1
	note __, 1
	note D#, 2
	octave 3
	note D#, 4
	note D_, 1
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
	note D#, 4
	note A#, 4
	octave 3
	note D#, 4
	note G#, 2
	note F#, 2
	octave 2
	note G#, 2
	octave 3
	note G#, 2
	octave 2
	note G#, 4
	octave 3
	note G#, 2
	octave 2
	note G#, 2
	octave 3	
Music_MayEncounter_Ch3_loop:
	note G_, 1
	note G#, 7
	octave 2
	note G#, 4
	octave 3
	note G_, 1
	note G#, 7
	callchannel Music_MayEncounter_Ch3_branch_1
	note C#, 3
	note __, 1
	note C#, 4
	note B_, 2
	note G#, 2
	note F_, 4
	note F#, 5
	note __, 1
	note F#, 2
	note F#, 2
	callchannel Music_MayEncounter_Ch3_branch_2
	note C_, 2
	octave 2
	note F#, 2
	callchannel Music_MayEncounter_Ch3_branch_3
	octave 3
	note A#, 2
	octave 2
	note D#, 2
	callchannel Music_MayEncounter_Ch3_branch_1
	note C#, 5
	note __, 1
	note C#, 1
	note __, 1
	note C#, 2
	note B_, 2
	note __, 2
	note G#, 2
	note F#, 5
	note __, 1
	note F#, 2
	note F#, 1
	note __, 1
	callchannel Music_MayEncounter_Ch3_branch_2
	octave 2
	note F#, 2
	note G_, 2
	callchannel Music_MayEncounter_Ch3_branch_3
	octave 2
	note G#, 2
	note G_, 2
	note F#, 5
	note __, 1
	note F#, 2
	note __, 4
	note C#, 2
	note F_, 2
	octave 3
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	note C#, 2
	octave 2
	note F#, 4
	note F_, 2
	note F#, 5
	note __, 1
	note F#, 2
	note __, 4
	note C#, 4
	note F#, 2
	octave 3
	note F#, 2
	octave 2
	note F#, 2
	note F#, 2
	octave 3
	note F#, 3
	note F_, 1
	note E_, 1
	note D#, 1
	octave 2
	note E_, 2
	note F_, 5
	note __, 1
	note F_, 2
	note __, 4
	note C#, 2
	note D#, 2
	octave 3
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	note C_, 2
	octave 2
	note G#, 4
	note E_, 2
	note F_, 5
	note __, 1
	note F_, 2
	note __, 4
	note B_, 2
	note D#, 2
	note F_, 5
	note __, 1
	note F_, 2
	note __, 4
	note E_, 4
	note D#, 5
	note __, 1
	note D#, 2
	note __, 4
	note A#, 2
	note C#, 2
	note D#, 2
	note A#, 2
	note F#, 2
	note D#, 2
	note A#, 2
	note __, 2
	note D_, 4
	note D#, 5
	note __, 1
	note D#, 2
	note __, 4
	note G#, 2
	note C_, 2
	note D#, 5
	note __, 1
	note D#, 1
	note __, 1
	note D#, 2
	note __, 2
	octave 3
	note C_, 4
	note D#, 1
	note __, 1
	note D#, 2
	octave 2
	note D#, 1
	note __, 1
	note D#, 2
	octave 3
	note D#, 8
	octave 2
	note D#, 4
	note A#, 4
	octave 3
	note D#, 4
	note G#, 2
	note F#, 2
	octave 2
	note G#, 2
	octave 3
	note G#, 2
	octave 2
	note G#, 4
	octave 3
	note G#, 2
	note __, 2
	loopchannel 0, Music_MayEncounter_Ch3_loop
	
Music_MayEncounter_Ch3_branch_1:
	octave 2
	note C#, 5
	note __, 1
	note C#, 2
	octave 3
	note C_, 2
	octave 2
	note C#, 2
	note __, 2
	note C_, 2
	note C#, 2
	tone $0040
	note C#, 2
	tone $0000
	note C#, 8
	octave 3
	note C_, 2
	octave 2
	note G#, 2
	note C#, 6
	note C#, 2
	octave 3
	note C#, 2
	octave 2
	note C#, 2
	note __, 4
	endchannel
	
Music_MayEncounter_Ch3_branch_2:
	octave 3
	note F#, 2
	note __, 2
	octave 2
	note F#, 1
	note __, 1
	note F#, 3
	note __, 1
	note F#, 3
	note __, 1
	note F#, 2
	octave 3
	note F#, 2
	endchannel
	
Music_MayEncounter_Ch3_branch_3:
	note G#, 4
	octave 3
	note G#, 2
	note __, 2
	octave 2
	note A#, 4
	octave 3
	note A#, 2
	note __, 2
	octave 2
	note B_, 4
	octave 3
	note B_, 2
	note __, 2
	note C_, 2
	octave 4
	note C_, 2
	endchannel
	
Music_MayEncounter_Ch4:
	togglenoise $3
	notetype $6
Music_MayEncounter_Ch4_loop:
	note C_, 2
	note C_, 2
	note C#, 2
	note C#, 2
	note C_, 8
	note C_, 2
	note C_, 2
	note C#, 4
	note C_, 4
	note C_, 2
	note C_, 2
	note C#, 4
	note C_, 4
	note C_, 4
	note C#, 2
	note C_, 2
	note C#, 4
	note C_, 4
	note B_, 8
	callchannel Music_MayEncounter_Ch4_branch_1
	callchannel Music_MayEncounter_Ch4_branch_1
	callchannel Music_MayEncounter_Ch4_branch_1
	callchannel Music_MayEncounter_Ch4_branch_2
	note C_, 2
	note C#, 2
	note C_, 2
	note C_, 2
	callchannel Music_MayEncounter_Ch4_branch_1
	callchannel Music_MayEncounter_Ch4_branch_1
	callchannel Music_MayEncounter_Ch4_branch_1
	callchannel Music_MayEncounter_Ch4_branch_2
	note C_, 4
	note C#, 2
	note C_, 1
	note C_, 1
	callchannel Music_MayEncounter_Ch4_branch_3
	note C#, 6
	note C#, 2
	note D_, 4
	note C#, 2
	note C#, 2
	note D_, 4
	note C#, 4
	note C#, 4
	note D_, 2
	note C#, 2
	callchannel Music_MayEncounter_Ch4_branch_3
	note C#, 4
	note D_, 2
	note C#, 2
	note D_, 4
	note C#, 2
	note D_, 2
	note C#, 6
	note C#, 2
	note D_, 4
	note C_, 2
	note C_, 2
	note C#, 6
	note C#, 2
	note D_, 4
	note C#, 4
	note C#, 6
	note D_, 2
	note C#, 4
	note D_, 4
	note C#, 6
	note C#, 2
	note D_, 4
	note D_, 4
	note C#, 2
	note D_, 4
	note C#, 2
	note D_, 4
	note D_, 2
	note C_, 2
	loopchannel 0, Music_MayEncounter_Ch4_loop
	
Music_MayEncounter_Ch4_branch_1:
	note C#, 8
	note C_, 2
	note C#, 4
	note C#, 6
	note C#, 4
	note C_, 4
	note D#, 2
	note D#, 2
	endchannel
	
Music_MayEncounter_Ch4_branch_2:
	note C#, 4
	note C_, 4
	note C#, 2
	note C_, 4
	note C#, 2
	note C_, 4
	note C_, 4
	endchannel
	
Music_MayEncounter_Ch4_branch_3:
	note C#, 6
	note D_, 6
	note C#, 2
	note C#, 2
	note C#, 4
	note C#, 4
	note D_, 2
	note C#, 4
	note C#, 2
	endchannel
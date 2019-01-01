Music_RivalBattle:
	musicheader 4, 1, Music_RivalBattle_Ch1
	musicheader 1, 2, Music_RivalBattle_Ch2
	musicheader 1, 3, Music_RivalBattle_Ch3
	musicheader 1, 4, Music_RivalBattle_Ch4


Music_RivalBattle_Ch1:
	dutycycle $3
	vibrato $12, $15
	tone $0001
	tempo 96
	notetype $c, $b2
	octave 4
Music_RivalBattle_Ch1_loop_1:
	note F_, 1
	note C_, 1
	note E_, 2
	loopchannel 8, Music_RivalBattle_Ch1_loop_1
	dutycycle $0
	intensity $82
	octave 2
	note A_, 6
	note F_, 6
	note A_, 4
	octave 3
	note C_, 6
	note D_, 6
	intensity $86
	note F_, 4
	octave 2
	intensity $82
	note A_, 6
	note F_, 6
	note A_, 4
	octave 3
	note C_, 6
	note D_, 6
	intensity $86
	note A_, 4
	intensity $82
	note A_, 6
	note F_, 6
	note A_, 4
	octave 4
	note C_, 6
	note D_, 6
	intensity $86
	note F_, 2
	intensity $64
	octave 5
	note C_, 1
	note D_, 1
	note E_, 2
	note F_, 2
	note G_, 2
	note G_, 4
	note F_, 2
	note E_, 2
	note F_, 2
	note F_, 1
	note E_, 1
	intensity $60
	note D_, 5
	intensity $67
	note D_, 9
Music_RivalBattle_Ch1_loop_main:
	dutycycle $2
	intensity $60
Music_RivalBattle_Ch1_loop_2:
	octave 2
	note C_, 2
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	loopchannel 4, Music_RivalBattle_Ch1_loop_2
Music_RivalBattle_Ch1_loop_3:
	octave 2
	note D#, 2
	note G#, 2
	octave 3
	note C_, 2
	note D#, 2
	loopchannel 4, Music_RivalBattle_Ch1_loop_3
Music_RivalBattle_Ch1_loop_4:
	octave 2
	note F_, 2
	note A#, 2
	octave 3
	note D_, 2
	note F_, 2
	loopchannel 4, Music_RivalBattle_Ch1_loop_4
Music_RivalBattle_Ch1_loop_5:
	octave 2
	note D#, 2
	note G#, 2
	octave 3
	note C_, 2
	note D#, 2
	loopchannel 4, Music_RivalBattle_Ch1_loop_5
	dutycycle $1
	intensity $97
	octave 4
	note D_, 4
	octave 3
	note A#, 4
	note F_, 4
	note D#, 2
	note D_, 2
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note D_, 2
	note D#, 4
	note D_, 2
	note D#, 2
	note F_, 2 ;
	octave 4
	note D#, 4
	note C_, 4
	octave 3
	note G_, 4
	note D#, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note F_, 4
	note D_, 2
	note D#, 2
	note F_, 2 ;
	octave 4
	note D#, 4
	note C_, 4
	octave 3
	note G_, 4
	note D#, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note F_, 4
	note G_, 2
	note A_, 2
	octave 4
	note C_, 2 ;
	intensity $87
	note F_, 6
	note G_, 6
	intensity $82
	note A_, 6
	intensity $87
	note A_, 6
	intensity $82
	note A#, 2
	note A#, 2
	intensity $87
	note A_, 4
	dutycycle $0
Music_RivalBattle_Ch1_loop_6:
	note __, 16
	loopchannel 7, Music_RivalBattle_Ch1_loop_6
	intensity $84
	octave 2
	note A#, 2
	note F_, 2
	note A#, 2
	octave 3
	note F_, 4
	note F#, 4
	note F_, 2
	note D#, 8
	intensity $87
	note F#, 8
	intensity $84
	octave 2
	note A#, 2
	note F_, 2
	note A#, 2
	octave 3
	note F_, 4
	note F#, 4
	note F_, 2
	note D#, 8
	intensity $87
	note F#, 10
	intensity $94
	callchannel Music_RivalBattle_Ch2_branch_1
	dutycycle $2
	intensity $b1
	octave 5
Music_RivalBattle_Ch1_loop_7:
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 4
	note C_, 2
	octave 4
	note A#, 2
	note G#, 2
	note G_, 4
	note G#, 4
	note A_, 4
	note A#, 2
	octave 5
	note D#, 4
	loopchannel 2, Music_RivalBattle_Ch1_loop_7
	dutycycle $1
	intensity $80
	octave 3
	note F_, 8
	intensity $87
	note F_, 8
	octave 2
	intensity $80
	note F_, 4
	intensity $87
	note F_, 8
	note G_, 4
	intensity $80
	note G#, 8
	intensity $87
	note G#, 8
	octave 3
	note D#, 6
	note F_, 6
	note D#, 4
	intensity $80
	note D_, 8
	intensity $87
	note D_, 8
	octave 2
	intensity $80
	note G_, 4
	intensity $87
	note G_, 8
	note A#, 4
	octave 3
	note C_, 8
	octave 2
	note A#, 8
	note G#, 8
	note D#, 8
	loopchannel 0, Music_RivalBattle_Ch1_loop_main
	
Music_RivalBattle_Ch2:
	dutycycle $2
	vibrato $12, $15
	tone $0001
	notetype $c, $71
	octave 5
Music_RivalBattle_Ch2_loop_1:
	note C_, 1
	note F_, 2
	note G_, 1
	loopchannel 8, Music_RivalBattle_Ch2_loop_1
	dutycycle $0
	intensity $a2
	octave 3
	note C_, 6
	octave 2
	note A_, 6
	octave 3
	note C_, 4
	note F_, 6
	note G_, 6
	intensity $a5
	note A_, 4
	intensity $a2
	note C_, 6
	octave 2
	note A_, 6
	octave 3
	note C_, 4
	note F_, 6
	note G_, 6
	octave 4
	intensity $a5
	note C_, 4
	intensity $a2
	note C_, 6
	octave 3
	note A_, 6
	octave 4
	note C_, 4
	note F_, 6
	note G_, 6
	intensity $a5
	note A_, 4
	intensity $a2
	note C_, 6
	octave 3
	note A_, 6
	octave 4
	note C_, 4
	note F_, 6
	note G_, 6
	intensity $a6
	octave 5
	note C_, 4
Music_RivalBattle_Ch2_loop_main:
	dutycycle $3
	intensity $a6
	octave 4
	note C_, 6
	octave 3
	note F_, 6
	octave 4
	note D#, 2
	note D_, 2
	note C_, 2
	note D#, 2
	note G_, 2
	note A#, 4
	note A_, 2
	note G_, 2
	note F_, 2
	intensity $a0
	note D#, 16
	intensity $a6
	note D#, 16
	note D_, 6
	note F_, 6
	note A#, 4
	octave 5
	note D_, 4
	octave 4
	note A#, 4
	note F_, 4
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D#, 8
	note D_, 8
	note C_, 8
	note D#, 8
	dutycycle $0
	intensity $a7
	note F_, 4
	note D_, 4
	octave 3
	note A#, 8
	dutycycle $2
	intensity $93
	octave 4
	note F_, 4
	note D_, 4
	octave 3
	intensity $95
	note A#, 8
	dutycycle $0
	intensity $a7
	octave 4
	note G_, 4
	note D#, 4
	note C_, 8
	dutycycle $2
	intensity $93
	note G_, 4
	note D#, 4
	intensity $95
	note C_, 8
	dutycycle $0
	intensity $a7
	note G_, 4
	note D#, 4
	note C_, 8
	dutycycle $2
	intensity $93
	note G_, 4
	note D#, 4
	intensity $95
	note C_, 8
	dutycycle $0
	intensity $a7
	note A_, 6
	note A#, 6
	intensity $a2
	octave 5
	note C_, 6
	intensity $a7
	note C_, 6
	intensity $a2
	note D_, 2
	note D_, 2
	intensity $a7
	note C_, 4
	dutycycle $1
	intensity $90
	octave 2
	note A#, 8
	octave 3
	note A#, 8
	note F_, 12
	note D#, 2
	note F_, 2
	note F#, 8
	note A_, 8
	note F_, 12
	note D#, 2
	note F_, 2
	note F#, 8
	note A_, 8
	note F_, 12
	note D#, 2
	note D_, 2
	note D#, 8
	octave 2
	note A_, 8
	octave 3
	note A#, 16
	intensity $97
	note A#, 16
	intensity $a0
	octave 4
	note A#, 16
	intensity $a7
	note A#, 8
	dutycycle $0
	intensity $a4
	octave 3
	note B_, 8
	callchannel Music_RivalBattle_Ch2_branch_1
	note __, 2
	dutycycle $3
	intensity $a0
	octave 4
	note C_, 16
	intensity $a7
	note C_, 16
	intensity $a0
	octave 3
	note F_, 16
	intensity $a7
	note F_, 16
	octave 4
	intensity $a0
	note C_, 8
	intensity $a7
	note C_, 8
	intensity $a0
	octave 3
	note C_, 4
	intensity $a7
	note C_, 8
	note D_, 4
	intensity $a0
	note D#, 8
	intensity $a7
	note D#, 8
	octave 4
	note C_, 6
	octave 3
	note A#, 6
	note G#, 4
	intensity $a0
	note A#, 8
	intensity $a7
	note A#, 8
	intensity $a0
	note D_, 4
	intensity $a7
	note D_, 8
	note F_, 4
	intensity $a0
	note D#, 16
	intensity $a7
	note D#, 16
	loopchannel 0, Music_RivalBattle_Ch2_loop_main
	
Music_RivalBattle_Ch2_branch_1:
	note A#, 4
	note F_, 4
	note B_, 4
	note G#, 4
	note A#, 4
	note F_, 4
	note G#, 4
	note D#, 4
	note A#, 4
	note F_, 4
	note B_, 4
	note G#, 4
	note A#, 4
	octave 4
	note D_, 4
	octave 3
	note B_, 4
	note A#, 2
	endchannel
	
Music_RivalBattle_Ch3:
	notetype $c, $19
	octave 3
	note C_, 16
	octave 2
	note A#, 8
	note G_, 4
	note E_, 4
	callchannel Music_RivalBattle_Ch3_branch_1
	callchannel Music_RivalBattle_Ch3_branch_2
	callchannel Music_RivalBattle_Ch3_branch_1
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 4
	note C_, 2
	note F_, 2
	note G_, 2
	callchannel Music_RivalBattle_Ch3_branch_1
	callchannel Music_RivalBattle_Ch3_branch_2
	callchannel Music_RivalBattle_Ch3_branch_1
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 4
	note C_, 2
	note F_, 2
	note A_, 2
Music_RivalBattle_Ch3_loop_main:
Music_RivalBattle_Ch3_loop_1:
	note C_, 2
	note F_, 2
	loopchannel 7, Music_RivalBattle_Ch3_loop_1
	note G_, 2
	note F_, 2
Music_RivalBattle_Ch3_loop_2:
	note D#, 2
	note G#, 2
	loopchannel 7, Music_RivalBattle_Ch3_loop_2
	note A#, 2
	note G#, 2
Music_RivalBattle_Ch3_loop_3:
	note F_, 2
	note A#, 2
	loopchannel 8, Music_RivalBattle_Ch3_loop_3
Music_RivalBattle_Ch3_loop_4:
	note D#, 2
	note G#, 2
	loopchannel 7, Music_RivalBattle_Ch3_loop_4
	octave 3
	note C_, 2
	octave 2
	note G#, 2
Music_RivalBattle_Ch3_loop_5:
	note D_, 2
	note F_, 2
	loopchannel 7, Music_RivalBattle_Ch3_loop_5
	note G_, 2
	note F_, 2
Music_RivalBattle_Ch3_loop_6:
	note D#, 2
	note G_, 2
	loopchannel 7, Music_RivalBattle_Ch3_loop_6
	note A_, 2
	note G_, 2
Music_RivalBattle_Ch3_loop_7:
	note D#, 2
	note G_, 2
	loopchannel 7, Music_RivalBattle_Ch3_loop_7
	note A_, 2
	note G_, 2
	note F_, 2
	note A_, 4
	note F_, 2
	note A#, 1
	note __, 1
	note A#, 2
	note F_, 2
	octave 3
	note C_, 1
	note __, 1
	note C_, 2
	octave 2
	note F_, 2
	octave 3
	note C_, 2
	octave 2
	note F_, 2
	octave 3
	note D_, 1
	note __, 1
	note D_, 2
	note C_, 2
	octave 2
	note A_, 2
Music_RivalBattle_Ch3_loop_8:
	octave 1
	note A#, 2
	octave 2
	note F_, 2
	loopchannel 6, Music_RivalBattle_Ch3_loop_8
	note A#, 2
	note F_, 2
	octave 1
	note A#, 2
	octave 2
	note A#, 2
Music_RivalBattle_Ch3_loop_9:
	octave 1
	note A#, 2
	octave 2
	note F_, 2
	loopchannel 6, Music_RivalBattle_Ch3_loop_9
	note A#, 2
	note F_, 2
	octave 1
	note A#, 2
	octave 2
	note A#, 2
Music_RivalBattle_Ch3_loop_10:
	octave 1
	note A#, 2
	octave 2
	note F_, 2
	octave 1
	note A#, 2
	octave 2
	note F_, 2
	note A#, 2
	note F_, 2
	octave 1
	note A#, 2
	octave 2
	note A#, 2
	loopchannel 3, Music_RivalBattle_Ch3_loop_10
Music_RivalBattle_Ch3_loop_11:
	octave 1
	note A#, 2
	octave 2
	note F_, 2
	loopchannel 15, Music_RivalBattle_Ch3_loop_11
	note B_, 2
	note G#, 2
Music_RivalBattle_Ch3_loop_12:
	octave 1
	note A#, 2
	octave 2
	note F_, 2
	loopchannel 14, Music_RivalBattle_Ch3_loop_12
	note F_, 2
	octave 1
	note A#, 2
	octave 2
	note F_, 2
	note B_, 2
Music_RivalBattle_Ch3_loop_13:
	note C_, 2
	note F_, 2
	loopchannel 8, Music_RivalBattle_Ch3_loop_13
Music_RivalBattle_Ch3_loop_14:
	note D#, 2
	note G_, 2
	loopchannel 6, Music_RivalBattle_Ch3_loop_14
	note D#, 2
	note A#, 2
	octave 3
	note D_, 2
	octave 2
	note A#, 2
Music_RivalBattle_Ch3_loop_15:
	note C_, 2
	note F_, 2
	loopchannel 7, Music_RivalBattle_Ch3_loop_15
	note G_, 2
	note F_, 2
Music_RivalBattle_Ch3_loop_16:
	note D#, 2
	note G_, 2
	loopchannel 7, Music_RivalBattle_Ch3_loop_16
	note A#, 2
	note G#, 2
Music_RivalBattle_Ch3_loop_17:
	note F_, 2
	note A#, 2
	loopchannel 8, Music_RivalBattle_Ch3_loop_17
Music_RivalBattle_Ch3_loop_18:
	note D#, 2
	note G#, 2
	loopchannel 5, Music_RivalBattle_Ch3_loop_18
	note A#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	loopchannel 0, Music_RivalBattle_Ch3_loop_main
	
Music_RivalBattle_Ch3_branch_1:
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 4
	note C_, 2
	note F_, 2
	note C#, 2
	endchannel
	
Music_RivalBattle_Ch3_branch_2:
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 4
	note C_, 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	endchannel
	
Music_RivalBattle_Ch4:
	togglenoise $3
	notetype $c
	note __, 16
	note __, 12
	note C_, 2
	note C_, 2
Music_RivalBattle_Ch4_loop_main:
Music_RivalBattle_Ch4_loop_1:
	note D#, 4
	note C_, 4
	note D#, 2
	note D#, 2
	note C_, 4
	loopchannel 22, Music_RivalBattle_Ch4_loop_1
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note D#, 4
	note C_, 2
	note D#, 4
	note C_, 2
	note D#, 4
	note D#, 2
	note C_, 2
	note C_, 2
Music_RivalBattle_Ch4_loop_2:
	note D#, 4
	note C_, 4
	note D#, 2
	note D#, 2
	note C_, 4
	note D#, 4
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 4
	note C_, 2
	loopchannel 3, Music_RivalBattle_Ch4_loop_2
	note D#, 4
	note C_, 4
	note D#, 2
	note D#, 2
	note C_, 2
	note C_, 2
Music_RivalBattle_Ch4_loop_3:
	note D#, 4
	note C_, 4
	note D#, 2
	note D#, 2
	note C_, 4
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 2
	loopchannel 4, Music_RivalBattle_Ch4_loop_3
	note B_, 4
Music_RivalBattle_Ch4_loop_4:
	note __, 16
	loopchannel 3, Music_RivalBattle_Ch4_loop_4
	note C_, 4
	note C_, 4
	note C_, 2
	note C_, 2
	loopchannel 0, Music_RivalBattle_Ch4_loop_main
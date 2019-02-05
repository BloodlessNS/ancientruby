Music_Help:
	musicheader 4, 1, Music_Help_Ch1
	musicheader 1, 2, Music_Help_Ch2
	musicheader 1, 3, Music_Help_Ch3
	musicheader 1, 4, Music_Help_Ch4


Music_Help_Ch1:
	dutycycle 0
	vibrato $12, $15
	tone $0001
	tempo 128
	notetype $6, $94
	octave 4
	note __, 2
	note B_, 2
	note A#, 2
	note A_, 2
	note G_, 4
	note F_, 4
	note D#, 4
	note D_, 4
	octave 2
	note B_, 2
	octave 3
	intensity $97
	note G_, 8
	intensity $81
Music_Help_Ch1_loop:
	callchannel Music_Help_Ch1_branch_1
	note G#, 2
	note E_, 2
	note C#, 2
	octave 2
	note G#, 2
	octave 3
	note G#, 2
	note E_, 2
	note C#, 2
	octave 2
	note G#, 2
	callchannel Music_Help_Ch1_branch_1
	note A#, 2
	note F_, 2
	note D_, 2
	octave 2
	note B_, 2
	note G_, 2
	note B_, 2
	octave 3
	note D_, 2
	note F_, 2
	loopchannel 0, Music_Help_Ch1_loop
	
Music_Help_Ch1_branch_1:
	octave 3
	note G_, 2
	note D#, 2
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note G_, 2
	note D#, 2
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note G#, 2
	note E_, 2
	note C#, 2
	octave 2
	note G#, 2
	octave 3
	note G#, 2
	note E_, 2
	note C#, 2
	octave 2
	note G#, 2
	octave 3
	note A_, 2
	note F_, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	note F_, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	endchannel
	
Music_Help_Ch2:
	dutycycle $1
	vibrato $12, $15
	tone $0001
	notetype $6, $b4
	octave 5
	note D_, 1
	note D#, 1
	note G_, 2
	note F#, 2
	note F_, 2
	note D#, 4
	note D_, 4
	note C_, 4
	octave 4
	note B_, 6
	intensity $b7
	note A#, 8
	intensity $b2
Music_Help_Ch2_loop:
	note __, 4
	callchannel Music_Help_Ch2_branch_1
	note G#, 6
	note G#, 10
	callchannel Music_Help_Ch2_branch_1
	note A#, 2
	note A#, 2
	note A#, 4
	note A#, 2
	note A#, 2
	loopchannel 0, Music_Help_Ch2_loop
	
Music_Help_Ch2_branch_1:
	note G_, 6
	note G_, 10
	note G#, 6
	note G#, 10
	note A_, 6
	note A_, 10
	endchannel
	
Music_Help_Ch3:
	notetype $6, $25
	note __, 16
	note __, 8
	octave 3
	note G_, 2
	octave 2
	note G_, 8
Music_Help_Ch3_loop:
	callchannel Music_Help_Ch3_branch_1
	note C_, 4
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note C_, 4
	octave 3
	note C_, 2
	note __, 2
	callchannel Music_Help_Ch3_branch_1
	note G_, 4
	octave 3
	note G_, 2
	note __, 2
	octave 2
	note G_, 2
	note B_, 2
	octave 3
	note F_, 2
	note G_, 2
	loopchannel 0, Music_Help_Ch3_loop
	
Music_Help_Ch3_branch_1:
	octave 2
	note C_, 4
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note C_, 1
	note __, 1
	note C_, 2
	octave 3
	note C_, 1
	note __, 1
	note C_, 2
	octave 2
	note C_, 4
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note C_, 4
	octave 3
	note C_, 1
	note __, 1
	note C_, 2
	octave 2
	note C_, 4
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note C_, 4
	octave 3
	note C_, 2
	note __, 2
	octave 2
	endchannel
	
Music_Help_Ch4:
	togglenoise $3
	notetype $6
	note __, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 2
	note B_, 8
Music_Help_Ch4_loop:
	note C#, 2
	loopchannel 0, Music_Help_Ch4_loop
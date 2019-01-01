Music_WildPokemonVictory:
	musicheader 3, 1, Music_WildPokemonVictory_Ch1
	musicheader 1, 2, Music_WildPokemonVictory_Ch2
	musicheader 1, 3, Music_WildPokemonVictory_Ch3


Music_WildPokemonVictory_Ch1:
	dutycycle $0
	vibrato $12, $15
	tone $0001
	tempo 136
	notetype $c, $80
	octave 3
	note G#, 1
	note A_, 1
	note B_, 1
	octave 4
	note D#, 1
	note E_, 2
	intensity $82
	octave 5
	note D#, 2
	note E_, 2
	intensity $62
	note E_, 2
	intensity $82
	note E_, 2
	intensity $62
	note E_, 2
Music_WildPokemonVictory_Ch1_loop:
	callchannel Music_WildPokemonVictory_Ch1_branch_1
	pitchoffset 0, C#
	callchannel Music_WildPokemonVictory_Ch1_branch_1
	pitchoffset 0, C_
	loopchannel 0, Music_WildPokemonVictory_Ch1_loop
	
Music_WildPokemonVictory_Ch1_branch_1:
	note __, 2
	intensity $72
	octave 3
	note E_, 4
	note E_, 4
	note E_, 4
	note E_, 2
	intensity $62
	octave 4
	note A_, 2
	note A_, 2
	intensity $60
	note A_, 4
	intensity $62
	note F#, 2
	note F#, 2
	note F#, 6
	intensity $72
	octave 3
	note E_, 4
	note E_, 4
	note E_, 4
	note E_, 2
	intensity $62
	octave 4
	note A_, 2
	note A_, 2
	intensity $60
	note A_, 4
	intensity $62
	note G#, 8
	endchannel
	
Music_WildPokemonVictory_Ch2:
	dutycycle $3
	vibrato $12, $15
	tone $0001
	notetype $c, $a0
	octave 4
	note E_, 1
	note F#, 1
	note G#, 1
	note A_, 1
	note B_, 2
	intensity $a7
	note B_, 10
Music_WildPokemonVictory_Ch2_loop:
	callchannel Music_WildPokemonVictory_Ch2_branch_1
	note B_, 2
	note B_, 2
	note B_, 4
	callchannel Music_WildPokemonVictory_Ch2_branch_1
	note B_, 4
	pitchoffset 0, C#
	octave 3
	note B_, 1
	octave 4
	note D#, 1
	note F#, 1
	note A_, 1
	callchannel Music_WildPokemonVictory_Ch2_branch_1
	note B_, 2
	note B_, 2
	note B_, 4
	callchannel Music_WildPokemonVictory_Ch2_branch_1
	note B_, 4
	pitchoffset 0, C_
	octave 3
	note B_, 1
	octave 4
	note D#, 1
	note F#, 1
	note A_, 1
	loopchannel 0, Music_WildPokemonVictory_Ch2_loop
	
Music_WildPokemonVictory_Ch2_branch_1:
	intensity $82
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note B_, 2
	note B_, 2
	note B_, 4
	octave 5
	note C#, 2
	note C#, 2
	intensity $87
	note C#, 4
	intensity $82
	octave 4
	endchannel
	
Music_WildPokemonVictory_Ch3:
	notetype $c, $22
	note __, 4
	octave 3
	note E_, 4
	octave 2
	note B_, 4
	note G#, 4
Music_WildPokemonVictory_Ch3_loop:
	callchannel Music_WildPokemonVictory_Ch3_branch_1
	pitchoffset 0, C#
	octave 2
	note B_, 4
	callchannel Music_WildPokemonVictory_Ch3_branch_1
	pitchoffset 0, C_
	octave 2
	note B_, 4
	loopchannel 0, Music_WildPokemonVictory_Ch3_loop
	
Music_WildPokemonVictory_Ch3_branch_1:
	octave 3
	note E_, 4
	octave 2
	note B_, 4
	octave 3
	note E_, 4
	octave 2
	note B_, 4
	octave 3
	note A_, 8
	note B_, 8
	note E_, 4
	octave 2
	note B_, 4
	octave 3
	note E_, 4
	octave 2
	note B_, 4
	octave 3
	note A_, 4
	note __, 4
	note E_, 4
	endchannel
Music_RSLookReporter:
	musicheader 4, 1, Music_RSLookReporter_Ch1
	musicheader 1, 2, Music_RSLookReporter_Ch2
	musicheader 1, 3, Music_RSLookReporter_Ch3
	musicheader 1, 4, Music_RSLookReporter_Ch4


Music_RSLookReporter_Ch1:
	dutycycle $2
	vibrato $12, $15
	tone $0001
	notetype $6, $71
	tempo 128
	octave 4
	note G#, 1
	note B_, 1
	octave 5
	note E_, 2
	note G#, 2
	note B_, 2
	note G#, 2
	note E_, 2
	note G#, 2
	note B_, 2
	note G#, 2
	note D_, 2
	note G#, 2
	note B_, 2
	note G#, 2
	note D_, 2
	note G#, 2
	note B_, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note B_, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note B_, 2
	note G#, 2
	note C_, 2
	note E_, 2
	note G_, 2
	note B_, 2
	note D_, 2
	note F#, 2
	note A_, 2
	octave 6
	note C#, 2
	dutycycle $1
Music_RSLookReporter_Ch1_loop:
	intensity $a0
	octave 3
	note F#, 16
	intensity $a7
	note F#, 12
	note D#, 2
	note F#, 2
	intensity $a0
	octave 2
	note B_, 16
	intensity $a7
	note B_, 16
	octave 3
	intensity $a0
	note F#, 16
	intensity $a7
	note F#, 12
	note A_, 2
	note A#, 2
	intensity $a0
	note B_, 16
	intensity $a7
	note B_, 16
	loopchannel 0, Music_RSLookReporter_Ch1_loop
	endchannel
	
Music_RSLookReporter_Ch2:
	dutycycle $0
	vibrato $12, $15
	tone $0001
	notetype $6, $b7
	octave 4
	note D#, 1
	note C#, 1
	octave 3
	note B_, 6
	octave 4
	note E_, 2
	intensity $b2
	note F#, 4
	note B_, 8
	note B_, 8
	note A_, 4
	intensity $b7
	note G#, 6
	note A_, 2
	intensity $b2
	note G#, 4
	note E_, 8
	intensity $b7
	note F#, 12
	octave 5
	dutycycle $2
	intensity $81
Music_RSLookReporter_Ch2_loop:
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 4
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 4
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	loopchannel 0, Music_RSLookReporter_Ch2_loop
	
Music_RSLookReporter_Ch3:
	notetype $6, $10
	note __, 2
	octave 2
	note E_, 2
	note __, 4
	note E_, 1
	note __, 1
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note E_, 2
	note D#, 2
	note D_, 4
	note __, 2
	note D_, 1
	note __, 1
	note D_, 2
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note D_, 4
	note C#, 2
	note __, 4
	note C#, 1
	note __, 1
	octave 3
	note C#, 2
	note __, 2
	octave 2
	note C#, 4
	note C_, 2
	note __, 2
	octave 3
	note C_, 4
	octave 2
	note D_, 2
	note __, 2
	octave 3
	note D_, 4
Music_RSLookReporter_Ch3_loop:
	octave 2
	note B_, 6
	octave 3
	note B_, 2
	note __, 2
	note B_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 2
	note B_, 8
	note __, 4
	note A_, 2
	note A#, 2
	note B_, 5
	note __, 1
	note B_, 2
	note __, 4
	note A_, 2
	note A#, 2
	note B_, 5
	note __, 1
	note B_, 2
	note __, 4
	note A_, 2
	note A#, 2
	loopchannel 0, Music_RSLookReporter_Ch3_loop
	
Music_RSLookReporter_Ch4:
	togglenoise $3
	notetype $6
	note __, 2
	note D_, 4
	note F#, 2
	note D_, 2
	note F#, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note C_, 2
	note C_, 2
	note C_, 4
	note F#, 2
	note D_, 2
	note F#, 4
	note C_, 4
	note D_, 4
	note C_, 4
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
Music_RSLookReporter_Ch4_loop:
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note F#, 4
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note F#, 4
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note G#, 2
	note F#, 4
	note G#, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note F#, 4
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note G#, 2
	note F#, 4
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note G#, 2
	note F#, 4
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note G#, 2
	loopchannel 0, Music_RSLookReporter_Ch4_loop
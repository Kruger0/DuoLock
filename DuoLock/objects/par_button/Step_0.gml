


if (place_meeting(x, y, par_character)) {
	if (state = 0) {
		audio_play_at(snd_click_1, x, y, false, undefined, 0, 0.7)
	}
	state = 1
} else {
	if (state = 1) {
		audio_play_at(snd_click_1, x, y, false, undefined, 0, 0.6)
	}
	state = 0
}
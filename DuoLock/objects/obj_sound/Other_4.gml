
if (room == rm_init) {
	return;
}

var _theme = -1
switch (room) {
	case rm_credits: 
	case rm_tutorial: 
	case rm_menu: {
		_theme = snd_music_menu
	} break;
	default: {
		_theme = snd_music_level
	}
}
	
if (group_music_loaded) {

	if !(audio_is_playing(_theme)) {
		audio_stop_sound(current_music)
		current_music = audio_play_sound(_theme, 0, true)
	}
}


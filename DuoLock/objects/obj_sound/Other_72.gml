

if (audio_group_is_loaded(audio_music) && !group_music_loaded) {
	group_music_loaded = true
	audio_group_set_gain(audio_music, global.gamedata.audio[Volume.Music], 0)
}


if (audio_group_is_loaded(audio_sfx) && !group_sfx_loaded) {
	group_sfx_loaded = true
	audio_group_set_gain(audio_sfx, global.gamedata.audio[Volume.Sfx], 0)
}


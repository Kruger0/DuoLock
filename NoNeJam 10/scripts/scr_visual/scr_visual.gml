function toggle_fullscreen() {
	if (window_get_fullscreen()) {
		window_set_fullscreen(false)
		//surface_resize(application_surface, GAME_WID*scl.aps, GAME_HEI*scl.aps)
	} else {
		window_set_fullscreen(true)
		//surface_resize(application_surface, 1920, 1080)
	}
	global.gamedata.video.fullscreen = window_get_fullscreen()
}
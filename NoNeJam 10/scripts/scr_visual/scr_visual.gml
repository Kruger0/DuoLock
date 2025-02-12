function toggle_fullscreen() {
	if (window_get_fullscreen()) {
		window_set_fullscreen(false)
		surface_resize(application_surface, GAME_WID*obj_cam.scl.aps, GAME_HEI*obj_cam.scl.aps)
	} else {
		window_set_fullscreen(true)
		surface_resize(application_surface, display_get_width(), display_get_height())
	}
	global.gamedata.video.fullscreen = window_get_fullscreen()
}
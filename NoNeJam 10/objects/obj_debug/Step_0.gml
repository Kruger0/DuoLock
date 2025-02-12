
if (DEVMODE && keyboard_check_pressed(DEBUG_KEY)) {
	
	if (DEBUG) {
		DEBUG = false
	} else {
		DEBUG = true
	}
	
	window_set_cursor(DEBUG ? cr_arrow : cr_none)
	show_debug_overlay(DEBUG, true)
}


if (DEVMODE && keyboard_check_pressed(DEBUG_KEY)) {
	
	if (DEBUG) {
		DEBUG = false
	} else {
		DEBUG = true
	}
	
	show_debug_overlay(DEBUG, true)
}
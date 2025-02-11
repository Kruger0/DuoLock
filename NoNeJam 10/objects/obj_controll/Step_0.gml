
if (DEVMODE && keyboard_check_pressed(DEBUG_KEY)) {
	
	if (DEBUG) {
		DEBUG = false
	} else {
		DEBUG = true
	}
}

GAME_TIME += 16.67


if (keyboard_check_pressed(ord("F"))) {
	
	with (global.current_char) {
		scale.y *= 0.8
		scale.x *= 1.2
	}
	
	global.current_char = (global.current_char == obj_char1 ? obj_char2 : obj_char1)
	
	with (global.current_char) {
		scale.y *= 1.2
		scale.x *= 0.8
	}
}


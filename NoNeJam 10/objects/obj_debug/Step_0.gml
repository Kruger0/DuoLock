
if (DEVMODE && keyboard_check_pressed(DEBUG_KEY)) {
	
	if (DEBUG) {
		DEBUG = false
	} else {
		DEBUG = true
	}
	
	window_set_cursor(DEBUG ? cr_arrow : cr_none)
	show_debug_overlay(DEBUG, true)
}

if (keyboard_check_pressed(vk_f10)) {
	room_tp = true
	keyboard_lastchar = ""
}

if (room_tp) {
	var _num = string_digits(keyboard_lastchar)
	var _room = asset_get_index("rm_level_"+_num)
	if (room_exists(_room)) {
		room_tp = false
		cam_tran_start(_room)
	}
}


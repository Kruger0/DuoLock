
for (var i = 0; i < 4; i++) {
	col_scl[i][0] = lerp(col_scl[i][0], col_scl_default, 0.1)
	col_scl[i][1] = lerp(col_scl[i][1], col_scl_default, 0.1)
}

if (!textbox_exists() && string_letters(room_get_name(room)) == "rmlevel" && !transition_exists()) {
	var _time = 40
	if (input_check("restart")) {
		reset_time++
		if (reset_time > _time) {
			cam_tran_start(room)
			reset_time = 0
		}
	} else {
		reset_time = 0
	}
	
	if (input_check("back")) {
		menu_time++
		if (menu_time > _time) {
			cam_tran_start(rm_menu)
			menu_time = 0
		}
	} else {
		menu_time = 0
	}
}

intro.step()

if (automatic || input_check_pressed("action")) {
	var _character = character
	if (character == "Both") {
		_character = [par_character]
	}
	if (place_meeting(x, y, _character)) {
		obj_gui.col_scl_default = 1
		instance_destroy()
	}
}

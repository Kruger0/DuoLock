
if (automatic || input_check_pressed("action")) {
	var _character = character
	if (character == "Both") {
		_character = [par_character]
	}
	if (place_meeting(x, y, _character)) {
		textbox_create(dialog_key)
		instance_destroy()
	}
}

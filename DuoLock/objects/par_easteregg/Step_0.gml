
if (place_meeting(x, y, par_character)) {
	outline = true
	if (input_check_pressed("action")) {
		textbox_create(dialog_key)
	}
} else {
	outline = false
}



// Get inputs
if (instance_exists(global.current_char)) {
	with (global.current_char) {
		if (!textbox_exists()) {
			get_inputs()
		}
	}
}

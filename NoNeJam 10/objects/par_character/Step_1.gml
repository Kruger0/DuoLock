
// Get inputs
if (global.current_char.id == id) {
	if (!textbox_exists() && !global.mid_transition && !obj_cam.level_delay) {
		get_inputs()
	}
}
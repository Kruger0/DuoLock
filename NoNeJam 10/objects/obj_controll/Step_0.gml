
if (room == rm_init) {
	layer_background_blend(layer_background_get_id(layer_get_id("Background")), c_tran)
	if (obj_sound.group_music_loaded && obj_sound.group_sfx_loaded) {
		cam_tran_start(rm_menu)
	}
}

GAME_TIME += 16.67

// Troca de personagem
if (!textbox_exists() && input_check_pressed("change")) {
	
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

if (instance_exists(obj_char1_goal) && instance_exists(obj_char2_goal)) {
	var _state = obj_char1_goal.state + obj_char2_goal.state
	if (_state > 1) {
		obj_cam.levelpass()
	}
}

if (input_check_pressed("skip")) {
	textbox_skip()
}

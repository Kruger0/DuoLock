
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

if (input_check_pressed("skip")) {
	textbox_skip()
}

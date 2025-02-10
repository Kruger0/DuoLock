
GAME_TIME += 16.67

if (instance_exists(obj_char1) && instance_exists(obj_char2)) {
	if (global.current_char = -1) {
		global.current_char = obj_char1
	}
	
	if (keyboard_check_pressed(ord("F"))) {
		global.current_char = (global.current_char == obj_char1 ? obj_char2 : obj_char1)
	}
}
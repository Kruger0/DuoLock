// update listener
if (instance_exists(global.current_char)) {
	var _x = global.current_char.x
	var _y = global.current_char.y
	audio_listener_position(_x, _y, 0)
	audio_listener_orientation(0, 0, 1, 0, -1, 0)
}


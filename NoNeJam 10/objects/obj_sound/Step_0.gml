// update listener
if (instance_exists(obj_player)) {
	var _x = obj_player.x
	var _y = obj_player.y
	audio_listener_position(_x, _y, 0)
	audio_listener_orientation(0, 0, 1, 0, -1, 0)
}


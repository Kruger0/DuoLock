
if (string_letters(room_get_name(room)) == "rmlevel") {
	tile_solidify("tile_walls", par_solid)
}

if (instance_exists(obj_char1) && instance_exists(obj_char2)) {
	if (global.current_char = -1) {
		global.current_char = obj_char1 // TODO ou random
	}
}
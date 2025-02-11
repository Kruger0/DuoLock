
if (string_letters(room_get_name(room)) == "rmlevel") {
	layer_depth_update()
	tile_solidify("tile_walls_top", par_solid, 8)
	tile_solidify("tile_walls_base", par_solid)
}

if (instance_exists(obj_char1) && instance_exists(obj_char2)) {
	if (global.current_char = -1) {
		global.current_char = obj_char1 // TODO ou random
	}
}

if (string_letters(room_get_name(room)) == "rmlevel") {
	if (instance_exists(global.current_char)) {
		with (global.current_char) {
			draw_sprite_ext(spr_char_pointer, GAME_TIME*0.01, x, y - 22 + sin_wave(4, 1), 0.5, 0.5, 0, -1, 1);
		}
	}
}
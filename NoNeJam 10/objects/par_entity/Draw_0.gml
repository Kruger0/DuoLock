
matrix_set(matrix_world, matrix_build(x, y, 0, global.tilt, 0, 0, 1, 1, 1))

	draw_sprite_ext(sprite_index, image_index, 0, 0, scale.x * facing, scale.y, angle, image_blend, image_alpha)

	if (global.current_char.id == id) {
		draw_sprite_ext(spr_char_pointer, GAME_TIME*0.01, 0, -22 + sin_wave(4, 1), 0.5, 0.5, 0, -1, 1);
	}

matrix_set(matrix_world, matrix_build_identity())

if (DEBUG) {
	draw_hitbox(c_red, 0.5)
}

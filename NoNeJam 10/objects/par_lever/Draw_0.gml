
switch (abs(image_angle)) {
	case 0: {
		matrix_set(matrix_world, matrix_build(x, y+5-8, -8, -70, 0, 0, scl, scl, scl))
		outline_draw_sprite(sprite_index, state, 0, 0, ol_config(show_outline, c_white, 1, 1));
		matrix_set(matrix_world, matrix_build_identity())
	} break;
	case 90: {
		
	} break;
	case 180: {
		matrix_set(matrix_world, matrix_build(x, y+5-16+8, -8, -70, 0, 0, -scl, scl, scl))
		outline_draw_sprite(sprite_index, state, 0, 0, ol_config(show_outline, c_white, 1, 1));
		matrix_set(matrix_world, matrix_build_identity())
	} break;
}

scl = lerp(scl, 1, 0.1)
show_outline = false
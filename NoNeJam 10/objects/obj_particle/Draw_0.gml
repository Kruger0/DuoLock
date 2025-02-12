
matrix_set(matrix_world, matrix_build(x, y, 0, global.tilt, 0, 0, 1, 1, 1))
draw_sprite_ext(sprite_index, image_index, 0, 0, scale, scale, image_angle, image_blend, image_alpha)
matrix_set(matrix_world, matrix_build_identity())
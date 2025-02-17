
matrix_set(matrix_world, matrix_build(x, y, z, global.tilt, 0, 0, 1, 1, 1))

	shader_set(shd_flash)
	draw_sprite_ext(sprite_index, image_index, 0, 0, scale.x * facing, scale.y, angle, image_blend, stomp_time/40)
	shader_reset()
	
	if (global.current_char.id == id) {
		var _diag = instance_place(x, y, [obj_trigger_dialog, par_easteregg])
		if (_diag && !_diag.automatic) {
			draw_sprite(spr_open_dialog, 0, 0.5, -24 + sin_wave(4, 1))
		}
	}

matrix_set(matrix_world, global.matrix_idendity)


if (DEBUG) {
	draw_hitbox(c_red, 0.5)
}

var _d = gpu_get_depth()
gpu_set_depth(-0.2)
gpu_set_zwriteenable(false)
draw_sprite_ext(spr_shadow, 0, x, y, 1, 1, 0, -1, 0.2)
gpu_set_zwriteenable(true)
gpu_set_depth(_d)


var _cw = GAME_WID * scl.cam
var _ch = GAME_HEI * scl.cam


if (instance_exists(global.current_char)) {
	print(global.current_char)
	var _mouse_fac = 0.0
	follow_pos.x = lerp(global.current_char.x, mouse_x, _mouse_fac)
	follow_pos.y = lerp(global.current_char.y, mouse_y, _mouse_fac)
}
	
x = round(lerp(x, (follow_pos.x + follow_offset.x) - cam_w/2, follow_spd))
y = round(lerp(y, (follow_pos.y + follow_offset.y) - cam_h/2, follow_spd))

x = clamp(x, cam_limit.x, cam_limit.z)
y = clamp(y, cam_limit.y, cam_limit.w)

screenshake_fx()

// camera update
camera_set_view_pos(cam, x, y)
camera_set_view_size(cam, _cw, _ch)
camera_set_view_angle(cam, angle)

// 2D process

if (keyboard_check_pressed(vk_f11)) {
	toggle_fullscreen()
}

var _cw = GAME_WID * scl.cam
var _ch = GAME_HEI * scl.cam


if (instance_exists(global.current_char)) {
	follow_pos.x = global.current_char.x
	follow_pos.y = global.current_char.y
}
	
//x = (lerp(x, (follow_pos.x + follow_offset.x) - cam_w/2, follow_spd))
//y = (lerp(y, (follow_pos.y + follow_offset.y) - cam_h/2, follow_spd))

//x = clamp(x, cam_limit.x, cam_limit.z)
//y = clamp(y, cam_limit.y, cam_limit.w)

screenshake_fx()

// camera update
camera_set_view_pos(cam, x, y)
camera_set_view_size(cam, _cw, _ch)
camera_set_view_angle(cam, angle)
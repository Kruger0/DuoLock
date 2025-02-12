
view_enabled = true
view_visible[0] = true

cam_limit = {
	x : 0,
	y : 0, 
	z : room_width - cam_w, 
	w : room_height - cam_h
}

var _cw = GAME_WID * scl.cam
var _ch = GAME_HEI * scl.cam

if (instance_exists(global.current_char)) {
	follow_pos.x = global.current_char.x
	follow_pos.y = global.current_char.y
	
	cam3d.pos.x = global.current_char.x
	cam3d.pos.y = global.current_char.y
			  
	cam3d.to.x  = global.current_char.x
	cam3d.to.y  = global.current_char.y
}
	
x = (follow_pos.x + follow_offset.x) - cam_w/2
y = (follow_pos.y + follow_offset.y) - cam_h/2

x = clamp(x, cam_limit.x, cam_limit.z)
y = clamp(y, cam_limit.y, cam_limit.w)

// camera update
camera_set_view_pos(cam, x, y)
camera_set_view_size(cam, _cw, _ch)
camera_set_view_angle(cam, angle)
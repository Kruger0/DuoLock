
// 3D process
if (string_letters(room_get_name(room)) == "rmlevel") {
	draw_clear_alpha(#0e071b, 0)

	var _acel = 0.075

	if (level_goto_next) {
		
		level_delay++
		if (level_delay > 60) {
			cam_tran_start(room_next(room), 0, , c_black, function() {
				obj_cam.level_delay = 0
				obj_cam.level_goto_next = false
				cam_ztarg = cam_zoff
				cam_ytarg = cam_yoff
			})
			
		}
		cam3d.pos.x = lerp(cam3d.pos.x, lerp(obj_char1.x, obj_char2.x, 0.5)	 , _acel)
		cam3d.pos.y = lerp(cam3d.pos.y, lerp(obj_char1.y, obj_char2.y, 0.5) + cam_ytarg, _acel)
		cam3d.pos.z	= lerp(cam3d.pos.z, cam_ztarg, _acel)

		cam3d.to.x = lerp(cam3d.to.x, lerp(obj_char1.x, obj_char2.x, 0.5), _acel)
		cam3d.to.y = lerp(cam3d.to.y, lerp(obj_char1.y, obj_char2.y, 0.5), _acel)
		cam3d.to.z = lerp(cam3d.to.z, -8, _acel)
	} else {

		cam3d.pos.x = lerp(cam3d.pos.x, follow_pos.x	 , _acel)
		cam3d.pos.y = lerp(cam3d.pos.y, follow_pos.y + cam_ytarg, _acel)
		cam3d.pos.z	= lerp(cam3d.pos.z, cam_ztarg, _acel)

		cam3d.to.x = lerp(cam3d.to.x, follow_pos.x, _acel)
		cam3d.to.y = lerp(cam3d.to.y, follow_pos.y, _acel)
		cam3d.to.z = lerp(cam3d.to.z, -8, _acel)
	}

	cam3d.Apply()
}


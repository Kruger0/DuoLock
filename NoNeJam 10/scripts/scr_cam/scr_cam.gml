



function cam_fx_screenshake(duration, _speed, hor_mag, ver_mag = hor_mag, rotation = 0, _target = 0) {
	with (obj_cam) {
		shake = true;
		shake_time = duration;
		shake_timestart = duration;
		shake_hor_mag = hor_mag
		shake_ver_mag = ver_mag
		shake_speed = _speed*0.1;
		shake_rotation = rotation;
		shake_target = _target;
	}
}


function cam_tran_start(destiny, type = 0, spd = 0.7, col = c_tran, _callback = function(){}) {
	if (obj_cam.tran_state != TranStt.Idle) {
		return;
	}
	obj_cam.tran_fake = false
	obj_cam.tran_callback = _callback
	obj_cam.tran_state = TranStt.In
	obj_cam.tran_type = type
	obj_cam.tran_mask_tex = sprite_get_texture(spr_grayscale_transition, type)
	obj_cam.tran_mask_uv = sprite_get_uvs(spr_grayscale_transition, type)
	obj_cam.tran_from = room
	obj_cam.tran_to = destiny
	obj_cam.tran_spd = spd
	obj_cam.tran_col = col
}

function cam_tran_fake(_callback = function(){}, type = 0, spd = 0.4, col = c_black) {
	if (obj_cam.tran_state != TranStt.Idle) {
		return;
	}
	obj_cam.tran_fake = true
	obj_cam.tran_callback = _callback
	obj_cam.tran_state = TranStt.In
	obj_cam.tran_type = type
	obj_cam.tran_mask_tex = sprite_get_texture(spr_grayscale_transition, type)
	obj_cam.tran_mask_uv = sprite_get_uvs(spr_grayscale_transition, type)
	obj_cam.tran_spd = spd
	obj_cam.tran_col = col
}

function tran_reset_globals() {
	//global.room_timer = 0
}

function transition_exists() {
	return !obj_cam.tran_state == TranStt.Idle
}
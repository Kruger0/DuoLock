event_inherited()

// ============================================= Variables

walk_spd		= 2
acel			= 0.4
facing			= 1
angle			= 0


invencible		= false
inv_time		= 0
inv_delay		= 0.75


wobble_delay	= 60/7
wobble_time		= 0
dust_delay		= 60/15
dust_time		= 0


moving			= false
last_dir		= 0

// ============================================= Methods

get_inputs = function() {
	k_up		= input_check("up")
	k_left		= input_check("left")
	k_down		= input_check("down")
	k_right		= input_check("right")
	
	
	var _fac_prev = facing
	facing = (mouse_x > x)*2.0-1.0
	if (_fac_prev != facing) {
		scale.y *= 1.1
		scale.x *= 0.9
	}
		
	// TODO read right axis as a direction too
	mouse_dir	= point_direction(0, 0, mouse_x, mouse_y)
}
get_inputs()


movement = function() {
	walk_dir = point_direction(0, 0, k_right - k_left, k_down - k_up)
	
	var _hor_vec = dcos(walk_dir) * walk_spd
	var _ver_vec = -dsin(walk_dir) * walk_spd
	if ((k_right ^^ k_left) || (k_down ^^ k_up)) {
		vel.x = lerp(vel.x, _hor_vec, acel)
		vel.y = lerp(vel.y, _ver_vec, acel)
		last_dir = walk_dir
	} else {
		vel.x = lerp(vel.x, 0, acel)
		vel.y = lerp(vel.y, 0, acel)
	}
	
	
	var _min_acel = 1.15
	if (abs(vel.x) > acel*_min_acel || abs(vel.y) > acel*_min_acel) {
		//sprite_index = spr_player_1_run
		wobble_time--
		if (wobble_time < 1) {
			wobble_time = wobble_delay
			scale.x *= 1.05
			scale.y *= 0.90
		}
		dust_time--
		if (dust_time < 1 || true) {
			dust_time = dust_delay
			var _rrx = 8
			var _rry = 2
			var _rx = random_range(-_rrx, _rrx)
			var _ry = random_range(-_rry, _rry)
			ember_part_create(x + _rx, y + _ry, EmberType.Walk)
		}
		moving = true
		if (abs(vel.x) > acel*_min_acel) {
			angle = lerp(angle, -sign(vel.x) * 8, 0.2)
		} else {
			angle = lerp(angle, 0, 0.2)
		}
	} else {
		//sprite_index = spr_player_1_idle
		angle = lerp(angle, 0, 0.2)
		moving = false
		wobble_time = wobble_delay
	}
}

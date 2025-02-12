event_inherited()

// ============================================= Variables

walk_spd		= 1
acel			= 0.4
facing			= 1
angle			= 0

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
	k_interact	= input_check_pressed("action")
	
	var _fac_prev = facing
	facing = (k_right - k_left != 0 ? k_right - k_left : facing)
	if (_fac_prev != facing) {
		scale.y *= 1.1
		scale.x *= 0.9
	}		
}

get_inputs()


movement = function() {
	walk_dir = point_direction(0, 0, k_right - k_left, k_down - k_up)
	
	// Movimento
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
	
	// Poeira e animacao
	var _min_acel = 1.15
	if (abs(vel.x) > acel*_min_acel || abs(vel.y) > acel*_min_acel) {
		sprite_index = spr.run
		dust_time--
		if (dust_time < 1 || true) {
			dust_time = dust_delay
			var _rrx = 2
			var _rry = 1
			if (chance(20)) {
				var _rx = random_range(-_rrx, _rrx)
				var _ry = random_range(-_rry, _rry)
				//ember_part_create(x + _rx, y + _ry, EmberType.Walk)
				with (part_create(x + _rx, y + _ry, 0)) {
					sprite_index = spr_dust
					image_blend = choose(#FFFFFF, #DDDDDD, #BBBBBB)
					scale = 0.4
				}
			}
		}
		moving = true
	} else {
		sprite_index = spr.idle
		angle = lerp(angle, 0, 0.2)
		moving = false
	}
}

interact = function() {
	var _interacs = [obj_lever_red, obj_lever_blue]
	var _list = ds_list_create()
	var _col = collision_circle_list(x, y, 4, _interacs, false, true, _list, true)
	if (_col) {
		var _inst = _list[|0]
		with (_inst) {
			show_outline = true
			if (other.k_interact) {
				_inst.state = !_inst.state
				_inst.scl = 1.2
			}
		}
	}
	ds_list_destroy(_list)
}





















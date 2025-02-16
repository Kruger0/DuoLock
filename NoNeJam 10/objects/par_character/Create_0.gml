event_inherited()

// ============================================= Variables

walk_spd		= 1.1
acel			= 0.2
facing			= 1
angle			= 0

dust_delay		= 60/15
dust_time		= 0

moving			= false
last_dir		= 0
velz = 0
grav = 1.5

// ============================================= Methods

stomp_time = 0

take_dmg = function() {
	stomp_time = max(stomp_time-1, 0)
	var _list = ds_list_create()
	var _dmg = collision_circle_list(x, y, GRID*2, dmg_source, true, true, _list, false)
	if (_dmg) {

		// Empurra o jogador na direcao contrária média do dano
		var _mx = 0
		var _my = 0
		for (var i = 0; i < _dmg; i++) {
			var _inst = _list[| i]
			_mx += _inst.x + _inst.sprite_width/2
			_my += _inst.y + _inst.sprite_height/2
		}
		_mx /= _dmg
		_my /= _dmg

		var _col = instance_place(x, y, dmg_source)
		if (_col && !stomp_time) {
			stomp_time = 40
			var _dir = point_direction(_mx, _my, x, y)
		
			var _spd = 3
			var _vec = new Vector2().SetDirection(_dir)
	
		
			vel.x += _vec.x * _spd
			vel.y += _vec.y * _spd
			scale.x = 0.8
			scale.y = 1.2;
			velz += _spd*0.6
			cam_fx_screenshake(60, 10, 5)
			audio_play_sound(snd_hurt_1, 0, false, undefined, undefined, random_range(0.9, 1.1))
			switch (dmg_source) {
				case obj_water: {
					if !(global.flag_water) {
						textbox_create("water")
						global.flag_water = true
					}					
				} break;
				case obj_poison: {
					if !(global.flag_acid) {
						textbox_create("acid")
						global.flag_acid = true
					}					
				} break;
			}
		}
	}
	//var _dmg = 
	//if (_dmg && !stomp_time) {
	//	stomp_time = 40
	//	//var _dir = point_direction(x, y, _dmg.x + _dmg.sprite_width/2, _dmg.y + _dmg.sprite_height/2) + 45
	//	//print(_dir, _dir div 90)
	//	////var _back = new Vector2()
	//	////print(_dir)
		
	//	var _spd = 1
	//	var _side = new Vector2(x > _dmg.x + _dmg.sprite_width/2, y > _dmg.y + _dmg.sprite_width/2)
	//	var _dir = new Vector2(vel.x, vel.y).Normalize()
		
	//	vel.x -= _dir.x * _spd
	//	vel.y -= _dir.y * _spd
	//	scale.x = 0.8
	//	scale.y = 1.2;
	//	velz += _spd*0.6
	//	cam_fx_screenshake(60, 10, 5)
	//}
	ds_list_destroy(_list)
}

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
	var _hor_vec = stomp_time ? 0 : dcos(walk_dir) * walk_spd
	var _ver_vec = stomp_time ? 0 : -dsin(walk_dir) * walk_spd
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
	var _interacs = [obj_lever_red, obj_lever_blue, obj_lever_green, obj_lever_yellow]
	var _list = ds_list_create()
	var _col = collision_circle_list(x, y, 4, _interacs, false, true, _list, true)
	if (_col) {
		var _inst = _list[|0]
		with (_inst) {
			show_outline = true
			if (other.k_interact) {
				state = !state
				audio_play_at(snd_click_1, x, y, false, undefined, 0, state ? 1.0 : 0.8)
				scl = 1.2
			}
		}
	}
	ds_list_destroy(_list)
}





















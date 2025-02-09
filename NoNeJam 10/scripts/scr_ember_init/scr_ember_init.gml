

/*
[]=========================================================[]
||                    	Ember Particle System for GMS2	   ||
||                    									   ||
||                    							--Krug	   ||
[]=========================================================[]
*/


///@ignore
function __ember_get_cache() {
	static cache = {
		sys:	[],
		type:	[],
		emit:	[],
	}
	return cache;
}

///@ignore
function __ember_new_type(_part_id) constructor {
	
	static __ember_cache = __ember_get_cache()	
	part_id = _part_id
	
	#region Variables
	
	// texture
	tex_mode	= 0 // 0: pt_shape, 1: sprite
	tex_id		= pt_shape_sphere
	tex_anim	= false
	tex_stretch = false
	tex_random	= false
	
	// color
	col_mode	= 0 // 0: no color, 1: default, 2: mix, 3: rgb, 4: hsv		
	col_1		= c_white
	col_2		= c_white
	col_3		= c_white
	col_4		= 0
	col_5		= 0
	col_6		= 0	
	col_blend	= false
	alpha_1		= 1
	alpha_2		= 1
	alpha_3		= 1
	
	// life
	life_min	= 60
	life_max	= 60
	
	// scale
	scale_x		= 1
	scale_y		= 1
	
	// size
	size_min	= 1
	size_max	= 1
	size_inc	= 0
	size_wig	= 0
	
	// speed
	spd_min		= 0
	spd_max		= 0
	spd_inc		= 0
	spd_wig		= 0
	
	// gravity
	grav_force	= 0
	grav_dir	= 270
	
	// direction
	dir_min		= 0
	dir_max		= 0
	dir_inc		= 0
	dir_wig		= 0
	
	// angle
	ang_min		= 0
	ang_max		= 0
	ang_inc		= 0
	ang_wig		= 0
	ang_relat	= false
	
	// subparticles
	step_type	= undefined
	step_count	= 1
	death_type	= undefined
	death_count	= 1	
	
	#endregion
	
	#region Functions
	
	///@func shape(part_shape)
	static shape = function(_shape) {
		tex_mode	= 0
		tex_id		= _shape
		return self
	}
	
	///@func sprite(sprite, [anim], [stretch], [random])
	static sprite = function(_sprite, _anim = true, _stretch = true, _random = false) {
		tex_mode	= 1
		tex_id		= _sprite
		tex_anim	= _anim
		tex_stretch = _stretch
		tex_random	= _random		
		return self
	}
	
	///@func color(col1, col2, col3)
	static color = function(_c1, _c2 = _c1, _c3 = _c2) {
		col_mode	= 1
		col_1		= _c1
		col_2		= _c2
		col_3		= _c3
		return self
	}
	
	///@func mix(col1, col2)
	static mix = function(_c1, _c2) {
		col_mode	= 2
		col_1		= _c1
		col_2		= _c2
		return self
	}
	
	///@func rgb(r_min, r_max, g_min, g_max, b_min, b_max)
	static rgb = function(_rmin, _rmax, _gmin, _gmax, _bmin, _bmax) {
		col_mode	= 3
		col_1		= _rmin
		col_2		= _rmax
		col_3		= _gmin
		col_4		= _gmax
		col_5		= _bmin
		col_6		= _bmax
		return self
	}
	
	///@func hsv(h_min, h_max, s_min, s_max, v_min, v_max)
	static hsv = function(_hmin, _hmax, _smin, _smax, _vmin, _vmax) {
		col_mode	= 4
		col_1		= _hmin
		col_2		= _hmax
		col_3		= _smin
		col_4		= _smax
		col_5		= _vmin
		col_6		= _vmax
		return self
	}	
	
	///@func alpha(alpha_1, [alpha_2], [alpha_3])
	static alpha = function(_a1, _a2 = _a1, _a3 = _a2) {
		alpha_1		= _a1
		alpha_2		= _a2
		alpha_3		= _a3
		return self
	}
	
	///@func blend(blend)
	static blend = function(_blend) {
		col_blend	= _blend
		return self
	}	
	
	///@func life(life_min, [life_max])
	static life = function(_min, _max = _min) {
		life_min	= _min
		life_max	= _max
		return self
	}
	
	///@func scale(scale_x, scale_y)
	static scale = function(_scalx, _scaly) {
		scale_x		= _scalx
		scale_y		= _scaly
		return self
	}
	
	///@func size(size_min, size_max, size_inc, size_wiggle)
	static size = function(_min, _max = _min, _inc = 0, _wig = 0) {
		size_min	= _min
		size_max	= _max
		size_inc	= _inc
		size_wig	= _wig
		return self
	}

	///@func spd(spd_min, spd_max, spd_inc, spd_wiggle)
	static spd = function(_min, _max = _min, _inc = 0, _wig = 0) {
		spd_min		= _min
		spd_max		= _max
		spd_inc		= _inc
		spd_wig		= _wig
		return self
	}

	///@func grav(force, direction)
	static grav = function(_force, _dir) {
		grav_force	= _force
		grav_dir	= _dir
		return self
	}
	
	///@func direc(dir_min, dir_max, dir_inc, dir_wiggle)
	static direc = function(_min, _max = _min, _inc = 0, _wig = 0) {
		dir_min		= _min
		dir_max		= _max
		dir_inc		= _inc
		dir_wig		= _wig
		return self
	}
	
	///@func angle(ang_min, ang_max, ang_inc, ang_wiggle, relative)
	static angle = function(_min, _max = _min, _inc = 0, _wig = 0, _relative = false) {
		ang_min		= _min
		ang_max		= _max
		ang_inc		= _inc
		ang_wig		= _wig
		ang_relat	= _relative
		return self
	}
	
	///@func step(type, count)
	static step = function(_type, _count = 1) {
		step_type	= _type
		step_count	= _count
		return self
	}
	
	///@func death(type, count)
	static death = function(_type, _count = 1) {
		death_type	= _type
		death_count = _count
		return self
	}
	
	///@func save()
	static save = function() {	
		part_type = part_type_create();
		__ember_cache.type[part_id] = part_type
		
		switch (tex_mode) {
			case 0: {part_type_shape(part_type, tex_id)}										break;
			case 1: {part_type_sprite(part_type, tex_id, tex_anim, tex_stretch, tex_random)}	break;
		}
		
		switch (col_mode) {
			case 0: {/*Blank Color*/}															break;
			case 1: {part_type_color3(part_type, col_1, col_2, col_3)}							break;
			case 2: {part_type_color_mix(part_type, col_1, col_2)}								break;
			case 3: {part_type_color_rgb(part_type, col_1, col_2, col_3, col_4, col_5, col_6)}	break;
			case 4: {part_type_color_hsv(part_type, col_1, col_2, col_3, col_4, col_5, col_6)}	break;
		}
		
		part_type_alpha3(part_type, alpha_1, alpha_2, alpha_3);
		part_type_blend(part_type, col_blend);
		part_type_life(part_type, life_min, life_max);
		part_type_scale(part_type, scale_x, scale_y);	
		part_type_size(part_type, size_min, size_max, size_inc, size_wig);
		part_type_speed(part_type, spd_min, spd_max, spd_inc, spd_wig);
		part_type_gravity(part_type, grav_force, grav_dir);
		part_type_direction(part_type, dir_min, dir_max, dir_inc, dir_wig);
		part_type_orientation(part_type, ang_min, ang_max, ang_inc, ang_wig, ang_relat);
		
		
		if !(is_undefined(step_type)) {part_type_step(part_type, step_count, __ember_get_cache().type[step_type])};
		if !(is_undefined(death_type)) {part_type_death(part_type, death_count, __ember_get_cache().type[death_type])};
	}
	
	#endregion
}


//==============================================
#region System

///@func ember_system_create(system_id)
function ember_system_create(_system_id) {
	__ember_get_cache().sys[_system_id] = part_system_create()
}

///@func ember_system_depth(system_id, depth)
function ember_system_depth(_system_id, _depth) {
	part_system_depth(__ember_get_cache().sys[_system_id], _depth)
}

///@func ember_system_clear(system_id)
function ember_system_clear(_system_id) {
	part_system_clear(__ember_get_cache().sys[_system_id])
}

///@func ember_system_automatic_update(system_id, automatic)
function ember_system_automatic_update(_system_id, _automatic) {
	part_system_automatic_update(__ember_get_cache().sys[_system_id], _automatic)
}

///@func ember_system_clear_all()
function ember_system_clear_all() {
	for (var i = 0; i < array_length(__ember_get_cache().sys); i++) {
		part_system_clear(__ember_get_cache().sys[i])
	}	
}

///@func ember_system_automatic_update_all(automatic)
function ember_system_automatic_update_all(_automatic) {
	for (var i = 0; i < array_length(__ember_get_cache().sys); i++) {
		part_system_automatic_update(__ember_get_cache().sys[i], _automatic)
	}
}

#endregion
//==============================================


//==============================================
#region Emitter - WIP

///@func ember_emit_create(emitter_id, [system_id])
function ember_emit_create(_emitter_id, _system_id = EmberSys.Default) {
	__ember_get_cache().emit[_emitter_id] = part_emitter_create(__ember_get_cache().sys[_system_id])
}

function ember_emit_region() {
	
}

#endregion
//==============================================


//==============================================
#region Type

///@func ember_type_create(part_id)
function ember_type_create(_part_id) {
	return new __ember_new_type(_part_id);
}

///@func ember_type_edit(part_id)
function ember_type_edit(_part_id) {
	
}

#endregion
//==============================================


//==============================================
#region Part

///@func ember_part_create(x, y, type, [number], [color], [system])
function ember_part_create(_x, _y, _type, _number = 1, _color = undefined, _sys = EmberSys.Default) {
	if (_number == 0) return;	
	static __ember_cache = __ember_get_cache()
	var _chance = 100/(_number < 0 ? abs(_number) : 1)
	if (_chance > random(100)) {
		if (is_undefined(_color)) {
			part_particles_create(__ember_cache.sys[_sys], _x, _y, __ember_cache.type[_type], max(_number, 1))
		} else {
			part_particles_create_color(__ember_cache.sys[_sys], _x, _y, __ember_cache.type[_type], _color, max(_number, 1))
		}
	}
}

function ember_part_create_region(_x1, _y1, _x2, _y2, _type, _shape, _distrib, _number = 1, _color = undefined, _sys = EmberSys.Default) {
	
	var _x, _y	

	repeat(max(1, _number)) {
		switch (_shape) {
			case ps_shape_rectangle: {
				_x = random_range(_x1, _x2)
				_y = random_range(_y1, _y2)
			} break;
			
			case ps_shape_ellipse: {
				var _dx = abs(_x1 - _x2)
				var _dy = abs(_y1 - _y2)
				var _mx = lerp(_x1, _x2, 0.5)
				var _my = lerp(_y1, _y2, 0.5)
				var _rx = (_dx/2)
				var _ry = (_dy/2)
				var _a = random(1)
				var _b = random(1)
				if (_b < _a) {
					var _n = _b
					_b = _a
					_a = _n
				}
				_x = _mx + _b*_rx*cos(2*pi*_a/_b)
				_y = _my + _b*_ry*sin(2*pi*_a/_b)
			} break;
			
			case ps_shape_diamond: {
				var _xc = (_x1 + _x2) / 2
			    var _yc = (_y1 + _y2) / 2
			    var _l = abs(_y2 - _y1) / 2
			    var _x1_l = _xc
			    var _x2_l = _xc + _l
			    var _x3_l = _xc
			    var _x4_l = _xc - _l
				var _y1_l = _yc + _l
				var _y2_l = _yc
				var _y3_l = _yc - _l
				var _y4_l = _yc
				
				
				
			} break;
			
			case ps_shape_line: {
		
			} break;
		}
	
		switch (_distrib) {
			case ps_distr_linear: {}				break;
			case ps_distr_gaussian: {}				break;
			case ps_distr_invgaussian: {}			break;
		}
		
		ember_part_create(_x, _y, _type, 1, _color, _sys)
	}
	
}

function ember_part_shape(_type, _shape) {
	static __ember_cache = __ember_get_cache()
	part_type_shape(__ember_cache.type[_type], _shape)
}

function ember_part_sprite(_type, _sprite, _anim = true, _stretch = true, _random = false) {
	static __ember_cache = __ember_get_cache()
	part_type_sprite(__ember_cache.type[_type], _sprite, _anim, _stretch, _random)
}

function ember_part_color(_type, _c1, _c2 = _c1, _c3 = _c2) {
	static __ember_cache = __ember_get_cache()
	part_type_color3(__ember_cache.type[_type], _c1, _c2, _c3)
}

function ember_part_mix(_type, _c1, _c2) {
	static __ember_cache = __ember_get_cache()
	part_type_color_mix(__ember_cache.type[_type], _c1, _c2)
}

function ember_part_rgb(_type, _rmin, _rmax, _gmin, _gmax, _bmin, _bmax) {
	static __ember_cache = __ember_get_cache()
	part_type_color_rgb(__ember_cache.type[_type], _rmin, _rmax, _gmin, _gmax, _bmin, _bmax)
}

function ember_part_hsv(_type, _hmin, _hmax, _smin, _smax, _vmin, _vmax) {
	static __ember_cache = __ember_get_cache()
	part_type_color_hsv(__ember_cache.type[_type], _hmin, _hmax, _smin, _smax, _vmin, _vmax)
}	

function ember_part_alpha(_type, _a1, _a2 = _a1, _a3 = _a2) {
	static __ember_cache = __ember_get_cache()
	part_type_alpha3(__ember_cache.type[_type], _a1, _a2, _a3)
}

function ember_part_blend(_type, _blend) {
	static __ember_cache = __ember_get_cache()
	part_type_blend(__ember_cache.type[_type], _blend)
}	

function ember_part_life(_type, _min, _max) {
	static __ember_cache = __ember_get_cache()
	part_type_life(__ember_cache.type[_type], _min, _max)
}

function ember_part_scale(_type, _scalx, _scaly) {
	static __ember_cache = __ember_get_cache()
	part_type_scale(__ember_cache.type[_type], _scalx, _scaly)
}

function ember_part_size(_type, _min, _max = _min, _inc = 0, _wig = 0) {
	static __ember_cache = __ember_get_cache()
	part_type_size(__ember_cache.type[_type], _min, _max, _inc, _wig)
}

function ember_part_spd(_type, _min, _max = _min, _inc = 0, _wig = 0) {
	static __ember_cache = __ember_get_cache()
	part_type_speed(__ember_cache.type[_type], _min, _max, _inc, _wig)
}

function ember_part_grav(_type, _force, _dir) {
	static __ember_cache = __ember_get_cache()
	part_type_gravity(__ember_cache.type[_type], _force, _dir)
}

function ember_part_direc(_type, _min, _max = _min, _inc = 0, _wig = 0) {
	static __ember_cache = __ember_get_cache()
	part_type_direction(__ember_cache.type[_type], _min, _max, _inc, _wig)
}

function ember_part_angle(_type, _min, _max = _min, _inc = 0, _wig = 0, _relative = false) {
	static __ember_cache = __ember_get_cache()
	part_type_orientation(__ember_cache.type[_type], _min, _max, _inc, _wig, _relative)
}

function ember_part_step(_type, _type_step, _count = 1) {
	static __ember_cache = __ember_get_cache()
	part_type_step(__ember_cache.type[_type], _type_step, _count)
}

function ember_part_death(_type, _type_death, _count = 1) {
	static __ember_cache = __ember_get_cache()
	part_type_death(__ember_cache.type[_type], _type_death, _count)
}

#endregion
//==============================================
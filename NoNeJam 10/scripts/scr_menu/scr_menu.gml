
function init_inputs() {
	k_up		= false
	k_down		= false
	k_left		= false
	k_right		= false
	k_left_p	= false
	k_right_p	= false
	k_select	= false
	k_start		= false
	k_back		= false
	m_left_p	= false
	m_left_r	= false
}

function get_key_inputs() {
	if !(global.mid_transition) {
		k_up		= input_check_pressed("up")
		k_down		= input_check_pressed("down")
		k_left		= input_check("left")
		k_right		= input_check("right")
		
		k_left_p	= input_check_pressed("left")
		k_right_p	= input_check_pressed("right")
		
		k_back		= input_check_pressed("back")
		k_select	= input_check_pressed("select")
		
		m_left_p	= 0//mouse_check_button_pressed(mb_left)
		m_left_r	= 0//mouse_check_button_released(mb_left)
	} else {
		init_inputs()
	}
}

function get_mouse_input() {
	// mouse input
	for (var i = 0; i < op_length; i++) {
		var _op_data = op_data[i]
		var _xx = op_x + _op_data[OpData.XOffset]
		var _yy = op_y + i*op_sep
		var _str = options[menu_level][i]

		var _sw = string_width_scribble(_str)
		var _sh = string_height_scribble(_str)
		var _x1 = _xx
		var _y1 = _yy - _sh/2
		var _x2 = _xx + _sw
		var _y2 = _yy + _sh/2
		if (point_in_rectangle(GUI_MOUSE_X, GUI_MOUSE_Y, _x1, _y1, _x2, _y2)) {
			if (selection != i) {
				selection = i
				op_data[selection][OpData.YScale] = 1.5
				op_data[selection][OpData.XScale] = 1.0
			
				if !(mouse_check_button(mb_left)) {
					audio_stop_sound(snd_menu_1)
					var _snd = audio_play_sound(snd_menu_1, 1, false)
					audio_sound_pitch(_snd, 0.8)
				}
			}	
		
			if (m_left_p) {
				k_select = true
			}
		}
	}
}

function menu_draw() {
	var _c = c_black;
	var _selec = false;
	
	var _offset = (1+sin_wave(1, 0.2))*16
	
	for (var i = 0; i < op_length; i++) {
		var _op_data = op_data[i]
		_op_data[OpData.XScale] = lerp(_op_data[OpData.XScale], op_scl_base, op_scl_spd)
		_op_data[OpData.YScale] = lerp(_op_data[OpData.YScale], op_scl_base, op_scl_spd)
	
		if (selection == i) {
			_op_data[OpData.XOffset] = lerp(_op_data[OpData.XOffset], _offset, op_scl_spd)
			_op_data[OpData.YOffset] = lerp(_op_data[OpData.YOffset], _offset, op_scl_spd)
			_c = c_menu_on				
			_selec = true
		} else {							
			_op_data[OpData.XOffset] = lerp(_op_data[OpData.XOffset], 0, op_scl_spd)
			_op_data[OpData.YOffset] = lerp(_op_data[OpData.YOffset], 0, op_scl_spd)
			_c = c_menu_off
			_selec = false
		}
	
		var _str = options[menu_level][i]
		var _xx = op_x + _op_data[OpData.XOffset]
		var _yy = op_y + i*op_sep
		var _xscal = _op_data[OpData.XScale]
		var _yscal = _op_data[OpData.YScale]
	
		// draw options
		scribble(_str).blend(_c, 1).transform(_xscal*2, _yscal*2).align(0, 1).draw(_xx, _yy)	
	
		// sound and sliders
		if (menu_level == 2 && i < 3) {
			var _value = global.gamedata.audio[i]
			var _volume = string("{0}%", ceil(_value*100))
			var _xoff = 160	
		
			var _slider_x = op_x + _xoff
			var _slider_y = _yy - 17
			var _slider_w = 80
			var _slider_h = 16
			var _slider_scl = 2
		
			scribble(_volume).blend(_c, 1).transform(_xscal*2, _yscal*2).align(0, 1).draw(_slider_x + 190, _yy)
		
			matrix_set(matrix_world, matrix_build(_slider_x, _slider_y, 0, 0, 0, 0, _slider_scl, _slider_scl, 1))
				draw_sprite_stretched_ext(spr_slider, 0, 0, 0, _slider_w, _slider_h, c_menu_off, 1)
				draw_sprite_stretched_ext(spr_slider, 0, 0, 0, _slider_w * _value, _slider_h, c_white, 1)
				draw_sprite_stretched(spr_slider, 0, -4 + (_slider_w * _value), -1, 8, 18)
			matrix_set(matrix_world, matrix_build_identity())
		}
	
		// video
		if (menu_level == 3) {
			var _opx = op_x + 240
			switch (i) {
				case 0: {
					scribble(window_get_fullscreen() ? "Ligado" : "Desligado").blend(_c, 1).transform(_op_data[OpData.XScale]*2, _op_data[OpData.YScale]*2).align(0, 1).draw(_opx, _yy)
				}
				break;
			}		
		}
	
		// arrow
		if (_selec) {
			var _arrow_scl = 1.2
			draw_sprite_ext(spr_arrow_r, 0, _xx - 12, _yy + 2, _arrow_scl, _arrow_scl, 0, -1, 1)
		}	
	}
}

function menu_input_process() {
	
	// change selection
	selection += k_down - k_up
	if (selection >= op_length) selection = 0
	if (selection < 0) selection = op_length - 1
	
	if (k_up || k_down) {
		var _snd = audio_play_sound(snd_menu_1, 1, false)
		audio_sound_pitch(_snd, 0.8)
		op_data[selection][OpData.YScale] = 1.5
		op_data[selection][OpData.XScale] = 1.0
	}

	if (k_select) {
		op_data[selection][OpData.XOffset] = 0
		op_data[selection][OpData.YScale] = 1.5
		var _snd = audio_play_sound(snd_menu_1, 1, false)
		audio_sound_pitch(_snd, 1.2)
	}
	op_length = array_length(options[menu_level])
}


function interface_process() {
	get_key_inputs()
	//get_mouse_input()
	menu_input_process()
}


function interface_draw() {
	menu_draw()
}





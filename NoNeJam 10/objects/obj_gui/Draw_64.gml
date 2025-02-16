
if (string_letters(room_get_name(room)) == "rmlevel") {
	// Esse é provavelmente o pior jeito de fazer isso mas fodase dia 15 já
	var _levers		= [obj_lever_red, obj_lever_blue, obj_lever_yellow, obj_lever_green]
	var _buttons	= [obj_button_red, obj_button_blue, obj_button_yellow, obj_button_green]
	var _state		= [0, 0, 0, 0]
	var _spr		= [spr_light_red, spr_light_blue, spr_light_yellow, spr_light_green]
	var _spr		= [spr_button_red, spr_button_blue, spr_button_yellow, spr_button_green]

	var _line		= 0
	for (var i = 0; i < 4; i++) {
		if (!instance_exists(_levers[i]) && !instance_exists(_buttons[i])) {
			continue;
		}
		
		for (var j = 0; j < instance_number(_levers[i]); j++) {
			_state[i] += instance_find(_levers[i], j).state
		}

		for (var j = 0; j < instance_number(_buttons[i]); j++) {
			_state[i] += instance_find(_buttons[i], j).state
		}
	
		var _result = sign(_state[i])
		if (_result != col_state[i]) {
			col_state[i] = _result
			col_scl[i][0] = 1.5
			col_scl[i][1] = 1.5
		}

		var _scl = 1.0
		var _alpha = _result ? 1 : 0.5
		var _hei = _line * 18 * _scl
		var _x = 20 * _scl
		var _y = 20 * _scl
		var _xsep = 10 * _scl
		var _xanim = 8 * _scl
		
		if (col_scl_default == 1) {
			draw_sprite_ext(_spr[i], _result, _x, _y + _hei, _scl*col_scl[i][0], _scl*col_scl[i][0], 0, -1, _alpha)
			scribble(_result ? "ON" : "OFF").transform(_scl, _scl).blend(_result ? c_menu_on : c_menu_off, _alpha).align(0, 1).draw((col_scl[i][0]-1)*_xanim + _x + _xsep, _y - 1 + _hei)
		}
		
		_line++
	}
	
	// ==========================================================
	if (reset_time) {
		scribble("Reiniciando...").blend(c_white, (reset_time/ROOM_SPEED)*1.2).draw(16, GUI_HEI-24)
	}
}

intro.draw()


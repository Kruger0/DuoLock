
if (string_letters(room_get_name(room)) == "rmlevel") {
	// Esse é provavelmente o pior jeito de fazer isso mas fodase dia 15 já
	var _levers		= [obj_lever_red, obj_lever_blue, obj_lever_yellow, obj_lever_green]
	var _buttons	= [obj_button_red, obj_button_blue, obj_button_yellow, obj_button_green]
	var _state		= [0, 0, 0, 0]
	var _spr		= [spr_light_red, spr_light_blue, spr_light_yellow, spr_light_green]
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

		var _hei = _line * 18
		var _x = 16
		var _y = 16
		draw_sprite_ext(_spr[i], _result, _x, _y + _hei, col_scl[i][0], col_scl[i][0], 0, -1, 1)
		scribble(_result ? "ON" : "OFF").blend(_result ? c_menu_on : c_menu_off).align(0, 1).draw((col_scl[i][0]-1)*8 + _x + 10, _y - 1 + _hei)
		_line++
	}
}


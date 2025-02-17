

function Player(_name, _spr) constructor {
	name = _name
	spr = _spr
	
	inputs = {
		k_up : false,
		k_down : false,
		k_left : false,
		k_right : false,
	}
	
	static getInputs = function() {
		k_up	= input_check_pressed("up")
		k_down  = input_check_pressed("down")
		k_left  = input_check_pressed("left")
		k_right = input_check_pressed("right")
	}
	
	static moveAndColide = function() {
		
	}
	
}
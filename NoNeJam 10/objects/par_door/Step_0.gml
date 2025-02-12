
var _state = 0

var _lever = asset_get_index("obj_lever_"+color)
for (var i = 0; i < instance_number(_lever); i++) {
	_state += instance_find(_lever, i).state
}

var _button = asset_get_index("obj_button_"+color)
for (var i = 0; i < instance_number(_button); i++) {
	_state += instance_find(_button, i).state
}

state = _state

if (z < 14) { // se tá fechada
	if (!instance_exists(wall)) {
		wall = instance_create_depth(x, y, 0, par_solid)
		wall.image_xscale = image_xscale
		wall.image_yscale = image_yscale
	}
} else {
	if (instance_exists(wall)) {
		instance_destroy(wall)
	}
}



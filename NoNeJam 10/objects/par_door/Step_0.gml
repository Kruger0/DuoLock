
// Detecta os inputs
var _state = 0
for (var i = 0; i < instance_number(door_data.lever); i++) {
	_state += instance_find(door_data.lever, i).state
}

for (var i = 0; i < instance_number(door_data.button); i++) {
	_state += instance_find(door_data.button, i).state
}

state = sign(_state)

// Cria o objeto sólido
if (z < 14) {
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



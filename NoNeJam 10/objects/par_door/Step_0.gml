
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
		var _player = instance_place(x, y, par_character)
		if (_player) {
			var _move_x = image_xscale < image_yscale
			if (_move_x) {
				var _mid = x + sprite_width/2
				_player.x += (_player.x > _mid ? 1 : -1)
			} else {
				var _mid = y + sprite_height/2
				print(_mid)
				_player.y += (_player.y > _mid ? 1 : -1)
			}
		} else {
			wall = instance_create_depth(x, y, 0, par_solid)
			wall.image_xscale = image_xscale
			wall.image_yscale = image_yscale
		}
		
	}
} else {
	if (instance_exists(wall)) {
		instance_destroy(wall)
	}
}



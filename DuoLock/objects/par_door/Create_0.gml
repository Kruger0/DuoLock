
DoorData = function(_lever, _button, _spr, _top) constructor {
	lever	= _lever
	button	= _button
	spr		= _spr
	top		= _top
}

switch (door_color) {
	case "Red": {
		door_data = new DoorData(obj_lever_red, obj_button_red, spr_door_red, spr_door_red_top)
	} break;
	case "Blue": {
		door_data = new DoorData(obj_lever_blue, obj_button_blue, spr_door_blue, spr_door_blue_top)
	} break;
	case "Green": {
		door_data = new DoorData(obj_lever_green, obj_button_green, spr_door_green, spr_door_green_top)
	} break;
	case "Yellow": {
		door_data = new DoorData(obj_lever_yellow, obj_button_yellow, spr_door_yellow, spr_door_yellow_top)
	} break;
}

vb_door = -1
tex_door = sprite_get_texture(door_data.spr, reverse)
wall = undefined
state = 0
z = 1
yy = 0

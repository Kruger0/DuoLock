
state = 0

if (place_meeting(x, y, obj_char1)) {
	state = 1
}

height = lerp(height, state, 0.1)
//print(height)
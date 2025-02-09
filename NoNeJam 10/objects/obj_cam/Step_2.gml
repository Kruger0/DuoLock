
if (keyboard_check_pressed(vk_f11)) {
	toggle_fullscreen()
}

// room limits
x = clamp(x, 16, room_width -16)
y = clamp(y, 16, room_height-16)

screenshake_fx()

camera_set_view_angle(cam, angle)
camera_set_view_pos(cam, x, y)
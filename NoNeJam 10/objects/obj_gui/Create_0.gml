cursor = {
	sprite : spr_cr_arrow,
	angle : 0,
	scale : 1,
	color : c_white,
	alpha : 1,
	draw : function() {
		if (mouse_check_button_pressed(mb_left)) {
			scale = 1.4
		}
		scale = lerp(scale, 1, 0.1)
		draw_sprite_ext(sprite, 0, GUI_MOUSE_X, GUI_MOUSE_Y, scale*obj_cam.scl.gui, scale*obj_cam.scl.gui, angle, color, alpha)
	}
}
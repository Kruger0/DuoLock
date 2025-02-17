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

col_scl = [
	[1, 1],
	[1, 1],
	[1, 1],
	[1, 1],
]
col_state = [0, 0, 0, 0]

col_scl_default = 0

reset_time = 0
menu_time = 0

intro = {
	text : "",
	duration : ROOM_SPEED*2.5,
	time : infinity,
	time_fac : 0,
	curve : 0,
	
	step : function() {
		time = min(time+1, duration)
		time_fac = time / duration;
		time_sin = sin(time_fac*pi)
		
		var _channel = animcurve_get_channel(ac_intro, 0)
		curve = animcurve_channel_evaluate(_channel, time_sin)
	},
	
	draw : function() {
		var _scl = 1
		var _hei = 30
		var _hei_fac = ((_hei*0.5)*curve)
		var _x = 0
		var _y = GUI_HEI*0.2
		var _w = GUI_WID
		var _h = _hei*curve
		
		draw_sprite_stretched_ext(spr_pixel, 0, _x, _y - _hei_fac, _w, _h, c_black, 0.75)
		
		var _c = curve/2
		var _xfac = time_fac < 0.5 ? _c : 0.5+(0.5-_c)
		if (_xfac > 1) {
			draw_reset_align()
			return
		}
		scribble("[fnt_title]"+text).align(1, 1).transform(_scl, _scl).draw(GUI_WID*_xfac, _y)
	},
}
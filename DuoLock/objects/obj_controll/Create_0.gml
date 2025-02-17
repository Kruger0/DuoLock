

instance_create_depth(0, 0, 0, obj_cam)
instance_create_depth(0, 0, 0, obj_gui)
instance_create_depth(0, 0, 0, obj_sound)
if (DEVMODE) instance_create_depth(0, 0, 0, obj_debug)

window_set_cursor(cr_none)
textbox_set_sprite(spr_textbox)

var _font_main = font_get_name(fnt_main)
scribble_font_bake_shadow(_font_main, "fnt_outline_1", 1, 1, #808080, 1, 0, false)
scribble_font_bake_outline_8dir("fnt_outline_1", "fnt_outline_2", #000000, false)
scribble_font_bake_outline_4dir("fnt_outline_2", "fnt_title", #000000, false)
scribble_font_delete("fnt_outline_1")
scribble_font_delete("fnt_outline_2")

var _font_diag = font_get_name(fnt_dialog)
scribble_font_bake_shadow(_font_diag, "fnt_temp1", 0, 1, c_black, 1, -1, false)
scribble_font_bake_outline_8dir("fnt_temp1", "fnt_main", c_black, false)
scribble_font_set_default("fnt_main")
scribble_font_delete("fnt_temp1")
	
scribble_anim_wave(0.5, 0.2, 0.05)
scribble_anim_rainbow(0.8, 0.01)
scribble_anim_wheel(1, 0.5, 0.3)
scribble_anim_shake(0.5, 1)



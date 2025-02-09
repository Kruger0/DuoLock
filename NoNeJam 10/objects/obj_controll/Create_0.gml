

instance_create_depth(0, 0, 0, obj_cam)
instance_create_depth(0, 0, 0, obj_gui)
instance_create_depth(0, 0, 0, obj_sound)

window_set_cursor(cr_none)

var _assets = [fnt_main]

scribble_font_bake_shadow("fnt_main", "fnt_outline_1", 1, 1, #808080, 1, 0, false)
scribble_font_bake_outline_8dir("fnt_outline_1", "fnt_outline_2", #000000, false)
scribble_font_bake_outline_4dir("fnt_outline_2", "fnt_default", #000000, false)
scribble_font_delete("fnt_outline_1")
scribble_font_delete("fnt_outline_2")
scribble_font_set_default("fnt_default")

scribble_anim_wave(1, 1, 0.1)

room_goto_next()
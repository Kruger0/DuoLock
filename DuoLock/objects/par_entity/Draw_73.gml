
var _d = gpu_get_depth()
gpu_set_depth(-0.2)
//gpu_set_zwriteenable(false)
draw_sprite_ext(spr_shadow, 0, x, y, 1, 1, 0, -1, 0.2)
//gpu_set_zwriteenable(true)
gpu_set_depth(_d)

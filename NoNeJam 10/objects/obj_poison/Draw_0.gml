
if (DEBUG) {
	var _d = gpu_get_depth()
	gpu_set_depth(-0.5)
	draw_hitbox()
	gpu_set_depth(_d)
}

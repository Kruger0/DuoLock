

if (vb_glow == -1) {
	vb_glow = vertex_create_buffer()
	var _sw = sprite_width
	var _sh = sprite_height
	
	
	var _offset = global.yoff
	var _c = #404060
	_c = #4080FF

	vertex_begin(vb_glow, global.vform)
	var _x = 0
	var _y = 0

	// north
	vertex_add_point(vb_glow, _x, _y + _offset, -16, 0, 0)
	vertex_add_point(vb_glow, _x + _sw, _y + _offset, -16, 1, 0)
	vertex_add_point(vb_glow, _x, _y, 0, 0, 1, _c)

	vertex_add_point(vb_glow, _x + _sw, _y + _offset, -16, 1, 0)
	vertex_add_point(vb_glow, _x, _y, 0, 0, 1, _c)
	vertex_add_point(vb_glow, _x + _sw, _y, 0, 1, 1, _c)

	// east
	vertex_add_point(vb_glow, _x + _sw, _y + _offset, -16, 0, 0)
	vertex_add_point(vb_glow, _x + _sw, _y + _sh + _offset, -16, 1, 0)
	vertex_add_point(vb_glow, _x + _sw, _y, 0, 0, 1, _c)

	vertex_add_point(vb_glow, _x + _sw, _y + _sh + _offset, -16, 1, 0)
	vertex_add_point(vb_glow, _x + _sw, _y, 0, 0, 1, _c)
	vertex_add_point(vb_glow, _x + _sw, _y + _sh, 0, 1, 1, _c)

	// south
	vertex_add_point(vb_glow, _x, _y + _sh + _offset, -16, 0, 0)
	vertex_add_point(vb_glow, _x + _sw, _y + _sh + _offset, -16, image_xscale, 0)
	vertex_add_point(vb_glow, _x, _y + _sh, 0, 0, 1, _c)

	vertex_add_point(vb_glow, _x + _sw, _y + _sh + _offset, -16, image_xscale, 0)
	vertex_add_point(vb_glow, _x, _y + _sh, 0, 0, 1, _c)
	vertex_add_point(vb_glow, _x + _sw, _y + _sh, 0, image_xscale, 1, _c)

	// west
	vertex_add_point(vb_glow, _x, _y + _offset, -16, 0, 0)
	vertex_add_point(vb_glow, _x, _y + _offset + _sh, -16, 1, 0)
	vertex_add_point(vb_glow, _x, _y, 0, 0, 1, _c)

	vertex_add_point(vb_glow, _x, _y + _offset + _sh, -16, 1, 0)
	vertex_add_point(vb_glow, _x, _y, 0, 0, 1, _c)
	vertex_add_point(vb_glow, _x, _y + _sh, 0, 1, 1, _c)

	vertex_end(vb_glow)
	vertex_freeze(vb_glow)
}

shader_set(shd_glow)
gpu_set_zwriteenable(false)

var _scl = 0.8
var _s = matrix_build(0, 0, 0, 0, 0, 0, _scl, _scl, lerp(-0.2, 2, height))
var _t = matrix_build(x-(8*_scl), y-(8*_scl), 0, 0, 0, 0, 1, 1, 1)

matrix_set(matrix_world, matrix_multiply(_s, _t))

vertex_submit(vb_glow, pr_trianglelist, -1)
matrix_set(matrix_world, global.matrix_idendity)
gpu_set_zwriteenable(true)
shader_reset()














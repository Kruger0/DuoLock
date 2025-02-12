
var _offset = -6
var _c = #404060
_c = #808080

if (vb_door == -1) {
	vb_door = vertex_create_buffer()

	var _sw = sprite_width
	var _sh = sprite_height

	vertex_begin(vb_door, global.vform)

	// north
	vertex_add_point(vb_door, x, y + _offset, -16, 0, 0)
	vertex_add_point(vb_door, x + _sw, y + _offset, -16, 1, 0)
	vertex_add_point(vb_door, x, y, 0, 0, 1, _c)

	vertex_add_point(vb_door, x + _sw, y + _offset, -16, 1, 0)
	vertex_add_point(vb_door, x, y, 0, 0, 1, _c)
	vertex_add_point(vb_door, x + _sw, y, 0, 1, 1, _c)

	// east
	vertex_add_point(vb_door, x + _sw, y + _offset, -16, 0, 0)
	vertex_add_point(vb_door, x + _sw, y + _sh + _offset, -16, 1, 0)
	vertex_add_point(vb_door, x + _sw, y, 0, 0, 1, _c)

	vertex_add_point(vb_door, x + _sw, y + _sh + _offset, -16, 1, 0)
	vertex_add_point(vb_door, x + _sw, y, 0, 0, 1, _c)
	vertex_add_point(vb_door, x + _sw, y + _sh, 0, 1, 1, _c)

	// south
	vertex_add_point(vb_door, x, y + _sh + _offset, -16, 0, 0)
	vertex_add_point(vb_door, x + _sw, y + _sh + _offset, -16, image_xscale, 0)
	vertex_add_point(vb_door, x, y + _sh, 0, 0, 1, _c)

	vertex_add_point(vb_door, x + _sw, y + _sh + _offset, -16, image_xscale, 0)
	vertex_add_point(vb_door, x, y + _sh, 0, 0, 1, _c)
	vertex_add_point(vb_door, x + _sw, y + _sh, 0, image_xscale, 1, _c)

	// west
	vertex_add_point(vb_door, x, y + _offset, -16, 0, 0)
	vertex_add_point(vb_door, x, y + _offset + _sh, -16, 1, 0)
	vertex_add_point(vb_door, x, y, 0, 0, 1, _c)

	vertex_add_point(vb_door, x, y + _offset + _sh, -16, 1, 0)
	vertex_add_point(vb_door, x, y, 0, 0, 1, _c)
	vertex_add_point(vb_door, x, y + _sh, 0, 1, 1, _c)

	vertex_end(vb_door)
	vertex_freeze(vb_door)
}


gpu_set_texrepeat(true)
matrix_set(matrix_world, matrix_build(0, -yy, z, 0, 0, 0, 1, 1, 1))
vertex_submit(vb_door, pr_trianglelist, tex_door)
matrix_set(matrix_world, matrix_build_identity())
gpu_set_texrepeat(false)

var _depth = gpu_get_depth()
gpu_set_depth(z-16)

draw_sprite_ext(spr_top, 0, x, y- (yy - global.yoff), image_xscale, image_yscale, 0, -1, 1)
gpu_set_depth(_depth)



















if (vb_wall == -1) {
	vb_wall = vertex_create_buffer()

	var _sw = sprite_width
	var _sh = sprite_height
	
	var _offset = global.yoff
	var _c = #404060
	_c = #808080
	var _uoff = 0.5
	var _u = image_xscale
	vertex_begin(vb_wall, global.vform)

	// north
	vertex_add_point(vb_wall, x, y + _offset, -16,				0, 0)
	vertex_add_point(vb_wall, x + _sw, y + _offset, -16,		1, 0)
	vertex_add_point(vb_wall, x, y, 0,							0, 1, _c)
																
	vertex_add_point(vb_wall, x + _sw, y + _offset, -16,		1, 0)
	vertex_add_point(vb_wall, x, y, 0,							0, 1, _c)
	vertex_add_point(vb_wall, x + _sw, y, 0,					1, 1, _c)
																  
	// east														
	vertex_add_point(vb_wall, x + _sw, y + _offset, -16,		0 + _uoff, 0)
	vertex_add_point(vb_wall, x + _sw, y + _sh + _offset, -16,	1 + _uoff, 0)
	vertex_add_point(vb_wall, x + _sw, y, 0,					0 + _uoff, image_yscale, _c)
																
	vertex_add_point(vb_wall, x + _sw, y + _sh + _offset, -16,	1 + _uoff, 0)
	vertex_add_point(vb_wall, x + _sw, y, 0,					0 + _uoff, 1, _c)
	vertex_add_point(vb_wall, x + _sw, y + _sh, 0,				1 + _uoff, 1, _c)
																 
	// south													 
	vertex_add_point(vb_wall, x, y + _sh + _offset, -16,		0, 0)
	vertex_add_point(vb_wall, x + _sw, y + _sh + _offset, -16,	image_xscale, 0)
	vertex_add_point(vb_wall, x, y + _sh, 0,					0, 1, _c)

	vertex_add_point(vb_wall, x + _sw, y + _sh + _offset, -16,	image_xscale, 0)
	vertex_add_point(vb_wall, x, y + _sh, 0,					0, 1, _c)
	vertex_add_point(vb_wall, x + _sw, y + _sh, 0,				image_xscale, 1, _c)

	// west
	vertex_add_point(vb_wall, x, y + _offset, -16,				0 + _uoff, 0)
	vertex_add_point(vb_wall, x, y + _offset + _sh, -16,		1 + _uoff, 0)
	vertex_add_point(vb_wall, x, y, 0,							0 + _uoff, 1, _c)
																  
	vertex_add_point(vb_wall, x, y + _offset + _sh, -16,		1 + _uoff, 0)
	vertex_add_point(vb_wall, x, y, 0,							0 + _uoff, 1, _c)
	vertex_add_point(vb_wall, x, y + _sh, 0,					1 + _uoff, 1, _c)

	vertex_end(vb_wall)
	vertex_freeze(vb_wall)
}

gpu_set_texrepeat(true)
vertex_submit(vb_wall, pr_trianglelist, tex_wall)
gpu_set_texrepeat(false)
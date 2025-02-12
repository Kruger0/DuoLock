vertex_format_begin()
vertex_format_add_position_3d()
vertex_format_add_color()
vertex_format_add_texcoord()
global.vform = vertex_format_end()

global.tilt = -50

function vertex_add_point(_vbuff, _x, _y, _z, _u, _v, _col = c_white, _alpha = 1) {
	vertex_position_3d(_vbuff, _x, _y, _z)
	vertex_color(_vbuff, _col, _alpha)
	vertex_texcoord(_vbuff, _u, _v)
}


cred_y -= 0.35
if (abs(cred_y) > string_height_scribble(credits) - 56) {
	cred_y = GUI_HEI
}

scribble(credits).align(1, 0).draw(GUI_WID/2, cred_y-48)


matrix_set(matrix_world, matrix_build(0, -4, 0, 0, 0, 0, 2, 2, 1))
draw_tilemap(layer_tilemap_get_id(layer_get_id("tile_walls_top")), 0, 0)
matrix_set(matrix_world, global.matrix_idendity)

scribble("[[Esc]: Voltar").align(2, 2).draw(GUI_WID-16, GUI_HEI-8)

for (var i = 0; i < 4; i++) {
	col_scl[i][0] = lerp(col_scl[i][0], 1, 0.1)
	col_scl[i][1] = lerp(col_scl[i][1], 1, 0.1)
}

if (input_check_pressed("restart")) {
	cam_tran_start(room)
}
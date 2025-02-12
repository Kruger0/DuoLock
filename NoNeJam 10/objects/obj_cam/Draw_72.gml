

if (string_letters(room_get_name(room)) == "rmlevel") {
	draw_clear_alpha(0, 0)

	cam3d.pos.x = lerp(cam3d.pos.x, follow_pos.x	 , 0.1)
	cam3d.pos.y = lerp(cam3d.pos.y, follow_pos.y + 50, 0.1)

	cam3d.to.x = lerp(cam3d.to.x, follow_pos.x, 0.1)
	cam3d.to.y = lerp(cam3d.to.y, follow_pos.y, 0.1)

	cam3d.Apply()
}
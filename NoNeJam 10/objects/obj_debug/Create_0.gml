
dbg_view("Camera", false, 16, 16, 360, 120)
dbg_slider(ref_create(obj_cam.cam3d.pos, "z"), -200, 200)
dbg_slider(ref_create(obj_cam, "cam_ztarg"), -200, 200)
dbg_slider(ref_create(obj_cam, "cam_ytarg"), -200, 200)
dbg_slider(ref_create(global, "tilt"), 0, -180)

show_debug_overlay(false)

room_tp = false
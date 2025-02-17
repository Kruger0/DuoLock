

var _ct = #FFFF40
var _cb = #FF6020
var _title_scl = 4.0

// title
//scribble("[wave]DuoLock").blend(_ct, 1).transform(_title_scl, _title_scl).gradient(_cb, 1.2).align(1, 1).draw(GUI_WID/2, GUI_HEI*0.2)
draw_sprite_ext(spr_name, 0, GUI_WID/2, GUI_HEI*0.2, 2, 2, sin_wave(1, 3), -1, 1)

interface_process()
interface_draw()

var _level = menu_level
switch (menu_level) {
	case 0: {
		// main menu
		switch (selection) {
			case 0: {
				if (k_select) {				
					with (obj_cam) {
						cam_vm = camera_get_view_mat(cam)
						cam_pm = camera_get_proj_mat(cam)
					}
					cam_tran_start(rm_tutorial)
				}
			}
			break;
			case 1: {
				if (k_select) {
					menu_level = 1					
				}
			}
			break;	
			case 2: {
				if (k_select) {					
					cam_tran_start(rm_credits)
				}
			} break;
			case 3: {
				if (k_select) {
					game_end()
				}
			}
			break;
		}
	}
	break;
	case 1: {
		// options
		switch (selection) {
			case 0: {
				if (k_select) {
					menu_level = 2			
				}
			}
			break;
			case 1: {
				if (k_select) {
					menu_level = 3
				}
			}
			break;		
			case 2: {
				if (k_select) {
					menu_level = 0
				}
			}
			break;
		}
		
		if (k_back) {
			menu_level = 0
		}
	}
	break;
	case 2: {
		// options audio
		switch (selection) {
			case 0: {
				if (k_right || k_left) {
					global.gamedata.audio[Volume.Master] = clamp(global.gamedata.audio[Volume.Master]+((k_right - k_left)*0.01), 0.0, 1.0);
					audio_set_master_gain(0, global.gamedata.audio[Volume.Master])
				}
			}
			break;
			case 1: {				
				if (k_right || k_left) {
					global.gamedata.audio[Volume.Music] = clamp(global.gamedata.audio[Volume.Music]+((k_right - k_left)*0.01), 0.0, 1.0);
					audio_group_set_gain(audio_music, global.gamedata.audio[Volume.Music], 0)
				}
			}
			break;
			case 2: {
				if (k_right || k_left) {
					global.gamedata.audio[Volume.Sfx] = clamp(global.gamedata.audio[Volume.Sfx]+((k_right - k_left)*0.01), 0.0, 1.0);
					audio_group_set_gain(audio_sfx, global.gamedata.audio[Volume.Sfx], 0)
				}
			}
			break;
			case 3: {
				if (k_select) {
					menu_level = 1
				}
			}
			break;
		}
		
		if (k_back) {
			menu_level = 1
		}
	}
	break;
	case 3: {
		// options video
		switch (selection) {
			case 0: {
				if (k_select) {
					toggle_fullscreen()
				}
			}
			break;
			case 1: {				
				if (k_select) {
					menu_level = 1
				}
			}
			break;
		}
		
		if (k_back) {
			menu_level = 1
		}
	}
	break;
}


if (_level != menu_level) {
	selection = 0
	op_length = array_length(options[menu_level])
	for (var i = 0; i < op_length; i++) {
		op_data[i] = [1, 1, 0, 0]
	}
}

scribble("[[WASD]: Movimento\n[[Enter]: Selecionar\n[[Esc]: Voltar").align(2, 2).draw(GUI_WID-16, GUI_HEI-8)



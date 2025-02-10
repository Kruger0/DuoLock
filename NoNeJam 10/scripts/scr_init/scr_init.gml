
global.seed = random_get_seed()
surface_depth_disable(true)


#macro DEBUG			global.debug
#macro DEBUG_KEY		vk_f9
#macro GAME_WID			640
#macro GAME_HEI			360
#macro GRID				16
#macro ROOM_SPEED		game_get_speed(gamespeed_fps)
#macro ROOM_NAME		global.room_name
#macro GAME_TIME		global.gametime

#macro GUI_WID			display_get_gui_width()
#macro GUI_HEI			display_get_gui_height()
#macro GUI_MOUSE_X		device_mouse_x_to_gui(0)
#macro GUI_MOUSE_Y		device_mouse_y_to_gui(0)

#macro FILE_SAVE		"data.sav"
#macro FILE_ENCODED		false

#macro c_menu_on		#FFFFFF
#macro c_menu_off		#606060
#macro c_sunlight		#FFF0B0


var KEEP_DATA = false;
if (file_exists(FILE_SAVE) && KEEP_DATA) {
	global.gamedata = json_load(FILE_SAVE)
} else {
	global.gamedata = {
		video : {
			fullscreen : false,
		},
		audio : [
			1.0, 0.6, 0.6
		]
	}	
	json_save(global.gamedata, FILE_SAVE, FILE_ENCODED)
}

enum Volume {
	Master,
	Music,
	Sfx
}

enum OpData {
	XScale,
	YScale,
	XOffset,
	YOffset,
}


global.debug			= false
global.mid_transition	= false
global.gametime			= 0
global.room_name		= ""
global.surf_shadow		= -1

global.current_char		= -1
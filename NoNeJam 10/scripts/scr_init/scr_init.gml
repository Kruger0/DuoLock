
global.seed = random_get_seed()


#macro DEVMODE			false
#macro DevMode:DEVMODE	true

#macro DEBUG			global.debug
#macro DEBUG_KEY		vk_f9
#macro GAME_WID			480
#macro GAME_HEI			270
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
#macro c_char1			#FFC825
#macro c_char2			#0CF1FF
#macro c_sky			#0E071B
#macro c_tran			#000000

var KEEP_DATA = true;
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


audio_master_gain(global.gamedata.audio[0])
audio_group_set_gain(audio_music, global.gamedata.audio[1], 0)
audio_group_set_gain(audio_sfx, global.gamedata.audio[2], 0)

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
global.current_char		= obj_char1

global.flag_water		= false
global.flag_acid		= false





















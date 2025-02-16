
if event_data[? "event_type"] == "sprite event" // or you can check "sprite event"
{
    switch (event_data[? "message"])
    {
        case "footstep":
			var _offset = 0.03
			var _gain	= undefined
			switch (object_index) {
				case obj_char1: {
					audio_play_sound(snd_footstep_1, 0, false, _gain, _offset, random_range(1.0, 1.2))
				} break;
				case obj_char2: {
					audio_play_sound(snd_footstep_1, 0, false, _gain, _offset, random_range(0.4, 0.5))
				} break;
			}			
        break;
    }
}
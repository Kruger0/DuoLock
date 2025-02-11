#macro LAYER_ENTITIES "entities"

///@func layer_depth_update()
///@desc Call in Room Start event of your game managet object.
function layer_depth_update() {
    
	var _sort_depth = undefined;
	var _layers = layer_get_all();
    for (var i = 0, _len = array_length(_layers); i < _len; i++;) {
		
		var _layer = _layers[i];
		if (_sort_depth != undefined) {
			layer_depth(_layer, layer_get_depth(_layer) + room_height);
			continue;
		}

		if (layer_get_name(_layer) == LAYER_ENTITIES) {
			_sort_depth = layer_get_depth(_layer)
		}
    }
}

///@func depthsort()
///@desc Call in Create event for static instances, and in Step event for dynamic ones.
function depthsort() {
	depth = layer_get_depth(LAYER_ENTITIES) + room_height - y
}
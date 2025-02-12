
function tile_solidify(tile_layer, wall_obj, wall_yoff = 0, wall_depth = 0) {
	if !(layer_exists(tile_layer)) {
		return;
	}
	
    var _tile_layer		= tile_layer
    var _wall_obj		= wall_obj
    var _wall_depth		= wall_depth
    var lay_id			= layer_get_id(_tile_layer);
    var map_id			= layer_tilemap_get_id(lay_id);
    var grid_unit		= tilemap_get_tile_width(map_id)
    var has_adjacent	= false;
    var strip_count		= 0;
    var curr_tile, next_tile, strip_start_xx;
	
    var xx				= 0;
    var yy				= 0;

    while (yy < room_height) {
        while (xx < room_width) {
            curr_tile = tilemap_get_at_pixel(map_id, xx, yy);
            next_tile = tilemap_get_at_pixel(map_id, xx + grid_unit, yy);
				
			if (curr_tile != 0) {
				if (next_tile) {
					has_adjacent = true;
	                strip_start_xx = xx;
	                strip_count++;
	            } else {
	                instance_create_depth(xx, yy + wall_yoff, _wall_depth, _wall_obj);
	            }
			}            
        
            while (has_adjacent) {
                xx += grid_unit;
                strip_count++;
            
                if (xx + grid_unit < room_width) {
                    next_tile = tilemap_get_at_pixel(map_id, xx + grid_unit, yy);
                } else {
                    next_tile = 0
                }
            
                if (!next_tile) {
                    has_adjacent = false;
                    var inst = instance_create_depth(strip_start_xx, yy + wall_yoff, _wall_depth, _wall_obj, {
						image_xscale : strip_count
					});
                    strip_count = 0;
                }
            }
            xx += grid_unit;   
        }
        xx = 0;
        yy += grid_unit;
    }    
}


function tile_liquidify(tile_layer, wall_obj, wall_yoff = 0, wall_depth = 0) {
	var _blacklist = [9, 11, 25, 27]
	
	if !(layer_exists(tile_layer)) {
		return;
	}
	
    var _tile_layer		= tile_layer
    var _wall_obj		= wall_obj
    var _wall_depth		= wall_depth
    var lay_id			= layer_get_id(_tile_layer);
    var map_id			= layer_tilemap_get_id(lay_id);
    var grid_unit		= tilemap_get_tile_width(map_id)
    var has_adjacent	= false;
    var strip_count		= 0;
    var curr_tile, next_tile, strip_start_xx;
	
    var xx				= 0;
    var yy				= 0;

    while (yy < room_height) {
        while (xx < room_width) {
            curr_tile = tilemap_get_at_pixel(map_id, xx, yy);
            next_tile = tilemap_get_at_pixel(map_id, xx + grid_unit, yy);
				
			if (curr_tile != 0 && !array_contains(_blacklist, curr_tile)) {
				if (next_tile && !array_contains(_blacklist, next_tile)) {
					has_adjacent = true;
	                strip_start_xx = xx;
	                strip_count++;
	            } else {
	                instance_create_depth(xx, yy + wall_yoff, _wall_depth, _wall_obj);
	            }
			}            
        
            while (has_adjacent) {
                xx += grid_unit;
                strip_count++;
            
                if (xx + grid_unit < room_width) {
                    next_tile = tilemap_get_at_pixel(map_id, xx + grid_unit, yy);
                } else {
                    next_tile = 0
                }
            
                if (!next_tile || array_contains(_blacklist, next_tile)) {
                    has_adjacent = false;
                    var inst = instance_create_depth(strip_start_xx, yy + wall_yoff, _wall_depth, _wall_obj, {
						image_xscale : strip_count
					});
                    strip_count = 0;
                }
            }
            xx += grid_unit;   
        }
        xx = 0;
        yy += grid_unit;
    }    
}
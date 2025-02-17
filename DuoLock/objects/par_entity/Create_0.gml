
vel			= new Vector2(0)
scale		= new Vector2(1)
angle		= 0

velz		= 0
z			= 0
stomp_time = 0

collision = function() {
	var _velh = max(1, abs(vel.x)) * sign(vel.x);
	var _velv = max(1, abs(vel.y)) * sign(vel.y);

	var _colh = instance_place(x+_velh, y, par_solid)
	if (_colh) {
		x = _velh > 0 ? _colh.bbox_left+(x-bbox_right) : _colh.bbox_right+(x-bbox_left)
		vel.x = 0
		
	}
	var _colv = instance_place(x, y+_velv, par_solid)
	if (_colv) {
		y =_velv > 0 ? _colv.bbox_top+(y-bbox_bottom) : _colv.bbox_bottom+(y-bbox_top)
		vel.y = 0
	}
	
	x += vel.x;
	y += vel.y;
}


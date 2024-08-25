use <knurled_v2.scad>;


module _simple_knurl(d=undef, od=undef, h=1, center=false) {
	knurl_width = 2;
	knurl_height = 3;
	knurl_depth = 0.6;
	end_smooth_height = 2;
	truncate_percent = 20;
	tr = center ? -h/2 : 0;
	knurl_param_d = is_undef(d)
		?
		od - knurl_depth * (1 + truncate_percent/100)
		:
		d + 2 * knurl_depth - knurl_depth * (1 + truncate_percent/100);
	translate([0, 0, tr])
		knurl(
			h = h,
			d = knurl_param_d,
			knurl_width = knurl_width,
			knurl_height = knurl_height,
			knurl_depth = knurl_depth,
			end_smooth_height = end_smooth_height,
			truncate_percent = truncate_percent
		);
}


module _simple_knurl_aggro(d=undef, od=undef, h=1, center=false) {
	knurl_width = 3;
	knurl_height = 4;
	knurl_depth = 1.2;
	end_smooth_height = 2;
	truncate_percent = 20;
	tr = center ? -h/2 : 0;
	knurl_param_d = is_undef(d)
		?
		od - knurl_depth * (1 + truncate_percent/100)
		:
		d + 2 * knurl_depth - knurl_depth * (1 + truncate_percent/100);
	translate([0, 0, tr])
		knurl(
			h = h,
			d = knurl_param_d,
			knurl_width = knurl_width,
			knurl_height = knurl_height,
			knurl_depth = knurl_depth,
			end_smooth_height = end_smooth_height,
			truncate_percent = truncate_percent
		);
}

module simple_knurl(d=undef, od=undef, h=1, center=false) {
	if ($preview) {
		simple_d = is_undef(d) ? od : d;
		cylinder(d=simple_d, h=h, center=center);
	}
	else {
		_simple_knurl(d=d, od=od, h=h, center=center);
	}
}

module simple_knurl_aggro(d=undef, od=undef, h=1, center=false) {
	if ($preview) {
		simple_d = is_undef(d) ? od : d;
		cylinder(d=simple_d, h=h, center=center);
	}
	else {
		_simple_knurl_aggro(d=d, od=od, h=h, center=center);
	}
}

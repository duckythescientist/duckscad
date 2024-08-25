module countersunk_bolt(d, h, head_d, angle=90, up=false, recess=0, cheat=0.1) {
	_fn = ($fn == 0) || is_undef($fn) ? 20 * d : $fn;
	head_h = tan(90 - angle/2) * head_d/2;
	render(2)  // Render to avoid z fighting
		mirror([0, 0, up ? 0 : 1])
			translate([0, 0, recess]) {
				translate([0, 0, -cheat - recess])
					cylinder(d=head_d, h=cheat + recess, $fn=_fn);
				cylinder(d1=head_d, d2=0, h=head_h, $fn=_fn);
				cylinder(d=d, h=h, $fn=_fn);
			}
}

module countersunk_m3(h, clearance=0.15, angle=90, up=false, recess=0) {
	countersunk_bolt(d=3 + clearance, h=h, head_d=7, angle=angle, up=up, recess=recess);
}

module countersunk_m5(h, clearance=0.15, angle=90, up=false, recess=0) {
	countersunk_bolt(d=5 + clearance, h=h, head_d=11, angle=angle, up=up, recess=recess);
}

// $fn=32;
// // countersunk_bolt(3, 10, 6, up=true, recess=5);
// countersunk_m3(10);
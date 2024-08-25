use <thread_profile.scad>
include <threadlib/THREAD_TABLE.scad>
include <ds/util.scad>


// Examples:

// tap("M3", 10, center=true);

// difference() {
// 	cube([10, 10, 10], center=true);
// 	#tap("M3", 10, center=true);
// }

module tap(designator, h, tol=0.20, center=false, blind=false, down=false, higbee_arc=20, table=THREAD_TABLE, fn=undef) {
	/*
	Partially copied from threadlib
		:Author: Adrian Schlatter and contributors
		:Date: 2019-11-11
		:License: 3-Clause BSD. See LICENSE.
	Heavily modified by duck
	*/
	specs = table[search([str(designator, "-int")], table, num_returns_per_match=1,
							  index_col_num=0)[0]][1];
	assert(!is_undef(specs), str("Designator: '", designator, "' not found"));
	P = specs[0];
	Rrotation = specs[1] - tol/2;
	Dsupport = specs[2] + tol;
	section_profile = specs[3];

	fn_suggested = Dsupport * 20;
	_fn = is_undef(fn) ? fn_suggested : fn;

	// An extra half pitch of height is needed to make a clear opening,
	// so we need one half for a blind hole,
	// and two halfs for a through hole (center=true).
	center_or_through = center || !blind;
	_h = h + (center_or_through ? P : P/2);
	turns = h / P - (center_or_through ? 0 : 0.5);
	mirror([0, 0, down ? 1 : 0])
		translate([0, 0, center ? -h/2 : 0])
			difference() {
				translate([0, 0, -P/2]) {
					cylinder(h=_h, d=Dsupport, $fn=_fn);
				};
				straight_thread(
					section_profile=section_profile,
					higbee_arc=higbee_arc,
					r=Rrotation,
					turns=turns,
					pitch=P,
					fn=_fn
				);
			}
}


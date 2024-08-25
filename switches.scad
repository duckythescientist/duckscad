module rotary_switch(extend=false, tol=0.15, simple=false, nib=true) {
    mount_d = 9 + tol;
    mount_h = extend ? 20 : 8;
    shaft_d = 6;
    shaft_h = 20;
    nib_d = 3 + tol;
    nib_h = extend ? 20 : 2.5 + 1;
    nib_x = 0.375*25.4;
    base_ring_d = 17.5;
    base_ring_h = 2.3;
    body_d = 28;
    body_h = 10.5;
    electrical_d = 23;
    electrical_h = 5.5;
    translate([0, 0, -0.1]) {
        color("dimgray") {
            cylinder(d=mount_d, h=mount_h);
            cylinder(d=shaft_d, h=shaft_h);
            if (nib)
                translate([nib_x, 0, -base_ring_h - 0.1])
                    cylinder(d=nib_d, h=base_ring_h + nib_h + 0.1);

        }
        if (!simple) {
            color("dimgray") {
                translate([0, 0, -base_ring_h - 0.1])
                    cylinder(d=base_ring_d, h=base_ring_h + 0.1);
                translate([0, 0, -base_ring_h - body_h])
                    cylinder(d=body_d, h=body_h);
            }
            color("silver")
                translate([0, 0, -base_ring_h - body_h - electrical_h])
                    cylinder(d=electrical_d, h=electrical_h + 0.1);
        }
    }
}

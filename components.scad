module bnc_connector_hole(h=4, center=false, flip=false) {
    intersection() {
        cylinder(d=9.3+0.15, h=h, center=center);
        cube([10, 8, h*3], center=true);
    }

    %translate([0, 0, flip ? h : 0])
    mirror([0, 0, flip ? 1 : 0]) {
        translate([0, 0, -1.5])
            cylinder(d=12.5, h=1.5);
        translate([0, 0, -12.6])
            cylinder(d=9.5, h=12.6);
        translate([0, 0, -8.5])
            rotate([0, 90, 0])
                cylinder(d=2, h=11, center=true);
        cylinder(d=8, h=8);
        cylinder(d=4.8, h=9.7);
        cylinder(d=2.2, h=12.3);
    }
}

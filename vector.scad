// UNIT: inches

module vector_tstrut_cutout(h) {
    translate([-0.203/2, -0.104/2, -0.1])
        cube([0.203, 0.104, h + 0.2]);
    translate([-0.118/2, -0.104/2 - 0.050, -0.1])
        cube([0.118, 0.3, h + 0.2]);
}


module vector_tstrut(h=100) {
    difference() {
        translate([-1/2, -0.291/2, 0])
            cube([1, 0.291, h]);
        for (i = [0, 1])
            mirror([i, 0, 0]) {
                translate([0.375, 0, 0])
                    rotate([0, 0, -90])
                        vector_tstrut_cutout(h);
            }
        #translate([0, 0.291/2 - 0.104/2 - 0.055, 0])
            vector_tstrut_cutout(h);
    }
}

vector_hole_locations = [
    [-0.375, 0],
    [+0.375, 0],
    [0, 0.0385]  // 0.0385 == 0.291/2 - 0.104/2 - 0.055
];

// vector_tstrut(h=5);

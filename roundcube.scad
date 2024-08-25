/* Fancy rounded cube library

It's not fast, but I think it's good.

Author: duckythescientist

Usage:
    build_corners(dims, r, edges)

    dims should be scalar or a 3d list [x, y, z] for cube dimensions
    r is the radius of curvature for the fillet
    edges is the specifier for which edges should be rounded
        it can be a named type
        or it can be a 12-list of bools counting counter clockwise from
        the origin: top face then vertical edges then bottom face

*/

cube_types = [
    [
        "top",
        [
            true, true, true, true,
            false, false, false, false,
            false, false, false, false,
        ]
    ],
    [
        "upper",
        [
            true, true, true, true,
            true, true, true, true,
            false, false, false, false,
        ]
    ],
    [
        "lower",
        [
            false, false, false, false,
            true, true, true, true,
            true, true, true, true,
        ]
    ],
    [
        "bottom",
        [
            false, false, false, false,
            false, false, false, false,
            true, true, true, true,
        ]
    ],
    [
        "origin",
        [
            false, false, false, false,
            true, false, false, false,
            true, false, false, true,
        ]
    ],
    [
        "full",
        [
            true, true, true, true,
            true, true, true, true,
            true, true, true, true,
        ]
    ],
    [
        "all",
        [
            true, true, true, true,
            true, true, true, true,
            true, true, true, true,
        ]
    ],
    [
        "yminus",
        [
            false, false, false, false,
            true, true, false, false,
            false, false, false, false,
        ]
    ],
    [
        "rightleft",
        [
            false, true, false, true,
            false, false, false, false,
            false, true, false, true,
        ]
    ],
    [
        "frontback",
        [
            true, false, true, false,
            false, false, false, false,
            true, false, true, false,
        ]
    ],
    [
        "frontsides",
        [
            false, false, false, false,
            true, true, false, false,
            false, false, false, false,
        ]
    ],
    [
        "sides",
        [
            false, false, false, false,
            true, true, true, true,
            false, false, false, false,
        ]
    ],
];

eps = 0.01;


module corner_0(r) {
    cube(eps);
}


module corner_1(r, x, y, z) {
    if (x) {
        translate([0, r, r])
            rotate([0, 90, 0])
                intersection() {
                    cylinder(r=r, h=eps);
                    translate([0, -r - 1, -1])
                        cube([r + 1, r + 1, eps + 2]);
                }

    }
    else if (y) {
        translate([r, 0, r])
            rotate([-90, 0, 0])
                intersection() {
                    cylinder(r=r, h=eps);
                    translate([-r - 1, 0, -1])
                        cube([r + 1, r + 1, eps + 2]);
                }
    }
    else {
        translate([r, r, 0])
            intersection() {
                cylinder(r=r, h=eps);
                translate([-r - 1, -r - 1, -1])
                    cube([r + 1, r + 1, eps + 2]);
            }
    }
}


module corner_2(r, x=true, y=true, z=true) {
    hull() {
        if (!x) {
            translate([r, 0, 0])
                cube([eps, r, r]);
        }
        else if (!y) {
            translate([0, r, 0])
                cube([r, eps, r]);
        }
        else {
            translate([0, 0, r])
                cube([r, r, eps]);
        }
        intersection() {
            translate([r, r, r])
                sphere(r=r);
            translate([-1, -1, -1])
                cube(r + 1);
        }
    }
}


module corner_3(r) {
    intersection() {
        translate([r, r, r])
            sphere(r=r);
        translate([-1, -1, -1])
            cube(r + 1);
    }
}


module corner(r, x, y, z) {
    xx = x ? 1 : 0;
    yy = y ? 1 : 0;
    zz = z ? 1 : 0;
    count = xx + yy + zz;
    if (count == 0) {
        corner_0(r);
    }
    else if (count == 1) {
        corner_1(r, x, y, z);
    }
    else if (count == 2) {
        corner_2(r, x, y, z);
    }
    else if (count == 3) {
        corner_3(r);
    }

}


module build_corners(dims, r, edges) {
    x = is_list(dims) ? dims[0] : dims;
    y = is_list(dims) ? dims[1] : dims;
    z = is_list(dims) ? dims[2] : dims;

    // echo(edges=edges);
    // echo(blah=cube_types[search([edges], cube_types)[0]][1]);
    _edges = is_string(edges) ?
        cube_types[search([edges], cube_types)[0]][1] :
        edges;

    a = _edges[0];
    b = _edges[1];
    c = _edges[2];
    d = _edges[3];

    e = _edges[4];
    f = _edges[5];
    g = _edges[6];
    h = _edges[7];

    i = _edges[8];
    j = _edges[9];
    k = _edges[10];
    l = _edges[11];

    translate([0, 0, z])
        rotate([-90, 0, 0])
            corner(r, a, e, d);
    translate([x, 0, z])
        rotate([-90, 0, 90])
            corner(r, b, f, a);
    translate([x, y, z])
        rotate([-90, 0, 180])
            corner(r, c, g, b);
    translate([0, y, z])
        rotate([-90, 0, -90])
            corner(r, d, h, c);

    translate([0, 0, 0])
        rotate([0, 0, 0])
            corner(r, i, l, e);
    translate([x, 0, 0])
        rotate([0, 0, 90])
            corner(r, j, i, f);
    translate([x, y, 0])
        rotate([0, 0, 180])
            corner(r, k, j, g);
    translate([0, y, 0])
        rotate([0, 0, -90])
            corner(r, l, k, h);
}


module roundcube(dims, r, edges="all", center=false) {
    if (center) {
        translate([-dims.x/2, -dims.y/2, -dims.z/2])
            hull()
                build_corners(dims, r, edges);
    }
    else {
        hull()
            build_corners(dims, r, edges);
    }

}




// corner_0();

// translate([30, 0, 0])
// corner_1(r=5, x=true);

// translate([0, 30, 0])
// corner_2(r=5, y=false);

// translate([30, 30, 0])
// corner_3(r=5);

// corner(5, true, true, false);

// hull()
// build_corners(
//     40,
//     5,
//     [
//         true,
//         true,
//         true,
//         true,

//         false,
//         false,
//         false,
//         true,

//         false,
//         false,
//         false,
//         true
//     ]
// );




// roundcube([20, 20, 4], 10, "yminus", $fn=20);

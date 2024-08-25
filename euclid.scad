phi=0.5*(sqrt(5)+1); // golden ratio


// Original: https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Commented_Example_Projects#Icosahedron
// create an icosahedron by intersecting 3 orthogonal golden-ratio rectangles
module _icosahedron(edge_length) {
    st=0.0001;  // microscopic sheet thickness
    hull() {
        cube([edge_length*phi, edge_length, st], true);
        rotate([90,90,0]) cube([edge_length*phi, edge_length, st], true);
        rotate([90,0,90]) cube([edge_length*phi, edge_length, st], true);
    }
}


module icosahedron(edge_length=undef, diameter=undef, up="edge") {
    edge_length = is_undef(edge_length) ? diameter * sqrt(3) / phi^2 : edge_length;

    if (up == "edge") {
        _icosahedron(edge_length);
    }
    else if (up == "face") {
        rotate([1/2 * acos(-sqrt(5)/3) - 90, 0, 0])
            _icosahedron(edge_length);
    }
    else if (up == "vertex") {
        rotate([0, atan(1/phi), 0])
            _icosahedron(edge_length);
    }
    else {
        assert(false, "up must be one of edge, face, or vertex");
    }
}

// icosahedron(10);
// icosahedron(diameter=20);

// // face-up rotation:
// rotate([1/2 * acos(-sqrt(5)/3) - 90, 0, 0])
// icosahedron(...);

// // vertex-up rotation:
// rotate([0, atan(1/phi), 0])
// icosahedron(...);

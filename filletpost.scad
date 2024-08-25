use <bezier.scad>;

module filletpost(r=undef, h, d=undef, radius=undef, rx=undef, rz=undef, aggression=0.5) {
    r = is_undef(r) ? d/2 : r;
    rx = is_undef(rx) ? radius : rx;
    rz = is_undef(rz) ? radius : rz;

    rotate_extrude()
    polygon(concat(
        [[0, 0]],
        [[r + rx, 0]],
        bezier_curve(
            [r + rx, 0],
            [r + rx - rx * aggression, 0],
            [r, rz - rz * aggression],
            [r, rz]
        ),
        [[r, h]],
        [[0, h]]
    ));
}


// filletpost(r=5, h=15, rx=7, rz=5, aggression=0.5, $fn=100);


module roundpost(r=undef, h, d=undef, radius=undef, rr=undef, rh=undef, aggression=0.5) {
    r = is_undef(r) ? d/2 : r;
    rr = is_undef(rr) ? radius : rr;
    rh = is_undef(rh) ? radius : rh;

    rotate_extrude()
    polygon(concat(
        [[0, 0]],
        [[r, 0]],
        [[r, h - rh]],
        bezier_curve(
            [r, h - rh],
            [r, h - rh + rh * aggression],
            [r - rr + rr * aggression, h],
            [r - rr, h]
        ),
        [[r - rr, h]],
        [[0, h]]
    ));
}


roundpost(r=5, h=15, rr=1, rh=2, aggression=0.5, $fn=100);

use <fonts/DSEG7ClassicMini-Regular.ttf>

module led_panel_meter_3(extend=false, tol=0.15, simple=false) {
    box_w = 22.7 + tol;
    box_l = 14.1 + tol;
    box_h = extend ? 20 : 7.3;
    ear_w = 33.7;
    ear_l = 5.3;
    pcb_h = 1.2;
    electronics_h = 1.6;
    wire_w = 5;
    hole_d = 3;
    hole_x = 28/2;
    eps = 0.1;
    // main body
    color("lightgray")
        translate([-box_w/2, -box_l/2, -eps])
            cube([box_w, box_l, box_h + 2*eps]);
    // wire stickout
    color("beige")
        translate([-wire_w + wire_w/2, -box_l/2 - 4, -pcb_h - electronics_h])
            cube([wire_w, 5, pcb_h + electronics_h + 1.5]);
    if (!simple) {
        // text
        color("red")
            translate([0, 0, box_h])
                linear_extrude(height=2*eps)
                    text(
                        "8.8.8.",
                        halign="center",
                        valign="center",
                        font="DSEG7 Classic Mini:style=Bold Italic",
                        size=6.5,
                        spacing=1);
        // PCB
        color("green") {
            translate([0, 0, -pcb_h/2]) {
                difference() {
                    union() {
                        cube([box_w, box_l, pcb_h], center=true);
                        cube([ear_w, ear_l, pcb_h], center=true);
                    }
                    for (i = [-1, +1])
                        translate([hole_x * i, 0, 0])
                            cylinder(d=hole_d, h=pcb_h+eps, center=true, $fn=16);
                }
            }
        }
        // electronics
        color("black")
            translate([0, 0, -pcb_h/2 - electronics_h/2])
                cube([box_w - 1, box_l - 1, electronics_h], center=true);

    }
}

module led_panel_meter_3_support(h=7.3, negative=false, hole_d=2.5, tol=0.15) {
    box_w = 22.7;
    box_l = 14.1;
    hole_x = 28/2;

    eps = 0.1;
    difference() {
        if (!negative)
            hull()
                for (i = [-1, +1])
                    translate([i * box_w/2, 0, 0])
                        cylinder(d=box_l, h=h);
        if (!negative)
            led_panel_meter_3(simple=true, tol=tol);
        for (i = [-1, +1])
            translate([i * hole_x, 0, -5])
                #cylinder(d=hole_d, h=5 + h + eps, $fn=20);
    }
}

module led_panel_meter_3_support_big(h=7.3, negative=false, hole_d=2.5, tol=0.15) {
    box_w = 22.7;
    cyl_d = 14.1 + 4;
    hole_x = 28/2;

    eps = 0.1;
    difference() {
        if (!negative)
            hull()
                for (i = [-1, +1])
                    translate([i * box_w/2, 0, 0])
                        cylinder(d=cyl_d, h=h);
        if (!negative)
            led_panel_meter_3(simple=true, tol=tol);
        for (i = [-1, +1])
            translate([i * hole_x, 0, -5])
                #cylinder(d=hole_d, h=5 + h + eps, $fn=20);
    }
}

// led_panel_meter_3(tol=0);
// led_panel_meter_3_support();
// led_panel_meter_3_support_big();

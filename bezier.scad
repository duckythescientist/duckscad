// Borrowed from https://openhome.cc/eGossip/OpenSCAD/BezierCurve.html

function bezier_coordinate(t, n0, n1, n2, n3) =
    n0 * pow((1 - t), 3) + 3 * n1 * t * pow((1 - t), 2) +
        3 * n2 * pow(t, 2) * (1 - t) + n3 * pow(t, 3);

function bezier_point_3d(t, p0, p1, p2, p3) =
    [
        bezier_coordinate(t, p0[0], p1[0], p2[0], p3[0]),
        bezier_coordinate(t, p0[1], p1[1], p2[1], p3[1]),
        bezier_coordinate(t, p0[2], p1[2], p2[2], p3[2])
    ];

function bezier_point_2d(t, p0, p1, p2, p3) =
    [
        bezier_coordinate(t, p0[0], p1[0], p2[0], p3[0]),
        bezier_coordinate(t, p0[1], p1[1], p2[1], p3[1])
    ];


function bezier_curve(p0, p1, p2, p3, $fn=50) =
    len(p0) == 2 ?
        [for(i = [0:$fn]) bezier_point_2d(i/$fn, p0, p1, p2, p3)] :
        [for(i = [0:$fn]) bezier_point_3d(i/$fn, p0, p1, p2, p3)];


// polygon(concat(
//     [[0, 0]],
//     [[10, 0]],
//     [[10, 1]],
//     bezier_curve(
//         [10, 1],
//         [10, 4],
//         [3, 2],
//         [2, 10]
//     ),
//     [[0, 10]]

// ));

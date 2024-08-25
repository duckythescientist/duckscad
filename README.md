# Duck's OpenSCAD Utilities

## bezier.scad

`bezier_curve(p0, p1, p2, p3, $fn=50)`

## components.scad

`bnc_connector_hole`

## countersunk_bolt.scad

`countersunk_m3(h)`

`countersunk_m5(h)`

`countersunk_bolt(d, h, head_d, angle=90, up=false, recess=0, cheat=0.1)`

## display.scad

LED panel meter things

## euclid.scad

icosahedron

Good for a D20

## filletpost.scad

Post with a fillet on its base:

`filletpost(r=undef, h, d=undef, radius=undef, rx=undef, rz=undef, aggression=0.5)`

Post with a rounded top:

`roundpost(r=undef, h, d=undef, radius=undef, rr=undef, rh=undef, aggression=0.5)`


## knurl.scad

Knurled cylinder. `d` is the little diameter (and usually the one to use), but if you need to fit this in a hole or something, `od` is the actual outer diameter.

`simple_knurl(d=undef, od=undef, h=1, center=false)`

Same but bigger:

`simple_knurl_aggro(d=undef, od=undef, h=1, center=false)`


## roundcube.scad

I'm actually proud of this one. 

`roundcube(dims, r, edges="all", center=false)`

Edges should be one of: top, upper, lower, bottom, origin, full, all, yminus, rightleft, frontback, frontsides, sides, or a list of 12 booleans.

## sum.scad

Sum of a vector: `sum(v)`

Cumulative sum of a vector: `cumsum(v)`

## switches.scad

I have a bunch of one type of rotary switch:

`rotary_switch()`


## threads.scad

3D printed pre-tapped holes. For small holes, these only print properly when vertical.

`tap(designator, h, tol=0.20, center=false, blind=false, down=false, higbee_arc=20, table=THREAD_TABLE, fn=undef)`


## util.scad

`INCH`

`flat_to_flat(d, N=6)` primarily for making hexagons

## vector.scad

Vector rack things.


## fonts

7-segment fonts

Copyright (c) 2020, keshikan (https://www.keshikan.net), with Reserved Font Name "DSEG".


# Housekeeping

## Installation

Either add a folder to your `$OPENSCADPATH` environment variable or clone this repo into a preexisting library directory.

`git clone git@github.com:duckythescientist/duckscad.git ds`


## Dependencies

There are several other libraries that this library uses. You'll probably need them too.

### threadlib

https://github.com/adrianschlatter/threadlib


### thread_profile

Grab this and put in your libraries folder:

https://github.com/MisterHW/IoP-satellite/blob/master/OpenSCAD%20bottle%20threads/thread_profile.scad

Backup: https://gist.github.com/duckythescientist/1060ddb7c7348a941b68f304f823a3d0


### tsmthread4

https://www.thingiverse.com/thing:3391213


### knurled_v2

In theory, download from https://www.thingiverse.com/thing:3391213 but the link is broken, so I've included a copy in this library. I'm not sure if my copy is modified.

(Note to self, `ln -s ds/knurled_v2.scad knurled_v2.scad`)


### https://github.com/openscad/scad-utils

### https://github.com/openscad/list-comprehension-demos

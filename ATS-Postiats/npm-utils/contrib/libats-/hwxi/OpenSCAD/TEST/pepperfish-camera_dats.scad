/*
The code is automatically
generated from [pepperfish-camera.dats]
*/

$fa=1.0; $fs=1.0;

module
camera() {
  d = 6.8;
  thickness = 1.63;

  d_ = 8.5;
  thickness_ = 4.3;

  depth = 12;
  width = 11;
  height = 11;
  lens = [4, 10];

  union () {
    difference() {
      union() {
        translate([d/2, -d/2, 0]) rotate([0, 0, 30])   cube([thickness, 10, thickness], center=true);
        translate([-d/2, -d/2, 0]) rotate([0, 0, -30]) cube([thickness, 10, thickness], center=true);
        translate([0, -d/2 -thickness/2, 0]) cube([d,d/2, thickness/2], center=true);
        translate([0, -d/2 -thickness, 0]) cube([d+thickness, d/2, thickness/2], center=true);
       }
          cylinder(h=thickness * 2, r=d/2, center=true);
          translate([0, -d/2-6, 0]) cube([d*2, thickness*2, thickness*2], center=true);
        }
        difference() {
          cylinder(thickness_, r=d_/2, center=true);
          cylinder(2*thickness_, r=d_/2-1, center=true);
          translate([0, d_/2, 0]) cube([d_/1.5, d_/2, thickness_*4], center=true);
        }
        translate([-sqrt(2)/2*d_/2.30, sqrt(2)/2*d_/2.25, 0]) cylinder(h=thickness_, r=thickness_/7.5, center=true);
        translate([sqrt(2)/2*d_/2.30, sqrt(2)/2*d_/2.25, 0])  cylinder(h=thickness_, r=thickness_/7.5, center=true);
    }

  }
union()
{
  union()
  {
    difference()
    {
      translate([0.00, 0.00, 4.00])
      {
        cube([18, 18, 2], center=true);
      }
      cube([14.00, 14.00, 20.00], center=true);
      translate([8.00, 8.00, 0.00])
      {
        cylinder(h=20.00, r=1.00, center=true);
      }
      translate([8.00, -8.00, 0.00])
      {
        cylinder(h=20.00, r=1.00, center=true);
      }
      translate([-8.00, 8.00, 0.00])
      {
        cylinder(h=20.00, r=1.00, center=true);
      }
      translate([-8.00, -8.00, 0.00])
      {
        cylinder(h=20.00, r=1.00, center=true);
      }
    }
    translate([8, 8, 0])
    {
      difference()
      {
        cylinder(h=5.00, r=2.00, center=false);
        cylinder(h=15.00, r=1.00, center=true);
      }
    }
    translate([8, -8, 0])
    {
      difference()
      {
        cylinder(h=5.00, r=2.00, center=false);
        cylinder(h=15.00, r=1.00, center=true);
      }
    }
    translate([-8, 8, 0])
    {
      difference()
      {
        cylinder(h=5.00, r=2.00, center=false);
        cylinder(h=15.00, r=1.00, center=true);
      }
    }
    translate([-8, -8, 0])
    {
      difference()
      {
        cylinder(h=5.00, r=2.00, center=false);
        cylinder(h=15.00, r=1.00, center=true);
      }
    }
    difference()
    {
      translate([-2.00, -8.00, 3.25])
      {
        cube([10.00, 10.00, 1.50], center=false);
      }
      rotate([0, 0, 45])
      {
        translate([-8.00, -3.90, 0.00])
        {
          cube([16.00, 16.00, 20.00], center=false);
        }
      }
      translate([8.00, -8.00, 0.00])
      {
        cylinder(h=10.00, r=2.00, center=true);
      }
    }
    translate([6.00, 6.00, 3.50])
    {
      rotate([0.00, 0.00, -45.00])
      {
        difference()
        {
          cube([3.50, 2.00, 3.00], center=true);
          cube([2.50, 1.00, 6.00], center=true);
        }
      }
    }
    translate([-6.00, -6.00, 3.50])
    {
      rotate([0.00, 0.00, -45.00])
      {
        difference()
        {
          cube([3.50, 2.00, 3.00], center=true);
          cube([2.50, 1.00, 6.00], center=true);
        }
      }
    }
  }
  rotate([58, 0, 45])
  {
    translate([0.00, 7.80, 6.80])
    {
      camera();
    }
  }
}

/* end of [pepperfish-camera_dats.scad] */

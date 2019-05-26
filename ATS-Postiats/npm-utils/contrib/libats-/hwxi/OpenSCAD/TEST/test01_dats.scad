/*
The code is automatically
generated from [test01.dats]
*/

$fa=0.1; $fs=0.1;

scale([10.00, 10.00, 17.50])
{
  translate([0.00, 0.00, 0.50])
  {
    difference()
    {
      intersection()
      {
        sphere(0.71);
        cube(1.00, center=true);
      }
      translate([0.00, 0.00, 0.10])
      {
        cylinder(h=1.00, r=0.45, center=true);
      }
    }
  }
}

/* end of [test01_dats.scad] */

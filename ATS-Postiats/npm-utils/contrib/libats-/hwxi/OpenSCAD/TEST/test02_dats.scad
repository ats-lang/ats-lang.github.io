/*
The code is automatically
generated from [test02.dats]
*/

$fa=0.1; $fs=0.1;

scale([5.00, 5.00, 5.00])
{
  union()
  {
    union()
    {
      union()
      {
        translate([1.00, 1.00, 1.00])
        {
          sphere(1.00);
        }
        translate([-1.00, 1.00, 1.00])
        {
          sphere(1.00);
        }
      }
      union()
      {
        translate([1.00, -1.00, 1.00])
        {
          sphere(1.00);
        }
        translate([-1.00, -1.00, 1.00])
        {
          sphere(1.00);
        }
      }
    }
    translate([0.00, 0.00, 2.41])
    {
      sphere(1.00);
    }
  }
}

/* end of [test02_dats.scad] */

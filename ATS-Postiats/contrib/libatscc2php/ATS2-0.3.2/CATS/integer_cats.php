<?php

/*
******
*
* HX-2014-08:
* for PHP code
* translated from ATS
*
******
*/

/*
******
* beg of [integer_cats.php]
******
*/

/* ****** ****** */

function
ats2phppre_abs_int0($x) { return abs($x); }

/* ****** ****** */

function
ats2phppre_neg_int0($x) { return ( -$x ); }
function
ats2phppre_neg_int1($x) { return ( -$x ); }

/* ****** ****** */

function
ats2phppre_succ_int0($x) { return ($x + 1); }
function
ats2phppre_pred_int0($x) { return ($x - 1); }

/* ****** ****** */

function
ats2phppre_half_int0($x)
{
  return ($x >= 0) ? floor($x/2) : ceil($x/2);
}

/* ****** ****** */

function
ats2phppre_succ_int1($x) { return ($x + 1); }
function
ats2phppre_pred_int1($x) { return ($x - 1); }

/* ****** ****** */

function
ats2phppre_half_int1($x) { return ats2phppre_half_int0($x); }

/* ****** ****** */

function
ats2phppre_add_int0_int0($x, $y) { return ($x + $y); }
function
ats2phppre_sub_int0_int0($x, $y) { return ($x - $y); }
function
ats2phppre_mul_int0_int0($x, $y) { return ($x * $y); }
function
ats2phppre_div_int0_int0($x, $y) { return intval($x / $y); }
function
ats2phppre_mod_int0_int0($x, $y) { return ($x % $y); }

/* ****** ****** */

function
ats2phppre_add_int1_int1($x, $y) { return ($x + $y); }
function
ats2phppre_sub_int1_int1($x, $y) { return ($x - $y); }
function
ats2phppre_mul_int1_int1($x, $y) { return ($x * $y); }
function
ats2phppre_div_int1_int1($x, $y) { return intval($x / $y); }

/* ****** ****** */
//
function
ats2phppre_mod_int1_int1($x, $y) { return ($x % $y); }
function
ats2phppre_nmod_int1_int1($x, $y) { return ($x % $y); }
//
/* ****** ****** */

function
ats2phppre_lt_int0_int0($x, $y) { return ($x < $y); }
function
ats2phppre_lte_int0_int0($x, $y) { return ($x <= $y); }
function
ats2phppre_gt_int0_int0($x, $y) { return ($x > $y); }
function
ats2phppre_gte_int0_int0($x, $y) { return ($x >= $y); }
function
ats2phppre_eq_int0_int0($x, $y) { return ($x === $y); }
function
ats2phppre_neq_int0_int0($x, $y) { return ($x !== $y); }

/* ****** ****** */

function
ats2phppre_compare_int0_int0($x, $y)
{
  return ($x < $y ? -1 : ($x <= $y ? 0 : 1)); // HX: intcmp
}

/* ****** ****** */

function
ats2phppre_lt_int1_int1($x, $y) { return ($x < $y); }
function
ats2phppre_lte_int1_int1($x, $y) { return ($x <= $y); }
function
ats2phppre_gt_int1_int1($x, $y) { return ($x > $y); }
function
ats2phppre_gte_int1_int1($x, $y) { return ($x >= $y); }
function
ats2phppre_eq_int1_int1($x, $y) { return ($x === $y); }
function
ats2phppre_neq_int1_int1($x, $y) { return ($x !== $y); }

/* ****** ****** */
//
function
ats2phppre_max_int0_int0($x, $y) { return max($x, $y); }
function
ats2phppre_max_int1_int1($x, $y) { return max($x, $y); }
//
function
ats2phppre_min_int0_int0($x, $y) { return min($x, $y); }
function
ats2phppre_min_int1_int1($x, $y) { return min($x, $y); }
//
/* ****** ****** */

/* end of [integer_cats.php] */

?>

<?php
/*
** Time of Generation:
** Tue Jul 14 00:43:38 EDT 2015
*/
?>
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
* beg of [basics_cats.php]
******
*/

/* ****** ****** */

function
ATSCKiseqz($x) { return ($x === 0); }
function
ATSCKisneqz($x) { return ($x !== 0); }

/* ****** ****** */

function
ATSCKptrisnull($xs) { return ($xs === NULL) ; }
function
ATSCKptriscons($xs) { return ($xs !== NULL) ; }

/* ****** ****** */

function
ATSCKpat_int($tmp, $given) { return ($tmp === $given) ; }
function
ATSCKpat_bool($tmp, $given) { return ($tmp === $given) ; }
function
ATSCKpat_char($tmp, $given) { return ($tmp === $given) ; }
function
ATSCKpat_float($tmp, $given) { return ($tmp === $given) ; }

/* ****** ****** */

function
ATSCKpat_con0($con, $tag) { return ($con === $tag) ; }
function
ATSCKpat_con1($con, $tag) { return ($con[0] === $tag) ; }

/* ****** ****** */
//
function
ATSINScaseof_fail($errmsg)
{
  fprintf(STDERR, "ATSINScaseof_fail:%s", $errmsg); exit(1);
  return;
}
//
function
ATSINSdeadcode_fail()
  { fprintf(STDERR, "ATSINSdeadcode_fail"); exit(1); return; }
//
/* ****** ****** */

function ATSPMVempty() { return; }

/* ****** ****** */

/*
function
ATSPMVlazyval_make (thunk) { return [0, thunk]; }
*/

/* ****** ****** */

function
ATSPMVlazyval_eval
  (&$lazyval)
{
//
  $flag = $lazyval[0];
//
  if($flag===0)
  {
    $lazyval[0] = 1;
    $thunk = $lazyval[1];
    $lazyval[1] = $thunk[0]($thunk);
  } else {
    $lazyval[0] = $flag + 1;
  } // end of [if]
//
  return;
//
} // end of [ATSPMVlazyval_eval]

/* ****** ****** */

function
ats2phppre_echo_obj($x) { echo($x); return; }

/* ****** ****** */
/*
//
function
ats2phppre_echo0_obj() { return; }
function
ats2phppre_echo1_obj($x1) { echo($x1); return; }
function
ats2phppre_echo2_obj($x1, $x2) { echo $x1, $x2; return; }
//
function
ats2phppre_echo3_obj
  ($x1, $x2, $x3) { echo $x1, $x2, $x3; return; }
function
ats2phppre_echo4_obj
  ($x1, $x2, $x3, $x4) { echo $x1, $x2, $x3, $x4; return; }
function
ats2phppre_echo5_obj
  ($x1, $x2, $x3, $x4, $x5) { echo $x1, $x2, $x3, $x4, $x5; return; }
function
ats2phppre_echo6_obj
  ($x1, $x2, $x3, $x4, $x5, $x6) { echo $x1, $x2, $x3, $x4, $x5, $x6; return; }
//
function
ats2phppre_echo7_obj
  ($x1, $x2, $x3, $x4, $x5, $x6, $x7)
  { echo $x1, $x2, $x3, $x4, $x5, $x6, $x7; return; }
function
ats2phppre_echo8_obj
  ($x1, $x2, $x3, $x4, $x5, $x6, $x7, $x8)
  { echo $x1, $x2, $x3, $x4, $x5, $x6, $x7, $x8; return; }
//
*/
/* ****** ****** */

function
ats2phppre_print_newline() { ats2phppre_fprint_newline(STDOUT); }
function
ats2phppre_prerr_newline() { ats2phppre_fprint_newline(STDERR); }
function
ats2phppre_fprint_newline($out) { fprintf($out, "\n"); fflush($out); return; }

/* ****** ****** */

function
ats2phppre_lazy2cloref($lazyval) { return $lazyval[1]; }

/* ****** ****** */
//
function
ats2phppre_assert_bool0($tfv) { if (!$tfv) exit("**EXIT**"); return; }
function
ats2phppre_assert_bool1($tfv) { if (!$tfv) exit("**EXIT**"); return; }
//
/* ****** ****** */
//
function
ats2phppre_assert_errmsg_bool0($tfv, $errmsg)
{
  if (!$tfv) { fprintf(STDERR, "%s", $errmsg); exit(errmsg); }; return;
}
function
ats2phppre_assert_errmsg_bool1($tfv, $errmsg)
{
  if (!$tfv) { fprintf(STDERR, "%s", $errmsg); exit(errmsg); }; return;
}
//
/* ****** ****** */

/* end of [basics_cats.php] */

?>
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
function
ats2phppre_neg_int0($x) { return ( -$x ); }

/* ****** ****** */

function
ats2phppre_succ_int0($x) { return ($x + 1); }
function
ats2phppre_pred_int0($x) { return ($x - 1); }

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

/* end of [integer_cats.php] */

?>
<?php

/*
******
*
* HX-2014-11:
* for PHP code
* translated from ATS
*
******
*/

/*
******
* beg of [bool_cats.php]
******
*/

/* ****** ****** */

/* end of [bool_cats.php] */

?>
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
* beg of [float_cats.php]
******
*/

/* ****** ****** */
//
function
ats2phppre_double2int($x) { return intval($x); }
function
ats2phppre_int_of_double($x) { return intval($x); }
//
/* ****** ****** */
//
function
ats2phppre_int2double($x) { return floatval($x); }
function
ats2phppre_double_of_int($x) { return floatval($x); }
//
/* ****** ****** */

function
ats2phppre_abs_double($x) { return abs($x); }
function
ats2phppre_neg_double($x) { return ( -$x ); }

/* ****** ****** */

function
ats2phppre_succ_double($x) { return ($x + 1); }
function
ats2phppre_pred_double($x) { return ($x - 1); }

/* ****** ****** */

function
ats2phppre_add_double_double($x, $y) { return ($x + $y); }
function
ats2phppre_sub_double_double($x, $y) { return ($x - $y); }
function
ats2phppre_mul_double_double($x, $y) { return ($x * $y); }
function
ats2phppre_div_double_double($x, $y) { return ($x / $y); }

/* ****** ****** */

function
ats2phppre_lt_double_double($x, $y) { return ($x < $y); }
function
ats2phppre_lte_double_double($x, $y) { return ($x <= $y); }
function
ats2phppre_gt_double_double($x, $y) { return ($x > $y); }
function
ats2phppre_gte_double_double($x, $y) { return ($x >= $y); }
function
ats2phppre_eq_double_double($x, $y) { return ($x === $y); }
function
ats2phppre_neq_double_double($x, $y) { return ($x !== $y); }

/* ****** ****** */

/* end of [float_cats.php] */

?>
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
* beg of [string_cats.php]
******
*/

/* ****** ****** */

/* end of [string_cats.php] */

?>
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
* beg of [print_cats.php]
******
*/

/* ****** ****** */
//
function
ats2phppre_print_int($x)
  { fprintf(STDOUT, "%d", $x); return; }
function
ats2phppre_prerr_int($x)
  { fprintf(STDERR, "%d", $x); return; }
function
ats2phppre_fprint_int
  ($out, $x) { fprintf($out, "%d", $x); return; }
//
/* ****** ****** */
//
function
ats2phppre_print_bool($x)
{
  ats2phppre_fprint_bool(STDOUT, $x); return;
}
function
ats2phppre_prerr_bool($x)
{
  ats2phppre_fprint_bool(STDERR, $x); return;
}
function
ats2phppre_fprint_bool
  ($out, $x)
{
  if($x) {
    fprintf($out, "true"); return;
  } else {
    fprintf($out, "false"); return;
  } // end of [if]
}
//
/* ****** ****** */
//
function
ats2phppre_print_double($x)
  { fprintf(STDOUT, "%f", $x); return; }
function
ats2phppre_prerr_double($x)
  { fprintf(STDERR, "%f", $x); return; }
function
ats2phppre_fprint_double
  ($out, $x) { fprintf($out, "%f", $x); return; }
//
/* ****** ****** */
//
function
ats2phppre_print_string($x)
  { fprintf(STDOUT, "%s", $x); return ; }
function
ats2phppre_prerr_string($x)
  { fprintf(STDERR, "%s", $x); return ; }
function
ats2phppre_fprint_string
 ($out, $x) { fprintf($out, "%s", $x); return ; }
//
/* ****** ****** */
//
function
ats2phppre_print_obj($x) { print($x); return; }
function
ats2phppre_print_r_obj($x) { print_r($x); return; }
//
/* ****** ****** */

/* end of [print_cats.php] */

?>
<?php

/*
******
*
* HX-2014-09:
* for PHP code
* translated from ATS
*
******
*/

/*
******
* beg of [filebas_cats.php]
******
*/

/* ****** ****** */
//
/*
$ats2phppre_stdin = STDIN;
$ats2phppre_stdout = STDOUT;
$ats2phppre_stderr = STDERR;
*/
//
/* ****** ****** */

/* end of [filebas_cats.php] */

?>
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
* beg of [PHPref_cats.php]
******
*/

/* ****** ****** */

class
PHPref {
  public $value ; // this is the payload
} /* end of [class] */

/* ****** ****** */
//
function
PHPref_new($x0) {
  $res = new PHPref;
  $res->value = $x0; return $res;
}
function
PHPref_make_elt($x0) { return PHPref_new($x0); }
//
/* ****** ****** */
//
function
PHPref_get_elt($A) { return $A->value ; }
//
function
PHPref_set_elt($A, $x) { $A->value = $x; return ; }
//
/* ****** ****** */

/* end of [PHPref_cats.php] */

?>
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
* beg of [PHParref_cats.php]
******
*/

/* ****** ****** */
//
function
PHParray_nil() { return array(); }
function
PHParray_sing($x) { return array($x); }
function
PHParray_pair($x1, $x2) { return array($x1, $x2); }
//
/* ****** ****** */

/* end of [PHParray_cats.php] */

?>
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
* beg of [PHParref_cats.php]
******
*/

/* ****** ****** */

class
PHParref {
  public $array ; // this is a PHParray
} /* end of [class] */

/* ****** ****** */
//
function
PHParref_nil() {
  $res = new PHParref; $res->array = array(); return $res;
}
//
function
PHParref_sing($x) {
  $res = new PHParref; $res->array = array($x); return $res;
}
//
function
PHParref_pair($x1, $x2) {
  $res = new PHParref; $res->array = array($x1, x2); return $res;
}
//
/* ****** ****** */

function
PHParref_size($A) { return count($A->array) ; }
function
PHParref_length($A) { return count($A->array) ; }

/* ****** ****** */
//
function
PHParref_get_at($A, $i)
{
  return $A->array[$i] ;
}
//
function
PHParref_set_at($A, $i, $x)
{
  $A->array[$i] = $x; return ;
}
//
/* ****** ****** */
//
function
PHParref_unset($A, $k)
  { unset($A->array[$k]); return; }
//
/* ****** ****** */
//
function
PHParref_extend($A, $x) { $A->array[] = $x; return; }
//
/* ****** ****** */

function
PHParref_copy ($A)
{
  $A2 = new PHParref;
  $A2->array = $A->array; return $A2;
}

/* ****** ****** */

function
PHParref_values($A)
{
  $A2 = new PHParref;
  $A2->array = array_values($A->array); return $A2;
}

/* ****** ****** */

/* end of [PHParref_cats.php] */

?>
<?php
/*
**
** The PHP code is generated by atscc2php
** The starting compilation time is: 2015-7-14:  0h:43m
**
*/

function
ats2phppre_list_make_intrange_2($arg0, $arg1)
{
/*
  // $tmpret0
*/
  __patsflab_list_make_intrange_2:
  $tmpret0 = ats2phppre_list_make_intrange_3($arg0, $arg1, 1);
  return $tmpret0;
} // end-of-function


function
ats2phppre_list_make_intrange_3($arg0, $arg1, $arg2)
{
/*
  // $tmpret1
  // $tmp12
  // $tmp13
  // $tmp14
  // $tmp15
  // $tmp16
  // $tmp17
  // $tmp18
  // $tmp19
  // $tmp20
  // $tmp21
  // $tmp22
  // $tmp23
  // $tmp24
  // $tmp25
  // $tmp26
  // $tmp27
  // $tmp28
  // $tmp29
  // $tmp30
  // $tmp31
  // $tmp32
*/
  __patsflab_list_make_intrange_3:
  // ATScaseofseq_beg
  do {
    // ATSbranchseq_beg
    __atstmplab0:
    $tmp12 = ats2phppre_gt_int0_int0($arg2, 0);
    if(!ATSCKpat_bool($tmp12, true)) goto __atstmplab1;
    $tmp13 = ats2phppre_lt_int0_int0($arg0, $arg1);
    if($tmp13) {
      $tmp17 = ats2phppre_sub_int0_int0($arg1, $arg0);
      $tmp16 = ats2phppre_add_int0_int0($tmp17, $arg2);
      $tmp15 = ats2phppre_sub_int0_int0($tmp16, 1);
      $tmp14 = ats2phppre_div_int0_int0($tmp15, $arg2);
      $tmp20 = ats2phppre_sub_int0_int0($tmp14, 1);
      $tmp19 = ats2phppre_mul_int0_int0($tmp20, $arg2);
      $tmp18 = ats2phppre_add_int0_int0($arg0, $tmp19);
      $tmp21 = null;
      $tmpret1 = _ats2phppre_list_loop1_2($tmp14, $tmp18, $arg2, $tmp21);
    } else {
      $tmpret1 = null;
    } // endif
    break;
    // ATSbranchseq_end
    // ATSbranchseq_beg
    __atstmplab1:
    $tmp22 = ats2phppre_lt_int0_int0($arg2, 0);
    if(!ATSCKpat_bool($tmp22, true)) goto __atstmplab2;
    $tmp23 = ats2phppre_gt_int0_int0($arg0, $arg1);
    if($tmp23) {
      $tmp24 = ats2phppre_neg_int0($arg2);
      $tmp28 = ats2phppre_sub_int0_int0($arg0, $arg1);
      $tmp27 = ats2phppre_add_int0_int0($tmp28, $tmp24);
      $tmp26 = ats2phppre_sub_int0_int0($tmp27, 1);
      $tmp25 = ats2phppre_div_int0_int0($tmp26, $tmp24);
      $tmp31 = ats2phppre_sub_int0_int0($tmp25, 1);
      $tmp30 = ats2phppre_mul_int0_int0($tmp31, $tmp24);
      $tmp29 = ats2phppre_sub_int0_int0($arg0, $tmp30);
      $tmp32 = null;
      $tmpret1 = _ats2phppre_list_loop2_3($tmp25, $tmp29, $tmp24, $tmp32);
    } else {
      $tmpret1 = null;
    } // endif
    break;
    // ATSbranchseq_end
    // ATSbranchseq_beg
    __atstmplab2:
    $tmpret1 = null;
    break;
    // ATSbranchseq_end
  } while(0);
  // ATScaseofseq_end
  return $tmpret1;
} // end-of-function


function
_ats2phppre_list_loop1_2($arg0, $arg1, $arg2, $arg3)
{
/*
  // $apy0
  // $apy1
  // $apy2
  // $apy3
  // $tmpret2
  // $tmp3
  // $tmp4
  // $tmp5
  // $tmp6
*/
  __patsflab__ats2phppre_list_loop1_2:
  $tmp3 = ats2phppre_gt_int0_int0($arg0, 0);
  if($tmp3) {
    $tmp4 = ats2phppre_sub_int0_int0($arg0, 1);
    $tmp5 = ats2phppre_sub_int0_int0($arg1, $arg2);
    $tmp6 = array($arg1, $arg3);
    // ATStailcalseq_beg
    $apy0 = $tmp4;
    $apy1 = $tmp5;
    $apy2 = $arg2;
    $apy3 = $tmp6;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    goto __patsflab__ats2phppre_list_loop1_2;
    // ATStailcalseq_end
  } else {
    $tmpret2 = $arg3;
  } // endif
  return $tmpret2;
} // end-of-function


function
_ats2phppre_list_loop2_3($arg0, $arg1, $arg2, $arg3)
{
/*
  // $apy0
  // $apy1
  // $apy2
  // $apy3
  // $tmpret7
  // $tmp8
  // $tmp9
  // $tmp10
  // $tmp11
*/
  __patsflab__ats2phppre_list_loop2_3:
  $tmp8 = ats2phppre_gt_int0_int0($arg0, 0);
  if($tmp8) {
    $tmp9 = ats2phppre_sub_int0_int0($arg0, 1);
    $tmp10 = ats2phppre_add_int0_int0($arg1, $arg2);
    $tmp11 = array($arg1, $arg3);
    // ATStailcalseq_beg
    $apy0 = $tmp9;
    $apy1 = $tmp10;
    $apy2 = $arg2;
    $apy3 = $tmp11;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    goto __patsflab__ats2phppre_list_loop2_3;
    // ATStailcalseq_end
  } else {
    $tmpret7 = $arg3;
  } // endif
  return $tmpret7;
} // end-of-function


function
ats2phppre_list_length($arg0)
{
/*
  // $tmpret44
*/
  __patsflab_list_length:
  $tmpret44 = _ats2phppre_list_loop_10($arg0, 0);
  return $tmpret44;
} // end-of-function


function
_ats2phppre_list_loop_10($arg0, $arg1)
{
/*
  // $apy0
  // $apy1
  // $tmpret45
  // $tmp47
  // $tmp48
*/
  __patsflab__ats2phppre_list_loop_10:
  // ATScaseofseq_beg
  do {
    // ATSbranchseq_beg
    __atstmplab7:
    if(ATSCKptriscons($arg0)) goto __atstmplab10;
    __atstmplab8:
    $tmpret45 = $arg1;
    break;
    // ATSbranchseq_end
    // ATSbranchseq_beg
    __atstmplab9:
    __atstmplab10:
    $tmp47 = $arg0[1];
    $tmp48 = ats2phppre_add_int1_int1($arg1, 1);
    // ATStailcalseq_beg
    $apy0 = $tmp47;
    $apy1 = $tmp48;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2phppre_list_loop_10;
    // ATStailcalseq_end
    break;
    // ATSbranchseq_end
  } while(0);
  // ATScaseofseq_end
  return $tmpret45;
} // end-of-function


function
ats2phppre_list_get_at($arg0, $arg1)
{
/*
  // $apy0
  // $apy1
  // $tmpret49
  // $tmp50
  // $tmp51
  // $tmp52
  // $tmp53
*/
  __patsflab_list_get_at:
  $tmp50 = ats2phppre_eq_int1_int1($arg1, 0);
  if($tmp50) {
    $tmp51 = $arg0[0];
    $tmpret49 = $tmp51;
  } else {
    $tmp52 = $arg0[1];
    $tmp53 = ats2phppre_sub_int1_int1($arg1, 1);
    // ATStailcalseq_beg
    $apy0 = $tmp52;
    $apy1 = $tmp53;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab_list_get_at;
    // ATStailcalseq_end
  } // endif
  return $tmpret49;
} // end-of-function


function
ats2phppre_list_append($arg0, $arg1)
{
/*
  // $tmpret54
  // $tmp55
  // $tmp56
  // $tmp57
*/
  __patsflab_list_append:
  // ATScaseofseq_beg
  do {
    // ATSbranchseq_beg
    __atstmplab11:
    if(ATSCKptriscons($arg0)) goto __atstmplab14;
    __atstmplab12:
    $tmpret54 = $arg1;
    break;
    // ATSbranchseq_end
    // ATSbranchseq_beg
    __atstmplab13:
    __atstmplab14:
    $tmp55 = $arg0[0];
    $tmp56 = $arg0[1];
    $tmp57 = ats2phppre_list_append($tmp56, $arg1);
    $tmpret54 = array($tmp55, $tmp57);
    break;
    // ATSbranchseq_end
  } while(0);
  // ATScaseofseq_end
  return $tmpret54;
} // end-of-function


function
ats2phppre_list_reverse($arg0)
{
/*
  // $tmpret58
  // $tmp59
*/
  __patsflab_list_reverse:
  $tmp59 = null;
  $tmpret58 = ats2phppre_list_reverse_append($arg0, $tmp59);
  return $tmpret58;
} // end-of-function


function
ats2phppre_list_reverse_append($arg0, $arg1)
{
/*
  // $tmpret60
*/
  __patsflab_list_reverse_append:
  $tmpret60 = _ats2phppre_list_loop_15($arg0, $arg1);
  return $tmpret60;
} // end-of-function


function
_ats2phppre_list_loop_15($arg0, $arg1)
{
/*
  // $apy0
  // $apy1
  // $tmpret61
  // $tmp62
  // $tmp63
  // $tmp64
*/
  __patsflab__ats2phppre_list_loop_15:
  // ATScaseofseq_beg
  do {
    // ATSbranchseq_beg
    __atstmplab15:
    if(ATSCKptriscons($arg0)) goto __atstmplab18;
    __atstmplab16:
    $tmpret61 = $arg1;
    break;
    // ATSbranchseq_end
    // ATSbranchseq_beg
    __atstmplab17:
    __atstmplab18:
    $tmp62 = $arg0[0];
    $tmp63 = $arg0[1];
    $tmp64 = array($tmp62, $arg1);
    // ATStailcalseq_beg
    $apy0 = $tmp63;
    $apy1 = $tmp64;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2phppre_list_loop_15;
    // ATStailcalseq_end
    break;
    // ATSbranchseq_end
  } while(0);
  // ATScaseofseq_end
  return $tmpret61;
} // end-of-function


function
ats2phppre_list_take($arg0, $arg1)
{
/*
  // $tmpret65
  // $tmp66
  // $tmp67
  // $tmp68
  // $tmp69
  // $tmp70
*/
  __patsflab_list_take:
  $tmp66 = ats2phppre_gt_int1_int1($arg1, 0);
  if($tmp66) {
    $tmp67 = $arg0[0];
    $tmp68 = $arg0[1];
    $tmp70 = ats2phppre_sub_int1_int1($arg1, 1);
    $tmp69 = ats2phppre_list_take($tmp68, $tmp70);
    $tmpret65 = array($tmp67, $tmp69);
  } else {
    $tmpret65 = null;
  } // endif
  return $tmpret65;
} // end-of-function


function
ats2phppre_list_drop($arg0, $arg1)
{
/*
  // $apy0
  // $apy1
  // $tmpret71
  // $tmp72
  // $tmp73
  // $tmp74
*/
  __patsflab_list_drop:
  $tmp72 = ats2phppre_gt_int1_int1($arg1, 0);
  if($tmp72) {
    $tmp73 = $arg0[1];
    $tmp74 = ats2phppre_sub_int1_int1($arg1, 1);
    // ATStailcalseq_beg
    $apy0 = $tmp73;
    $apy1 = $tmp74;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab_list_drop;
    // ATStailcalseq_end
  } else {
    $tmpret71 = $arg0;
  } // endif
  return $tmpret71;
} // end-of-function


function
ats2phppre_list_split_at($arg0, $arg1)
{
/*
  // $tmpret75
  // $tmp76
  // $tmp77
*/
  __patsflab_list_split_at:
  $tmp76 = ats2phppre_list_take($arg0, $arg1);
  $tmp77 = ats2phppre_list_drop($arg0, $arg1);
  $tmpret75 = array($tmp76, $tmp77);
  return $tmpret75;
} // end-of-function


function
ats2phppre_list_insert_at($arg0, $arg1, $arg2)
{
/*
  // $tmpret78
  // $tmp79
  // $tmp80
  // $tmp81
  // $tmp82
  // $tmp83
*/
  __patsflab_list_insert_at:
  $tmp79 = ats2phppre_gt_int1_int1($arg1, 0);
  if($tmp79) {
    $tmp80 = $arg0[0];
    $tmp81 = $arg0[1];
    $tmp83 = ats2phppre_sub_int1_int1($arg1, 1);
    $tmp82 = ats2phppre_list_insert_at($tmp81, $tmp83, $arg2);
    $tmpret78 = array($tmp80, $tmp82);
  } else {
    $tmpret78 = array($arg2, $arg0);
  } // endif
  return $tmpret78;
} // end-of-function


function
ats2phppre_list_remove_at($arg0, $arg1)
{
/*
  // $tmpret84
  // $tmp85
  // $tmp86
  // $tmp87
  // $tmp88
  // $tmp89
  // $tmp90
  // $tmp91
  // $tmp92
*/
  __patsflab_list_remove_at:
  $tmp85 = $arg0[0];
  $tmp86 = $arg0[1];
  $tmp87 = ats2phppre_gt_int1_int1($arg1, 0);
  if($tmp87) {
    $tmp89 = ats2phppre_sub_int1_int1($arg1, 1);
    $tmp88 = ats2phppre_list_remove_at($tmp86, $tmp89);
    $tmp90 = $tmp88[0];
    $tmp91 = $tmp88[1];
    $tmp92 = array($tmp85, $tmp91);
    $tmpret84 = array($tmp90, $tmp92);
  } else {
    $tmpret84 = array($tmp85, $tmp86);
  } // endif
  return $tmpret84;
} // end-of-function


function
ats2phppre_list_app($arg0, $arg1)
{
/*
*/
  __patsflab_list_app:
  ats2phppre_list_foreach($arg0, $arg1);
  return/*_void*/;
} // end-of-function


function
ats2phppre_list_foreach($arg0, $arg1)
{
/*
  // $apy0
  // $apy1
  // $tmp95
  // $tmp96
*/
  __patsflab_list_foreach:
  // ATScaseofseq_beg
  do {
    // ATSbranchseq_beg
    __atstmplab19:
    if(ATSCKptriscons($arg0)) goto __atstmplab22;
    __atstmplab20:
    // ATSINSmove_void;
    break;
    // ATSbranchseq_end
    // ATSbranchseq_beg
    __atstmplab21:
    __atstmplab22:
    $tmp95 = $arg0[0];
    $tmp96 = $arg0[1];
    $arg1[0]($arg1, $tmp95);
    // ATStailcalseq_beg
    $apy0 = $tmp96;
    $apy1 = $arg1;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab_list_foreach;
    // ATStailcalseq_end
    break;
    // ATSbranchseq_end
  } while(0);
  // ATScaseofseq_end
  return/*_void*/;
} // end-of-function


function
ats2phppre_list_map($arg0, $arg1)
{
/*
  // $tmpret98
  // $tmp99
  // $tmp100
  // $tmp101
  // $tmp102
*/
  __patsflab_list_map:
  // ATScaseofseq_beg
  do {
    // ATSbranchseq_beg
    __atstmplab23:
    if(ATSCKptriscons($arg0)) goto __atstmplab26;
    __atstmplab24:
    $tmpret98 = null;
    break;
    // ATSbranchseq_end
    // ATSbranchseq_beg
    __atstmplab25:
    __atstmplab26:
    $tmp99 = $arg0[0];
    $tmp100 = $arg0[1];
    $tmp101 = $arg1[0]($arg1, $tmp99);
    $tmp102 = ats2phppre_list_map($tmp100, $arg1);
    $tmpret98 = array($tmp101, $tmp102);
    break;
    // ATSbranchseq_end
  } while(0);
  // ATScaseofseq_end
  return $tmpret98;
} // end-of-function

/* ****** ****** */

/* end-of-compilation-unit */
?>
<?php
/*
**
** The PHP code is generated by atscc2php
** The starting compilation time is: 2015-7-14:  0h:43m
**
*/

function
ats2phppre_option_is_some($arg0)
{
/*
  // $tmpret0
*/
  __patsflab_option_is_some:
  // ATScaseofseq_beg
  do {
    // ATSbranchseq_beg
    __atstmplab0:
    if(ATSCKptrisnull($arg0)) goto __atstmplab3;
    __atstmplab1:
    $tmpret0 = true;
    break;
    // ATSbranchseq_end
    // ATSbranchseq_beg
    __atstmplab2:
    __atstmplab3:
    $tmpret0 = false;
    break;
    // ATSbranchseq_end
  } while(0);
  // ATScaseofseq_end
  return $tmpret0;
} // end-of-function


function
ats2phppre_option_is_none($arg0)
{
/*
  // $tmpret1
*/
  __patsflab_option_is_none:
  // ATScaseofseq_beg
  do {
    // ATSbranchseq_beg
    __atstmplab4:
    if(ATSCKptriscons($arg0)) goto __atstmplab7;
    __atstmplab5:
    $tmpret1 = true;
    break;
    // ATSbranchseq_end
    // ATSbranchseq_beg
    __atstmplab6:
    __atstmplab7:
    $tmpret1 = false;
    break;
    // ATSbranchseq_end
  } while(0);
  // ATScaseofseq_end
  return $tmpret1;
} // end-of-function

/* ****** ****** */

/* end-of-compilation-unit */
?>
<?php
/*
**
** The PHP code is generated by atscc2php
** The starting compilation time is: 2015-7-14:  0h:43m
**
*/
function
_ats2jspre_stream_patsfun_1__closurerize($env0, $env1)
{
  return array(function($cenv) { return _ats2jspre_stream_patsfun_1($cenv[1], $cenv[2]); }, $env0, $env1);
}

function
_ats2jspre_stream_patsfun_3__closurerize($env0, $env1)
{
  return array(function($cenv) { return _ats2jspre_stream_patsfun_3($cenv[1], $cenv[2]); }, $env0, $env1);
}

function
_ats2jspre_stream_patsfun_6__closurerize($env0, $env1)
{
  return array(function($cenv) { return _ats2jspre_stream_patsfun_6($cenv[1], $cenv[2]); }, $env0, $env1);
}


function
ats2phppre_stream_map_cloref($arg0, $arg1)
{
/*
  // $tmpret0
*/
  __patsflab_stream_map_cloref:
  $tmpret0 = array(0, _ats2jspre_stream_patsfun_1__closurerize($arg0, $arg1));
  return $tmpret0;
} // end-of-function


function
_ats2jspre_stream_patsfun_1($env0, $env1)
{
/*
  // $tmpret1
  // $tmp2
  // $tmp3
  // $tmp4
  // $tmp5
  // $tmp6
*/
  __patsflab__ats2jspre_stream_patsfun_1:
  ATSPMVlazyval_eval($env0); $tmp2 = $env0[1];
  // ATScaseofseq_beg
  do {
    // ATSbranchseq_beg
    __atstmplab0:
    if(ATSCKptriscons($tmp2)) goto __atstmplab3;
    __atstmplab1:
    $tmpret1 = null;
    break;
    // ATSbranchseq_end
    // ATSbranchseq_beg
    __atstmplab2:
    __atstmplab3:
    $tmp3 = $tmp2[0];
    $tmp4 = $tmp2[1];
    $tmp5 = $env1[0]($env1, $tmp3);
    $tmp6 = ats2phppre_stream_map_cloref($tmp4, $env1);
    $tmpret1 = array($tmp5, $tmp6);
    break;
    // ATSbranchseq_end
  } while(0);
  // ATScaseofseq_end
  return $tmpret1;
} // end-of-function


function
ats2phppre_stream_filter_cloref($arg0, $arg1)
{
/*
  // $tmpret7
*/
  __patsflab_stream_filter_cloref:
  $tmpret7 = array(0, _ats2jspre_stream_patsfun_3__closurerize($arg0, $arg1));
  return $tmpret7;
} // end-of-function


function
_ats2jspre_stream_patsfun_3($env0, $env1)
{
/*
  // $tmpret8
  // $tmp9
  // $tmp10
  // $tmp11
  // $tmp12
  // $tmp13
  // $tmp14
*/
  __patsflab__ats2jspre_stream_patsfun_3:
  ATSPMVlazyval_eval($env0); $tmp9 = $env0[1];
  // ATScaseofseq_beg
  do {
    // ATSbranchseq_beg
    __atstmplab4:
    if(ATSCKptriscons($tmp9)) goto __atstmplab7;
    __atstmplab5:
    $tmpret8 = null;
    break;
    // ATSbranchseq_end
    // ATSbranchseq_beg
    __atstmplab6:
    __atstmplab7:
    $tmp10 = $tmp9[0];
    $tmp11 = $tmp9[1];
    $tmp12 = $env1[0]($env1, $tmp10);
    if($tmp12) {
      $tmp13 = ats2phppre_stream_filter_cloref($tmp11, $env1);
      $tmpret8 = array($tmp10, $tmp13);
    } else {
      $tmp14 = ats2phppre_stream_filter_cloref($tmp11, $env1);
      ATSPMVlazyval_eval($tmp14); $tmpret8 = $tmp14[1];
    } // endif
    break;
    // ATSbranchseq_end
  } while(0);
  // ATScaseofseq_end
  return $tmpret8;
} // end-of-function


function
ats2phppre_stream_tabulate_cloref($arg0)
{
/*
  // $tmpret15
*/
  __patsflab_stream_tabulate_cloref:
  $tmpret15 = _ats2jspre_stream_aux_5($arg0, 0);
  return $tmpret15;
} // end-of-function


function
_ats2jspre_stream_aux_5($env0, $arg0)
{
/*
  // $tmpret16
*/
  __patsflab__ats2jspre_stream_aux_5:
  $tmpret16 = array(0, _ats2jspre_stream_patsfun_6__closurerize($env0, $arg0));
  return $tmpret16;
} // end-of-function


function
_ats2jspre_stream_patsfun_6($env0, $env1)
{
/*
  // $tmpret17
  // $tmp18
  // $tmp19
  // $tmp20
*/
  __patsflab__ats2jspre_stream_patsfun_6:
  $tmp18 = $env0[0]($env0, $env1);
  $tmp20 = ats2phppre_add_int1_int1($env1, 1);
  $tmp19 = _ats2jspre_stream_aux_5($env0, $tmp20);
  $tmpret17 = array($tmp18, $tmp19);
  return $tmpret17;
} // end-of-function

/* ****** ****** */

/* end-of-compilation-unit */
?>
<?php
/*
**
** The PHP code is generated by atscc2php
** The starting compilation time is: 2015-7-14:  0h:43m
**
*/
function
_ats2phppre_intrange_patsfun_7__closurerize($env0)
{
  return array(function($cenv, $arg0) { return _ats2phppre_intrange_patsfun_7($cenv[1], $arg0); }, $env0);
}

function
_ats2phppre_intrange_patsfun_9__closurerize($env0)
{
  return array(function($cenv, $arg0) { return _ats2phppre_intrange_patsfun_9($cenv[1], $arg0); }, $env0);
}

function
_ats2phppre_intrange_patsfun_11__closurerize($env0)
{
  return array(function($cenv, $arg0) { return _ats2phppre_intrange_patsfun_11($cenv[1], $arg0); }, $env0);
}

function
_ats2phppre_intrange_patsfun_14__closurerize($env0)
{
  return array(function($cenv, $arg0, $arg1) { return _ats2phppre_intrange_patsfun_14($cenv[1], $arg0, $arg1); }, $env0);
}

function
_ats2phppre_intrange_patsfun_18__closurerize($env0)
{
  return array(function($cenv, $arg0) { return _ats2phppre_intrange_patsfun_18($cenv[1], $arg0); }, $env0);
}

function
_ats2phppre_intrange_patsfun_31__closurerize($env0, $env1)
{
  return array(function($cenv, $arg0, $arg1) { return _ats2phppre_intrange_patsfun_31($cenv[1], $cenv[2], $arg0, $arg1); }, $env0, $env1);
}


function
ats2phppre_int_repeat_lazy($arg0, $arg1)
{
/*
  // $tmp1
*/
  __patsflab_int_repeat_lazy:
  $tmp1 = ats2phppre_lazy2cloref($arg1);
  ats2phppre_int_repeat_cloref($arg0, $tmp1);
  return/*_void*/;
} // end-of-function


function
ats2phppre_int_repeat_cloref($arg0, $arg1)
{
/*
*/
  __patsflab_int_repeat_cloref:
  _ats2phppre_intrange_loop_2($arg0, $arg1);
  return/*_void*/;
} // end-of-function


function
_ats2phppre_intrange_loop_2($arg0, $arg1)
{
/*
  // $apy0
  // $apy1
  // $tmp4
  // $tmp6
*/
  __patsflab__ats2phppre_intrange_loop_2:
  $tmp4 = ats2phppre_gt_int0_int0($arg0, 0);
  if($tmp4) {
    $arg1[0]($arg1);
    $tmp6 = ats2phppre_sub_int0_int0($arg0, 1);
    // ATStailcalseq_beg
    $apy0 = $tmp6;
    $apy1 = $arg1;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2phppre_intrange_loop_2;
    // ATStailcalseq_end
  } else {
    // ATSINSmove_void;
  } // endif
  return/*_void*/;
} // end-of-function


function
ats2phppre_int_exists_cloref($arg0, $arg1)
{
/*
  // $tmpret7
*/
  __patsflab_int_exists_cloref:
  $tmpret7 = ats2phppre_intrange_exists_cloref(0, $arg0, $arg1);
  return $tmpret7;
} // end-of-function


function
ats2phppre_int_forall_cloref($arg0, $arg1)
{
/*
  // $tmpret8
*/
  __patsflab_int_forall_cloref:
  $tmpret8 = ats2phppre_intrange_forall_cloref(0, $arg0, $arg1);
  return $tmpret8;
} // end-of-function


function
ats2phppre_int_foreach_cloref($arg0, $arg1)
{
/*
*/
  __patsflab_int_foreach_cloref:
  ats2phppre_intrange_foreach_cloref(0, $arg0, $arg1);
  return/*_void*/;
} // end-of-function


function
ats2phppre_int_exists_method($arg0)
{
/*
  // $tmpret10
*/
  __patsflab_int_exists_method:
  $tmpret10 = _ats2phppre_intrange_patsfun_7__closurerize($arg0);
  return $tmpret10;
} // end-of-function


function
_ats2phppre_intrange_patsfun_7($env0, $arg0)
{
/*
  // $tmpret11
*/
  __patsflab__ats2phppre_intrange_patsfun_7:
  $tmpret11 = ats2phppre_int_exists_cloref($env0, $arg0);
  return $tmpret11;
} // end-of-function


function
ats2phppre_int_forall_method($arg0)
{
/*
  // $tmpret12
*/
  __patsflab_int_forall_method:
  $tmpret12 = _ats2phppre_intrange_patsfun_9__closurerize($arg0);
  return $tmpret12;
} // end-of-function


function
_ats2phppre_intrange_patsfun_9($env0, $arg0)
{
/*
  // $tmpret13
*/
  __patsflab__ats2phppre_intrange_patsfun_9:
  $tmpret13 = ats2phppre_int_forall_cloref($env0, $arg0);
  return $tmpret13;
} // end-of-function


function
ats2phppre_int_foreach_method($arg0)
{
/*
  // $tmpret14
*/
  __patsflab_int_foreach_method:
  $tmpret14 = _ats2phppre_intrange_patsfun_11__closurerize($arg0);
  return $tmpret14;
} // end-of-function


function
_ats2phppre_intrange_patsfun_11($env0, $arg0)
{
/*
*/
  __patsflab__ats2phppre_intrange_patsfun_11:
  ats2phppre_int_foreach_cloref($env0, $arg0);
  return/*_void*/;
} // end-of-function


function
ats2phppre_int_foldleft_cloref($arg0, $arg1, $arg2)
{
/*
  // $tmpret16
*/
  __patsflab_int_foldleft_cloref:
  $tmpret16 = ats2phppre_intrange_foldleft_cloref(0, $arg0, $arg1, $arg2);
  return $tmpret16;
} // end-of-function


function
ats2phppre_int_foldleft_method($arg0, $arg1)
{
/*
  // $tmpret17
*/
  __patsflab_int_foldleft_method:
  $tmpret17 = _ats2phppre_intrange_patsfun_14__closurerize($arg0);
  return $tmpret17;
} // end-of-function


function
_ats2phppre_intrange_patsfun_14($env0, $arg0, $arg1)
{
/*
  // $tmpret18
*/
  __patsflab__ats2phppre_intrange_patsfun_14:
  $tmpret18 = ats2phppre_int_foldleft_cloref($env0, $arg0, $arg1);
  return $tmpret18;
} // end-of-function


function
_057_home_057_hwxi_057_research_057_Postiats_055_contrib_057_git_057_contrib_057_libatscc_057_libatscc2php_057_SATS_057_intrange_056_sats__int_list_map_cloref($arg0, $arg1)
{
/*
  // $tmpret19
*/
  __patsflab_int_list_map_cloref:
  $tmpret19 = _ats2phppre_intrange_aux_16($arg0, $arg1, 0);
  return $tmpret19;
} // end-of-function


function
_ats2phppre_intrange_aux_16($env0, $env1, $arg0)
{
/*
  // $tmpret20
  // $tmp21
  // $tmp22
  // $tmp23
  // $tmp24
*/
  __patsflab__ats2phppre_intrange_aux_16:
  $tmp21 = ats2phppre_lt_int1_int1($arg0, $env0);
  if($tmp21) {
    $tmp22 = $env1[0]($env1, $arg0);
    $tmp24 = ats2phppre_add_int1_int1($arg0, 1);
    $tmp23 = _ats2phppre_intrange_aux_16($env0, $env1, $tmp24);
    $tmpret20 = array($tmp22, $tmp23);
  } else {
    $tmpret20 = null;
  } // endif
  return $tmpret20;
} // end-of-function


function
_057_home_057_hwxi_057_research_057_Postiats_055_contrib_057_git_057_contrib_057_libatscc_057_libatscc2php_057_SATS_057_intrange_056_sats__int_list_map_method($arg0, $arg1)
{
/*
  // $tmpret25
*/
  __patsflab_int_list_map_method:
  $tmpret25 = _ats2phppre_intrange_patsfun_18__closurerize($arg0);
  return $tmpret25;
} // end-of-function


function
_ats2phppre_intrange_patsfun_18($env0, $arg0)
{
/*
  // $tmpret26
*/
  __patsflab__ats2phppre_intrange_patsfun_18:
  $tmpret26 = _057_home_057_hwxi_057_research_057_Postiats_055_contrib_057_git_057_contrib_057_libatscc_057_libatscc2php_057_SATS_057_intrange_056_sats__int_list_map_cloref($env0, $arg0);
  return $tmpret26;
} // end-of-function


function
ats2phppre_int2_exists_cloref($arg0, $arg1, $arg2)
{
/*
  // $tmpret27
*/
  __patsflab_int2_exists_cloref:
  $tmpret27 = ats2phppre_intrange2_exists_cloref(0, $arg0, 0, $arg1, $arg2);
  return $tmpret27;
} // end-of-function


function
ats2phppre_int2_forall_cloref($arg0, $arg1, $arg2)
{
/*
  // $tmpret28
*/
  __patsflab_int2_forall_cloref:
  $tmpret28 = ats2phppre_intrange2_forall_cloref(0, $arg0, 0, $arg1, $arg2);
  return $tmpret28;
} // end-of-function


function
ats2phppre_int2_foreach_cloref($arg0, $arg1, $arg2)
{
/*
*/
  __patsflab_int2_foreach_cloref:
  ats2phppre_intrange2_foreach_cloref(0, $arg0, 0, $arg1, $arg2);
  return/*_void*/;
} // end-of-function


function
ats2phppre_intrange_exists_cloref($arg0, $arg1, $arg2)
{
/*
  // $tmpret30
*/
  __patsflab_intrange_exists_cloref:
  $tmpret30 = _ats2phppre_intrange_loop_23($arg0, $arg1, $arg2);
  return $tmpret30;
} // end-of-function


function
_ats2phppre_intrange_loop_23($arg0, $arg1, $arg2)
{
/*
  // $apy0
  // $apy1
  // $apy2
  // $tmpret31
  // $tmp32
  // $tmp33
  // $tmp34
*/
  __patsflab__ats2phppre_intrange_loop_23:
  $tmp32 = ats2phppre_lt_int0_int0($arg0, $arg1);
  if($tmp32) {
    $tmp33 = $arg2[0]($arg2, $arg0);
    if($tmp33) {
      $tmpret31 = true;
    } else {
      $tmp34 = ats2phppre_add_int0_int0($arg0, 1);
      // ATStailcalseq_beg
      $apy0 = $tmp34;
      $apy1 = $arg1;
      $apy2 = $arg2;
      $arg0 = $apy0;
      $arg1 = $apy1;
      $arg2 = $apy2;
      goto __patsflab__ats2phppre_intrange_loop_23;
      // ATStailcalseq_end
    } // endif
  } else {
    $tmpret31 = false;
  } // endif
  return $tmpret31;
} // end-of-function


function
ats2phppre_intrange_forall_cloref($arg0, $arg1, $arg2)
{
/*
  // $tmpret35
*/
  __patsflab_intrange_forall_cloref:
  $tmpret35 = _ats2phppre_intrange_loop_25($arg0, $arg1, $arg2);
  return $tmpret35;
} // end-of-function


function
_ats2phppre_intrange_loop_25($arg0, $arg1, $arg2)
{
/*
  // $apy0
  // $apy1
  // $apy2
  // $tmpret36
  // $tmp37
  // $tmp38
  // $tmp39
*/
  __patsflab__ats2phppre_intrange_loop_25:
  $tmp37 = ats2phppre_lt_int0_int0($arg0, $arg1);
  if($tmp37) {
    $tmp38 = $arg2[0]($arg2, $arg0);
    if($tmp38) {
      $tmp39 = ats2phppre_add_int0_int0($arg0, 1);
      // ATStailcalseq_beg
      $apy0 = $tmp39;
      $apy1 = $arg1;
      $apy2 = $arg2;
      $arg0 = $apy0;
      $arg1 = $apy1;
      $arg2 = $apy2;
      goto __patsflab__ats2phppre_intrange_loop_25;
      // ATStailcalseq_end
    } else {
      $tmpret36 = false;
    } // endif
  } else {
    $tmpret36 = true;
  } // endif
  return $tmpret36;
} // end-of-function


function
ats2phppre_intrange_foreach_cloref($arg0, $arg1, $arg2)
{
/*
*/
  __patsflab_intrange_foreach_cloref:
  _ats2phppre_intrange_loop_27($arg0, $arg1, $arg2);
  return/*_void*/;
} // end-of-function


function
_ats2phppre_intrange_loop_27($arg0, $arg1, $arg2)
{
/*
  // $apy0
  // $apy1
  // $apy2
  // $tmp42
  // $tmp44
*/
  __patsflab__ats2phppre_intrange_loop_27:
  $tmp42 = ats2phppre_lt_int0_int0($arg0, $arg1);
  if($tmp42) {
    $arg2[0]($arg2, $arg0);
    $tmp44 = ats2phppre_add_int0_int0($arg0, 1);
    // ATStailcalseq_beg
    $apy0 = $tmp44;
    $apy1 = $arg1;
    $apy2 = $arg2;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    goto __patsflab__ats2phppre_intrange_loop_27;
    // ATStailcalseq_end
  } else {
    // ATSINSmove_void;
  } // endif
  return/*_void*/;
} // end-of-function


function
ats2phppre_intrange_foldleft_cloref($arg0, $arg1, $arg2, $arg3)
{
/*
  // $tmpret45
*/
  __patsflab_intrange_foldleft_cloref:
  $tmpret45 = _ats2phppre_intrange_loop_29($arg0, $arg1, $arg2, $arg3);
  return $tmpret45;
} // end-of-function


function
_ats2phppre_intrange_loop_29($arg0, $arg1, $arg2, $arg3)
{
/*
  // $apy0
  // $apy1
  // $apy2
  // $apy3
  // $tmpret46
  // $tmp47
  // $tmp48
  // $tmp49
*/
  __patsflab__ats2phppre_intrange_loop_29:
  $tmp47 = ats2phppre_lt_int0_int0($arg0, $arg1);
  if($tmp47) {
    $tmp48 = ats2phppre_add_int0_int0($arg0, 1);
    $tmp49 = $arg3[0]($arg3, $arg2, $arg0);
    // ATStailcalseq_beg
    $apy0 = $tmp48;
    $apy1 = $arg1;
    $apy2 = $tmp49;
    $apy3 = $arg3;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    goto __patsflab__ats2phppre_intrange_loop_29;
    // ATStailcalseq_end
  } else {
    $tmpret46 = $arg2;
  } // endif
  return $tmpret46;
} // end-of-function


function
ats2phppre_intrange_foldleft_method($arg0, $arg1)
{
/*
  // $tmp50
  // $tmp51
  // $tmpret52
*/
  __patsflab_intrange_foldleft_method:
  $tmp50 = $arg0[0];
  $tmp51 = $arg0[1];
  $tmpret52 = _ats2phppre_intrange_patsfun_31__closurerize($tmp50, $tmp51);
  return $tmpret52;
} // end-of-function


function
_ats2phppre_intrange_patsfun_31($env0, $env1, $arg0, $arg1)
{
/*
  // $tmpret53
*/
  __patsflab__ats2phppre_intrange_patsfun_31:
  $tmpret53 = ats2phppre_intrange_foldleft_cloref($env0, $env1, $arg0, $arg1);
  return $tmpret53;
} // end-of-function


function
ats2phppre_intrange2_exists_cloref($arg0, $arg1, $arg2, $arg3, $arg4)
{
/*
  // $tmpret54
*/
  __patsflab_intrange2_exists_cloref:
  $tmpret54 = _ats2phppre_intrange_loop1_33($arg2, $arg3, $arg0, $arg1, $arg4);
  return $tmpret54;
} // end-of-function


function
_ats2phppre_intrange_loop1_33($env0, $env1, $arg0, $arg1, $arg2)
{
/*
  // $apy0
  // $apy1
  // $apy2
  // $tmpret55
  // $tmp56
  // $a2rg0
  // $a2rg1
  // $a2rg2
  // $a2rg3
  // $a2rg4
  // $a2py0
  // $a2py1
  // $a2py2
  // $a2py3
  // $a2py4
  // $tmpret57
  // $tmp58
  // $tmp59
  // $tmp60
  // $tmp61
*/
  __patsflab__ats2phppre_intrange_loop1_33:
  $tmp56 = ats2phppre_lt_int0_int0($arg0, $arg1);
  if($tmp56) {
    // ATStailcalseq_beg
    $a2py0 = $arg0;
    $a2py1 = $arg1;
    $a2py2 = $env0;
    $a2py3 = $env1;
    $a2py4 = $arg2;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2phppre_intrange_loop2_34;
    // ATStailcalseq_end
  } else {
    $tmpret55 = false;
  } // endif
  return $tmpret55;
//
  __patsflab__ats2phppre_intrange_loop2_34:
  $tmp58 = ats2phppre_lt_int0_int0($a2rg2, $a2rg3);
  if($tmp58) {
    $tmp59 = $a2rg4[0]($a2rg4, $a2rg0, $a2rg2);
    if($tmp59) {
      $tmpret57 = true;
    } else {
      $tmp60 = ats2phppre_add_int0_int0($a2rg2, 1);
      // ATStailcalseq_beg
      $a2py0 = $a2rg0;
      $a2py1 = $a2rg1;
      $a2py2 = $tmp60;
      $a2py3 = $a2rg3;
      $a2py4 = $a2rg4;
      $a2rg0 = $a2py0;
      $a2rg1 = $a2py1;
      $a2rg2 = $a2py2;
      $a2rg3 = $a2py3;
      $a2rg4 = $a2py4;
      goto __patsflab__ats2phppre_intrange_loop2_34;
      // ATStailcalseq_end
    } // endif
  } else {
    $tmp61 = ats2phppre_add_int0_int0($a2rg0, 1);
    // ATStailcalseq_beg
    $apy0 = $tmp61;
    $apy1 = $a2rg1;
    $apy2 = $a2rg4;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    goto __patsflab__ats2phppre_intrange_loop1_33;
    // ATStailcalseq_end
  } // endif
  return $tmpret57;
} // end-of-function


function
ats2phppre_intrange2_forall_cloref($arg0, $arg1, $arg2, $arg3, $arg4)
{
/*
  // $tmpret62
*/
  __patsflab_intrange2_forall_cloref:
  $tmpret62 = _ats2phppre_intrange_loop1_36($arg2, $arg3, $arg0, $arg1, $arg4);
  return $tmpret62;
} // end-of-function


function
_ats2phppre_intrange_loop1_36($env0, $env1, $arg0, $arg1, $arg2)
{
/*
  // $apy0
  // $apy1
  // $apy2
  // $tmpret63
  // $tmp64
  // $a2rg0
  // $a2rg1
  // $a2rg2
  // $a2rg3
  // $a2rg4
  // $a2py0
  // $a2py1
  // $a2py2
  // $a2py3
  // $a2py4
  // $tmpret65
  // $tmp66
  // $tmp67
  // $tmp68
  // $tmp69
*/
  __patsflab__ats2phppre_intrange_loop1_36:
  $tmp64 = ats2phppre_lt_int0_int0($arg0, $arg1);
  if($tmp64) {
    // ATStailcalseq_beg
    $a2py0 = $arg0;
    $a2py1 = $arg1;
    $a2py2 = $env0;
    $a2py3 = $env1;
    $a2py4 = $arg2;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2phppre_intrange_loop2_37;
    // ATStailcalseq_end
  } else {
    $tmpret63 = true;
  } // endif
  return $tmpret63;
//
  __patsflab__ats2phppre_intrange_loop2_37:
  $tmp66 = ats2phppre_lt_int0_int0($a2rg2, $a2rg3);
  if($tmp66) {
    $tmp67 = $a2rg4[0]($a2rg4, $a2rg0, $a2rg2);
    if($tmp67) {
      $tmp68 = ats2phppre_add_int0_int0($a2rg2, 1);
      // ATStailcalseq_beg
      $a2py0 = $a2rg0;
      $a2py1 = $a2rg1;
      $a2py2 = $tmp68;
      $a2py3 = $a2rg3;
      $a2py4 = $a2rg4;
      $a2rg0 = $a2py0;
      $a2rg1 = $a2py1;
      $a2rg2 = $a2py2;
      $a2rg3 = $a2py3;
      $a2rg4 = $a2py4;
      goto __patsflab__ats2phppre_intrange_loop2_37;
      // ATStailcalseq_end
    } else {
      $tmpret65 = false;
    } // endif
  } else {
    $tmp69 = ats2phppre_add_int0_int0($a2rg0, 1);
    // ATStailcalseq_beg
    $apy0 = $tmp69;
    $apy1 = $a2rg1;
    $apy2 = $a2rg4;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    goto __patsflab__ats2phppre_intrange_loop1_36;
    // ATStailcalseq_end
  } // endif
  return $tmpret65;
} // end-of-function


function
ats2phppre_intrange2_foreach_cloref($arg0, $arg1, $arg2, $arg3, $arg4)
{
/*
*/
  __patsflab_intrange2_foreach_cloref:
  _ats2phppre_intrange_loop1_39($arg2, $arg3, $arg0, $arg1, $arg4);
  return/*_void*/;
} // end-of-function


function
_ats2phppre_intrange_loop1_39($env0, $env1, $arg0, $arg1, $arg2)
{
/*
  // $apy0
  // $apy1
  // $apy2
  // $tmp72
  // $a2rg0
  // $a2rg1
  // $a2rg2
  // $a2rg3
  // $a2rg4
  // $a2py0
  // $a2py1
  // $a2py2
  // $a2py3
  // $a2py4
  // $tmp74
  // $tmp76
  // $tmp77
*/
  __patsflab__ats2phppre_intrange_loop1_39:
  $tmp72 = ats2phppre_lt_int0_int0($arg0, $arg1);
  if($tmp72) {
    // ATStailcalseq_beg
    $a2py0 = $arg0;
    $a2py1 = $arg1;
    $a2py2 = $env0;
    $a2py3 = $env1;
    $a2py4 = $arg2;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2phppre_intrange_loop2_40;
    // ATStailcalseq_end
  } else {
    // ATSINSmove_void;
  } // endif
  return/*_void*/;
//
  __patsflab__ats2phppre_intrange_loop2_40:
  $tmp74 = ats2phppre_lt_int0_int0($a2rg2, $a2rg3);
  if($tmp74) {
    $a2rg4[0]($a2rg4, $a2rg0, $a2rg2);
    $tmp76 = ats2phppre_add_int0_int0($a2rg2, 1);
    // ATStailcalseq_beg
    $a2py0 = $a2rg0;
    $a2py1 = $a2rg1;
    $a2py2 = $tmp76;
    $a2py3 = $a2rg3;
    $a2py4 = $a2rg4;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2phppre_intrange_loop2_40;
    // ATStailcalseq_end
  } else {
    $tmp77 = ats2phppre_add_int0_int0($a2rg0, 1);
    // ATStailcalseq_beg
    $apy0 = $tmp77;
    $apy1 = $a2rg1;
    $apy2 = $a2rg4;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    goto __patsflab__ats2phppre_intrange_loop1_39;
    // ATStailcalseq_end
  } // endif
  return/*_void*/;
} // end-of-function

/* ****** ****** */

/* end-of-compilation-unit */
?>
<?php
/*
**
** The PHP code is generated by atscc2php
** The starting compilation time is: 2015-7-14:  0h:43m
**
*/

function
ats2phppre_arrayref_exists_cloref($arg0, $arg1, $arg2)
{
/*
  // $tmpret0
*/
  __patsflab_arrayref_exists_cloref:
  $tmpret0 = ats2phppre_int_exists_cloref($arg1, $arg2);
  return $tmpret0;
} // end-of-function


function
ats2phppre_arrayref_forall_cloref($arg0, $arg1, $arg2)
{
/*
  // $tmpret1
*/
  __patsflab_arrayref_forall_cloref:
  $tmpret1 = ats2phppre_int_forall_cloref($arg1, $arg2);
  return $tmpret1;
} // end-of-function


function
ats2phppre_arrayref_foreach_cloref($arg0, $arg1, $arg2)
{
/*
*/
  __patsflab_arrayref_foreach_cloref:
  ats2phppre_int_foreach_cloref($arg1, $arg2);
  return/*_void*/;
} // end-of-function


function
ats2phppre_arrszref_make_elt($arg0, $arg1)
{
/*
  // $tmpret3
  // $tmp4
*/
  __patsflab_arrszref_make_elt:
  $tmp4 = ats2phppre_arrayref_make_elt($arg0, $arg1);
  $tmpret3 = ats2phppre_arrszref_make_arrayref($tmp4, $arg0);
  return $tmpret3;
} // end-of-function


function
ats2phppre_arrszref_exists_cloref($arg0, $arg1)
{
/*
  // $tmpret5
  // $tmp6
*/
  __patsflab_arrszref_exists_cloref:
  $tmp6 = ats2phppre_arrszref_size($arg0);
  $tmpret5 = ats2phppre_int_exists_cloref($tmp6, $arg1);
  return $tmpret5;
} // end-of-function


function
ats2phppre_arrszref_forall_cloref($arg0, $arg1)
{
/*
  // $tmpret7
  // $tmp8
*/
  __patsflab_arrszref_forall_cloref:
  $tmp8 = ats2phppre_arrszref_size($arg0);
  $tmpret7 = ats2phppre_int_forall_cloref($tmp8, $arg1);
  return $tmpret7;
} // end-of-function


function
ats2phppre_arrszref_foreach_cloref($arg0, $arg1)
{
/*
  // $tmp10
*/
  __patsflab_arrszref_foreach_cloref:
  $tmp10 = ats2phppre_arrszref_size($arg0);
  ats2phppre_int_foreach_cloref($tmp10, $arg1);
  return/*_void*/;
} // end-of-function


function
ats2phppre_arrayref_make_elt($arg0, $arg1)
{
/*
  // $tmpret11
  // $tmp12
*/
  __patsflab_arrayref_make_elt:
  $tmp12 = PHParref_make_elt($arg0, $arg1);
  $tmpret11 = $tmp12;
  return $tmpret11;
} // end-of-function


function
ats2phppre_arrayref_get_at($arg0, $arg1)
{
/*
  // $tmpret13
*/
  __patsflab_arrayref_get_at:
  $tmpret13 = PHParref_get_at($arg0, $arg1);
  return $tmpret13;
} // end-of-function


function
ats2phppre_arrayref_set_at($arg0, $arg1, $arg2)
{
/*
*/
  __patsflab_arrayref_set_at:
  PHParref_set_at($arg0, $arg1, $arg2);
  return/*_void*/;
} // end-of-function


function
ats2phppre_arrszref_make_arrayref($arg0, $arg1)
{
/*
  // $tmpret15
*/
  __patsflab_arrszref_make_arrayref:
  $tmpret15 = $arg0;
  return $tmpret15;
} // end-of-function


function
ats2phppre_arrszref_size($arg0)
{
/*
  // $tmpret16
  // $tmp17
*/
  __patsflab_arrszref_size:
  $tmp17 = PHParref_length($arg0);
  $tmpret16 = $tmp17;
  return $tmpret16;
} // end-of-function


function
ats2phppre_arrszref_get_at($arg0, $arg1)
{
/*
  // $tmpret18
*/
  __patsflab_arrszref_get_at:
  $tmpret18 = PHParref_get_at($arg0, $arg1);
  return $tmpret18;
} // end-of-function


function
ats2phppre_arrszref_set_at($arg0, $arg1, $arg2)
{
/*
*/
  __patsflab_arrszref_set_at:
  PHParref_set_at($arg0, $arg1, $arg2);
  return/*_void*/;
} // end-of-function

/* ****** ****** */

/* end-of-compilation-unit */
?>
<?php
/*
**
** The PHP code is generated by atscc2php
** The starting compilation time is: 2015-7-14:  0h:43m
**
*/

function
ats2phppre_ref($arg0)
{
/*
  // $tmpret0
*/
  __patsflab_ref:
  $tmpret0 = ats2phppre_ref_make_elt($arg0);
  return $tmpret0;
} // end-of-function


function
ats2phppre_ref_make_elt($arg0)
{
/*
  // $tmpret1
  // $tmp2
*/
  __patsflab_ref_make_elt:
  $tmp2 = PHPref_new($arg0);
  $tmpret1 = $tmp2;
  return $tmpret1;
} // end-of-function


function
ats2phppre_ref_get_elt($arg0)
{
/*
  // $tmpret3
*/
  __patsflab_ref_get_elt:
  $tmpret3 = PHPref_get_elt($arg0);
  return $tmpret3;
} // end-of-function


function
ats2phppre_ref_set_elt($arg0, $arg1)
{
/*
*/
  __patsflab_ref_set_elt:
  PHPref_set_elt($arg0, $arg1);
  return/*_void*/;
} // end-of-function

/* ****** ****** */

/* end-of-compilation-unit */
?>
<?php
/*
** end of [libatscc2php_all.php]
*/
?>

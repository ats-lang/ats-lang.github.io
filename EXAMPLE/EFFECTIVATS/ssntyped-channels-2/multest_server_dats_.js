/*
Time of Generation:
Wed Dec 16 07:43:18 EST 2015
*/

/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [basics_cats.js]
******
*/

/* ****** ****** */

function
ATSCKiseqz(x) { return (x === 0); }
function
ATSCKisneqz(x) { return (x !== 0); }

/* ****** ****** */

function
ATSCKptrisnull(xs) { return (xs === null); }
function
ATSCKptriscons(xs) { return (xs !== null); }

/* ****** ****** */

function
ATSCKpat_int(tmp, given) { return (tmp === given); }
function
ATSCKpat_bool(tmp, given) { return (tmp === given); }
function
ATSCKpat_char(tmp, given) { return (tmp === given); }
function
ATSCKpat_float(tmp, given) { return (tmp === given); }
function
ATSCKpat_string(tmp, given) { return (tmp === given); }

/* ****** ****** */

function
ATSCKpat_con0 (con, tag) { return (con === tag); }
function
ATSCKpat_con1 (con, tag) { return (con[0] === tag); }

/* ****** ****** */
//
function
ATSINScaseof_fail(errmsg)
{
  throw new Error("ATSINScaseof_fail:"+errmsg);
  return;
}
//
function
ATSINSdeadcode_fail()
  { throw new Error("ATSINSdeadcode_fail"); return; }
//
/* ****** ****** */

function
ATSPMVempty() { return; }

/* ****** ****** */

/*
function
ATSPMVlazyval_make (thunk) { return [0, thunk]; }
*/

/* ****** ****** */

function
ATSPMVlazyval_eval(lazyval)
{
//
  var
  flag, thunk;
//
  flag = lazyval[0];
//
  if(flag===0)
  {
    lazyval[0] = 1;
    thunk = lazyval[1];
    lazyval[1] = thunk[0](thunk);
  } else {
    lazyval[0] = flag + 1;
  } // end of [if]
//
  return;
//
} // end of [ATSPMVlazyval_eval]

/* ****** ****** */

function
ats2jspre_alert(msg) { alert(msg); return; }

/* ****** ****** */

function
ats2jspre_confirm(msg) { return confirm(msg); }

/* ****** ****** */
//
function
ats2jspre_prompt_none
  (msg) { return prompt(msg); }
//
function
ats2jspre_prompt_some
  (msg, dflt) { return prompt(msg, dflt); }
//
/* ****** ****** */

function
ats2jspre_typeof(obj) { return typeof(obj); }

/* ****** ****** */

function
ats2jspre_toString(obj) { return obj.toString(); }

/* ****** ****** */

function
ats2jspre_console_log(obj) { return console.log(obj); }

/* ****** ****** */

function
ats2jspre_lazy2cloref(lazyval) { return lazyval[1]; }

/* ****** ****** */
//
function
ats2jspre_assert_bool0(tfv)
  { if (!tfv) throw new Error("Assert"); return; }
function
ats2jspre_assert_bool1(tfv)
  { if (!tfv) throw new Error("Assert"); return; }
//
/* ****** ****** */
//
function
ats2jspre_assert_errmsg_bool0
  (tfv, errmsg) { if (!tfv) throw new Error(errmsg); return; }
function
ats2jspre_assert_errmsg_bool1
  (tfv, errmsg) { if (!tfv) throw new Error(errmsg); return; }
//
/* ****** ****** */
//
/*
//
// HX-2015-10-25:
// Commenting out
// implementation in basics.dats
//
*/
function
ats2jspre_cloref0_app(cf) { return cf[0](cf); }
function
ats2jspre_cloref1_app(cf, x) { return cf[0](cf, x); }
function
ats2jspre_cloref2_app(cf, x1, x2) { return cf[0](cf, x1, x2); }
function
ats2jspre_cloref3_app(cf, x1, x2, x3) { return cf[0](cf, x1, x2, x3); }
//
/* ****** ****** */
//
function
ats2jspre_cloref2fun0(cf)
{
  return function(){return ats2jspre_cloref0_app(cf);};
}
function
ats2jspre_cloref2fun1(cf)
{
  return function(x){return ats2jspre_cloref1_app(cf,x);};
}
function
ats2jspre_cloref2fun2(cf)
{
  return function(x1,x2){return ats2jspre_cloref2_app(cf,x1,x2);};
}
function
ats2jspre_cloref2fun3(cf)
{
  return function(x1,x2,x3){return ats2jspre_cloref2_app(cf,x1,x2,x3);};
}
//
/* ****** ****** */

/* end of [basics_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [integer_cats.js]
******
*/

/* ****** ****** */
//
// HX: for signed integers
//
/* ****** ****** */

function
ats2jspre_neg_int0(x) { return ( -x ); }
function
ats2jspre_neg_int1(x) { return ( -x ); }

/* ****** ****** */

function
ats2jspre_abs_int0(x) { return Math.abs(x); }

/* ****** ****** */

function
ats2jspre_succ_int0(x) { return (x + 1); }
function
ats2jspre_pred_int0(x) { return (x - 1); }

/* ****** ****** */

function
ats2jspre_half_int0(x)
{
  return (x >= 0) ? Math.floor(x/2) : Math.ceil(x/2);
}

/* ****** ****** */

function
ats2jspre_succ_int1(x) { return (x + 1); }
function
ats2jspre_pred_int1(x) { return (x - 1); }

/* ****** ****** */

function
ats2jspre_half_int1(x) { return ats2jspre_half_int0(x); }

/* ****** ****** */

function
ats2jspre_add_int0_int0(x, y) { return (x + y); }
function
ats2jspre_sub_int0_int0(x, y) { return (x - y); }
function
ats2jspre_mul_int0_int0(x, y) { return (x * y); }
function
ats2jspre_div_int0_int0(x, y)
{ 
  var q = x / y; return (q >= 0 ? Math.floor(q) : Math.ceil(q));
}
function
ats2jspre_mod_int0_int0(x, y) { return (x % y); }

/* ****** ****** */

function
ats2jspre_add_int1_int1(x, y) { return (x + y); }
function
ats2jspre_sub_int1_int1(x, y) { return (x - y); }
function
ats2jspre_mul_int1_int1(x, y) { return (x * y); }
function
ats2jspre_div_int1_int1(x, y) { return ats2jspre_div_int0_int0(x, y); }

/* ****** ****** */

function
ats2jspre_pow_int0_int1(x, y)
{
  var res = 1;
  while(y >= 2)
  {
    if (y%2 > 0) res *= x;
    x = x * x; y = Math.floor(y/2);
  }
  return (y > 0) ? (x * res) : res;
}

/* ****** ****** */

function
ats2jspre_asl_int0_int1(x, y) { return (x << y); }
function
ats2jspre_asr_int0_int1(x, y) { return (x >> y); }

/* ****** ****** */

function
ats2jspre_lnot_int0(x) { return (~x); }
function
ats2jspre_lor_int0_int0(x, y) { return (x | y); }
function
ats2jspre_lxor_int0_int0(x, y) { return (x ^ y); }
function
ats2jspre_land_int0_int0(x, y) { return (x & y); }

/* ****** ****** */

function
ats2jspre_lt_int0_int0(x, y) { return (x < y); }
function
ats2jspre_lte_int0_int0(x, y) { return (x <= y); }
function
ats2jspre_gt_int0_int0(x, y) { return (x > y); }
function
ats2jspre_gte_int0_int0(x, y) { return (x >= y); }
function
ats2jspre_eq_int0_int0(x, y) { return (x === y); }
function
ats2jspre_neq_int0_int0(x, y) { return (x !== y); }

/* ****** ****** */

function
ats2jspre_compare_int0_int0(x, y)
{
  if (x < y) return -1; else if (x > y) return 1; else return 0;
}

/* ****** ****** */

function
ats2jspre_lt_int1_int1(x, y) { return (x < y); }
function
ats2jspre_lte_int1_int1(x, y) { return (x <= y); }
function
ats2jspre_gt_int1_int1(x, y) { return (x > y); }
function
ats2jspre_gte_int1_int1(x, y) { return (x >= y); }
function
ats2jspre_eq_int1_int1(x, y) { return (x === y); }
function
ats2jspre_neq_int1_int1(x, y) { return (x !== y); }

/* ****** ****** */
//
function
ats2jspre_max_int0_int0(x, y) { return (x >= y) ? x : y ; }
function
ats2jspre_min_int0_int0(x, y) { return (x <= y) ? x : y ; }
//
function
ats2jspre_max_int1_int1(x, y) { return (x >= y) ? x : y ; }
function
ats2jspre_min_int1_int1(x, y) { return (x <= y) ? x : y ; }
//
/* ****** ****** */
//
// HX: for unsigned integers
//
/* ****** ****** */

function
ats2jspre_succ_uint0(x) { return (x + 1); }
function
ats2jspre_pred_uint0(x) { return (x - 1); }

/* ****** ****** */

function
ats2jspre_add_uint0_uint0(x, y) { return (x + y); }
function
ats2jspre_sub_uint0_uint0(x, y) { return (x - y); }
function
ats2jspre_mul_uint0_uint0(x, y) { return (x * y); }
function
ats2jspre_div_uint0_uint0(x, y) { return Math.floor(x/y); }
function
ats2jspre_mod_uint0_uint0(x, y) { return (x % y); }

/* ****** ****** */

function
ats2jspre_lsl_uint0_int1(x, y) { return (x << y); }
function
ats2jspre_lsr_uint0_int1(x, y) { return (x >>> y); }

/* ****** ****** */

function
ats2jspre_lnot_uint0(x) { return (~x); }
function
ats2jspre_lor_uint0_uint0(x, y) { return (x | y); }
function
ats2jspre_lxor_uint0_uint0(x, y) { return (x ^ y); }
function
ats2jspre_land_uint0_uint0(x, y) { return (x & y); }

/* ****** ****** */

function
ats2jspre_lt_uint0_uint0(x, y) { return (x < y); }
function
ats2jspre_lte_uint0_uint0(x, y) { return (x <= y); }
function
ats2jspre_gt_uint0_uint0(x, y) { return (x > y); }
function
ats2jspre_gte_uint0_uint0(x, y) { return (x >= y); }
function
ats2jspre_eq_uint0_uint0(x, y) { return (x === y); }
function
ats2jspre_neq_uint0_uint0(x, y) { return (x !== y); }

/* ****** ****** */

function
ats2jspre_compare_uint0_uint0(x, y)
{
  if (x < y) return -1; else if (x > y) return 1; else return 0;
}

/* ****** ****** */

/* end of [integer_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [bool_cats.js]
******
*/

/* ****** ****** */
//
function
ats2jspre_neg_bool0(x)
  { return (x ? false : true ); }
function
ats2jspre_neg_bool1(x)
  { return (x ? false : true ); }
//
/* ****** ****** */

function
ats2jspre_add_bool0_bool0(x, y) { return (x || y); }
function
ats2jspre_add_bool0_bool1(x, y) { return (x || y); }
function
ats2jspre_add_bool1_bool0(x, y) { return (x || y); }
function
ats2jspre_add_bool1_bool1(x, y) { return (x || y); }

/* ****** ****** */

function
ats2jspre_mul_bool0_bool0(x, y) { return (x && y); }
function
ats2jspre_mul_bool0_bool1(x, y) { return (x && y); }
function
ats2jspre_mul_bool1_bool0(x, y) { return (x && y); }
function
ats2jspre_mul_bool1_bool1(x, y) { return (x && y); }

/* ****** ****** */
//
function
ats2jspre_eq_bool0_bool0(x, y) { return (x === y); }
function
ats2jspre_neq_bool0_bool0(x, y) { return (x !== y); }
//
function
ats2jspre_eq_bool1_bool1(x, y) { return (x === y); }
function
ats2jspre_neq_bool1_bool1(x, y) { return (x !== y); }
//
/* ****** ****** */
//
function
ats2jspre_int2bool0(x)
  { return (x !== 0 ? true : false) ; }
function
ats2jspre_int2bool1(x)
  { return (x !== 0 ? true : false) ; }
//
/* ****** ****** */
//
function
ats2jspre_bool2int0(x) { return (x ? 1 : 0); }
function
ats2jspre_bool2int1(x) { return (x ? 1 : 0); }
//
/* ****** ****** */

/* end of [bool_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [float_cats.js]
******
*/

/* ****** ****** */
//
function
ats2jspre_int2double(x) { return x; }
function
ats2jspre_double_of_int(x) { return x; }
//
function
ats2jspre_double2int(x)
{
  return (x >= 0 ? Math.floor(x) : Math.ceil(x));
}
function
ats2jspre_int_of_double(x)
{
  return (x >= 0 ? Math.floor(x) : Math.ceil(x));
}
//
/* ****** ****** */

function
ats2jspre_neg_double(x) { return ( -x ); }

/* ****** ****** */

function
ats2jspre_abs_double(x) { return Math.abs(x); }

/* ****** ****** */
//
function
ats2jspre_add_int_double(x, y) { return (x + y); }
function
ats2jspre_add_double_int(x, y) { return (x + y); }
//
function
ats2jspre_sub_int_double(x, y) { return (x - y); }
function
ats2jspre_sub_double_int(x, y) { return (x - y); }
//
function
ats2jspre_mul_int_double(x, y) { return (x * y); }
function
ats2jspre_mul_double_int(x, y) { return (x * y); }
//
function
ats2jspre_div_int_double(x, y) { return (x / y); }
function
ats2jspre_div_double_int(x, y) { return (x / y); }
//
/* ****** ****** */

function
ats2jspre_pow_double_int1(x, y)
{
  var res = 1;
  while(y >= 2)
  {
    if (y%2 > 0) res *= x;
    x = x * x; y = Math.floor(y/2);
  }
  return (y > 0) ? (x * res) : res;
}

/* ****** ****** */

function
ats2jspre_add_double_double(x, y) { return (x + y); }
function
ats2jspre_sub_double_double(x, y) { return (x - y); }
function
ats2jspre_mul_double_double(x, y) { return (x * y); }
function
ats2jspre_div_double_double(x, y) { return (x / y); }

/* ****** ****** */
//
function
ats2jspre_lt_int_double(x, y) { return (x < y); }
function
ats2jspre_lt_double_int(x, y) { return (x < y); }
//
function
ats2jspre_lte_int_double(x, y) { return (x <= y); }
function
ats2jspre_lte_double_int(x, y) { return (x <= y); }
//
function
ats2jspre_gt_int_double(x, y) { return (x > y); }
function
ats2jspre_gt_double_int(x, y) { return (x > y); }
//
function
ats2jspre_gte_int_double(x, y) { return (x >= y); }
function
ats2jspre_gte_double_int(x, y) { return (x >= y); }
//
/* ****** ****** */

function
ats2jspre_lt_double_double(x, y) { return (x < y); }
function
ats2jspre_lte_double_double(x, y) { return (x <= y); }
function
ats2jspre_gt_double_double(x, y) { return (x > y); }
function
ats2jspre_gte_double_double(x, y) { return (x >= y); }
function
ats2jspre_eq_double_double(x, y) { return (x === y); }
function
ats2jspre_neq_double_double(x, y) { return (x !== y); }

/* ****** ****** */

function
ats2jspre_compare_double_double(x, y)
{
  if (x < y) return -1; else if (x > y) return 1; else return 0;
}

/* ****** ****** */

/* end of [float_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [string_cats.js]
******
*/

/* ****** ****** */
//
function
ats2jspre_lt_string_string(x, y) { return (x < y); }
function
ats2jspre_lte_string_string(x, y) { return (x <= y); }
function
ats2jspre_gt_string_string(x, y) { return (x > y); }
function
ats2jspre_gte_string_string(x, y) { return (x >= y); }
//
function
ats2jspre_eq_string_string(x, y) { return (x === y); }
function
ats2jspre_neq_string_string(x, y) { return (x !== y); }
//
/* ****** ****** */

function
ats2jspre_compare_string_string(x, y)
{
  if (x < y) return -1; else if (x > y) return 1; else return 0;
}

/* ****** ****** */

function
ats2jspre_string_length(str) { return str.length ; }

/* ****** ****** */

function
ats2jspre_string_charAt(str, i) { return str.charAt(i) ; }
function
ats2jspre_string_charCodeAt(str, i) { return str.charCodeAt(i) ; }

/* ****** ****** */
//
function
ats2jspre_string_fromCharCode_1
  (c1) { return String.fromCharCode(c1) ; }
function
ats2jspre_string_fromCharCode_2
  (c1,c2) { return String.fromCharCode(c1,c2) ; }
function
ats2jspre_string_fromCharCode_3
  (c1,c2,c3) { return String.fromCharCode(c1,c2,c3) ; }
function
ats2jspre_string_fromCharCode_4
  (c1,c2,c3,c4) { return String.fromCharCode(c1,c2,c3,c4) ; }
function
ats2jspre_string_fromCharCode_5
  (c1,c2,c3,c4,c5) { return String.fromCharCode(c1,c2,c3,c4,c5) ; }
function
ats2jspre_string_fromCharCode_6
  (c1,c2,c3,c4,c5,c6) { return String.fromCharCode(c1,c2,c3,c4,c5,c6) ; }
//
/* ****** ****** */

function
ats2jspre_string_indexOf_2(str, key) { return str.indexOf(key) ; }
function
ats2jspre_string_indexOf_3(str, key, start) { return str.indexOf(key, start) ; }

/* ****** ****** */

function
ats2jspre_string_lastIndexOf_2(str, key) { return str.lastIndexOf(key) ; }
function
ats2jspre_string_lastIndexOf_3(str, key, start) { return str.lastIndexOf(key, start) ; }

/* ****** ****** */

function
ats2jspre_string_append(str1, str2) { return str1.concat(str2) ; }

/* ****** ****** */
//
function
ats2jspre_string_concat_2(str1, str2) { return str1.concat(str2) ; }
function
ats2jspre_string_concat_3(str1, str2, str3) { return str1.concat(str2, str3) ; }
//
/* ****** ****** */

/* end of [string_cats.js] */
/*
******
*
* HX-2015-12:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [gvalue_cats.js]
******
*/

/* ****** ****** */
//
function
ats2jspre_gvhashtbl_make_nil() { return {}; }
//
/* ****** ****** */
//
function
ats2jspre_gvhashtbl_get_atkey(tbl, k0)
{
  var res = tbl[k0];
  return (res !== undefined ? res : ats2jspre_gvalue_nil());
}
//
/* ****** ****** */
//
function
ats2jspre_gvhashtbl_set_atkey(tbl, k0, x0) { tbl[k0] = x0; return; }
//
/* ****** ****** */
//
function
ats2jspre_gvhashtbl_exch_atkey(tbl, k0, x0)
{
  var res = tbl[k0]; tbl[k0] = x0;
  return (res !== undefined ? res : ats2jspre_gvalue_nil());
}
//
/* ****** ****** */

/* end of [gvalue_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [JSmath_cats.js]
******
*/

/* ****** ****** */
//
var
ats2jspre_JSmath_E = Math.E
var
ats2jspre_JSmath_PI = Math.PI
var
ats2jspre_JSmath_SQRT2 = Math.SQRT2
var
ats2jspre_JSmath_SQRT1_2 = Math.SQRT1_2
var
ats2jspre_JSmath_LN2 = Math.LN2
var
ats2jspre_JSmath_LN10 = Math.LN10
var
ats2jspre_JSmath_LOG2E = Math.LOG2E
var
ats2jspre_JSmath_LOG10E = Math.LOG10E
//
/* ****** ****** */
//
function
ats2jspre_JSmath_abs(x) { return Math.abs(x); }
//
function
ats2jspre_JSmath_max(x, y) { return Math.max(x, y); }
//
function
ats2jspre_JSmath_min(x, y) { return Math.min(x, y); }
//
/* ****** ****** */
//
function
ats2jspre_JSmath_sqrt(x) { return Math.sqrt(x); }
//
/* ****** ****** */
//
function
ats2jspre_JSmath_exp(x) { return Math.exp(x); }
//
function
ats2jspre_JSmath_pow(x, y) { return Math.pow(x, y); }
//
function
ats2jspre_JSmath_log(x) { return Math.log(x); }
//
/* ****** ****** */
//
function
ats2jspre_JSmath_ceil(x) { return Math.ceil(x); }
function
ats2jspre_JSmath_floor(x) { return Math.floor(x); }
function
ats2jspre_JSmath_round(x) { return Math.round(x); }
//
/* ****** ****** */
//
function
ats2jspre_JSmath_sin(x) { return Math.sin(x); }
function
ats2jspre_JSmath_cos(x) { return Math.cos(x); }
function
ats2jspre_JSmath_tan(x) { return Math.tan(x); }
//
/* ****** ****** */
//
function
ats2jspre_JSmath_asin(x) { return Math.asin(x); }
function
ats2jspre_JSmath_acos(x) { return Math.acos(x); }
function
ats2jspre_JSmath_atan(x) { return Math.atan(x); }
function
ats2jspre_JSmath_atan2(y, x) { return Math.atan2(y, x); }
//
/* ****** ****** */
//
function
ats2jspre_JSmath_random() { return Math.random(); }
//
/* ****** ****** */

/* end of [JSmath_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [JSdate_cats.js]
******
*/

/* ****** ****** */
//
function
ats2jspre_Date_new_0
  () { return new Date(); }
function
ats2jspre_Date_new_1_int
  (msec) { return new Date(msec); }
function
ats2jspre_Date_new_1_string
  (date) { return new Date(date); }
function
ats2jspre_Date_new_7
  (year, mon, day, hour, min, sec, ms)
{
  return new Date(year, mon, day, hour, min, sec, ms);
}
//
/* ****** ****** */
//
function
ats2jspre_getTime
  (date) { return date.getTime(); }
function
ats2jspre_getTimezoneOffset
  (date) { return date.getTimezoneOffset(); }
//
/* ****** ****** */
//
function
ats2jspre_getDay(date) { return date.getDay(); }
function
ats2jspre_getDate(date) { return date.getDate(); }
function
ats2jspre_getMonth(date) { return date.getMonth(); }
function
ats2jspre_getFullYear(date) { return date.getFullYear(); }
//
function
ats2jspre_getHours(date) { return date.getHours(); }
function
ats2jspre_getMinutes(date) { return date.getMinutes(); }
function
ats2jspre_getSeconds(date) { return date.getSeconds(); }
function
ats2jspre_getMilliseconds(date) { return date.getMilliseconds(); }
//
/* ****** ****** */
//
function
ats2jspre_getUTCDay(date) { return date.getUTCDay(); }
function
ats2jspre_getUTCDate(date) { return date.getUTCDate(); }
function
ats2jspre_getUTCMonth(date) { return date.getUTCMonth(); }
function
ats2jspre_getUTCFullYear(date) { return date.getUTCFullYear(); }
//
function
ats2jspre_getUTCHours(date) { return date.getUTCHours(); }
function
ats2jspre_getUTCMinutes(date) { return date.getUTCMinutes(); }
function
ats2jspre_getUTCSeconds(date) { return date.getUTCSeconds(); }
function
ats2jspre_getUTCMilliseconds(date) { return date.getUTCMilliseconds(); }
//
/* ****** ****** */

/* end of [JSdate_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [JSarray_cats.js]
******
*/

/* ****** ****** */

function
ats2jspre_JSarray_nil() { return []; }
function
ats2jspre_JSarray_sing(x) { return [x]; }
function
ats2jspre_JSarray_pair(x1, x2) { return [x1, x2]; }

/* ****** ****** */

function
ats2jspre_JSarray_copy_arrayref(A, n)
{
//
  var A2 = new Array(n);
  for (var i = 0; i < n; i += 1) A2[i] = A[i]; return A2;
//
} // end of [ats2jspre_JSarray_copy_arrayref]

/* ****** ****** */
//
function
ats2jspre_JSarray_get_at
  (A, i) { return A[i]; }
function
ats2jspre_JSarray_set_at
  (A, i, x0) { A[i] = x0; return; }
//
function
ats2jspre_JSarray_exch_at
  (A, i, x0) { var x1 = A[i]; A[i] = x0; return x1; }
//
/* ****** ****** */
//
function
ats2jspre_JSarray_length(A) { return A.length; }
//
/* ****** ****** */

function
ats2jspre_JSarray_pop(A) { return A.pop(); }
function
ats2jspre_JSarray_push(A, x) { return A.push(x); }

/* ****** ****** */

function
ats2jspre_JSarray_shift(A) { return A.shift(); }
function
ats2jspre_JSarray_unshift(A, x) { return A.unshift(x); }

/* ****** ****** */

function
ats2jspre_JSarray_reverse(A) { return A.reverse(); }

/* ****** ****** */

function
ats2jspre_JSarray_copy(A) { return A.slice(0); }

/* ****** ****** */

function
ats2jspre_JSarray_concat(A1, A2) { return A1.concat(A2); }

/* ****** ****** */
//
function
ats2jspre_JSarray_insert_at
  (A, i, x) { A.splice(i, 0, x); return; }
//
function
ats2jspre_JSarray_takeout_at
  (A, i) { var res = A.splice(i, 1); return res[0]; }
//
function
ats2jspre_JSarray_remove_at(A, i) { A.splice(i, 1); return; }
//
/* ****** ****** */
//
function
ats2jspre_JSarray_join(A) { return A.join(""); }
function
ats2jspre_JSarray_join_sep(A, sep) { return A.join(sep); }
//
/* ****** ****** */

/* end of [JSarray_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [JSglobal_cats.js]
******
*/

/* ****** ****** */

function
ats2jspre_eval(code) { return eval(code); }

/* ****** ****** */

function
ats2jspre_Number(obj) { return Number(obj); }
function
ats2jspre_String(obj) { return String(obj); }

/* ****** ****** */

function
ats2jspre_isFinite_int(x) { return isFinite(x); }
function
ats2jspre_isFinite_double(x) { return isFinite(x); }

/* ****** ****** */

function
ats2jspre_isNaN_int(x) { return isNaN(x); }
function
ats2jspre_isNaN_double(x) { return isNaN(x); }

/* ****** ****** */

function
ats2jspre_parseInt_1(rep) { return parseInt(rep); }
function
ats2jspre_parseInt_2(rep, base) { return parseInt(rep, base); }

/* ****** ****** */

function
ats2jspre_parseFloat(rep) { return parseFloat(rep); }

/* ****** ****** */

function
ats2jspre_encodeURI(uri) { return encodeURI(uri); }
function
ats2jspre_decodeURI(uri) { return decodeURI(uri); }

/* ****** ****** */

function
ats2jspre_encodeURIComponent(uri) { return encodeURIComponent(uri); }
function
ats2jspre_decodeURIComponent(uri) { return decodeURIComponent(uri); }

/* ****** ****** */

/* end of [JSglobal_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [Ajax_cats.js]
******
*/

/* ****** ****** */

function
ats2js_Ajax_XMLHttpRequest_new
(
  // argumentless
)
{ 
  var res = new XMLHttpRequest(); return res;
}

/* ****** ****** */
//
function
ats2js_Ajax_XMLHttpRequest_open
  (xmlhttp, method, URL, async)
  { xmlhttp.open(method, URL, async); return; }
//
/* ****** ****** */
//
function
ats2js_Ajax_XMLHttpRequest_send_0
  (xmlhttp) { xmlhttp.send(); return; }
function
ats2js_Ajax_XMLHttpRequest_send_1
  (xmlhttp, msg) { xmlhttp.send(msg); return; }
//
/* ****** ****** */
//
function
ats2js_Ajax_XMLHttpRequest_setRequestHeader
  (xmlhttp, header, value)
  { xmlhttp.setRequestHeader(header, value); return; }
//
/* ****** ****** */
//
function
ats2js_Ajax_XMLHttpRequest_get_responseXML
  (xmlhttp) { return xmlhttp.responseXML; }
function
ats2js_Ajax_XMLHttpRequest_get_responseText
  (xmlhttp) { return xmlhttp.responseText; }
//
/* ****** ****** */
//
function
ats2js_Ajax_XMLHttpRequest_get_status
  (xmlhttp) { return xmlhttp.status; }
//
function
ats2js_Ajax_XMLHttpRequest_get_readyState
  (xmlhttp) { return xmlhttp.readyState; }
//
function
ats2js_Ajax_XMLHttpRequest_set_onreadystatechange
  (xmlhttp, f_action)
{
  xmlhttp.onreadystatechange = function() { f_action[0](f_action); };
}
//
/* ****** ****** */
//
// HX-2014-09: Convenience functions
//
/* ****** ****** */
//
function
ats2js_Ajax_XMLHttpRequest_is_ready_okay
  (xmlhttp) { return xmlhttp.readyState===4 && xmlhttp.status===200; }
//
/* ****** ****** */

/* end of [Ajax_cats.js] */
/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [canvas2d_cats.js]
******
*/

/* ****** ****** */

function
ats2js_HTML5_canvas_getById
  (id)
{
  var
  canvas =
  document.getElementById(id);
  if(!canvas)
  {
    throw "ats2js_HTML5_canvas_getById: canvas is not found";
  }
  return canvas;
}

/* ****** ****** */

function
ats2js_HTML5_canvas2d_getById
  (id)
{
  var
  canvas =
  document.getElementById(id);
  if(!canvas)
  {
    throw "ats2js_HTML5_canvas_getById: canvas is not found";
  }
  if(!canvas.getContext)
  {
    throw "ats2js_HTML5_canvas2d_getById: canvas-2d is not supported";
  }
  return canvas.getContext("2d");
}

/* ****** ****** */

function
ats2js_HTML5_canvas2d_beginPath
  (ctx) { ctx.beginPath(); return; }
function
ats2js_HTML5_canvas2d_closePath
  (ctx) { ctx.closePath(); return; }

/* ****** ****** */

function
ats2js_HTML5_canvas2d_moveTo
  (ctx, x, y) { ctx.moveTo(x, y); return; }
function
ats2js_HTML5_canvas2d_lineTo
  (ctx, x, y) { ctx.lineTo(x, y); return; }

/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_translate
  (ctx, x, y) { ctx.translate(x, y); return; }
//
function
ats2js_HTML5_canvas2d_scale
  (ctx, sx, sy) { ctx.scale(sx, sy); return; }
//
function
ats2js_HTML5_canvas2d_rotate
  (ctx, rangle) { ctx.rotate(rangle); return; }
//
/* ****** ****** */

function
ats2js_HTML5_canvas2d_rect
  (ctx, xul, yul, width, height)
{
  ctx.rect(xul, yul, width, height); return;
} /* end of [ats2js_HTML5_canvas2d_rect] */

function
ats2js_HTML5_canvas2d_arc
  (ctx, xc, yc, rad, angle_beg, angle_end, CCW)
{
  ctx.arc(xc, yc, rad, angle_beg, angle_end, CCW); return;
} /* end of [ats2js_HTML5_canvas2d_arc] */

/* ****** ****** */

function
ats2js_HTML5_canvas2d_clearRect
  (ctx, xul, yul, width, height)
{
  ctx.clearRect(xul, yul, width, height); return;
} /* end of [ats2js_HTML5_canvas2d_clearRect] */

/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_fill(ctx) { ctx.fill(); return; }
function
ats2js_HTML5_canvas2d_stroke(ctx) { ctx.stroke(); return; }
//
/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_fillRect
  (ctx, xul, yul, width, height)
{
  ctx.fillRect(xul, yul, width, height); return;
} /* end of [ats2js_HTML5_canvas2d_fillRect] */
//
function
ats2js_HTML5_canvas2d_strokeRect
  (ctx, xul, yul, width, height)
{
  ctx.strokeRect(xul, yul, width, height); return;
} /* end of [ats2js_HTML5_canvas2d_strokeRect] */
//
/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_fillText
  (ctx, text, xstart, ystart)
{
  ctx.fillText(text, xstart, ystart); return;
}
function
ats2js_HTML5_canvas2d_fillText2
  (ctx, text, xstart, ystart, maxWidth)
{ 
  ctx.fillText2(text, xstart, ystart, maxWidth); return;
}
//
/* ****** ****** */

function
ats2js_HTML5_canvas2d_save(ctx) { ctx.save(); return; }
function
ats2js_HTML5_canvas2d_restore(ctx) { ctx.restore(); return; }

/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_get_lineWidth
  (ctx) { return ctx.lineWidth; }
function
ats2js_HTML5_canvas2d_set_lineWidth_int
  (ctx, lineWidth) { ctx.lineWidth = lineWidth; return; }
function
ats2js_HTML5_canvas2d_set_lineWidth_double
  (ctx, lineWidth) { ctx.lineWidth = lineWidth; return; }
//
/* ****** ****** */

function
ats2js_HTML5_canvas2d_set_font_string
  (ctx, font) { ctx.font = font; return; }
function
ats2js_HTML5_canvas2d_set_textAlign_string
  (ctx, textAlign) { ctx.textAlign = textAlign; return; }
function
ats2js_HTML5_canvas2d_set_textBaseline_string
  (ctx, textBaseline) { ctx.textBaseline = textBaseline; return; }

/* ****** ****** */

function
ats2js_HTML5_canvas2d_set_fillStyle_string
  (ctx, fillStyle) { ctx.fillStyle = fillStyle; return; }
function
ats2js_HTML5_canvas2d_set_strokeStyle_string
  (ctx, strokeStyle) { ctx.strokeStyle = strokeStyle; return; }

/* ****** ****** */

function
ats2js_HTML5_canvas2d_set_shadowColor_string
  (ctx, shadowColor) { ctx.shadowColor = shadowColor; return; }

/* ****** ****** */

function
ats2js_HTML5_canvas2d_set_shadowBlur_int
  (ctx, shadowBlur) { ctx.shadowBlur = shadowBlur; return; }
function
ats2js_HTML5_canvas2d_set_shadowBlur_string
  (ctx, shadowBlur) { ctx.shadowBlur = shadowBlur; return; }

/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_set_shadowOffsetX_int
  (ctx, X) { ctx.shadowOffsetX = X; return; }
function
ats2js_HTML5_canvas2d_set_shadowOffsetX_double
  (ctx, X) { ctx.shadowOffsetX = X; return; }
//
function
ats2js_HTML5_canvas2d_set_shadowOffsetY_int
  (ctx, Y) { ctx.shadowOffsetY = Y; return; }
function
ats2js_HTML5_canvas2d_set_shadowOffsetY_double
  (ctx, Y) { ctx.shadowOffsetY = Y; return; }
//
/* ****** ****** */

function
ats2js_HTML5_canvas2d_createLinearGradient
  (ctx, x0, y0, x1, y1)
{
  return ctx.createLinearGradient(x0, y0, x1, y1);
}

/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_gradient_addColorStop
  (grad, stop, color) { grad.addColorStop(stop, color); return; }
//
/* ****** ****** */
//
function
ats2js_HTML5_canvas2d_set_fillStyle_gradient
  (ctx, gradient) { ctx.fillStyle = gradient; return; }
function
ats2js_HTML5_canvas2d_set_strokeStyle_gradient
  (ctx, gradient) { ctx.strokeStyle = gradient; return; }
//
/* ****** ****** */

/* end of [canvas2d_cats.js] */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2015-12-16:  7h:43m
**
*/

/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2015-12-16:  7h:43m
**
*/

function
ats2jspre_list_make_intrange_2(arg0, arg1)
{
//
// knd = 0
  var tmpret2
  var tmplab, tmplab_js
//
  // __patsflab_list_make_intrange_2
  tmpret2 = ats2jspre_list_make_intrange_3(arg0, arg1, 1);
  return tmpret2;
} // end-of-function


function
ats2jspre_list_make_intrange_3(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret3
  var tmp14
  var tmp15
  var tmp16
  var tmp17
  var tmp18
  var tmp19
  var tmp20
  var tmp21
  var tmp22
  var tmp23
  var tmp24
  var tmp25
  var tmp26
  var tmp27
  var tmp28
  var tmp29
  var tmp30
  var tmp31
  var tmp32
  var tmp33
  var tmp34
  var tmplab, tmplab_js
//
  // __patsflab_list_make_intrange_3
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab6
      tmp14 = ats2jspre_gt_int0_int0(arg2, 0);
      if(!ATSCKpat_bool(tmp14, true)) { tmplab_js = 2; break; }
      tmp15 = ats2jspre_lt_int0_int0(arg0, arg1);
      if(tmp15) {
        tmp19 = ats2jspre_sub_int0_int0(arg1, arg0);
        tmp18 = ats2jspre_add_int0_int0(tmp19, arg2);
        tmp17 = ats2jspre_sub_int0_int0(tmp18, 1);
        tmp16 = ats2jspre_div_int0_int0(tmp17, arg2);
        tmp22 = ats2jspre_sub_int0_int0(tmp16, 1);
        tmp21 = ats2jspre_mul_int0_int0(tmp22, arg2);
        tmp20 = ats2jspre_add_int0_int0(arg0, tmp21);
        tmp23 = null;
        tmpret3 = _ats2jspre_list_loop1_4(tmp16, tmp20, arg2, tmp23);
      } else {
        tmpret3 = null;
      } // endif
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 2: // __atstmplab7
      tmp24 = ats2jspre_lt_int0_int0(arg2, 0);
      if(!ATSCKpat_bool(tmp24, true)) { tmplab_js = 3; break; }
      tmp25 = ats2jspre_gt_int0_int0(arg0, arg1);
      if(tmp25) {
        tmp26 = ats2jspre_neg_int0(arg2);
        tmp30 = ats2jspre_sub_int0_int0(arg0, arg1);
        tmp29 = ats2jspre_add_int0_int0(tmp30, tmp26);
        tmp28 = ats2jspre_sub_int0_int0(tmp29, 1);
        tmp27 = ats2jspre_div_int0_int0(tmp28, tmp26);
        tmp33 = ats2jspre_sub_int0_int0(tmp27, 1);
        tmp32 = ats2jspre_mul_int0_int0(tmp33, tmp26);
        tmp31 = ats2jspre_sub_int0_int0(arg0, tmp32);
        tmp34 = null;
        tmpret3 = _ats2jspre_list_loop2_5(tmp27, tmp31, tmp26, tmp34);
      } else {
        tmpret3 = null;
      } // endif
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab8
      tmpret3 = null;
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret3;
} // end-of-function


function
_ats2jspre_list_loop1_4(arg0, arg1, arg2, arg3)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var apy3
  var tmpret4
  var tmp5
  var tmp6
  var tmp7
  var tmp8
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_loop1_4
    tmp5 = ats2jspre_gt_int0_int0(arg0, 0);
    if(tmp5) {
      tmp6 = ats2jspre_sub_int0_int0(arg0, 1);
      tmp7 = ats2jspre_sub_int0_int0(arg1, arg2);
      tmp8 = [arg1, arg3];
      // ATStailcalseq_beg
      apy0 = tmp6;
      apy1 = tmp7;
      apy2 = arg2;
      apy3 = tmp8;
      arg0 = apy0;
      arg1 = apy1;
      arg2 = apy2;
      arg3 = apy3;
      funlab_js = 1; // __patsflab__ats2jspre_list_loop1_4
      // ATStailcalseq_end
    } else {
      tmpret4 = arg3;
    } // endif
    if (funlab_js > 0) continue; else return tmpret4;
  } // endwhile-fun
} // end-of-function


function
_ats2jspre_list_loop2_5(arg0, arg1, arg2, arg3)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var apy3
  var tmpret9
  var tmp10
  var tmp11
  var tmp12
  var tmp13
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_loop2_5
    tmp10 = ats2jspre_gt_int0_int0(arg0, 0);
    if(tmp10) {
      tmp11 = ats2jspre_sub_int0_int0(arg0, 1);
      tmp12 = ats2jspre_add_int0_int0(arg1, arg2);
      tmp13 = [arg1, arg3];
      // ATStailcalseq_beg
      apy0 = tmp11;
      apy1 = tmp12;
      apy2 = arg2;
      apy3 = tmp13;
      arg0 = apy0;
      arg1 = apy1;
      arg2 = apy2;
      arg3 = apy3;
      funlab_js = 1; // __patsflab__ats2jspre_list_loop2_5
      // ATStailcalseq_end
    } else {
      tmpret9 = arg3;
    } // endif
    if (funlab_js > 0) continue; else return tmpret9;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_length(arg0)
{
//
// knd = 0
  var tmpret46
  var tmplab, tmplab_js
//
  // __patsflab_list_length
  tmpret46 = _ats2jspre_list_loop_12(arg0, 0);
  return tmpret46;
} // end-of-function


function
_ats2jspre_list_loop_12(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret47
  var tmp49
  var tmp50
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_loop_12
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab13
        if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab14
        tmpret47 = arg1;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab15
        case 4: // __atstmplab16
        tmp49 = arg0[1];
        tmp50 = ats2jspre_add_int1_int1(arg1, 1);
        // ATStailcalseq_beg
        apy0 = tmp49;
        apy1 = tmp50;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_list_loop_12
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret47;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_get_at(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret51
  var tmp52
  var tmp53
  var tmp54
  var tmp55
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_list_get_at
    tmp52 = ats2jspre_eq_int1_int1(arg1, 0);
    if(tmp52) {
      tmp53 = arg0[0];
      tmpret51 = tmp53;
    } else {
      tmp54 = arg0[1];
      tmp55 = ats2jspre_sub_int1_int1(arg1, 1);
      // ATStailcalseq_beg
      apy0 = tmp54;
      apy1 = tmp55;
      arg0 = apy0;
      arg1 = apy1;
      funlab_js = 1; // __patsflab_list_get_at
      // ATStailcalseq_end
    } // endif
    if (funlab_js > 0) continue; else return tmpret51;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_append(arg0, arg1)
{
//
// knd = 0
  var tmpret56
  var tmp57
  var tmp58
  var tmp59
  var tmplab, tmplab_js
//
  // __patsflab_list_append
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab17
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab18
      tmpret56 = arg1;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab19
      case 4: // __atstmplab20
      tmp57 = arg0[0];
      tmp58 = arg0[1];
      tmp59 = ats2jspre_list_append(tmp58, arg1);
      tmpret56 = [tmp57, tmp59];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret56;
} // end-of-function


function
ats2jspre_list_reverse(arg0)
{
//
// knd = 0
  var tmpret60
  var tmp61
  var tmplab, tmplab_js
//
  // __patsflab_list_reverse
  tmp61 = null;
  tmpret60 = ats2jspre_list_reverse_append(arg0, tmp61);
  return tmpret60;
} // end-of-function


function
ats2jspre_list_reverse_append(arg0, arg1)
{
//
// knd = 0
  var tmpret62
  var tmplab, tmplab_js
//
  // __patsflab_list_reverse_append
  tmpret62 = _ats2jspre_list_loop_17(arg0, arg1);
  return tmpret62;
} // end-of-function


function
_ats2jspre_list_loop_17(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret63
  var tmp64
  var tmp65
  var tmp66
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_list_loop_17
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab21
        if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab22
        tmpret63 = arg1;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab23
        case 4: // __atstmplab24
        tmp64 = arg0[0];
        tmp65 = arg0[1];
        tmp66 = [tmp64, arg1];
        // ATStailcalseq_beg
        apy0 = tmp65;
        apy1 = tmp66;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_list_loop_17
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret63;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_take(arg0, arg1)
{
//
// knd = 0
  var tmpret67
  var tmp68
  var tmp69
  var tmp70
  var tmp71
  var tmp72
  var tmplab, tmplab_js
//
  // __patsflab_list_take
  tmp68 = ats2jspre_gt_int1_int1(arg1, 0);
  if(tmp68) {
    tmp69 = arg0[0];
    tmp70 = arg0[1];
    tmp72 = ats2jspre_sub_int1_int1(arg1, 1);
    tmp71 = ats2jspre_list_take(tmp70, tmp72);
    tmpret67 = [tmp69, tmp71];
  } else {
    tmpret67 = null;
  } // endif
  return tmpret67;
} // end-of-function


function
ats2jspre_list_drop(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret73
  var tmp74
  var tmp75
  var tmp76
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_list_drop
    tmp74 = ats2jspre_gt_int1_int1(arg1, 0);
    if(tmp74) {
      tmp75 = arg0[1];
      tmp76 = ats2jspre_sub_int1_int1(arg1, 1);
      // ATStailcalseq_beg
      apy0 = tmp75;
      apy1 = tmp76;
      arg0 = apy0;
      arg1 = apy1;
      funlab_js = 1; // __patsflab_list_drop
      // ATStailcalseq_end
    } else {
      tmpret73 = arg0;
    } // endif
    if (funlab_js > 0) continue; else return tmpret73;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_split_at(arg0, arg1)
{
//
// knd = 0
  var tmpret77
  var tmp78
  var tmp79
  var tmplab, tmplab_js
//
  // __patsflab_list_split_at
  tmp78 = ats2jspre_list_take(arg0, arg1);
  tmp79 = ats2jspre_list_drop(arg0, arg1);
  tmpret77 = [tmp78, tmp79];
  return tmpret77;
} // end-of-function


function
ats2jspre_list_insert_at(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret80
  var tmp81
  var tmp82
  var tmp83
  var tmp84
  var tmp85
  var tmplab, tmplab_js
//
  // __patsflab_list_insert_at
  tmp81 = ats2jspre_gt_int1_int1(arg1, 0);
  if(tmp81) {
    tmp82 = arg0[0];
    tmp83 = arg0[1];
    tmp85 = ats2jspre_sub_int1_int1(arg1, 1);
    tmp84 = ats2jspre_list_insert_at(tmp83, tmp85, arg2);
    tmpret80 = [tmp82, tmp84];
  } else {
    tmpret80 = [arg2, arg0];
  } // endif
  return tmpret80;
} // end-of-function


function
ats2jspre_list_remove_at(arg0, arg1)
{
//
// knd = 0
  var tmpret86
  var tmp87
  var tmp88
  var tmp89
  var tmp90
  var tmp91
  var tmp92
  var tmp93
  var tmp94
  var tmplab, tmplab_js
//
  // __patsflab_list_remove_at
  tmp87 = arg0[0];
  tmp88 = arg0[1];
  tmp89 = ats2jspre_gt_int1_int1(arg1, 0);
  if(tmp89) {
    tmp91 = ats2jspre_sub_int1_int1(arg1, 1);
    tmp90 = ats2jspre_list_remove_at(tmp88, tmp91);
    tmp92 = tmp90[0];
    tmp93 = tmp90[1];
    tmp94 = [tmp87, tmp93];
    tmpret86 = [tmp92, tmp94];
  } else {
    tmpret86 = [tmp87, tmp88];
  } // endif
  return tmpret86;
} // end-of-function


function
ats2jspre_list_app(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_list_app
  ats2jspre_list_foreach(arg0, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_list_foreach(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmp97
  var tmp98
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_list_foreach
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab25
        if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
        case 2: // __atstmplab26
        // ATSINSmove_void
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab27
        case 4: // __atstmplab28
        tmp97 = arg0[0];
        tmp98 = arg0[1];
        arg1[0](arg1, tmp97);
        // ATStailcalseq_beg
        apy0 = tmp98;
        apy1 = arg1;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab_list_foreach
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_list_map(arg0, arg1)
{
//
// knd = 0
  var tmpret100
  var tmp101
  var tmp102
  var tmp103
  var tmp104
  var tmplab, tmplab_js
//
  // __patsflab_list_map
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab29
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab30
      tmpret100 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab31
      case 4: // __atstmplab32
      tmp101 = arg0[0];
      tmp102 = arg0[1];
      tmp103 = arg1[0](arg1, tmp101);
      tmp104 = ats2jspre_list_map(tmp102, arg1);
      tmpret100 = [tmp103, tmp104];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret100;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2015-12-16:  7h:43m
**
*/

function
ats2jspre_option_some(arg0)
{
//
// knd = 0
  var tmpret0
  var tmplab, tmplab_js
//
  // __patsflab_option_some
  tmpret0 = [arg0];
  return tmpret0;
} // end-of-function


function
ats2jspre_option_none()
{
//
// knd = 0
  var tmpret1
  var tmplab, tmplab_js
//
  // __patsflab_option_none
  tmpret1 = null;
  return tmpret1;
} // end-of-function


function
ats2jspre_option_is_some(arg0)
{
//
// knd = 0
  var tmpret2
  var tmplab, tmplab_js
//
  // __patsflab_option_is_some
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab0
      if(ATSCKptrisnull(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab1
      tmpret2 = true;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab2
      case 4: // __atstmplab3
      tmpret2 = false;
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret2;
} // end-of-function


function
ats2jspre_option_is_none(arg0)
{
//
// knd = 0
  var tmpret3
  var tmplab, tmplab_js
//
  // __patsflab_option_is_none
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab4
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab5
      tmpret3 = true;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab6
      case 4: // __atstmplab7
      tmpret3 = false;
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret3;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2015-12-16:  7h:43m
**
*/

function
_ats2jspre_stream_patsfun_1__closurerize(env0, env1)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_1(cenv[1], cenv[2]); }, env0, env1];
}


function
_ats2jspre_stream_patsfun_3__closurerize(env0, env1)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_3(cenv[1], cenv[2]); }, env0, env1];
}


function
_ats2jspre_stream_patsfun_6__closurerize(env0, env1)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_6(cenv[1], cenv[2]); }, env0, env1];
}


function
_ats2jspre_stream_patsfun_8__closurerize(env0)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_8(cenv[1]); }, env0];
}


function
_ats2jspre_stream_patsfun_10__closurerize(env0)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_10(cenv[1]); }, env0];
}


function
_ats2jspre_stream_patsfun_12__closurerize(env0, env1)
{
  return [function(cenv) { return _ats2jspre_stream_patsfun_12(cenv[1], cenv[2]); }, env0, env1];
}


function
ats2jspre_stream_map_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret0
  var tmplab, tmplab_js
//
  // __patsflab_stream_map_cloref
  tmpret0 = [0, _ats2jspre_stream_patsfun_1__closurerize(arg0, arg1)]
  return tmpret0;
} // end-of-function


function
_ats2jspre_stream_patsfun_1(env0, env1)
{
//
// knd = 0
  var tmpret1
  var tmp2
  var tmp3
  var tmp4
  var tmp5
  var tmp6
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_1
  ATSPMVlazyval_eval(env0); tmp2 = env0[1];
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab0
      if(ATSCKptriscons(tmp2)) { tmplab_js = 4; break; }
      case 2: // __atstmplab1
      tmpret1 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab2
      case 4: // __atstmplab3
      tmp3 = tmp2[0];
      tmp4 = tmp2[1];
      tmp5 = env1[0](env1, tmp3);
      tmp6 = ats2jspre_stream_map_cloref(tmp4, env1);
      tmpret1 = [tmp5, tmp6];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret1;
} // end-of-function


function
ats2jspre_stream_filter_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret7
  var tmplab, tmplab_js
//
  // __patsflab_stream_filter_cloref
  tmpret7 = [0, _ats2jspre_stream_patsfun_3__closurerize(arg0, arg1)]
  return tmpret7;
} // end-of-function


function
_ats2jspre_stream_patsfun_3(env0, env1)
{
//
// knd = 0
  var tmpret8
  var tmp9
  var tmp10
  var tmp11
  var tmp12
  var tmp13
  var tmp14
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_3
  ATSPMVlazyval_eval(env0); tmp9 = env0[1];
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab4
      if(ATSCKptriscons(tmp9)) { tmplab_js = 4; break; }
      case 2: // __atstmplab5
      tmpret8 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab6
      case 4: // __atstmplab7
      tmp10 = tmp9[0];
      tmp11 = tmp9[1];
      tmp12 = env1[0](env1, tmp10);
      if(tmp12) {
        tmp13 = ats2jspre_stream_filter_cloref(tmp11, env1);
        tmpret8 = [tmp10, tmp13];
      } else {
        tmp14 = ats2jspre_stream_filter_cloref(tmp11, env1);
        ATSPMVlazyval_eval(tmp14); tmpret8 = tmp14[1];
      } // endif
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret8;
} // end-of-function


function
ats2jspre_stream_tabulate_cloref(arg0)
{
//
// knd = 0
  var tmpret15
  var tmplab, tmplab_js
//
  // __patsflab_stream_tabulate_cloref
  tmpret15 = _ats2jspre_stream_aux_5(arg0, 0);
  return tmpret15;
} // end-of-function


function
_ats2jspre_stream_aux_5(env0, arg0)
{
//
// knd = 0
  var tmpret16
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_aux_5
  tmpret16 = [0, _ats2jspre_stream_patsfun_6__closurerize(env0, arg0)]
  return tmpret16;
} // end-of-function


function
_ats2jspre_stream_patsfun_6(env0, env1)
{
//
// knd = 0
  var tmpret17
  var tmp18
  var tmp19
  var tmp20
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_6
  tmp18 = env0[0](env0, env1);
  tmp20 = ats2jspre_add_int1_int1(env1, 1);
  tmp19 = _ats2jspre_stream_aux_5(env0, tmp20);
  tmpret17 = [tmp18, tmp19];
  return tmpret17;
} // end-of-function


function
ats2jspre_stream2cloref_exn(arg0)
{
//
// knd = 0
  var tmpret21
  var tmp22
  var tmplab, tmplab_js
//
  // __patsflab_stream2cloref_exn
  tmp22 = ats2jspre_ref(arg0);
  tmpret21 = _ats2jspre_stream_patsfun_8__closurerize(tmp22);
  return tmpret21;
} // end-of-function


function
_ats2jspre_stream_patsfun_8(env0)
{
//
// knd = 0
  var tmpret23
  var tmp24
  var tmp25
  var tmp26
  var tmp27
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_8
  tmp24 = ats2jspre_ref_get_elt(env0);
  ATSPMVlazyval_eval(tmp24); tmp25 = tmp24[1];
  if(ATSCKptrisnull(tmp25)) ATSINScaseof_fail("/home/hwxi/Research/ATS-Postiats-contrib/contrib/libatscc/DATS/stream.dats: 1532(line=114, offs=5) -- 1556(line=114, offs=29)");
  tmp26 = tmp25[0];
  tmp27 = tmp25[1];
  ats2jspre_ref_set_elt(env0, tmp27);
  tmpret23 = tmp26;
  return tmpret23;
} // end-of-function


function
ats2jspre_stream2cloref_opt(arg0)
{
//
// knd = 0
  var tmpret29
  var tmp30
  var tmplab, tmplab_js
//
  // __patsflab_stream2cloref_opt
  tmp30 = ats2jspre_ref(arg0);
  tmpret29 = _ats2jspre_stream_patsfun_10__closurerize(tmp30);
  return tmpret29;
} // end-of-function


function
_ats2jspre_stream_patsfun_10(env0)
{
//
// knd = 0
  var tmpret31
  var tmp32
  var tmp33
  var tmp34
  var tmp35
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_10
  tmp32 = ats2jspre_ref_get_elt(env0);
  ATSPMVlazyval_eval(tmp32); tmp33 = tmp32[1];
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab8
      if(ATSCKptriscons(tmp33)) { tmplab_js = 4; break; }
      case 2: // __atstmplab9
      tmpret31 = null;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab10
      case 4: // __atstmplab11
      tmp34 = tmp33[0];
      tmp35 = tmp33[1];
      ats2jspre_ref_set_elt(env0, tmp35);
      tmpret31 = [tmp34];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret31;
} // end-of-function


function
ats2jspre_stream2cloref_last(arg0, arg1)
{
//
// knd = 0
  var tmpret37
  var tmp38
  var tmp39
  var tmplab, tmplab_js
//
  // __patsflab_stream2cloref_last
  tmp38 = ats2jspre_ref(arg0);
  tmp39 = ats2jspre_ref(arg1);
  tmpret37 = _ats2jspre_stream_patsfun_12__closurerize(tmp38, tmp39);
  return tmpret37;
} // end-of-function


function
_ats2jspre_stream_patsfun_12(env0, env1)
{
//
// knd = 0
  var tmpret40
  var tmp41
  var tmp42
  var tmp43
  var tmp44
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_stream_patsfun_12
  tmp41 = ats2jspre_ref_get_elt(env0);
  ATSPMVlazyval_eval(tmp41); tmp42 = tmp41[1];
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab12
      if(ATSCKptriscons(tmp42)) { tmplab_js = 4; break; }
      case 2: // __atstmplab13
      tmpret40 = ats2jspre_ref_get_elt(env1);
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab14
      case 4: // __atstmplab15
      tmp43 = tmp42[0];
      tmp44 = tmp42[1];
      ats2jspre_ref_set_elt(env0, tmp44);
      ats2jspre_ref_set_elt(env1, tmp43);
      tmpret40 = tmp43;
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret40;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2015-12-16:  7h:43m
**
*/

function
ats2jspre_gvalue_nil()
{
//
// knd = 0
  var tmpret0
  var tmplab, tmplab_js
//
  // __patsflab_gvalue_nil
  tmpret0 = 0;
  return tmpret0;
} // end-of-function


function
ats2jspre_gvalue_int(arg0)
{
//
// knd = 0
  var tmpret1
  var tmplab, tmplab_js
//
  // __patsflab_gvalue_int
  tmpret1 = [1, arg0];
  return tmpret1;
} // end-of-function


function
ats2jspre_gvalue_bool(arg0)
{
//
// knd = 0
  var tmpret2
  var tmplab, tmplab_js
//
  // __patsflab_gvalue_bool
  tmpret2 = [2, arg0];
  return tmpret2;
} // end-of-function


function
ats2jspre_gvalue_float(arg0)
{
//
// knd = 0
  var tmpret3
  var tmplab, tmplab_js
//
  // __patsflab_gvalue_float
  tmpret3 = [3, arg0];
  return tmpret3;
} // end-of-function


function
ats2jspre_gvalue_string(arg0)
{
//
// knd = 0
  var tmpret4
  var tmplab, tmplab_js
//
  // __patsflab_gvalue_string
  tmpret4 = [4, arg0];
  return tmpret4;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2015-12-16:  7h:43m
**
*/

function
_ats2jspre_intrange_patsfun_7__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_7(cenv[1], arg0); }, env0];
}


function
_ats2jspre_intrange_patsfun_9__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_9(cenv[1], arg0); }, env0];
}


function
_ats2jspre_intrange_patsfun_11__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_11(cenv[1], arg0); }, env0];
}


function
_ats2jspre_intrange_patsfun_14__closurerize(env0)
{
  return [function(cenv, arg0, arg1) { return _ats2jspre_intrange_patsfun_14(cenv[1], arg0, arg1); }, env0];
}


function
_ats2jspre_intrange_patsfun_18__closurerize(env0)
{
  return [function(cenv, arg0) { return _ats2jspre_intrange_patsfun_18(cenv[1], arg0); }, env0];
}


function
_ats2jspre_intrange_patsfun_31__closurerize(env0, env1)
{
  return [function(cenv, arg0, arg1) { return _ats2jspre_intrange_patsfun_31(cenv[1], cenv[2], arg0, arg1); }, env0, env1];
}


function
ats2jspre_int_repeat_lazy(arg0, arg1)
{
//
// knd = 0
  var tmp1
  var tmplab, tmplab_js
//
  // __patsflab_int_repeat_lazy
  tmp1 = ats2jspre_lazy2cloref(arg1);
  ats2jspre_int_repeat_cloref(arg0, tmp1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_int_repeat_cloref(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_int_repeat_cloref
  _ats2jspre_intrange_loop_2(arg0, arg1);
  return/*_void*/;
} // end-of-function


function
_ats2jspre_intrange_loop_2(arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmp4
  var tmp6
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_intrange_loop_2
    tmp4 = ats2jspre_gt_int0_int0(arg0, 0);
    if(tmp4) {
      arg1[0](arg1);
      tmp6 = ats2jspre_sub_int0_int0(arg0, 1);
      // ATStailcalseq_beg
      apy0 = tmp6;
      apy1 = arg1;
      arg0 = apy0;
      arg1 = apy1;
      funlab_js = 1; // __patsflab__ats2jspre_intrange_loop_2
      // ATStailcalseq_end
    } else {
      // ATSINSmove_void
    } // endif
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_int_exists_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret7
  var tmplab, tmplab_js
//
  // __patsflab_int_exists_cloref
  tmpret7 = ats2jspre_intrange_exists_cloref(0, arg0, arg1);
  return tmpret7;
} // end-of-function


function
ats2jspre_int_forall_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret8
  var tmplab, tmplab_js
//
  // __patsflab_int_forall_cloref
  tmpret8 = ats2jspre_intrange_forall_cloref(0, arg0, arg1);
  return tmpret8;
} // end-of-function


function
ats2jspre_int_foreach_cloref(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_int_foreach_cloref
  ats2jspre_intrange_foreach_cloref(0, arg0, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_int_exists_method(arg0)
{
//
// knd = 0
  var tmpret10
  var tmplab, tmplab_js
//
  // __patsflab_int_exists_method
  tmpret10 = _ats2jspre_intrange_patsfun_7__closurerize(arg0);
  return tmpret10;
} // end-of-function


function
_ats2jspre_intrange_patsfun_7(env0, arg0)
{
//
// knd = 0
  var tmpret11
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_7
  tmpret11 = ats2jspre_int_exists_cloref(env0, arg0);
  return tmpret11;
} // end-of-function


function
ats2jspre_int_forall_method(arg0)
{
//
// knd = 0
  var tmpret12
  var tmplab, tmplab_js
//
  // __patsflab_int_forall_method
  tmpret12 = _ats2jspre_intrange_patsfun_9__closurerize(arg0);
  return tmpret12;
} // end-of-function


function
_ats2jspre_intrange_patsfun_9(env0, arg0)
{
//
// knd = 0
  var tmpret13
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_9
  tmpret13 = ats2jspre_int_forall_cloref(env0, arg0);
  return tmpret13;
} // end-of-function


function
ats2jspre_int_foreach_method(arg0)
{
//
// knd = 0
  var tmpret14
  var tmplab, tmplab_js
//
  // __patsflab_int_foreach_method
  tmpret14 = _ats2jspre_intrange_patsfun_11__closurerize(arg0);
  return tmpret14;
} // end-of-function


function
_ats2jspre_intrange_patsfun_11(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_11
  ats2jspre_int_foreach_cloref(env0, arg0);
  return/*_void*/;
} // end-of-function


function
ats2jspre_int_foldleft_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret16
  var tmplab, tmplab_js
//
  // __patsflab_int_foldleft_cloref
  tmpret16 = ats2jspre_intrange_foldleft_cloref(0, arg0, arg1, arg2);
  return tmpret16;
} // end-of-function


function
ats2jspre_int_foldleft_method(arg0, arg1)
{
//
// knd = 0
  var tmpret17
  var tmplab, tmplab_js
//
  // __patsflab_int_foldleft_method
  tmpret17 = _ats2jspre_intrange_patsfun_14__closurerize(arg0);
  return tmpret17;
} // end-of-function


function
_ats2jspre_intrange_patsfun_14(env0, arg0, arg1)
{
//
// knd = 0
  var tmpret18
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_14
  tmpret18 = ats2jspre_int_foldleft_cloref(env0, arg0, arg1);
  return tmpret18;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_intrange_056_sats__int_list_map_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret19
  var tmplab, tmplab_js
//
  // __patsflab_int_list_map_cloref
  tmpret19 = _ats2jspre_intrange_aux_16(arg0, arg1, 0);
  return tmpret19;
} // end-of-function


function
_ats2jspre_intrange_aux_16(env0, env1, arg0)
{
//
// knd = 0
  var tmpret20
  var tmp21
  var tmp22
  var tmp23
  var tmp24
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_aux_16
  tmp21 = ats2jspre_lt_int1_int1(arg0, env0);
  if(tmp21) {
    tmp22 = env1[0](env1, arg0);
    tmp24 = ats2jspre_add_int1_int1(arg0, 1);
    tmp23 = _ats2jspre_intrange_aux_16(env0, env1, tmp24);
    tmpret20 = [tmp22, tmp23];
  } else {
    tmpret20 = null;
  } // endif
  return tmpret20;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_intrange_056_sats__int_list_map_method(arg0, arg1)
{
//
// knd = 0
  var tmpret25
  var tmplab, tmplab_js
//
  // __patsflab_int_list_map_method
  tmpret25 = _ats2jspre_intrange_patsfun_18__closurerize(arg0);
  return tmpret25;
} // end-of-function


function
_ats2jspre_intrange_patsfun_18(env0, arg0)
{
//
// knd = 0
  var tmpret26
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_18
  tmpret26 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_intrange_056_sats__int_list_map_cloref(env0, arg0);
  return tmpret26;
} // end-of-function


function
ats2jspre_int2_exists_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret27
  var tmplab, tmplab_js
//
  // __patsflab_int2_exists_cloref
  tmpret27 = ats2jspre_intrange2_exists_cloref(0, arg0, 0, arg1, arg2);
  return tmpret27;
} // end-of-function


function
ats2jspre_int2_forall_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret28
  var tmplab, tmplab_js
//
  // __patsflab_int2_forall_cloref
  tmpret28 = ats2jspre_intrange2_forall_cloref(0, arg0, 0, arg1, arg2);
  return tmpret28;
} // end-of-function


function
ats2jspre_int2_foreach_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_int2_foreach_cloref
  ats2jspre_intrange2_foreach_cloref(0, arg0, 0, arg1, arg2);
  return/*_void*/;
} // end-of-function


function
ats2jspre_intrange_exists_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret30
  var tmplab, tmplab_js
//
  // __patsflab_intrange_exists_cloref
  tmpret30 = _ats2jspre_intrange_loop_23(arg0, arg1, arg2);
  return tmpret30;
} // end-of-function


function
_ats2jspre_intrange_loop_23(arg0, arg1, arg2)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var tmpret31
  var tmp32
  var tmp33
  var tmp34
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_intrange_loop_23
    tmp32 = ats2jspre_lt_int0_int0(arg0, arg1);
    if(tmp32) {
      tmp33 = arg2[0](arg2, arg0);
      if(tmp33) {
        tmpret31 = true;
      } else {
        tmp34 = ats2jspre_add_int0_int0(arg0, 1);
        // ATStailcalseq_beg
        apy0 = tmp34;
        apy1 = arg1;
        apy2 = arg2;
        arg0 = apy0;
        arg1 = apy1;
        arg2 = apy2;
        funlab_js = 1; // __patsflab__ats2jspre_intrange_loop_23
        // ATStailcalseq_end
      } // endif
    } else {
      tmpret31 = false;
    } // endif
    if (funlab_js > 0) continue; else return tmpret31;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_intrange_forall_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret35
  var tmplab, tmplab_js
//
  // __patsflab_intrange_forall_cloref
  tmpret35 = _ats2jspre_intrange_loop_25(arg0, arg1, arg2);
  return tmpret35;
} // end-of-function


function
_ats2jspre_intrange_loop_25(arg0, arg1, arg2)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var tmpret36
  var tmp37
  var tmp38
  var tmp39
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_intrange_loop_25
    tmp37 = ats2jspre_lt_int0_int0(arg0, arg1);
    if(tmp37) {
      tmp38 = arg2[0](arg2, arg0);
      if(tmp38) {
        tmp39 = ats2jspre_add_int0_int0(arg0, 1);
        // ATStailcalseq_beg
        apy0 = tmp39;
        apy1 = arg1;
        apy2 = arg2;
        arg0 = apy0;
        arg1 = apy1;
        arg2 = apy2;
        funlab_js = 1; // __patsflab__ats2jspre_intrange_loop_25
        // ATStailcalseq_end
      } else {
        tmpret36 = false;
      } // endif
    } else {
      tmpret36 = true;
    } // endif
    if (funlab_js > 0) continue; else return tmpret36;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_intrange_foreach_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_intrange_foreach_cloref
  _ats2jspre_intrange_loop_27(arg0, arg1, arg2);
  return/*_void*/;
} // end-of-function


function
_ats2jspre_intrange_loop_27(arg0, arg1, arg2)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var tmp42
  var tmp44
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_intrange_loop_27
    tmp42 = ats2jspre_lt_int0_int0(arg0, arg1);
    if(tmp42) {
      arg2[0](arg2, arg0);
      tmp44 = ats2jspre_add_int0_int0(arg0, 1);
      // ATStailcalseq_beg
      apy0 = tmp44;
      apy1 = arg1;
      apy2 = arg2;
      arg0 = apy0;
      arg1 = apy1;
      arg2 = apy2;
      funlab_js = 1; // __patsflab__ats2jspre_intrange_loop_27
      // ATStailcalseq_end
    } else {
      // ATSINSmove_void
    } // endif
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_intrange_foldleft_cloref(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmpret45
  var tmplab, tmplab_js
//
  // __patsflab_intrange_foldleft_cloref
  tmpret45 = _ats2jspre_intrange_loop_29(arg0, arg1, arg2, arg3);
  return tmpret45;
} // end-of-function


function
_ats2jspre_intrange_loop_29(arg0, arg1, arg2, arg3)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var apy3
  var tmpret46
  var tmp47
  var tmp48
  var tmp49
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_intrange_loop_29
    tmp47 = ats2jspre_lt_int0_int0(arg0, arg1);
    if(tmp47) {
      tmp48 = ats2jspre_add_int0_int0(arg0, 1);
      tmp49 = arg3[0](arg3, arg2, arg0);
      // ATStailcalseq_beg
      apy0 = tmp48;
      apy1 = arg1;
      apy2 = tmp49;
      apy3 = arg3;
      arg0 = apy0;
      arg1 = apy1;
      arg2 = apy2;
      arg3 = apy3;
      funlab_js = 1; // __patsflab__ats2jspre_intrange_loop_29
      // ATStailcalseq_end
    } else {
      tmpret46 = arg2;
    } // endif
    if (funlab_js > 0) continue; else return tmpret46;
  } // endwhile-fun
} // end-of-function


function
ats2jspre_intrange_foldleft_method(arg0, arg1)
{
//
// knd = 0
  var tmp50
  var tmp51
  var tmpret52
  var tmplab, tmplab_js
//
  // __patsflab_intrange_foldleft_method
  tmp50 = arg0[0];
  tmp51 = arg0[1];
  tmpret52 = _ats2jspre_intrange_patsfun_31__closurerize(tmp50, tmp51);
  return tmpret52;
} // end-of-function


function
_ats2jspre_intrange_patsfun_31(env0, env1, arg0, arg1)
{
//
// knd = 0
  var tmpret53
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_intrange_patsfun_31
  tmpret53 = ats2jspre_intrange_foldleft_cloref(env0, env1, arg0, arg1);
  return tmpret53;
} // end-of-function


function
ats2jspre_intrange2_exists_cloref(arg0, arg1, arg2, arg3, arg4)
{
//
// knd = 0
  var tmpret54
  var tmplab, tmplab_js
//
  // __patsflab_intrange2_exists_cloref
  tmpret54 = _ats2jspre_intrange_loop1_33(arg2, arg3, arg0, arg1, arg4);
  return tmpret54;
} // end-of-function


function
_ats2jspre_intrange_loop1_33(env0, env1, arg0, arg1, arg2)
{
//
// knd = 2
  var apy0
  var apy1
  var apy2
  var tmpret55
  var tmp56
  var a2rg0
  var a2rg1
  var a2rg2
  var a2rg3
  var a2rg4
  var a2py0
  var a2py1
  var a2py2
  var a2py3
  var a2py4
  var tmpret57
  var tmp58
  var tmp59
  var tmp60
  var tmp61
  var funlab_js
  var tmplab, tmplab_js
//
  funlab_js = 1;
  while(true) {
    switch(funlab_js) {
      case 1: {
        funlab_js = 0;
        tmp56 = ats2jspre_lt_int0_int0(arg0, arg1);
        if(tmp56) {
          // ATStailcalseq_beg
          a2py0 = arg0;
          a2py1 = arg1;
          a2py2 = env0;
          a2py3 = env1;
          a2py4 = arg2;
          a2rg0 = a2py0;
          a2rg1 = a2py1;
          a2rg2 = a2py2;
          a2rg3 = a2py3;
          a2rg4 = a2py4;
          funlab_js = 2; // __patsflab__ats2jspre_intrange_loop2_34
          // ATStailcalseq_end
        } else {
          tmpret55 = false;
        } // endif
        if (funlab_js > 0) continue; else return tmpret55;
      } // end-of-case
      case 2: {
        funlab_js = 0;
        tmp58 = ats2jspre_lt_int0_int0(a2rg2, a2rg3);
        if(tmp58) {
          tmp59 = a2rg4[0](a2rg4, a2rg0, a2rg2);
          if(tmp59) {
            tmpret57 = true;
          } else {
            tmp60 = ats2jspre_add_int0_int0(a2rg2, 1);
            // ATStailcalseq_beg
            a2py0 = a2rg0;
            a2py1 = a2rg1;
            a2py2 = tmp60;
            a2py3 = a2rg3;
            a2py4 = a2rg4;
            a2rg0 = a2py0;
            a2rg1 = a2py1;
            a2rg2 = a2py2;
            a2rg3 = a2py3;
            a2rg4 = a2py4;
            funlab_js = 2; // __patsflab__ats2jspre_intrange_loop2_34
            // ATStailcalseq_end
          } // endif
        } else {
          tmp61 = ats2jspre_add_int0_int0(a2rg0, 1);
          // ATStailcalseq_beg
          apy0 = tmp61;
          apy1 = a2rg1;
          apy2 = a2rg4;
          arg0 = apy0;
          arg1 = apy1;
          arg2 = apy2;
          funlab_js = 1; // __patsflab__ats2jspre_intrange_loop1_33
          // ATStailcalseq_end
        } // endif
        if (funlab_js > 0) continue; else return tmpret57;
      } // end-of-case
    } // end-of-switch
  } // endwhile-fun
} // end-of-function


function
ats2jspre_intrange2_forall_cloref(arg0, arg1, arg2, arg3, arg4)
{
//
// knd = 0
  var tmpret62
  var tmplab, tmplab_js
//
  // __patsflab_intrange2_forall_cloref
  tmpret62 = _ats2jspre_intrange_loop1_36(arg2, arg3, arg0, arg1, arg4);
  return tmpret62;
} // end-of-function


function
_ats2jspre_intrange_loop1_36(env0, env1, arg0, arg1, arg2)
{
//
// knd = 2
  var apy0
  var apy1
  var apy2
  var tmpret63
  var tmp64
  var a2rg0
  var a2rg1
  var a2rg2
  var a2rg3
  var a2rg4
  var a2py0
  var a2py1
  var a2py2
  var a2py3
  var a2py4
  var tmpret65
  var tmp66
  var tmp67
  var tmp68
  var tmp69
  var funlab_js
  var tmplab, tmplab_js
//
  funlab_js = 1;
  while(true) {
    switch(funlab_js) {
      case 1: {
        funlab_js = 0;
        tmp64 = ats2jspre_lt_int0_int0(arg0, arg1);
        if(tmp64) {
          // ATStailcalseq_beg
          a2py0 = arg0;
          a2py1 = arg1;
          a2py2 = env0;
          a2py3 = env1;
          a2py4 = arg2;
          a2rg0 = a2py0;
          a2rg1 = a2py1;
          a2rg2 = a2py2;
          a2rg3 = a2py3;
          a2rg4 = a2py4;
          funlab_js = 2; // __patsflab__ats2jspre_intrange_loop2_37
          // ATStailcalseq_end
        } else {
          tmpret63 = true;
        } // endif
        if (funlab_js > 0) continue; else return tmpret63;
      } // end-of-case
      case 2: {
        funlab_js = 0;
        tmp66 = ats2jspre_lt_int0_int0(a2rg2, a2rg3);
        if(tmp66) {
          tmp67 = a2rg4[0](a2rg4, a2rg0, a2rg2);
          if(tmp67) {
            tmp68 = ats2jspre_add_int0_int0(a2rg2, 1);
            // ATStailcalseq_beg
            a2py0 = a2rg0;
            a2py1 = a2rg1;
            a2py2 = tmp68;
            a2py3 = a2rg3;
            a2py4 = a2rg4;
            a2rg0 = a2py0;
            a2rg1 = a2py1;
            a2rg2 = a2py2;
            a2rg3 = a2py3;
            a2rg4 = a2py4;
            funlab_js = 2; // __patsflab__ats2jspre_intrange_loop2_37
            // ATStailcalseq_end
          } else {
            tmpret65 = false;
          } // endif
        } else {
          tmp69 = ats2jspre_add_int0_int0(a2rg0, 1);
          // ATStailcalseq_beg
          apy0 = tmp69;
          apy1 = a2rg1;
          apy2 = a2rg4;
          arg0 = apy0;
          arg1 = apy1;
          arg2 = apy2;
          funlab_js = 1; // __patsflab__ats2jspre_intrange_loop1_36
          // ATStailcalseq_end
        } // endif
        if (funlab_js > 0) continue; else return tmpret65;
      } // end-of-case
    } // end-of-switch
  } // endwhile-fun
} // end-of-function


function
ats2jspre_intrange2_foreach_cloref(arg0, arg1, arg2, arg3, arg4)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_intrange2_foreach_cloref
  _ats2jspre_intrange_loop1_39(arg2, arg3, arg0, arg1, arg4);
  return/*_void*/;
} // end-of-function


function
_ats2jspre_intrange_loop1_39(env0, env1, arg0, arg1, arg2)
{
//
// knd = 2
  var apy0
  var apy1
  var apy2
  var tmp72
  var a2rg0
  var a2rg1
  var a2rg2
  var a2rg3
  var a2rg4
  var a2py0
  var a2py1
  var a2py2
  var a2py3
  var a2py4
  var tmp74
  var tmp76
  var tmp77
  var funlab_js
  var tmplab, tmplab_js
//
  funlab_js = 1;
  while(true) {
    switch(funlab_js) {
      case 1: {
        funlab_js = 0;
        tmp72 = ats2jspre_lt_int0_int0(arg0, arg1);
        if(tmp72) {
          // ATStailcalseq_beg
          a2py0 = arg0;
          a2py1 = arg1;
          a2py2 = env0;
          a2py3 = env1;
          a2py4 = arg2;
          a2rg0 = a2py0;
          a2rg1 = a2py1;
          a2rg2 = a2py2;
          a2rg3 = a2py3;
          a2rg4 = a2py4;
          funlab_js = 2; // __patsflab__ats2jspre_intrange_loop2_40
          // ATStailcalseq_end
        } else {
          // ATSINSmove_void
        } // endif
        if (funlab_js > 0) continue; else return/*_void*/;
      } // end-of-case
      case 2: {
        funlab_js = 0;
        tmp74 = ats2jspre_lt_int0_int0(a2rg2, a2rg3);
        if(tmp74) {
          a2rg4[0](a2rg4, a2rg0, a2rg2);
          tmp76 = ats2jspre_add_int0_int0(a2rg2, 1);
          // ATStailcalseq_beg
          a2py0 = a2rg0;
          a2py1 = a2rg1;
          a2py2 = tmp76;
          a2py3 = a2rg3;
          a2py4 = a2rg4;
          a2rg0 = a2py0;
          a2rg1 = a2py1;
          a2rg2 = a2py2;
          a2rg3 = a2py3;
          a2rg4 = a2py4;
          funlab_js = 2; // __patsflab__ats2jspre_intrange_loop2_40
          // ATStailcalseq_end
        } else {
          tmp77 = ats2jspre_add_int0_int0(a2rg0, 1);
          // ATStailcalseq_beg
          apy0 = tmp77;
          apy1 = a2rg1;
          apy2 = a2rg4;
          arg0 = apy0;
          arg1 = apy1;
          arg2 = apy2;
          funlab_js = 1; // __patsflab__ats2jspre_intrange_loop1_39
          // ATStailcalseq_end
        } // endif
        if (funlab_js > 0) continue; else return/*_void*/;
      } // end-of-case
    } // end-of-switch
  } // endwhile-fun
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2015-12-16:  7h:43m
**
*/

function
ats2jspre_ref(arg0)
{
//
// knd = 0
  var tmpret0
  var tmplab, tmplab_js
//
  // __patsflab_ref
  tmpret0 = ats2jspre_ref_make_elt(arg0);
  return tmpret0;
} // end-of-function


function
ats2jspre_ref_make_elt(arg0)
{
//
// knd = 0
  var tmpret1
  var tmp2
  var tmplab, tmplab_js
//
  // __patsflab_ref_make_elt
  tmp2 = ats2jspre_JSarray_sing(arg0);
  tmpret1 = tmp2;
  return tmpret1;
} // end-of-function


function
ats2jspre_ref_get_elt(arg0)
{
//
// knd = 0
  var tmpret3
  var tmplab, tmplab_js
//
  // __patsflab_ref_get_elt
  tmpret3 = ats2jspre_JSarray_get_at(arg0, 0);
  return tmpret3;
} // end-of-function


function
ats2jspre_ref_set_elt(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_ref_set_elt
  ats2jspre_JSarray_set_at(arg0, 0, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_ref_exch_elt(arg0, arg1)
{
//
// knd = 0
  var tmpret5
  var tmp6
  var tmplab, tmplab_js
//
  // __patsflab_ref_exch_elt
  tmp6 = ats2jspre_JSarray_get_at(arg0, 0);
  ats2jspre_JSarray_set_at(arg0, 0, arg1);
  tmpret5 = tmp6;
  return tmpret5;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2015-12-16:  7h:43m
**
*/

/* ATSextcode_beg() */
//
function
ats2jspre_arrayref_make_elt
  (n, x)
{
  var A, i;
  A = new Array(n);
  for (i = 0; i < n; i += 1) A[i] = x;
  return A;
}
//
/* ATSextcode_end() */

function
ats2jspre_arrayref_exists_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret0
  var tmplab, tmplab_js
//
  // __patsflab_arrayref_exists_cloref
  tmpret0 = ats2jspre_int_exists_cloref(arg1, arg2);
  return tmpret0;
} // end-of-function


function
ats2jspre_arrayref_forall_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret1
  var tmplab, tmplab_js
//
  // __patsflab_arrayref_forall_cloref
  tmpret1 = ats2jspre_int_forall_cloref(arg1, arg2);
  return tmpret1;
} // end-of-function


function
ats2jspre_arrayref_foreach_cloref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_arrayref_foreach_cloref
  ats2jspre_int_foreach_cloref(arg1, arg2);
  return/*_void*/;
} // end-of-function


function
ats2jspre_arrszref_make_elt(arg0, arg1)
{
//
// knd = 0
  var tmpret3
  var tmp4
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_make_elt
  tmp4 = ats2jspre_arrayref_make_elt(arg0, arg1);
  tmpret3 = ats2jspre_arrszref_make_arrayref(tmp4, arg0);
  return tmpret3;
} // end-of-function


function
ats2jspre_arrszref_exists_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret5
  var tmp6
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_exists_cloref
  tmp6 = ats2jspre_arrszref_size(arg0);
  tmpret5 = ats2jspre_int_exists_cloref(tmp6, arg1);
  return tmpret5;
} // end-of-function


function
ats2jspre_arrszref_forall_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret7
  var tmp8
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_forall_cloref
  tmp8 = ats2jspre_arrszref_size(arg0);
  tmpret7 = ats2jspre_int_forall_cloref(tmp8, arg1);
  return tmpret7;
} // end-of-function


function
ats2jspre_arrszref_foreach_cloref(arg0, arg1)
{
//
// knd = 0
  var tmp10
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_foreach_cloref
  tmp10 = ats2jspre_arrszref_size(arg0);
  ats2jspre_int_foreach_cloref(tmp10, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_arrayref_get_at(arg0, arg1)
{
//
// knd = 0
  var tmpret11
  var tmplab, tmplab_js
//
  // __patsflab_arrayref_get_at
  tmpret11 = ats2jspre_JSarray_get_at(arg0, arg1);
  return tmpret11;
} // end-of-function


function
ats2jspre_arrayref_set_at(arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_arrayref_set_at
  ats2jspre_JSarray_set_at(arg0, arg1, arg2);
  return/*_void*/;
} // end-of-function


function
ats2jspre_arrszref_make_arrayref(arg0, arg1)
{
//
// knd = 0
  var tmpret13
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_make_arrayref
  tmpret13 = arg0;
  return tmpret13;
} // end-of-function


function
ats2jspre_arrszref_size(arg0)
{
//
// knd = 0
  var tmpret14
  var tmp15
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_size
  tmp15 = ats2jspre_JSarray_length(arg0);
  tmpret14 = tmp15;
  return tmpret14;
} // end-of-function


function
ats2jspre_arrszref_get_at(arg0, arg1)
{
//
// knd = 0
  var tmpret16
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_get_at
  tmpret16 = ats2jspre_JSarray_get_at(arg0, arg1);
  return tmpret16;
} // end-of-function


function
ats2jspre_arrszref_set_at(arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_arrszref_set_at
  ats2jspre_JSarray_set_at(arg0, arg1, arg2);
  return/*_void*/;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2015-12-16:  7h:43m
**
*/

/* ATSextcode_beg() */
//
function
ats2jspre_matrixref_make_elt
  (m, n, x)
{
  var A, i, j;
  A = new Array(m*n);
  for (i = 0; i < m; i += 1)
  {
    for (j = 0; j < n; j += 1) A[i*n+j] = x;
  }
  return A;
}
//
/* ATSextcode_end() */

/* ATSextcode_beg() */
//
function
ats2jspre_mtrxszref_make_matrixref
  (M, m, n)
{
  return { matrix: M, nrow: m, ncol: n };
}
//
function
ats2jspre_mtrxszref_get_nrow(MSZ) { return MSZ.nrow; }
function
ats2jspre_mtrxszref_get_ncol(MSZ) { return MSZ.ncol; }
//
function
ats2jspre_mtrxszref_get_at
  (MSZ, i, j)
{
  var nrow = MSZ.nrow;
  var ncol = MSZ.ncol;
  if (i < 0) throw new RangeError("mtrxszref_get_at");
  if (i >= nrow) throw new RangeError("mtrxszref_get_at");
  if (j < 0) throw new RangeError("mtrxszref_get_at");
  if (j >= ncol) throw new RangeError("mtrxszref_get_at");
  return MSZ.matrix[i*ncol+j];
}
//
function
ats2jspre_mtrxszref_set_at
  (MSZ, i, j, x)
{
  var nrow = MSZ.nrow;
  var ncol = MSZ.ncol;
  if (i < 0) throw new RangeError("mtrxszref_set_at");
  if (i >= nrow) throw new RangeError("mtrxszref_set_at");
  if (j < 0) throw new RangeError("mtrxszref_set_at");
  if (j >= ncol) throw new RangeError("mtrxszref_set_at");
  return (MSZ.matrix[i*ncol+j] = x);
}
//
/* ATSextcode_end() */

function
ats2jspre_matrixref_exists_cloref(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmpret0
  var tmplab, tmplab_js
//
  // __patsflab_matrixref_exists_cloref
  tmpret0 = ats2jspre_int2_exists_cloref(arg1, arg2, arg3);
  return tmpret0;
} // end-of-function


function
ats2jspre_matrixref_forall_cloref(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmpret1
  var tmplab, tmplab_js
//
  // __patsflab_matrixref_forall_cloref
  tmpret1 = ats2jspre_int2_forall_cloref(arg1, arg2, arg3);
  return tmpret1;
} // end-of-function


function
ats2jspre_matrixref_foreach_cloref(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_matrixref_foreach_cloref
  ats2jspre_int2_foreach_cloref(arg1, arg2, arg3);
  return/*_void*/;
} // end-of-function


function
ats2jspre_mtrxszref_make_elt(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret3
  var tmp4
  var tmplab, tmplab_js
//
  // __patsflab_mtrxszref_make_elt
  tmp4 = ats2jspre_matrixref_make_elt(arg0, arg1, arg2);
  tmpret3 = ats2jspre_mtrxszref_make_matrixref(tmp4, arg0, arg1);
  return tmpret3;
} // end-of-function


function
ats2jspre_mtrxszref_exists_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret5
  var tmp6
  var tmp7
  var tmplab, tmplab_js
//
  // __patsflab_mtrxszref_exists_cloref
  tmp6 = ats2jspre_mtrxszref_get_nrow(arg0);
  tmp7 = ats2jspre_mtrxszref_get_ncol(arg0);
  tmpret5 = ats2jspre_int2_exists_cloref(tmp6, tmp7, arg1);
  return tmpret5;
} // end-of-function


function
ats2jspre_mtrxszref_forall_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret8
  var tmp9
  var tmp10
  var tmplab, tmplab_js
//
  // __patsflab_mtrxszref_forall_cloref
  tmp9 = ats2jspre_mtrxszref_get_nrow(arg0);
  tmp10 = ats2jspre_mtrxszref_get_ncol(arg0);
  tmpret8 = ats2jspre_int2_forall_cloref(tmp9, tmp10, arg1);
  return tmpret8;
} // end-of-function


function
ats2jspre_mtrxszref_foreach_cloref(arg0, arg1)
{
//
// knd = 0
  var tmp12
  var tmp13
  var tmplab, tmplab_js
//
  // __patsflab_mtrxszref_foreach_cloref
  tmp12 = ats2jspre_mtrxszref_get_nrow(arg0);
  tmp13 = ats2jspre_mtrxszref_get_ncol(arg0);
  ats2jspre_int2_foreach_cloref(tmp12, tmp13, arg1);
  return/*_void*/;
} // end-of-function


function
ats2jspre_matrixref_get_at(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmpret14
  var tmp15
  var tmp16
  var tmplab, tmplab_js
//
  // __patsflab_matrixref_get_at
  tmp16 = ats2jspre_mul_int1_int1(arg1, arg2);
  tmp15 = ats2jspre_add_int1_int1(tmp16, arg3);
  tmpret14 = ats2jspre_JSarray_get_at(arg0, tmp15);
  return tmpret14;
} // end-of-function


function
ats2jspre_matrixref_set_at(arg0, arg1, arg2, arg3, arg4)
{
//
// knd = 0
  var tmp18
  var tmp19
  var tmplab, tmplab_js
//
  // __patsflab_matrixref_set_at
  tmp19 = ats2jspre_mul_int1_int1(arg1, arg2);
  tmp18 = ats2jspre_add_int1_int1(tmp19, arg3);
  ats2jspre_JSarray_set_at(arg0, tmp18, arg4);
  return/*_void*/;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2015-12-16:  7h:43m
**
*/

// ATSassume(_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_gmatrixref_056_sats__gmatrixref)

function
ats2jspre_gmatrixref_make_matrixref(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret0
  var tmplab, tmplab_js
//
  // __patsflab_gmatrixref_make_matrixref
  tmpret0 = [arg0, arg1, arg2, 0, 0, arg1, arg2];
  return tmpret0;
} // end-of-function


function
ats2jspre_gmatrixref_make_subregion(arg0, arg1, arg2, arg3, arg4)
{
//
// knd = 0
  var tmpret1
  var tmp2
  var tmp3
  var tmplab, tmplab_js
//
  // __patsflab_gmatrixref_make_subregion
  tmp2 = ats2jspre_add_int1_int1(arg0[3], arg1);
  tmp3 = ats2jspre_add_int1_int1(arg0[4], arg2);
  tmpret1 = [arg0[0], arg0[1], arg0[2], tmp2, tmp3, arg3, arg4];
  return tmpret1;
} // end-of-function


function
ats2jspre_gmatrixref_get_at(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret4
  var tmp5
  var tmp6
  var tmplab, tmplab_js
//
  // __patsflab_gmatrixref_get_at
  tmp5 = ats2jspre_add_int1_int1(arg0[3], arg1);
  tmp6 = ats2jspre_add_int1_int1(arg0[4], arg2);
  tmpret4 = ats2jspre_matrixref_get_at(arg0[0], tmp5, arg0[2], tmp6);
  return tmpret4;
} // end-of-function


function
ats2jspre_gmatrixref_set_at(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmp8
  var tmp9
  var tmplab, tmplab_js
//
  // __patsflab_gmatrixref_set_at
  tmp8 = ats2jspre_add_int1_int1(arg0[3], arg1);
  tmp9 = ats2jspre_add_int1_int1(arg0[4], arg2);
  ats2jspre_matrixref_set_at(arg0[0], tmp8, arg0[2], tmp9, arg3);
  return/*_void*/;
} // end-of-function


function
ats2jspre_gmatrixref_exists_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret10
  var tmplab, tmplab_js
//
  // __patsflab_gmatrixref_exists_cloref
  tmpret10 = ats2jspre_int2_exists_cloref(arg0[3], arg0[4], arg1);
  return tmpret10;
} // end-of-function


function
ats2jspre_gmatrixref_forall_cloref(arg0, arg1)
{
//
// knd = 0
  var tmpret11
  var tmplab, tmplab_js
//
  // __patsflab_gmatrixref_forall_cloref
  tmpret11 = ats2jspre_int2_forall_cloref(arg0[3], arg0[4], arg1);
  return tmpret11;
} // end-of-function


function
ats2jspre_gmatrixref_foreach_cloref(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_gmatrixref_foreach_cloref
  ats2jspre_int2_foreach_cloref(arg0[3], arg0[4], arg1);
  return/*_void*/;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */

/* ****** ****** */

/* end of [libatscc2js_all.js] */
/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-1-18: 15h:51m
**
*/

/* ATSextcode_beg() */
//
var
theWorker_cont;
//
self.onmessage =
function(event)
{
  var k0 = theWorker_cont;
  return ats2jspre_cloref2_app(k0, 0, event.data);
}
//
function
ats2js_worker_chanpos0_recv
  (chp, k0)
{
  theWorker_cont = k0; return;
}
function
ats2js_worker_chanpos0_send
  (chp, x0, k0)
{
  postMessage(x0); return ats2jspre_cloref1_app(k0, 0);
}
//
function
ats2js_worker_chanpos1_recv
  (chp, k0)
{
  return ats2js_worker_chanpos0_recv(chp, k0);
}
function
ats2js_worker_chanpos1_send
  (chp, x0, k0)
{
  return ats2js_worker_chanpos0_send(chp, x0, k0);
}
//
/* ATSextcode_end() */

/* ATSextcode_beg() */
//
function
ats2js_worker_chanpos0_close(chp) { return self.close(); }
function
ats2js_worker_chanpos1_close(chp) { return self.close(); }
//
/* ATSextcode_end() */

// ATSassume(_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_type)

var statmp324

function
__patsfun_40__closurerize()
{
  return [function(cenv, arg0, arg1) { return __patsfun_40(arg0, arg1); }];
}


function
__patsfun_32__32__1__closurerize(env0)
{
  return [function(cenv, arg0, arg1) { return __patsfun_32__32__1(cenv[1], arg0, arg1); }, env0];
}


function
__patsfun_33__33__1__closurerize(env0, env1)
{
  return [function(cenv, arg0, arg1) { return __patsfun_33__33__1(cenv[1], cenv[2], arg0, arg1); }, env0, env1];
}


function
__patsfun_75__closurerize(env0)
{
  return [function(cenv, arg0) { return __patsfun_75(cenv[1], arg0); }, env0];
}


function
__patsfun_30__30__1__closurerize(env0)
{
  return [function(cenv, arg0, arg1) { return __patsfun_30__30__1(cenv[1], arg0, arg1); }, env0];
}


function
__patsfun_78__closurerize(env0, env1)
{
  return [function(cenv) { return __patsfun_78(cenv[1], cenv[2]); }, env0, env1];
}


function
__patsfun_43__43__1__closurerize(env0, env1)
{
  return [function(cenv, arg0, arg1) { return __patsfun_43__43__1(cenv[1], cenv[2], arg0, arg1); }, env0, env1];
}


function
__patsfun_5__5__1__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return __patsfun_5__5__1(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
__patsfun_43__43__2__closurerize(env0, env1)
{
  return [function(cenv, arg0, arg1) { return __patsfun_43__43__2(cenv[1], cenv[2], arg0, arg1); }, env0, env1];
}


function
__patsfun_5__5__2__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return __patsfun_5__5__2(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
__patsfun_51__51__1__closurerize(env0, env1, env2, env3)
{
  return [function(cenv, arg0, arg1) { return __patsfun_51__51__1(cenv[1], cenv[2], cenv[3], cenv[4], arg0, arg1); }, env0, env1, env2, env3];
}


function
__patsfun_23__23__1__closurerize(env0, env1, env2, env3, env4)
{
  return [function(cenv, arg0) { return __patsfun_23__23__1(cenv[1], cenv[2], cenv[3], cenv[4], cenv[5], arg0); }, env0, env1, env2, env3, env4];
}


function
__patsfun_24__24__1__closurerize(env0, env1, env2, env3, env4)
{
  return [function(cenv, arg0) { return __patsfun_24__24__1(cenv[1], cenv[2], cenv[3], cenv[4], cenv[5], arg0); }, env0, env1, env2, env3, env4];
}


function
__patsfun_32__32__2__closurerize(env0)
{
  return [function(cenv, arg0, arg1) { return __patsfun_32__32__2(cenv[1], arg0, arg1); }, env0];
}


function
__patsfun_33__33__2__closurerize(env0, env1)
{
  return [function(cenv, arg0, arg1) { return __patsfun_33__33__2(cenv[1], cenv[2], arg0, arg1); }, env0, env1];
}


function
__patsfun_105__closurerize(env0)
{
  return [function(cenv, arg0) { return __patsfun_105(cenv[1], arg0); }, env0];
}


function
__patsfun_43__43__3__closurerize(env0, env1)
{
  return [function(cenv, arg0, arg1) { return __patsfun_43__43__3(cenv[1], cenv[2], arg0, arg1); }, env0, env1];
}


function
__patsfun_5__5__3__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return __patsfun_5__5__3(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
__patsfun_32__32__3__closurerize(env0)
{
  return [function(cenv, arg0, arg1) { return __patsfun_32__32__3(cenv[1], arg0, arg1); }, env0];
}


function
__patsfun_33__33__3__closurerize(env0, env1)
{
  return [function(cenv, arg0, arg1) { return __patsfun_33__33__3(cenv[1], cenv[2], arg0, arg1); }, env0, env1];
}


function
__patsfun_118__closurerize(env0)
{
  return [function(cenv, arg0) { return __patsfun_118(cenv[1], arg0); }, env0];
}


function
__patsfun_30__30__2__closurerize(env0)
{
  return [function(cenv, arg0, arg1) { return __patsfun_30__30__2(cenv[1], arg0, arg1); }, env0];
}


function
__patsfun_121__closurerize(env0, env1)
{
  return [function(cenv) { return __patsfun_121(cenv[1], cenv[2]); }, env0, env1];
}


function
__patsfun_43__43__4__closurerize(env0, env1)
{
  return [function(cenv, arg0, arg1) { return __patsfun_43__43__4(cenv[1], cenv[2], arg0, arg1); }, env0, env1];
}


function
__patsfun_5__5__4__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return __patsfun_5__5__4(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
__patsfun_43__43__5__closurerize(env0, env1)
{
  return [function(cenv, arg0, arg1) { return __patsfun_43__43__5(cenv[1], cenv[2], arg0, arg1); }, env0, env1];
}


function
__patsfun_5__5__5__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return __patsfun_5__5__5(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
__patsfun_51__51__2__closurerize(env0, env1, env2, env3)
{
  return [function(cenv, arg0, arg1) { return __patsfun_51__51__2(cenv[1], cenv[2], cenv[3], cenv[4], arg0, arg1); }, env0, env1, env2, env3];
}


function
__patsfun_23__23__2__closurerize(env0, env1, env2, env3, env4)
{
  return [function(cenv, arg0) { return __patsfun_23__23__2(cenv[1], cenv[2], cenv[3], cenv[4], cenv[5], arg0); }, env0, env1, env2, env3, env4];
}


function
__patsfun_24__24__2__closurerize(env0, env1, env2, env3, env4)
{
  return [function(cenv, arg0) { return __patsfun_24__24__2(cenv[1], cenv[2], cenv[3], cenv[4], cenv[5], arg0); }, env0, env1, env2, env3, env4];
}


function
__patsfun_30__30__3__closurerize(env0)
{
  return [function(cenv, arg0, arg1) { return __patsfun_30__30__3(cenv[1], arg0, arg1); }, env0];
}


function
__patsfun_149__closurerize(env0)
{
  return [function(cenv) { return __patsfun_149(cenv[1]); }, env0];
}


function
__patsfun_30__30__4__closurerize(env0)
{
  return [function(cenv, arg0, arg1) { return __patsfun_30__30__4(cenv[1], arg0, arg1); }, env0];
}


function
__patsfun_152__closurerize(env0)
{
  return [function(cenv) { return __patsfun_152(cenv[1]); }, env0];
}


function
__patsfun_43__43__6__closurerize(env0, env1)
{
  return [function(cenv, arg0, arg1) { return __patsfun_43__43__6(cenv[1], cenv[2], arg0, arg1); }, env0, env1];
}


function
__patsfun_5__5__6__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return __patsfun_5__5__6(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
__patsfun_43__43__7__closurerize(env0, env1)
{
  return [function(cenv, arg0, arg1) { return __patsfun_43__43__7(cenv[1], cenv[2], arg0, arg1); }, env0, env1];
}


function
__patsfun_5__5__7__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return __patsfun_5__5__7(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
__patsfun_49__49__1__closurerize(env0)
{
  return [function(cenv, arg0, arg1) { return __patsfun_49__49__1(cenv[1], arg0, arg1); }, env0];
}


function
__patsfun_19__19__1__closurerize(env0, env1)
{
  return [function(cenv, arg0, arg1) { return __patsfun_19__19__1(cenv[1], cenv[2], arg0, arg1); }, env0, env1];
}


function
__patsfun_20__20__1__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return __patsfun_20__20__1(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
__patsfun_47__47__1__closurerize(env0, env1)
{
  return [function(cenv, arg0, arg1) { return __patsfun_47__47__1(cenv[1], cenv[2], arg0, arg1); }, env0, env1];
}


function
__patsfun_14__14__1__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return __patsfun_14__14__1(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
__patsfun_43__43__8__closurerize(env0, env1)
{
  return [function(cenv, arg0, arg1) { return __patsfun_43__43__8(cenv[1], cenv[2], arg0, arg1); }, env0, env1];
}


function
__patsfun_5__5__8__closurerize(env0, env1)
{
  return [function(cenv, arg0) { return __patsfun_5__5__8(cenv[1], cenv[2], arg0); }, env0, env1];
}


function
__patsfun_54__54__1__closurerize()
{
  return [function(cenv, arg0) { return __patsfun_54__54__1(arg0); }];
}


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_nil()
{
//
// knd = 0
  var tmpret59
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_nil
  tmpret59 = __patsfun_40__closurerize();
  return tmpret59;
} // end-of-function


function
__patsfun_40(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_40
  arg1[0](arg1, arg0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_new()
{
//
// knd = 0
  var tmpret80
  var tmplab, tmplab_js
//
  // __patsflab_state_new
  tmpret80 = ats2jspre_gvhashtbl_make_nil();
  return tmpret80;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_get_uid(arg0)
{
//
// knd = 0
  var tmpret81
  var tmp82
  var tmp83
  var tmplab, tmplab_js
//
  // __patsflab_state_get_uid
  tmp82 = ats2jspre_gvhashtbl_get_atkey(arg0, "uid");
  if(!ATSCKpat_con1(tmp82, 4)) ATSINScaseof_fail("/home/hwxi/Research/ATS-Postiats/doc/EXAMPLE/EFFECTIVATS/ssntyped-channels-2/multest_server.dats: 2378(line=117, offs=11) -- 2404(line=117, offs=37)");
  tmp83 = tmp82[1];
  tmpret81 = tmp83;
  return tmpret81;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_set_uid(arg0, arg1)
{
//
// knd = 0
  var tmp85
  var tmplab, tmplab_js
//
  // __patsflab_state_set_uid
  tmp85 = [4, arg1];
  ats2jspre_gvhashtbl_set_atkey(arg0, "uid", tmp85);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_get_test_arg1(arg0)
{
//
// knd = 0
  var tmpret86
  var tmp87
  var tmp88
  var tmplab, tmplab_js
//
  // __patsflab_state_get_test_arg1
  tmp87 = ats2jspre_gvhashtbl_get_atkey(arg0, "test_arg1");
  if(!ATSCKpat_con1(tmp87, 1)) ATSINScaseof_fail("/home/hwxi/Research/ATS-Postiats/doc/EXAMPLE/EFFECTIVATS/ssntyped-channels-2/multest_server.dats: 2555(line=124, offs=11) -- 2584(line=124, offs=40)");
  tmp88 = tmp87[1];
  tmpret86 = tmp88;
  return tmpret86;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_set_test_arg1(arg0, arg1)
{
//
// knd = 0
  var tmp90
  var tmplab, tmplab_js
//
  // __patsflab_state_set_test_arg1
  tmp90 = [1, arg1];
  ats2jspre_gvhashtbl_set_atkey(arg0, "test_arg1", tmp90);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_get_test_arg2(arg0)
{
//
// knd = 0
  var tmpret91
  var tmp92
  var tmp93
  var tmplab, tmplab_js
//
  // __patsflab_state_get_test_arg2
  tmp92 = ats2jspre_gvhashtbl_get_atkey(arg0, "test_arg2");
  if(!ATSCKpat_con1(tmp92, 1)) ATSINScaseof_fail("/home/hwxi/Research/ATS-Postiats/doc/EXAMPLE/EFFECTIVATS/ssntyped-channels-2/multest_server.dats: 2744(line=131, offs=11) -- 2773(line=131, offs=40)");
  tmp93 = tmp92[1];
  tmpret91 = tmp93;
  return tmpret91;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_set_test_arg2(arg0, arg1)
{
//
// knd = 0
  var tmp95
  var tmplab, tmplab_js
//
  // __patsflab_state_set_test_arg2
  tmp95 = [1, arg1];
  ats2jspre_gvhashtbl_set_atkey(arg0, "test_arg2", tmp95);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_get_pass_result(arg0)
{
//
// knd = 0
  var tmpret96
  var tmp97
  var tmp98
  var tmplab, tmplab_js
//
  // __patsflab_state_get_pass_result
  tmp97 = ats2jspre_gvhashtbl_get_atkey(arg0, "pass_result");
  if(!ATSCKpat_con1(tmp97, 2)) ATSINScaseof_fail("/home/hwxi/Research/ATS-Postiats/doc/EXAMPLE/EFFECTIVATS/ssntyped-channels-2/multest_server.dats: 2935(line=138, offs=11) -- 2967(line=138, offs=43)");
  tmp98 = tmp97[1];
  tmpret96 = tmp98;
  return tmpret96;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_set_pass_result(arg0, arg1)
{
//
// knd = 0
  var tmp100
  var tmplab, tmplab_js
//
  // __patsflab_state_set_pass_result
  tmp100 = [2, arg1];
  ats2jspre_gvhashtbl_set_atkey(arg0, "pass_result", tmp100);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_get_answer_result(arg0)
{
//
// knd = 0
  var tmpret101
  var tmp102
  var tmp103
  var tmplab, tmplab_js
//
  // __patsflab_state_get_answer_result
  tmp102 = ats2jspre_gvhashtbl_get_atkey(arg0, "answer_result");
  if(!ATSCKpat_con1(tmp102, 2)) ATSINScaseof_fail("/home/hwxi/Research/ATS-Postiats/doc/EXAMPLE/EFFECTIVATS/ssntyped-channels-2/multest_server.dats: 3136(line=145, offs=11) -- 3170(line=145, offs=45)");
  tmp103 = tmp102[1];
  tmpret101 = tmp103;
  return tmpret101;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_set_answer_result(arg0, arg1)
{
//
// knd = 0
  var tmp105
  var tmplab, tmplab_js
//
  // __patsflab_state_set_answer_result
  tmp105 = [2, arg1];
  ats2jspre_gvhashtbl_set_atkey(arg0, "answer_result", tmp105);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__f_ss_pass(arg0)
{
//
// knd = 0
  var tmpret106
  var tmp107
  var tmp112
  var tmp121
  var tmp133
  var tmp140
  var tmplab, tmplab_js
//
  // __patsflab_f_ss_pass
  tmp107 = ats2jspre_ref("");
  tmp112 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_recv__31__1(__patsfun_75__closurerize(tmp107));
  tmp121 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_send__29__1(__patsfun_78__closurerize(arg0, tmp107));
  tmp140 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_nil();
  tmp133 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_cons__41__2(tmp121, tmp140);
  tmpret106 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_cons__41__1(tmp112, tmp133);
  return tmpret106;
} // end-of-function


function
pass_check_69(env0, arg0)
{
//
// knd = 0
  var tmpret108
  var tmp109
  var tmp110
  var tmplab, tmplab_js
//
  // __patsflab_pass_check_69
  tmp110 = ats2jspre_eq_string_string(arg0, "multest");
  if(tmp110) {
    tmp109 = true;
  } else {
    tmp109 = false;
  } // endif
  if(tmp109) {
    _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_set_pass_result(env0, true);
  } else {
    // ATSINSmove_void
  } // endif
  tmpret108 = tmp109;
  return tmpret108;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_recv__31__1(arg0)
{
//
// knd = 0
  var tmpret47__1
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_recv
  tmpret47__1 = __patsfun_32__32__1__closurerize(arg0);
  return tmpret47__1;
} // end-of-function


function
__patsfun_32__32__1(env0, arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_32
  ats2js_worker_chanpos1_recv(arg0, __patsfun_33__33__1__closurerize(env0, arg1));
  return/*_void*/;
} // end-of-function


function
__patsfun_33__33__1(env0, env1, arg0, arg1)
{
//
// knd = 0
  var tmp51__1
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_33
  tmp51__1 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chmsg_parse__73__1(arg1);
  env0[0](env0, tmp51__1);
  env1[0](env1, arg0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chmsg_parse__73__1(arg0)
{
//
// knd = 0
  var tmpret118__1
  var tmplab, tmplab_js
//
  // __patsflab_chmsg_parse
  tmpret118__1 = arg0;
  return tmpret118__1;
} // end-of-function


function
__patsfun_75(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_75
  ats2jspre_ref_set_elt(env0, arg0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_send__29__1(arg0)
{
//
// knd = 0
  var tmpret44__1
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_send
  tmpret44__1 = __patsfun_30__30__1__closurerize(arg0);
  return tmpret44__1;
} // end-of-function


function
__patsfun_30__30__1(env0, arg0, arg1)
{
//
// knd = 0
  var tmp46__1
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_30
  tmp46__1 = env0[0](env0);
  ats2js_worker_chanpos1_send(arg0, tmp46__1, arg1);
  return/*_void*/;
} // end-of-function


function
__patsfun_78(env0, env1)
{
//
// knd = 0
  var tmpret125
  var tmp126
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_78
  tmp126 = ats2jspre_ref_get_elt(env1);
  tmpret125 = pass_check_69(env0, tmp126);
  return tmpret125;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_cons__41__1(arg0, arg1)
{
//
// knd = 0
  var tmpret61__1
  var tmp62__1
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_cons
  tmp62__1 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__1(arg0, arg1);
  tmpret61__1 = tmp62__1;
  return tmpret61__1;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__1(arg0, arg1)
{
//
// knd = 0
  var tmpret63__1
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_append
  tmpret63__1 = __patsfun_43__43__1__closurerize(arg0, arg1);
  return tmpret63__1;
} // end-of-function


function
__patsfun_43__43__1(env0, env1, arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_43
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__1(arg0, arg1, env0, env1);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__1(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_append
  arg2[0](arg2, arg0, __patsfun_5__5__1__closurerize(arg1, arg3));
  return/*_void*/;
} // end-of-function


function
__patsfun_5__5__1(env0, env1, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_5
  env1[0](env1, arg0, env0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_cons__41__2(arg0, arg1)
{
//
// knd = 0
  var tmpret61__2
  var tmp62__2
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_cons
  tmp62__2 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__2(arg0, arg1);
  tmpret61__2 = tmp62__2;
  return tmpret61__2;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__2(arg0, arg1)
{
//
// knd = 0
  var tmpret63__2
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_append
  tmpret63__2 = __patsfun_43__43__2__closurerize(arg0, arg1);
  return tmpret63__2;
} // end-of-function


function
__patsfun_43__43__2(env0, env1, arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_43
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__2(arg0, arg1, env0, env1);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__2(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_append
  arg2[0](arg2, arg0, __patsfun_5__5__2__closurerize(arg1, arg3));
  return/*_void*/;
} // end-of-function


function
__patsfun_5__5__2(env0, env1, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_5
  env1[0](env1, arg0, env0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__f_ss_pass_try(arg0)
{
//
// knd = 0
  var tmpret141
  var tmp142
  var tmp167
  var tmplab, tmplab_js
//
  // __patsflab_f_ss_pass_try
  tmp142 = ats2jspre_ref(0);
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_set_pass_result(arg0, false);
  tmp167 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__f_ss_pass(arg0);
  tmpret141 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_repeat_disj__50__1(arg0, 3, tmp142, tmp167);
  return tmpret141;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_repeat_disj__50__1(env0, env1, env2, arg0)
{
//
// knd = 0
  var tmpret71__1
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_repeat_disj
  tmpret71__1 = __patsfun_51__51__1__closurerize(arg0, env0, env1, env2);
  return tmpret71__1;
} // end-of-function


function
__patsfun_51__51__1(env0, env1, env2, env3, arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_51
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__21__1(env1, env2, env3, arg0, arg1, env0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__21__1(env0, env1, env2, arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_repeat_disj
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__init__26__1();
  loop_22__22__1(env0, env1, env2, arg0, arg1, arg2);
  return/*_void*/;
} // end-of-function


function
loop_22__22__1(env0, env1, env2, arg0, arg1, arg2)
{
//
// knd = 0
  var tmp35__1
  var tmplab, tmplab_js
//
  // __patsflab_loop_22
  tmp35__1 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__choose__90__1(env0, env1, env2);
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__fwork_tag__28__1(tmp35__1);
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab15
      if(!ATSCKpat_int(tmp35__1, 0)) { tmplab_js = 3; break; }
      case 2: // __atstmplab16
      ats2js_worker_chanpos0_send(arg0, tmp35__1, arg1);
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab17
      ats2js_worker_chanpos0_send(arg0, tmp35__1, __patsfun_23__23__1__closurerize(arg1, arg2, env0, env1, env2));
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__choose__90__1(env0, env1, env2)
{
//
// knd = 0
  var tmpret144__1
  var tmp145__1
  var tmp147__1
  var tmp148__1
  var tmp149__1
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_repeat_disj__choose
  tmp145__1 = ats2jspre_ref_get_elt(env2);
  tmp147__1 = ats2jspre_add_int0_int0(tmp145__1, 1);
  ats2jspre_ref_set_elt(env2, tmp147__1);
  tmp148__1 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_get_pass_result(env0);
  if(tmp148__1) {
    tmpret144__1 = 0;
  } else {
    tmp149__1 = ats2jspre_gte_int0_int0(tmp145__1, env1);
    if(tmp149__1) {
      tmpret144__1 = 0;
    } else {
      tmpret144__1 = 1;
    } // endif
  } // endif
  return tmpret144__1;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__fwork_tag__28__1(arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_repeat_disj__fwork_tag
  // ATSINSmove_void
  return/*_void*/;
} // end-of-function


function
__patsfun_23__23__1(env0, env1, env2, env3, env4, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_23
  env1[0](env1, arg0, __patsfun_24__24__1__closurerize(env0, env1, env2, env3, env4));
  return/*_void*/;
} // end-of-function


function
__patsfun_24__24__1(env0, env1, env2, env3, env4, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_24
  loop_22__22__1(env2, env3, env4, arg0, env0, env1);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__init__26__1()
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_repeat_disj__init
  // ATSINSmove_void
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__f_ss_login(arg0)
{
//
// knd = 0
  var tmpret168
  var tmp169
  var tmp183
  var tmplab, tmplab_js
//
  // __patsflab_f_ss_login
  tmp169 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_recv__31__2(__patsfun_105__closurerize(arg0));
  tmp183 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__f_ss_pass_try(arg0);
  tmpret168 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_cons__41__3(tmp169, tmp183);
  return tmpret168;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_recv__31__2(arg0)
{
//
// knd = 0
  var tmpret47__2
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_recv
  tmpret47__2 = __patsfun_32__32__2__closurerize(arg0);
  return tmpret47__2;
} // end-of-function


function
__patsfun_32__32__2(env0, arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_32
  ats2js_worker_chanpos1_recv(arg0, __patsfun_33__33__2__closurerize(env0, arg1));
  return/*_void*/;
} // end-of-function


function
__patsfun_33__33__2(env0, env1, arg0, arg1)
{
//
// knd = 0
  var tmp51__2
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_33
  tmp51__2 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chmsg_parse__73__2(arg1);
  env0[0](env0, tmp51__2);
  env1[0](env1, arg0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chmsg_parse__73__2(arg0)
{
//
// knd = 0
  var tmpret118__2
  var tmplab, tmplab_js
//
  // __patsflab_chmsg_parse
  tmpret118__2 = arg0;
  return tmpret118__2;
} // end-of-function


function
__patsfun_105(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_105
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_set_uid(env0, arg0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_cons__41__3(arg0, arg1)
{
//
// knd = 0
  var tmpret61__3
  var tmp62__3
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_cons
  tmp62__3 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__3(arg0, arg1);
  tmpret61__3 = tmp62__3;
  return tmpret61__3;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__3(arg0, arg1)
{
//
// knd = 0
  var tmpret63__3
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_append
  tmpret63__3 = __patsfun_43__43__3__closurerize(arg0, arg1);
  return tmpret63__3;
} // end-of-function


function
__patsfun_43__43__3(env0, env1, arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_43
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__3(arg0, arg1, env0, env1);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__3(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_append
  arg2[0](arg2, arg0, __patsfun_5__5__3__closurerize(arg1, arg3));
  return/*_void*/;
} // end-of-function


function
__patsfun_5__5__3(env0, env1, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_5
  env1[0](env1, arg0, env0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__f_ss_answer(arg0)
{
//
// knd = 0
  var tmpret184
  var tmp185
  var tmp192
  var tmp201
  var tmp213
  var tmp220
  var tmplab, tmplab_js
//
  // __patsflab_f_ss_answer
  tmp185 = ats2jspre_ref(0);
  tmp192 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_recv__31__3(__patsfun_118__closurerize(tmp185));
  tmp201 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_send__29__2(__patsfun_121__closurerize(arg0, tmp185));
  tmp220 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_nil();
  tmp213 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_cons__41__5(tmp201, tmp220);
  tmpret184 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_cons__41__4(tmp192, tmp213);
  return tmpret184;
} // end-of-function


function
answer_check_112(env0, arg0)
{
//
// knd = 0
  var tmpret186
  var tmp187
  var tmp188
  var tmp189
  var tmp190
  var tmplab, tmplab_js
//
  // __patsflab_answer_check_112
  tmp187 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_get_test_arg1(env0);
  tmp188 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_get_test_arg2(env0);
  tmp190 = ats2jspre_mul_int0_int0(tmp187, tmp188);
  tmp189 = ats2jspre_eq_int0_int0(arg0, tmp190);
  if(tmp189) {
    _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_set_answer_result(env0, true);
  } else {
    // ATSINSmove_void
  } // endif
  tmpret186 = tmp189;
  return tmpret186;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_recv__31__3(arg0)
{
//
// knd = 0
  var tmpret47__3
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_recv
  tmpret47__3 = __patsfun_32__32__3__closurerize(arg0);
  return tmpret47__3;
} // end-of-function


function
__patsfun_32__32__3(env0, arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_32
  ats2js_worker_chanpos1_recv(arg0, __patsfun_33__33__3__closurerize(env0, arg1));
  return/*_void*/;
} // end-of-function


function
__patsfun_33__33__3(env0, env1, arg0, arg1)
{
//
// knd = 0
  var tmp51__3
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_33
  tmp51__3 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chmsg_parse__116__1(arg1);
  env0[0](env0, tmp51__3);
  env1[0](env1, arg0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chmsg_parse__116__1(arg0)
{
//
// knd = 0
  var tmpret198__1
  var tmplab, tmplab_js
//
  // __patsflab_chmsg_parse
  tmpret198__1 = parseInt(arg0);
  return tmpret198__1;
} // end-of-function


function
__patsfun_118(env0, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_118
  ats2jspre_ref_set_elt(env0, arg0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_send__29__2(arg0)
{
//
// knd = 0
  var tmpret44__2
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_send
  tmpret44__2 = __patsfun_30__30__2__closurerize(arg0);
  return tmpret44__2;
} // end-of-function


function
__patsfun_30__30__2(env0, arg0, arg1)
{
//
// knd = 0
  var tmp46__2
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_30
  tmp46__2 = env0[0](env0);
  ats2js_worker_chanpos1_send(arg0, tmp46__2, arg1);
  return/*_void*/;
} // end-of-function


function
__patsfun_121(env0, env1)
{
//
// knd = 0
  var tmpret205
  var tmp206
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_121
  tmp206 = ats2jspre_ref_get_elt(env1);
  tmpret205 = answer_check_112(env0, tmp206);
  return tmpret205;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_cons__41__4(arg0, arg1)
{
//
// knd = 0
  var tmpret61__4
  var tmp62__4
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_cons
  tmp62__4 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__4(arg0, arg1);
  tmpret61__4 = tmp62__4;
  return tmpret61__4;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__4(arg0, arg1)
{
//
// knd = 0
  var tmpret63__4
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_append
  tmpret63__4 = __patsfun_43__43__4__closurerize(arg0, arg1);
  return tmpret63__4;
} // end-of-function


function
__patsfun_43__43__4(env0, env1, arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_43
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__4(arg0, arg1, env0, env1);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__4(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_append
  arg2[0](arg2, arg0, __patsfun_5__5__4__closurerize(arg1, arg3));
  return/*_void*/;
} // end-of-function


function
__patsfun_5__5__4(env0, env1, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_5
  env1[0](env1, arg0, env0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_cons__41__5(arg0, arg1)
{
//
// knd = 0
  var tmpret61__5
  var tmp62__5
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_cons
  tmp62__5 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__5(arg0, arg1);
  tmpret61__5 = tmp62__5;
  return tmpret61__5;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__5(arg0, arg1)
{
//
// knd = 0
  var tmpret63__5
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_append
  tmpret63__5 = __patsfun_43__43__5__closurerize(arg0, arg1);
  return tmpret63__5;
} // end-of-function


function
__patsfun_43__43__5(env0, env1, arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_43
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__5(arg0, arg1, env0, env1);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__5(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_append
  arg2[0](arg2, arg0, __patsfun_5__5__5__closurerize(arg1, arg3));
  return/*_void*/;
} // end-of-function


function
__patsfun_5__5__5(env0, env1, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_5
  env1[0](env1, arg0, env0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__f_ss_answer_try(arg0)
{
//
// knd = 0
  var tmpret221
  var tmp222
  var tmp249
  var tmplab, tmplab_js
//
  // __patsflab_f_ss_answer_try
  tmp222 = ats2jspre_ref(0);
  tmp249 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__f_ss_answer(arg0);
  tmpret221 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_repeat_disj__50__2(arg0, 3, tmp222, tmp249);
  return tmpret221;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_repeat_disj__50__2(env0, env1, env2, arg0)
{
//
// knd = 0
  var tmpret71__2
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_repeat_disj
  tmpret71__2 = __patsfun_51__51__2__closurerize(arg0, env0, env1, env2);
  return tmpret71__2;
} // end-of-function


function
__patsfun_51__51__2(env0, env1, env2, env3, arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_51
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__21__2(env1, env2, env3, arg0, arg1, env0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__21__2(env0, env1, env2, arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_repeat_disj
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__init__133__1(env0, env2);
  loop_22__22__2(env0, env1, env2, arg0, arg1, arg2);
  return/*_void*/;
} // end-of-function


function
loop_22__22__2(env0, env1, env2, arg0, arg1, arg2)
{
//
// knd = 0
  var tmp35__2
  var tmplab, tmplab_js
//
  // __patsflab_loop_22
  tmp35__2 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__choose__134__1(env0, env1, env2);
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__fwork_tag__28__2(tmp35__2);
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab15
      if(!ATSCKpat_int(tmp35__2, 0)) { tmplab_js = 3; break; }
      case 2: // __atstmplab16
      ats2js_worker_chanpos0_send(arg0, tmp35__2, arg1);
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab17
      ats2js_worker_chanpos0_send(arg0, tmp35__2, __patsfun_23__23__2__closurerize(arg1, arg2, env0, env1, env2));
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__choose__134__1(env0, env1, env2)
{
//
// knd = 0
  var tmpret225__1
  var tmp226__1
  var tmp228__1
  var tmp229__1
  var tmp230__1
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_repeat_disj__choose
  tmp226__1 = ats2jspre_ref_get_elt(env2);
  tmp228__1 = ats2jspre_add_int0_int0(tmp226__1, 1);
  ats2jspre_ref_set_elt(env2, tmp228__1);
  tmp229__1 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_get_answer_result(env0);
  if(tmp229__1) {
    tmpret225__1 = 0;
  } else {
    tmp230__1 = ats2jspre_gte_int0_int0(tmp226__1, env1);
    if(tmp230__1) {
      tmpret225__1 = 0;
    } else {
      tmpret225__1 = 1;
    } // endif
  } // endif
  return tmpret225__1;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__fwork_tag__28__2(arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_repeat_disj__fwork_tag
  // ATSINSmove_void
  return/*_void*/;
} // end-of-function


function
__patsfun_23__23__2(env0, env1, env2, env3, env4, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_23
  env1[0](env1, arg0, __patsfun_24__24__2__closurerize(env0, env1, env2, env3, env4));
  return/*_void*/;
} // end-of-function


function
__patsfun_24__24__2(env0, env1, env2, env3, env4, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_24
  loop_22__22__2(env2, env3, env4, arg0, env0, env1);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_disj__init__133__1(env0, env1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_repeat_disj__init
  ats2jspre_ref_set_elt(env1, 0);
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_set_answer_result(env0, false);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__f_ss_test_one(arg0)
{
//
// knd = 0
  var tmpret250
  var tmp261
  var tmp266
  var tmp277
  var tmp284
  var tmplab, tmplab_js
//
  // __patsflab_f_ss_test_one
  tmp261 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_send__29__3(__patsfun_149__closurerize(arg0));
  tmp266 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_send__29__4(__patsfun_152__closurerize(arg0));
  tmp284 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__f_ss_answer_try(arg0);
  tmp277 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_cons__41__7(tmp266, tmp284);
  tmpret250 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_cons__41__6(tmp261, tmp277);
  return tmpret250;
} // end-of-function


function
arg1_gen_145(env0)
{
//
// knd = 0
  var tmpret251
  var tmp252
  var tmp253
  var tmp254
  var tmplab, tmplab_js
//
  // __patsflab_arg1_gen_145
  tmp254 = ats2jspre_JSmath_random();
  tmp253 = ats2jspre_mul_int_double(100, tmp254);
  tmp252 = ats2jspre_double2int(tmp253);
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_set_test_arg1(env0, tmp252);
  tmpret251 = tmp252;
  return tmpret251;
} // end-of-function


function
arg2_gen_146(env0)
{
//
// knd = 0
  var tmpret256
  var tmp257
  var tmp258
  var tmp259
  var tmplab, tmplab_js
//
  // __patsflab_arg2_gen_146
  tmp259 = ats2jspre_JSmath_random();
  tmp258 = ats2jspre_mul_int_double(100, tmp259);
  tmp257 = ats2jspre_double2int(tmp258);
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_set_test_arg2(env0, tmp257);
  tmpret256 = tmp257;
  return tmpret256;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_send__29__3(arg0)
{
//
// knd = 0
  var tmpret44__3
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_send
  tmpret44__3 = __patsfun_30__30__3__closurerize(arg0);
  return tmpret44__3;
} // end-of-function


function
__patsfun_30__30__3(env0, arg0, arg1)
{
//
// knd = 0
  var tmp46__3
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_30
  tmp46__3 = env0[0](env0);
  ats2js_worker_chanpos1_send(arg0, tmp46__3, arg1);
  return/*_void*/;
} // end-of-function


function
__patsfun_149(env0)
{
//
// knd = 0
  var tmpret265
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_149
  tmpret265 = arg1_gen_145(env0);
  return tmpret265;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_send__29__4(arg0)
{
//
// knd = 0
  var tmpret44__4
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_send
  tmpret44__4 = __patsfun_30__30__4__closurerize(arg0);
  return tmpret44__4;
} // end-of-function


function
__patsfun_30__30__4(env0, arg0, arg1)
{
//
// knd = 0
  var tmp46__4
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_30
  tmp46__4 = env0[0](env0);
  ats2js_worker_chanpos1_send(arg0, tmp46__4, arg1);
  return/*_void*/;
} // end-of-function


function
__patsfun_152(env0)
{
//
// knd = 0
  var tmpret270
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_152
  tmpret270 = arg2_gen_146(env0);
  return tmpret270;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_cons__41__6(arg0, arg1)
{
//
// knd = 0
  var tmpret61__6
  var tmp62__6
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_cons
  tmp62__6 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__6(arg0, arg1);
  tmpret61__6 = tmp62__6;
  return tmpret61__6;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__6(arg0, arg1)
{
//
// knd = 0
  var tmpret63__6
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_append
  tmpret63__6 = __patsfun_43__43__6__closurerize(arg0, arg1);
  return tmpret63__6;
} // end-of-function


function
__patsfun_43__43__6(env0, env1, arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_43
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__6(arg0, arg1, env0, env1);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__6(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_append
  arg2[0](arg2, arg0, __patsfun_5__5__6__closurerize(arg1, arg3));
  return/*_void*/;
} // end-of-function


function
__patsfun_5__5__6(env0, env1, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_5
  env1[0](env1, arg0, env0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_cons__41__7(arg0, arg1)
{
//
// knd = 0
  var tmpret61__7
  var tmp62__7
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_cons
  tmp62__7 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__7(arg0, arg1);
  tmpret61__7 = tmp62__7;
  return tmpret61__7;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__7(arg0, arg1)
{
//
// knd = 0
  var tmpret63__7
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_append
  tmpret63__7 = __patsfun_43__43__7__closurerize(arg0, arg1);
  return tmpret63__7;
} // end-of-function


function
__patsfun_43__43__7(env0, env1, arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_43
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__7(arg0, arg1, env0, env1);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__7(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_append
  arg2[0](arg2, arg0, __patsfun_5__5__7__closurerize(arg1, arg3));
  return/*_void*/;
} // end-of-function


function
__patsfun_5__5__7(env0, env1, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_5
  env1[0](env1, arg0, env0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__f_ss_test_loop(arg0)
{
//
// knd = 0
  var tmpret285
  var tmp286
  var tmplab, tmplab_js
//
  // __patsflab_f_ss_test_loop
  tmp286 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__f_ss_test_one(arg0);
  tmpret285 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_repeat_conj__48__1(tmp286);
  return tmpret285;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_repeat_conj__48__1(arg0)
{
//
// knd = 0
  var tmpret69__1
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_repeat_conj
  tmpret69__1 = __patsfun_49__49__1__closurerize(arg0);
  return tmpret69__1;
} // end-of-function


function
__patsfun_49__49__1(env0, arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_49
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_conj__17__1(arg0, arg1, env0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_conj__17__1(arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_repeat_conj
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_conj__init__25__1();
  loop_18__18__1(arg0, arg1, arg2);
  return/*_void*/;
} // end-of-function


function
loop_18__18__1(arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_loop_18
  ats2js_worker_chanpos0_recv(arg0, __patsfun_19__19__1__closurerize(arg1, arg2));
  return/*_void*/;
} // end-of-function


function
__patsfun_19__19__1(env0, env1, arg0, arg1)
{
//
// knd = 0
  var tmp29__1
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_19
  tmp29__1 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chmsg_parse__116__2(arg1);
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_conj__fwork_tag__27__1(tmp29__1);
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab12
      if(!ATSCKpat_int(tmp29__1, 0)) { tmplab_js = 3; break; }
      case 2: // __atstmplab13
      env0[0](env0, arg0);
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab14
      env1[0](env1, arg0, __patsfun_20__20__1__closurerize(env0, env1));
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chmsg_parse__116__2(arg0)
{
//
// knd = 0
  var tmpret198__2
  var tmplab, tmplab_js
//
  // __patsflab_chmsg_parse
  tmpret198__2 = parseInt(arg0);
  return tmpret198__2;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_conj__fwork_tag__27__1(arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_repeat_conj__fwork_tag
  // ATSINSmove_void
  return/*_void*/;
} // end-of-function


function
__patsfun_20__20__1(env0, env1, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_20
  loop_18__18__1(arg0, env0, env1);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_repeat_conj__init__25__1()
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_repeat_conj__init
  // ATSINSmove_void
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__chanpos_session_multest()
{
//
// knd = 0
  var tmpret299
  var tmp300
  var tmp301
  var tmp302
  var tmplab, tmplab_js
//
  // __patsflab_chanpos_session_multest
  tmp300 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_new();
  tmp301 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__f_ss_login(tmp300);
  tmp302 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__f_ss_test_loop(tmp300);
  tmpret299 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session2_056_sats__chanpos1_session_guardby__55__1(tmp300, tmp302, tmp301);
  return tmpret299;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session2_056_sats__chanpos1_session_guardby__55__1(env0, arg0, arg1)
{
//
// knd = 0
  var tmpret76__1
  var tmp79__1
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_guardby
  tmp79__1 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_option_disj__46__1(env0, arg0);
  tmpret76__1 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__8(arg1, tmp79__1);
  return tmpret76__1;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_option_disj__46__1(env0, arg0)
{
//
// knd = 0
  var tmpret67__1
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_option_disj
  tmpret67__1 = __patsfun_47__47__1__closurerize(arg0, env0);
  return tmpret67__1;
} // end-of-function


function
__patsfun_47__47__1(env0, env1, arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_47
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_option_disj__13__1(env1, arg0, arg1, env0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_option_disj__13__1(env0, arg0, arg1, arg2)
{
//
// knd = 0
  var tmp21__1
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_option_disj
  tmp21__1 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_option_disj__choose__56__1(env0);
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_option_disj__fwork_tag__16__1(tmp21__1);
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab9
      if(!ATSCKpat_int(tmp21__1, 0)) { tmplab_js = 3; break; }
      case 2: // __atstmplab10
      ats2js_worker_chanpos0_send(arg0, tmp21__1, arg1);
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab11
      ats2js_worker_chanpos0_send(arg0, tmp21__1, __patsfun_14__14__1__closurerize(arg1, arg2));
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_option_disj__choose__56__1(env0)
{
//
// knd = 0
  var tmpret77__1
  var tmp78__1
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_option_disj__choose
  tmp78__1 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session2_056_sats__chanpos1_session_guardby__guard__174__1(env0);
  if(tmp78__1) {
    tmpret77__1 = 1;
  } else {
    tmpret77__1 = 0;
  } // endif
  return tmpret77__1;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session2_056_sats__chanpos1_session_guardby__guard__174__1(env0)
{
//
// knd = 0
  var tmpret303__1
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_guardby__guard
  tmpret303__1 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__state_get_pass_result(env0);
  return tmpret303__1;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_option_disj__fwork_tag__16__1(arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_option_disj__fwork_tag
  // ATSINSmove_void
  return/*_void*/;
} // end-of-function


function
__patsfun_14__14__1(env0, env1, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_14
  env1[0](env1, arg0, env0);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_session_056_sats__chanpos1_session_append__42__8(arg0, arg1)
{
//
// knd = 0
  var tmpret63__8
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_append
  tmpret63__8 = __patsfun_43__43__8__closurerize(arg0, arg1);
  return tmpret63__8;
} // end-of-function


function
__patsfun_43__43__8(env0, env1, arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_43
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__8(arg0, arg1, env0, env1);
  return/*_void*/;
} // end-of-function


function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2js_057_SATS_057_Worker_057_channel_056_sats__chanpos1_append__4__8(arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_append
  arg2[0](arg2, arg0, __patsfun_5__5__8__closurerize(arg1, arg3));
  return/*_void*/;
} // end-of-function


function
__patsfun_5__5__8(env0, env1, arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_5
  env1[0](env1, arg0, env0);
  return/*_void*/;
} // end-of-function


function
ats2js_worker_chanpos1_session_run_close__53__1(arg0, arg1)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_run_close
  ats2js_worker_chanpos1_session_run__52__1(arg0, arg1, __patsfun_54__54__1__closurerize());
  return/*_void*/;
} // end-of-function


function
ats2js_worker_chanpos1_session_run__52__1(arg0, arg1, arg2)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab_chanpos1_session_run
  arg0[0](arg0, arg1, arg2);
  return/*_void*/;
} // end-of-function


function
__patsfun_54__54__1(arg0)
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // __patsflab___patsfun_54
  ats2js_worker_chanpos1_close(arg0);
  return/*_void*/;
} // end-of-function

// dynloadflag_minit
var _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__dynloadflag = 0;

function
_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__dynload()
{
//
// knd = 0
  var tmplab, tmplab_js
//
  // ATSdynload()
  // ATSdynloadflag_sta(_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__dynloadflag(510))
  if(ATSCKiseqz(_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__dynloadflag)) {
    _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__dynloadflag = 1 ; // flag is set
    statmp324 = _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__chanpos_session_multest();
    ats2js_worker_chanpos1_session_run_close__53__1(statmp324, 0);
  } // endif
  return/*_void*/;
} // end-of-function


function
theWorker_start()
{
//
// knd = 0
  var tmplab, tmplab_js
//
  _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_057_doc_057_EXAMPLE_057_EFFECTIVATS_057_ssntyped_055_channels_055_2_057_multest_server_056_dats__dynload();
  return/*_void*/;
} // end-of-function


/* ATSextcode_beg() */
//
theWorker_start();
//
/* ATSextcode_end() */

/* ****** ****** */

/* end-of-compilation-unit */

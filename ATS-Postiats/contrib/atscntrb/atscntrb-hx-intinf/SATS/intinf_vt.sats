(***********************************************************************)
(*                                                                     *)
(*                         ATS/contrib/atshwxi                         *)
(*                                                                     *)
(***********************************************************************)

(*
** Copyright (C) 2013 Hongwei Xi, ATS Trustful Software, Inc.
**
** Permission is hereby granted, free of charge, to any person obtaining a
** copy of this software and associated documentation files (the "Software"),
** to deal in the Software without restriction, including without limitation
** the rights to use, copy, modify, merge, publish, distribute, sublicense,
** and/or sell copies of the Software, and to permit persons to whom the
** Software is furnished to do so, subject to the following stated conditions:
** 
** The above copyright notice and this permission notice shall be included in
** all copies or substantial portions of the Software.
** 
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
** OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
** FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
** THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
** LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
** FROM OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
** IN THE SOFTWARE.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: February, 2013
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#define
ATS_PACKNAME
"ATSCNTRB.HX.intinf_vt"
//
(* ****** ****** *)
//
// HX-2013-02:
// For multiple-precision integers
//
(* ****** ****** *)

staload "./intinf.sats"

(* ****** ****** *)

stadef intinf = intinf_vtype
//
vtypedef Intinf = [i:int] intinf(i)
//
vtypedef
intinfLt(i0:int) = [i:int | i < i0] intinf(i)
vtypedef
intinfLte(i0:int) = [i:int | i <= i0] intinf(i)
vtypedef
intinfGt(i0:int) = [i:int | i > i0] intinf(i)
vtypedef
intinfGte(i0:int) = [i:int | i >= i0] intinf(i)
vtypedef
intinfBtw(i1:int, i2:int) = [i:int | i1 <= i; i < i2] intinf(i)
vtypedef
intinfBtwe(i1:int, i2:int) = [i:int | i1 <= i; i <= i2] intinf(i)
//
(* ****** ****** *)
//
// HX: taken from GMP
//
typedef
intinf_base = intBtwe(2, 36)
//
(* ****** ****** *)
//
fun{}
intinf_make_int
  {i:int}(x: int(i)): intinf(i)
//
macdef
int2intinf(x) = intinf_make_int(,(x))
//
(* ****** ****** *)

fun{}
intinf_make_lint
  {i:int}(x: lint(i)): intinf(i)
fun{}
intinf_make_llint
  {i:int}(x: llint(i)): intinf(i)

(* ****** ****** *)

fun{}
intinf_make_uint
  {i:int}(x: uint(i)): intinf(i)
fun{}
intinf_make_ulint
  {i:int}(x: ulint(i)): intinf(i)
fun{}
intinf_make_ullint
  {i:int}(x: ullint(i)): intinf(i)

(* ****** ****** *)

fun{}
intinf_free(x: Intinf): void

(* ****** ****** *)
//
fun{}
intinf_get_int(x: !Intinf): int
fun{}
intinf_get_lint(x: !Intinf): lint
//
(* ****** ****** *)
//
fun{}
intinf_get_strptr
  (x: !Intinf, base: intinf_base): Strptr1
// end of [intinf_get_strptr]
//
(* ****** ****** *)
//
fun{}
print_intinf(x: !Intinf): void
fun{}
prerr_intinf(x: !Intinf): void
fun{}
fprint_intinf
  (out: FILEref, x: !Intinf): void
//
fun{}
fprint_intinf_base
(
  out: FILEref, x: !Intinf, base: intinf_base
) : void // end of [fprint_intinf_base]
//
overload print with print_intinf
overload prerr with prerr_intinf
overload fprint with fprint_intinf
//
(* ****** ****** *)
//
// arithmetic-functions
//
(* ****** ****** *)
//
fun{}
neg_intinf0
  {i:int}(x: intinf(i)): intinf(~i)
//
fun{}
neg_intinf1
  {i:int}(x: !intinf(i)): intinf(~i)
//
overload ~ with neg_intinf1
//
(* ****** ****** *)
//
fun{}
abs_intinf0
  {i:int}(x: intinf(i)): intinf(abs(i))
//
fun{}
abs_intinf1
  {i:int}(x: !intinf(i)): intinf(abs(i))
//
overload abs with abs_intinf1
//
(* ****** ****** *)
//
fun{}
succ_intinf0
  {i:int}(x: intinf(i)): intinf(i+1)
fun{}
succ_intinf1
  {i:int}(x: !intinf(i)): intinf(i+1)
//
overload succ with succ_intinf1
//
(* ****** ****** *)
//
fun{}
pred_intinf0
  {i:int}(x: intinf(i)): intinf(i-1)
//
fun{}
pred_intinf1
  {i:int}(x: !intinf(i)): intinf(i-1)
//
overload pred with pred_intinf1
//
(* ****** ****** *)
//
fun{}
square_intinf0
  {i:int}(x: intinf(i)): intinf(i*i)
//
fun{}
square_intinf1
  {i:int}(x: !intinf(i)): intinf(i*i)
//
overload square with square_intinf1
//
(* ****** ****** *)
//
fun{}
add_int_intinf0
  {i,j:int}
  (x: int(i), y: intinf(j)): intinf(i+j)
fun{}
add_int_intinf1
  {i,j:int}
  (x: int(i), y: !intinf(j)): intinf(i+j)
//
fun{}
add_intinf0_int
  {i,j:int}
  (x: intinf(i), y: int(j)): intinf(i+j)
//
fun{}
add_intinf1_int
  {i,j:int}
  (x: !intinf(i), y: int(j)): intinf(i+j)
//
fun{}
add_intinf0_intinf1
  {i,j:int}
  (x: intinf(i), y: !intinf(j)): intinf(i+j)
fun{}
add_intinf1_intinf0
  {i,j:int}
  (x: !intinf(i), y: intinf(j)): intinf(i+j)
fun{}
add_intinf1_intinf1
  {i,j:int}
  (x: !intinf(i), y: !intinf(j)): intinf(i+j)
//
overload + with add_intinf1_int
overload + with add_int_intinf1
overload + with add_intinf1_intinf1
//
(* ****** ****** *)
//
fun{}
sub_int_intinf0
  {i,j:int}
  (x: int(i), y: intinf(j)): intinf(i-j)
fun{}
sub_int_intinf1
  {i,j:int}
  (x: int(i), y: !intinf(j)): intinf(i-j)
//
fun{}
sub_intinf0_int
  {i,j:int}
  (x: intinf(i), y: int(j)): intinf(i-j)
fun{}
sub_intinf1_int
  {i,j:int}
  (x: !intinf(i), y: int(j)): intinf(i-j)
//
fun{}
sub_intinf0_intinf1
  {i,j:int}
  (x: intinf(i), y: !intinf(j)): intinf(i-j)
fun{}
sub_intinf1_intinf0
  {i,j:int}
  (x: !intinf(i), y: intinf(j)): intinf(i-j)
fun{}
sub_intinf1_intinf1
  {i,j:int}
  (x: !intinf(i), y: !intinf(j)): intinf(i-j)
//
overload - with sub_int_intinf1
overload - with sub_intinf1_int
overload - with sub_intinf1_intinf1
//
(* ****** ****** *)
//
fun{}
mul_int_intinf0
  {i,j:int}
  (x: int(i), y: intinf(j)): intinf(i*j)
//
fun{}
mul_int_intinf1
  {i,j:int}
  (x: int(i), y: !intinf(j)): intinf(i*j)
//
fun{}
mul_intinf0_int
  {i,j:int}
  (x: intinf(i), y: int(j)): intinf(i*j)
//
fun{}
mul_intinf1_int
  {i,j:int}
  (x: !intinf(i), y: int(j)): intinf (i*j)
//
fun{}
mul_intinf0_intinf1
  {i,j:int}
  (x: intinf(i), y: !intinf(j)): intinf(i*j)
fun{}
mul_intinf1_intinf0
  {i,j:int}
  (x: !intinf(i), y: intinf(j)): intinf(i*j)
//
fun{}
mul_intinf1_intinf1
  {i,j:int}
  (x: !intinf(i), y: !intinf(j)): intinf(i*j)
//
overload * with mul_int_intinf1
overload * with mul_intinf1_int
overload * with mul_intinf1_intinf1
//
(* ****** ****** *)
//
fun{}
div_intinf0_int
  {i,j:int | j != 0}
  (x: intinf(i), y: int(j)): intinf(i/j)
//
fun{}
div_intinf1_int
  {i,j:int | j != 0}
  (x: !intinf(i), y: int(j)): intinf(i/j)
//
fun{}
div_intinf0_intinf1
  {i,j:int}
  (x: intinf(i), y: !intinf(j)): intinf(i/j)
fun{}
div_intinf1_intinf0
  {i,j:int}
  (x: !intinf(i), y: intinf(j)): intinf(i/j)
fun{}
div_intinf1_intinf1
  {i,j:int}
  (x: !intinf(i), y: !intinf(j)): intinf(i/j)
//
overload / with div_intinf1_int
overload / with div_intinf1_intinf1
//
(* ****** ****** *)
//
fun{}
ndiv_intinf0_int
  {i,j:int | i >= 0; j > 0}
  (x: intinf i, y: int j): intinf(ndiv(i,j))
//
fun{}
ndiv_intinf1_int
  {i,j:int | i >= 0; j > 0}
  (x: !intinf i, y: int j): intinf(ndiv(i,j))
//
fun{}
ndiv_intinf0_intinf1
  {i,j:nat | j > 0}
  (x: intinf(i), y: !intinf(j)): intinf(ndiv(i,j))
fun{}
ndiv_intinf1_intinf0
  {i,j:nat | j > 0}
  (x: !intinf(i), y: intinf(j)): intinf(ndiv(i,j))
fun{}
ndiv_intinf1_intinf1
  {i,j:nat | j > 0}
  (x: !intinf(i), y: !intinf(j)): intinf(ndiv(i,j))
//
overload ndiv with ndiv_intinf1_int
overload ndiv with ndiv_intinf1_intinf1
//
(* ****** ****** *)
//
fun{}
nmod_intinf0_int
  {i,j:int | j > 0}
  (x: intinf(i), y: int(j)): intBtw(0, j)
//
fun{}
nmod_intinf1_int
  {i,j:int | j > 0}
  (x: !intinf(i), y: int(j)): intBtw(0, j)
//
fun{}
nmod_intinf0_intinf1
  {i,j:int | j > 0}
  (x: intinf(i), y: !intinf(j)): intinfBtw(0, j)
fun{}
nmod_intinf1_intinf0
  {i,j:int | j > 0}
  (x: !intinf(i), y: intinf(j)): intinfBtw(0, j)
fun{}
nmod_intinf1_intinf1
  {i,j:int | j > 0}
  (x: !intinf(i), y: !intinf(j)): intinfBtw(0, j)
//
overload nmod with nmod_intinf1_int
overload nmod with nmod_intinf1_intinf1
//
(* ****** ****** *)
//
// comparison-functions
//
(* ****** ****** *)

fun{}
lt_intinf_int
  {i,j:int}
  (x: !intinf(i), y: int(j)):<> bool(i < j)
fun{}
lt_intinf_intinf
  {i,j:int}
  (x: !intinf(i), y: !intinf(j)):<> bool(i < j)
//
overload < with lt_intinf_int
overload < with lt_intinf_intinf
//
(* ****** ****** *)
//
fun{}
lte_intinf_int
  {i,j:int}
  (x: !intinf(i), y: int(j)):<> bool(i <= j)
fun{}
lte_intinf_intinf
  {i,j:int}
  (x: !intinf(i), y: !intinf(j)):<> bool(i <= j)
//
overload <= with lte_intinf_int
overload <= with lte_intinf_intinf
//
(* ****** ****** *)
//
fun{}
gt_intinf_int
  {i,j:int}
  (x: !intinf(i), y: int(j)):<> bool(i > j)
fun{}
gt_intinf_intinf
  {i,j:int}
  (x: !intinf(i), y: !intinf(j)):<> bool(i > j)
//
overload > with gt_intinf_int
overload > with gt_intinf_intinf
//
(* ****** ****** *)

fun{}
gte_intinf_int
  {i,j:int}
  (x: !intinf(i), y: int(j)):<> bool(i >= j)
fun{}
gte_intinf_intinf
  {i,j:int}
  (x: !intinf(i), y: !intinf(j)):<> bool(i >= j)
//
overload >= with gte_intinf_int
overload >= with gte_intinf_intinf
//
(* ****** ****** *)
//
fun{}
eq_intinf_int
  {i,j:int}
  (x: !intinf(i), y: int(j)):<> bool(i == j)
fun{}
eq_intinf_intinf
  {i,j:int}
  (x: !intinf(i), y: !intinf(j)):<> bool(i == j)
//
overload = with eq_intinf_int
overload = with eq_intinf_intinf
//
(* ****** ****** *)
//
fun{}
neq_intinf_int
  {i,j:int}
  (x: !intinf(i), y: int(j)):<> bool(i != j)
fun{}
neq_intinf_intinf
  {i,j:int}
  (x: !intinf(i), y: !intinf(j)):<> bool (i != j)
//
overload != with neq_intinf_int
overload != with neq_intinf_intinf
//
(* ****** ****** *)
//
fun{}
compare_intinf_int
  {i,j:int}
  (x: !intinf(i), y: int(j)):<> int(sgn(i-j))
fun{}
compare_int_intinf
  {i,j:int}
  (x: int(i), y: !intinf(j)):<> int(sgn(i-j))
fun{}
compare_intinf_intinf
  {i,j:int}
  (x: !intinf(i), y: !intinf(j)):<> int(sgn(i-j))
//
overload compare with compare_intinf_int
overload compare with compare_int_intinf
overload compare with compare_intinf_intinf
//
(* ****** ****** *)
//
fun{}
pow_int_int
  {b,n:nat}(base: int(b), exp: int(n)): intinfGte(0)
fun{}
pow_intinf_int
  {b,n:nat}(base: !intinf(b), exp: int(n)): intinfGte(0)
//
(* ****** ****** *)

(* end of [intinf_vt.sats] *)

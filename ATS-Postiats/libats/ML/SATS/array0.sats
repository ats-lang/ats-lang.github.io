(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2013 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Start time: July, 2012 *)
(* Authoremail: gmmhwxiATgmailDOTcom *)

(* ****** ****** *)
//
#define
ATS_PACKNAME "ATSLIB.libats.ML"
//
#define
ATS_EXTERN_PREFIX "atslib_ML_" // prefix for external names
//
(* ****** ****** *)

%{#
#include \
"libats/ML/CATS/array0.cats"
%} // end of [%{#]

(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"

(* ****** ****** *)

typedef SHR(a:type) = a // for commenting purpose
typedef NSH(a:type) = a // for commenting purpose

(* ****** ****** *)

#if(0)
//
// HX: in [basis.sats]
//
abstype
array0_vt0ype_type
  (a: vt@ype(*invariant*)) = ptr
//
stadef array0 = array0_vt0ype_type
//
#endif // end of [#if(0)]

(* ****** ****** *)

(*
typedef array0(a: vt@ype) = arrszref(a)
*)

(* ****** ****** *)

(*
sortdef t0p = t@ype
sortdef vt0p = viewt@ype
*)

(* ****** ****** *)
//
fun
{a:t0p}
array0_tuple_0(): array0(a)
//
fun
{a:t0p}
array0_tuple_1(x0: a): array0(a)
fun
{a:t0p}
array0_tuple_2(x0: a, x1: a): array0(a)
fun
{a:t0p}
array0_tuple_3(x0: a, x1: a, x2: a): array0(a)
//
fun
{a:t0p}
array0_tuple_4
  (x0: a, x1: a, x2: a, x3: a): array0(a)
fun
{a:t0p}
array0_tuple_5
  (x0: a, x1: a, x2: a, x3: a, x4: a): array0(a)
fun
{a:t0p}
array0_tuple_6
  (x0: a, x1: a, x2: a, x3: a, x4: a, x5: a): array0(a)
//
(* ****** ****** *)
//
symintr array0_tuple
//
overload
array0_tuple with array0_tuple_0
overload
array0_tuple with array0_tuple_1
overload
array0_tuple with array0_tuple_2
overload
array0_tuple with array0_tuple_3
overload
array0_tuple with array0_tuple_4
overload
array0_tuple with array0_tuple_5
overload
array0_tuple with array0_tuple_6
//
(* ****** ****** *)
//
fun{}
array0_of_arrszref
  {a:vt0p}(arrszref(a)):<> array0(a)
//
fun{}
arrszref_of_array0
  {a:vt0p}(A: array0(a)):<> arrszref(a)
//
(* ****** ****** *)
//
fun{}
array0_make_arrpsz
  {a:vt0p}{n:int}
  (psz: arrpsz(INV(a), n)):<!wrt> array0(a)
//
fun{}
array0_make_arrayref
  {a:vt0p}{n:int}
  (Arf: arrayref(a, n), n: size_t(n)):<!wrt> array0(a)
//
symintr array0
//
overload array0 with array0_make_arrpsz
overload array0 with array0_make_arrayref
//
(* ****** ****** *)
//
fun{}
array0_get_ref
{a:vt0p}(A: array0(a)):<> Ptr1
fun{}
array0_get_size
{a:vt0p}(A: array0(a)):<> size_t
fun{}
array0_get_length
{a:vt0p}(A: array0(a)):<> intGte(0)
//
fun{}
array0_get_refsize
  {a:vt0p}
(
A : array0(a)
) :<> [n:nat] (arrayref(a, n), size_t(n))
//
(* ****** ****** *)
//
symintr
array0_make_elt
//
fun{a:t0p}
array0_make_elt_int
  (asz: int, x0: a):<!wrt> array0(a)
//
fun{a:t0p}
array0_make_elt_size
  (asz: size_t, x0: a):<!wrt> array0(a)
//
overload
array0_make_elt with array0_make_elt_int
overload
array0_make_elt with array0_make_elt_size
//
(* ****** ****** *)
//
fun{a:t0p}
array0_make_list
  (xs: List(INV(a))):<!wrt> array0(a)
fun{a:t0p}
array0_make_rlist
  (xs: List(INV(a))):<!wrt> array0(a)
//
fun{a:t0p}
array0_make_list0
  (xs: list0(INV(a))):<!wrt> array0(a)
fun{a:t0p}
array0_make_rlist0
  (xs: list0(INV(a))):<!wrt> array0(a)
//
(* ****** ****** *)

fun{a:t0p}
array0_make_subarray
( A: array0(a)
, st: size_t, ln: size_t):<!wrt> array0(a)
// end of [array0_make_subarray]

(* ****** ****** *)
//
fun{a:t0p}
array0_make_stream
  (xs: stream(INV(a))):<!wrt> array0(a)
fun{a:t0p}
array0_make_stream_vt
  (xs: stream_vt(INV(a))):<!wrt> array0(a)
//
fun{}
array0_make_stream$bufsize():<> intGte(1)
//
(* ****** ****** *)

fun{a:t0p}
array0_get_at_size
  (A: array0(a), i: size_t):<!exnref> (a)
fun
{a:t0p}{tk:tk}
array0_get_at_gint
  (A: array0(a), i: g0int(tk)):<!exnref> (a)
fun
{a:t0p}{tk:tk}
array0_get_at_guint
  (A: array0(a), i: g0uint(tk)):<!exnref> (a)
//
symintr array0_get_at
//
overload
array0_get_at with array0_get_at_gint
overload
array0_get_at with array0_get_at_guint
//
(* ****** ****** *)
//
fun{a:t0p}
array0_set_at_size
( A: array0(a)
, i: size_t, x: a):<!exnrefwrt> void
fun
{a:t0p}{tk:tk}
array0_set_at_gint
( A: array0(a)
, i: g0int(tk), x: a):<!exnrefwrt> void
fun
{a:t0p}{tk:tk}
array0_set_at_guint
( A: array0(a)
, i: g0uint(tk), x: a):<!exnrefwrt> void
//
symintr array0_set_at
//
overload
array0_set_at with array0_set_at_gint
overload
array0_set_at with array0_set_at_guint
//
(* ****** ****** *)
//
fun{a:vt0p}
array0_exch_at_size
( A: array0(a)
, i: size_t, x: &a >> _):<!exnrefwrt> void
//
fun
{a:vt0p}{tk:tk}
array0_exch_at_gint
( A: array0(a)
, i: g0int(tk), x: &a >> _):<!exnrefwrt> void
fun
{a:vt0p}{tk:tk}
array0_exch_at_guint
( A: array0(a)
, i: g0uint(tk), x: &a >> _):<!exnrefwrt> void
//
symintr array0_exch_at
//
overload
array0_exch_at with array0_exch_at_gint
overload
array0_exch_at with array0_exch_at_guint
//
(* ****** ****** *)
//
fun{a:vt0p}
array0_interchange
( A: array0(a)
, i: size_t, j: size_t):<!exnrefwrt> void
// end of [array0_interchange]
//
(* ****** ****** *)
//
fun{a:vt0p}
array0_subcirculate
( A: array0(a)
, i: size_t, j: size_t):<!exnrefwrt> void
// end of [array0_subcirculate]
//
(* ****** ****** *)
//
fun{a:vt0p}
print_array0 (A: array0(a)): void
fun{a:vt0p}
prerr_array0 (A: array0(a)): void
//
(*
fun{}
fprint_array$sep (out: FILEref): void
*)
fun{a:vt0p}
fprint_array0
  (out: FILEref, A: array0(a)): void
fun{a:vt0p}
fprint_array0_sep
  (out: FILEref, A: array0(a), sep: string): void
//
(* ****** ****** *)

fun{a:t0p}
array0_copy(array0(a)):<!refwrt> array0(a)

(* ****** ****** *)
//
fun{a:t0p}
array0_append
  (array0(a), array0(a)):<!refwrt> array0(a)
// end of [array0_append]
//
overload + with array0_append
//
overload append with array0_append
overload .append with array0_append
//
(* ****** ****** *)
//
fun
{a:vt0p}
{b:vt0p}
array0_map
(
A0: array0(a), fopr: (&a) -<cloref1> b
) : array0(b) // end of [array0_map]
fun
{a:vt0p}
{b:vt0p}
array0_map_method
(
A0: array0(a), TYPE(b))(fopr: (&a) -<cloref1> b
) : array0(b) // end of [array0_map_method]
//
overload .map with array0_map_method
//
(* ****** ****** *)
//
fun
{a:vt0p}
array0_tabulate
  {n:int}
(
  asz: size_t(n), fopr: (sizeLt(n)) -<cloref1> a
) : array0(a) // end of [array0_tabulate]
//
(* ****** ****** *)
//
fun
{a:vt0p}
array0_tabulate_method_int
  {n:nat}
(
  asz: int(n))(fopr: (natLt(n)) -<cloref1> a
) : array0(a) // end of [array0_tabulate_method_int]
fun
{a:vt0p}
array0_tabulate_method_size
  {n:int}
(
  asz: size_t(n))(fopr: (sizeLt(n)) -<cloref1> a
) : array0(a) // end of [array0_tabulate_method_size]
//
overload
.array0_tabulate with array0_tabulate_method_int
overload
.array0_tabulate with array0_tabulate_method_size
//
(* ****** ****** *)
//
(*
** HX:
** Raising NotFoundExn
** if no satisfying element is found
*)
fun
{a:vt0p}
array0_find_exn
(
xs: array0(a), pred: (&a) -<cloref1> bool
) : size_t // end of [array0_find_exn]
//
fun
{a:vt0p}
array0_find_opt
(
xs: array0(a), pred: (&a) -<cloref1> bool
) : Option_vt(size_t) // end-of-function
//
(* ****** ****** *)
//
fun
{a:vt0p}
array0_exists
(
xs: array0(a), pred: (&a) -<cloref1> bool
) : bool // end of [array0_exists]
fun
{a:vt0p}
array0_exists_method
(
xs: array0(a))(pred: (&a) -<cloref1> bool
) : bool // end of [array0_exists_method]
//
overload
.exists with array0_exists_method
//
(* ****** ****** *)
//
fun
{a:t0p}
array0_iexists
( xs: array0(a)
, pred: (size_t, &a) -<cloref1> bool
) : bool // end of [array0_iexists]
//
fun
{a:t0p}
array0_iexists_method
(xs: array0(a))
(pred: ( size_t, &a ) -<cloref1> bool
) : bool // end of [array0_iexists_method]
//
overload
.iexists with array0_iexists_method
//
(* ****** ****** *)
//
fun
{a:vt0p}
array0_forall
(
xs: array0(a), pred: (&a) -<cloref1> bool
) : bool // end of [array0_forall]
fun
{a:vt0p}
array0_forall_method
(
xs: array0(a)) (pred: (&a) -<cloref1> bool
) : bool // end of [array0_forall_method]
//
overload
.forall with array0_forall_method
//
(* ****** ****** *)
//
fun
{a:t0p}
array0_iforall
( xs: array0(a)
, pred: (size_t, &a) -<cloref1> bool
) : bool // end of [array0_iforall]
//
fun
{a:t0p}
array0_iforall_method
(xs: array0(a))
(pred: ( size_t, &a ) -<cloref1> bool
) : bool // end of [array0_iforall_method]
//
overload
.iforall with array0_iforall_method
//
(* ****** ****** *)
//
fun
{a:vt0p}
array0_foreach
(
  A0: array0(a)
, fwork: (&a >> _) -<cloref1> void
) : void // end of [array0_foreach]
//
fun
{a:vt0p}
array0_foreach_method
(A0: array0(a))
(fwork: (&a >> _) -<cloref1> void): void
// end of [array0_foreach_methon]
//
overload
.foreach with array0_foreach_method
//
(* ****** ****** *)
//
fun
{a:vt0p}
array0_iforeach
(
  A0: array0(a)
, fwork: (size_t, &a >> _) -<cloref1> void
) : void // end of [array0_iforeach]
//
fun
{a:vt0p}
array0_iforeach_method
(A0: array0(a))
(fwork: (size_t, &a >> _) -<cloref1> void): void
// end of [array0_iforeach_method]
//
overload
.iforeach with array0_iforeach_method
//
(* ****** ****** *)
//
fun
{a:vt0p}
array0_rforeach
( A0: array0(a)
, fwork: (&a >> _) -<cloref1> void
) : void // end of [array0_rforeach]
//
fun
{a:vt0p}
array0_rforeach_method
(A0: array0(a))
(fwork: (&a >> _) -<cloref1> void): void
// end of [array0_rforeach]
//
overload
.rforeach with array0_rforeach_method
//
(* ****** ****** *)
//
fun{
res:vt0p}{a:vt0p
} array0_foldleft
( A0: array0(a)
, ini: res, fopr: (res, &a) -<cloref1> res
) : res // end of [array0_foldleft]
//
fun{
res:vt0p}{a:vt0p
} array0_foldleft_method
(
  A: array0(a), TYPE(res)
)
(
  ini: res, fopr: (res, &a) -<cloref1> res
) : res // end of [array0_foldleft_method]
//
overload
.foldleft with array0_foldleft_method
//
(* ****** ****** *)
//
fun{
res:vt0p}{a:vt0p
} array0_ifoldleft
( A0: array0(a), ini: res
, fopr: (res, size_t, &a) -<cloref1> res
) : res // end of [array0_ifoldleft]
//
fun{
res:vt0p}{a:vt0p
} array0_ifoldleft_method
(
  A: array0(a), TYPE(res)
)
(
  ini: res
, fopr: (res, size_t, &a) -<cloref1> res
) : res // end of [array0_ifoldleft_method]
//
overload
.ifoldleft with array0_ifoldleft_method
//
(* ****** ****** *)
//
// HX: this one is tail-recursive!
//
fun{
a:vt0p}{res:vt0p
} array0_foldright
(
  A0: array0(a)
, fopr: (&a, res) -<cloref1> res, snk: res
) : res // end of [array0_foldright]
//
fun{
a:vt0p}{res:vt0p
} array0_foldright_method
(
  A: array0(a), TYPE(res)
)
(
  fopr: (&a, res) -<cloref1> res, snk: res
) : res // end of [array0_foldright_method]
//
overload
.foldright with array0_foldright_method
//
(* ****** ****** *)
//
fun
{a:t0p}
streamize_array0_elt
  (A0: array0(a)):<!wrt> stream_vt(a)
//
(* ****** ****** *)
//
fun
{a:vt0p}
array0_is_ordered
( A0: array0(a)
, cmp: (&a, &a) -<cloref1> int): bool
//
(* ****** ****** *)
//
fun
{a:vt0p}
array0_bsearch
( A0: array0(a)
, ford: (&a) -<cloref1> int): size_t
//
(* ****** ****** *)
//
fun
{a:vt0p}
array0_quicksort
( A0: array0(a)
, cmp: (&a, &a) -<cloref1> int): void
//
(* ****** ****** *)
//
// Overloading certain symbols
//
(* ****** ****** *)
//
overload
[] with array0_get_at_gint
overload
[] with array0_set_at_gint
//
overload
[] with array0_get_at_guint
overload
[] with array0_set_at_guint
//
(* ****** ****** *)
//
overload size with array0_get_size
overload length with array0_get_length
//
overload .size with array0_get_size
overload .length with array0_get_length
//
(* ****** ****** *)

overload print with print_array0
overload prerr with print_array0
overload fprint with fprint_array0
overload fprint with fprint_array0_sep

(* ****** ****** *)

(* end of [array0.sats] *)

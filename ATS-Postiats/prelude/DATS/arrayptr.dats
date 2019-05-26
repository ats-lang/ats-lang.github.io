(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2015 Hongwei Xi, ATS Trustful Software, Inc.
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

(*
** Source:
** $PATSHOME/prelude/DATS/CODEGEN/arrayptr.atxt
** Time of generation: Wed Oct 10 21:08:52 2018
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Start time: May, 2012 *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
extern
fun
memcpy
( d0: ptr
, s0: ptr
, n0: size_t
) :<!wrt> ptr = "mac#atspre_array_memcpy"
// end of [memcpy]
//
(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_make_elt
  (asz, elt) = let
//
val
(
  pf, pfgc | p
) = array_ptr_alloc<a>(asz)
//
val () = array_initize_elt<a>(!p, asz, elt)
//
in
  arrayptr_encode(pf, pfgc | p)
end // end of [arrayptr_make_elt]

(* ****** ****** *)

implement
{}(*tmp*)
arrayptr_make_intrange
  {l,r} (l, r) = let
//
val asz = g1int2uint (r-l)
val [A:addr] A =
  arrayptr_make_uninitized<int>(asz)
//
fun loop
  {n:nat} .<n>. (
  p: ptr, asz: size_t n, l: int
) :<!wrt> void = let
in
//
if asz > 0 then let
  val () = $UN.ptr0_set<int>(p, l)
in
  loop(ptr0_succ<int>(p), pred(asz), l+1)
end else () // end of [if]
//
end // end of [loop]
//
val () = loop(ptrcast(A), asz, l)
//
in
  $UN.castvwtp0{arrayptr(intBtw(l,r),A,r-l)}(A)
end // end of [arrayptr_make_intrange]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_make_list
  (asz, xs) = let
//
prval () = lemma_list_param (xs)
//
val (
  pf, pfgc | p
) = array_ptr_alloc<a>(i2sz(asz))
//
val () = array_initize_list<a>(!p, asz, xs)
//
in
  arrayptr_encode(pf, pfgc | p)
end // end of [arrayptr_make_list]

implement
{a}(*tmp*)
arrayptr_make_rlist
  (asz, xs) = let
//
prval () = lemma_list_param (xs)
//
val (
  pf, pfgc | p
) = array_ptr_alloc<a>(i2sz(asz))
//
val () = array_initize_rlist<a>(!p, asz, xs)
//
in
  arrayptr_encode(pf, pfgc | p)
end // end of [arrayptr_make_rlist]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_make_subarray
  {n}{st,ln}(A, st, ln) = let
//
val p1 =
ptr_add<a>($UN.cast2ptr(A), st)
val (
  pf1, fpf | p1
) = $UN.ptr_vtake{array(a,ln)}(p1)
//
val A2 =
arrayptr_make_uninitized<a>(ln)
val p2 = ptrcast (A2)
prval pf2 = arrayptr_takeout (A2)
//
val () = array_copy<a>(!p2, !p1, ln)
//
prval () = fpf (pf1)
prval () = arrayptr_addback (pf2 | A2)
//
in
  A2
end // end of [arrayptr_make_subarray]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_make_list_vt
  (asz, xs) = let
//
prval() = lemma_list_vt_param(xs)
//
val (
 pf, pfgc | p
) = array_ptr_alloc<a>(i2sz(asz))
//
val () =
array_initize_list_vt<a>(!p, asz, xs)
//
in
  arrayptr_encode(pf, pfgc | p)
end // end of [arrayptr_make_list_vt]

implement
{a}(*tmp*)
arrayptr_make_rlist_vt
  (asz, xs) = let
//
prval() = lemma_list_vt_param(xs)
//
val (
 pf, pfgc | p
) = array_ptr_alloc<a>(i2sz(asz))
//
val () = array_initize_rlist_vt<a>(!p, asz, xs)
//
in
  arrayptr_encode(pf, pfgc | p)
end // end of [arrayptr_make_rlist_vt]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_make_uninitized
  (asz) = let
in
  arrayptr_encode2(array_ptr_alloc<a>(asz))
end // end of [arrayptr_uninitize]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_imake_list
  (A, asz) = res where
{
//
val p = ptrcast(A)
prval pf = arrayptr_takeout (A)
val res = list_make_array (!p, asz)
prval () = arrayptr_addback (pf | A)
} // end of [arrayptr_imake_list]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_make_stream
  (xs, asz) = let
//
fun
loop
{n:int|0 < n}
{i:nat|i <= n}
( xs: stream(a)
, p0: ptr, pi: ptr
, n0: size_t(n), i0: size_t(i)
) : (ptr, Size_t) = (
//
case+ !xs of
| stream_nil() =>
  (
    p0, i0
  ) (* stream_nil *)
| stream_cons(x, xs) =>
  if
  (i0 < n0)
  then
  let
    val () = $UN.ptr0_set<a>(pi, x)
  in
    loop
    (xs, p0, ptr_succ<a>(pi), n0, succ(i0))
  end // end of [then]
  else let
//
    val n02 = n0 + n0
    val A02 =
    arrayptr_make_uninitized<a>(n02)
    val p02 = $UN.castvwtp0{ptr}(A02)
//
    val _(*p02*) =
      memcpy(p02, p0, i0*sizeof<a>)
    val ((*freed*)) =
      arrayptr_free($UN.castvwtp0(p0))
//
    val pi = ptr_add<a>(p02, i0)
    val () = $UN.ptr0_set<a>(pi, x)
//
  in
    loop
    (xs, p02, ptr_succ<a>(pi), n02, succ(i0))
  end // end of [else]
) (* end of [loop] *)
//
val n0 =
arrayptr_make_stream$bufsize<>
  ((*void*))
//
val n0 = i2sz(n0)
val A0 = arrayptr_make_uninitized<a>(n0)
val p0 = $UN.castvwtp0{ptr}(A0)
//
val (p0, n0) =
  $effmask_all(loop(xs, p0, p0, n0, i2sz(0)))
//
in
//
  let val () = asz := n0 in $UN.castvwtp0(p0) end
//
end // end of [arrayptr_make_stream]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_make_stream_vt
  (xs, asz) = let
//
fun
loop
{n:int|0 < n}
{i:nat|i <= n}
( xs: stream_vt(a)
, p0: ptr, pi: ptr
, n0: size_t(n), i0: size_t(i)
) : (ptr, Size_t) = (
//
case+ !xs of
| ~stream_vt_nil() =>
  (
    p0, i0
  )
| ~stream_vt_cons(x, xs) =>
  if
  (i0 < n0)
  then
  let
    val () = $UN.ptr0_set<a>(pi, x)
  in
    loop
    (xs, p0, ptr_succ<a>(pi), n0, succ(i0))
  end // end of [then]
  else let
//
    val n02 = n0 + n0
    val A02 =
    arrayptr_make_uninitized<a>(n02)
    val p02 = $UN.castvwtp0{ptr}(A02)
//
    val _(*p02*) =
      memcpy(p02, p0, i0*sizeof<a>)
    val ((*freed*)) =
      arrayptr_free($UN.castvwtp0(p0))
//
    val pi = ptr_add<a>(p02, i0)
    val () = $UN.ptr0_set<a>(pi, x)
//
  in
    loop
    (xs, p02, ptr_succ<a>(pi), n02, succ(i0))
  end // end of [else]
) (* end of [loop] *)
//
val n0 =
arrayptr_make_stream$bufsize<>
  ((*void*))
//
val n0 = i2sz(n0)
val A0 = arrayptr_make_uninitized<a>(n0)
val p0 = $UN.castvwtp0{ptr}(A0)
//
val (p0, n0) =
  $effmask_all(loop(xs, p0, p0, n0, i2sz(0)))
//
in
//
  let val () = asz := n0 in $UN.castvwtp0(p0) end
//
end // end of [arrayptr_make_stream_vt]

(* ****** ****** *)
//
implement
arrayptr_make_stream$bufsize<> ((*void*)) = 16
//
(* ****** ****** *)

(*
implement
arrayptr_free = ATS_MFREE // HX: in arrayptr.cats
*)

(* ****** ****** *)

implement
{a}(*tmp*)
fprint_arrayptr
  (out, A, n) = () where
{
//
val p = ptrcast(A)
prval pf = arrayptr_takeout(A)
//
val () = fprint_array<a>(out, !p, n)
prval () = arrayptr_addback(pf | A)
//
} // end of [fprint_arrayptr]

(* ****** ****** *)

implement
{a}(*tmp*)
fprint_arrayptr_sep
  (out, A, n, sep) = () where
{
//
val p = ptrcast (A)
prval pf = arrayptr_takeout(A)
val () = fprint_array_sep<a>(out, !p, n, sep)
prval () = arrayptr_addback(pf | A)
//
} // end of [fprint_arrayptr_sep]

(* ****** ****** *)

implement
{a}{tk}
arrayptr_get_at_gint
  (A, i) = let
  val p = ptrcast(A) in
  $UN.ptr0_get<a>(ptr1_add_gint<a><tk>(p, i))
end // end of [arrayptr_get_at_gint]

implement
{a}{tk}
arrayptr_get_at_guint
  (A, i) = let
  val p = ptrcast(A) in
  $UN.ptr0_get<a>(ptr1_add_guint<a><tk>(p, i))
end // end of [arrayptr_get_at_guint]

(* ****** ****** *)

implement
{a}{tk}
arrayptr_set_at_gint
  (A, i, x) = let
  val p = ptrcast(A) in
  $UN.ptr0_set<a>(ptr1_add_gint<a><tk>(p, i), x)
end // end of [arrayptr_set_at_gint]

implement
{a}{tk}
arrayptr_set_at_guint
  (A, i, x) = let
  val p = ptrcast(A) in
  $UN.ptr0_set<a>(ptr1_add_guint<a><tk>(p, i), x)
end // end of [arrayptr_set_at_guint]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_interchange
  (A, i, j) = let
//
  val p = ptrcast (A)
  prval pfarr = arrayptr_takeout (A)
  val () = array_interchange (!p, i, j)
  prval () = arrayptr_addback (pfarr | A)
//
in
  // noting
end // end of [arrayptr_interchange]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_foreach
  (A, asz) = let
  var env: void = () in
  arrayptr_foreach_env<a><void>(A, asz, env)
end // end of [arrayptr_foreach]

implement
{a}{env}
arrayptr_foreach_env
  (A, asz, env) = res where {
//
val p = ptrcast (A)
prval pfarr = arrayptr_takeout(A)
//
val res =
array_foreach_env<a><env>(!p, asz, env)
prval () = arrayptr_addback{a}(pfarr | A)
//
} // end of [arrayptr_foreach_env]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_foreach_funenv
  (pfv | A, asz, f, env) = let
//
val p = ptrcast (A)
prval pfarr = arrayptr_takeout(A)
//
val () =
array_foreach_funenv<a>(pfv | !p, asz, f, env)
prval () = arrayptr_addback{a}(pfarr | A)
//
in
  // nothing
end // end of [arrayptr_foreach_funenv]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_iforeach
  (A, asz) = let
  var env: void = () in
  arrayptr_iforeach_env<a><void>(A, asz, env)
end // end of [arrayptr_iforeach]

implement
{a}{env}
arrayptr_iforeach_env
  (A, asz, env) = res where {
//
val p = ptrcast (A)
prval pfarr = arrayptr_takeout (A)
//
val res =
array_iforeach_env<a><env>(!p, asz, env)
prval () = arrayptr_addback{a}(pfarr | A)
//
} // end of [arrayptr_iforeach_env]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_rforeach
  (A, asz) = let
  var env: void = () in
  arrayptr_rforeach_env<a><void>(A, asz, env)
end // end of [arrayptr_rforeach]

implement
{a}{env}
arrayptr_rforeach_env
  (A, asz, env) = res where {
//
val p = ptrcast(A)
prval pfarr = arrayptr_takeout(A)
//
val res =
array_rforeach_env<a><env>(!p, asz, env)
prval () = arrayptr_addback{a}(pfarr | A)
//
} // end of [arrayptr_rforeach_env]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_initize
  (A, asz) = () where {
//
val p = ptrcast(A)
prval pfarr = arrayptr_takeout(A)
//
val () = array_initize<a>(!p, asz)
prval () = arrayptr_addback{a}(pfarr | A)
//
} // end of [arrayptr_initize]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_uninitize
  (A, asz) = () where {
//
val p = ptrcast(A)
prval pfarr = arrayptr_takeout(A)
//
val () = array_uninitize<a>(!p, asz)
prval () = arrayptr_addback{a?}(pfarr | A)
//
} // end of [arrayptr_uninitize]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_freelin
  (A, asz) = let
//
val () = arrayptr_uninitize<a>(A, asz)
//
in
  arrayptr_free{a?}(A)
end // end of [arrayptr_freelin]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_tabulate
  (asz) =
  arrayptr_encode2(array_ptr_tabulate<a>(asz))
// end of [arrayptr_tabulate]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_bsearch
  (A, asz) = res where
{
//
val p = ptrcast(A)
prval pfarr = arrayptr_takeout(A)
//
val res = array_bsearch<a>(!p, asz)
prval () = arrayptr_addback{a}(pfarr | A)
//
} (* end of [arrayptr_bsearch] *)

(* ****** ****** *)

implement
{a}(*tmp*)
arrayptr_quicksort
  (A, asz) = () where
{
//
val p = ptrcast(A)
prval pfarr = arrayptr_takeout(A)
//
val () = array_quicksort<a>(!p, asz)
prval () = arrayptr_addback{a}(pfarr | A)
//
} (* end of [arrayptr_quicksort] *)

(* ****** ****** *)

(* end of [arrayptr.dats] *)

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
** $PATSHOME/prelude/DATS/CODEGEN/unsafe.atxt
** Time of generation: Wed Oct 10 21:08:48 2018
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: April, 2012 *)

(* ****** ****** *)

staload "prelude/SATS/unsafe.sats"

(* ****** ****** *)

implement
{}(*tmp*)
int2ptr(i) = cast{ptr}(cast{intptr}(i))
implement
{}(*tmp*)
ptr2int(p) = cast{int}(cast{intptr}(p))

(* ****** ****** *)

implement
{a}(*tmp*)
ptr0_get
  (p) = x where {
  val [l:addr]
    p = g1ofg0_ptr(p)
  prval (pf, fpf) = __assert () where {
    extern praxi __assert (): (a @ l, a? @ l -<lin,prf> void)
  } // end of [prval]
  val x = !p
  prval () = fpf (pf)
} // end of [ptr0_get]

implement{a} ptr1_get = ptr0_get<a>

(* ****** ****** *)

implement
{a}(*tmp*)
ptr0_set
  (p, x) = () where {
  val [l:addr]
    p = g1ofg0_ptr(p)
  prval (pf, fpf) = __assert () where {
    extern praxi __assert (): (a? @ l, a @ l -<lin,prf> void)
  } // end of [prval]
  val () = !p := x
  prval () = fpf (pf)
} // end of [ptr0_set]

implement{a} ptr1_set = ptr0_set<a>

(* ****** ****** *)

implement
{a}(*tmp*)
ptr0_exch
  (p, x) = () where {
  val p = g1ofg0_ptr(p)
  val (pf, fpf | p) = ptr_vtake{a}(p)
  val tmp = !p
  val ( ) = !p := x
  val ( ) = x := tmp
  prval () = fpf (pf)
} // end of [ptr0_exch]

implement{a} ptr1_exch = ptr0_exch<a>

(* ****** ****** *)

implement
{a}(*tmp*)
ptr0_intch
  (p1, p2) = () where {
  val p1 = g1ofg0_ptr(p1)
  val p2 = g1ofg0_ptr(p2)
  val (pf1, fpf1 | p1) = ptr_vtake{a}(p1)
  val (pf2, fpf2 | p2) = ptr_vtake{a}(p2)
  val tmp = !p1
  val ( ) = !p1 := !p2
  val ( ) = !p2 := tmp
  prval () = fpf1 (pf1)
  prval () = fpf2 (pf2)
} (* end of [ptr0_intch] *)

implement{a} ptr1_intch = ptr0_intch<a>

(* ****** ****** *)

implement
{a}(*tmp*)
ptr0_getinc(p0) = let
  val p = p0
  val x = ptr0_get<a>(p)
  val () = p0 := ptr_succ<a>(p) in (x)
end // end of [ptr0_getinc]
implement
{a}(*tmp*)
ptr1_getinc(p0) = let
  val p = p0
  val x = ptr0_get<a>(p)
  val () = p0 := ptr_succ<a>(p) in (x)
end // end of [ptr1_getinc]

(* ****** ****** *)

implement
{a}(*tmp*)
ptr0_setinc(p0, x) = let
  val p = p0
  val () = ptr0_set<a>(p, x)
  val () = p0 := ptr_succ<a>(p) in (*void*)
end // end of [ptr0_setinc]
implement
{a}(*tmp*)
ptr1_setinc(p0, x) = let
  val p = p0
  val () = ptr0_set<a>(p, x)
  val () = p0 := ptr_succ<a>(p) in (*void*)
end // end of [ptr1_setinc]

(* ****** ****** *)
//
implement
{a}(*tmp*)
ptr0_get_at_int(p, i) =
  ptr0_get<a>(ptr0_add_gint<a>(p, i))
implement
{a}(*tmp*)
ptr0_set_at_int(p, i, x) =
  ptr0_set<a>(ptr0_add_gint<a>(p, i), x)
//
implement
{a}(*tmp*)
ptr0_get_at_size(p, i) =
  ptr0_get<a>(ptr0_add_guint<a>(p, i))
implement
{a}(*tmp*)
ptr0_set_at_size(p, i, x) =
  ptr0_set<a>(ptr0_add_guint<a>(p, i), x)
//
(* ****** ****** *)

implement
{a}(*tmp*)
cptr_get(p) = ptr1_get<a>(cptr2ptr(p))

implement
{a}(*tmp*)
cptr_set(p, x) = ptr1_set<a>(cptr2ptr(p), x)

implement
{a}(*tmp*)
cptr_exch(p, x) = ptr1_exch<a>(cptr2ptr(p), x)

(* ****** ****** *)

implement
{a}(*tmp*)
ptr0_addby
  (p, x) = let
  val x0 = ptr0_get<a>(p)
in
ptr0_set<a>(p, gadd_val_val<a>(x0, x))
end // end of [ptr0_addby]
implement{a} ptr1_addby = ptr0_addby<a>

implement
{a}(*tmp*)
ptr0_subby
  (p, x) = let
  val x0 = ptr0_get<a>(p)
in
ptr0_set<a>(p, gsub_val_val<a>(x0, x))
end // end of [ptr0_subby]
implement{a} ptr1_subby = ptr0_subby<a>

implement
{a}(*tmp*)
ptr0_mulby
  (p, x) = let
  val x0 = ptr0_get<a>(p)
in
ptr0_set<a>(p, gmul_val_val<a>(x0, x))
end // end of [ptr0_mulby]
implement{a} ptr1_mulby = ptr0_mulby<a>

implement
{a}(*tmp*)
ptr0_divby
  (p, x) = let
  val x0 = ptr0_get<a>(p)
in
ptr0_set<a>(p, gdiv_val_val<a>(x0, x))
end // end of [ptr0_divby]
implement{a} ptr1_divby = ptr0_divby<a>

implement
{a}(*tmp*)
ptr0_modby
  (p, x) = let
//
val x0 = ptr0_get<a>(p)
//
in
ptr0_set<a>(p, gmod_val_val<a>(x0, x))
end // end of [ptr0_modby]
implement{a} ptr1_modby = ptr0_modby<a>

(* ****** ****** *)

implement
{a}(*tmp*)
ptr1_list_next
  (p) = p_next where
{
  val xs =
  castvwtp1{list_vt(a,1)}(p)
  val+@list_vt_cons(_, xs_next) = xs
  val p_next = addr@(xs_next)
  prval ((*void*)) = fold@ (xs)
  prval ((*void*)) = cast2void (xs)
} (* end of [ptr1_list_next] *)

(* ****** ****** *)

implement
{}(*tmp*)
string_get_at(src, i) =
ptr0_get_at<char>(string2ptr(src), i)

(* ****** ****** *)

(* end of [unsafe.dats] *)

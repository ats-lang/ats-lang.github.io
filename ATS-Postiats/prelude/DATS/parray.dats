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

(* Author: Hongwei Xi *)
(* Start time: April, 2012 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/DATS/CODEGEN/parray.atxt
** Time of generation: Wed Oct 10 21:08:53 2018
*)

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

implement
{a}(*tmp*)
parray_is_empty
  {l}{n}(pf | p) = let
//
prval () =
  lemma_parray_v_params(pf)
//
val x = $UN.ptr0_get<ptr>(p)
val [lx:addr] x = g1ofg0_ptr(x)
//
prval () =
__assert__() where
{
extern praxi
__assert__(): [(lx <= null && n==0) || (lx > null && n > 0)] void
} (* end of [prval] *)
//
in
  lte_ptr1_ptr1(x, the_null_ptr)
end // end of [parray_is_empty]

implement
{a}(*tmp*)
parray_isnot_empty
  {l}{n} (pf | p) = let
//
prval () =
  lemma_parray_v_params(pf)
//
val x = $UN.ptr0_get<ptr>(p)
val [lx:addr] x = g1ofg0_ptr(x)
//
prval () =
__assert__() where
{
extern praxi
__assert__ (): [(lx <= null && n==0) || (lx > null && n > 0)] void
} (* end of [prval] *)
//
in
  gt_ptr1_ptr1(x, the_null_ptr)
end // end of [parray_isnot_empty]

(* ****** ****** *)

implement
{a}(*tmp*)
parray_size
  (pf | p0) = let
//
fun
loop
{l:addr}
{i,j:nat} .<i>.
(
  pf: !parray_v(a, l, i)
| p0: ptr(l), j0: size_t(j)
) :<> size_t(i+j) = let
//
  val
  isnot =
  parray_isnot_empty<a>(pf | p0)
//
in
//
  if
  isnot
  then asz where
  {
  prval
  parray_v_cons
    (pf1, pf2) = pf
    val asz =
    loop(pf2 | ptr_succ<a>(p0), j0+1)
  prval ((*returned*)) =
    (pf := parray_v_cons{a}(pf1, pf2))
  } (* end of [then] *)
  else (j0) // end of [else]
// end if [if]
end (* end of [loop] *)
//
in
let
prval () =
lemma_parray_v_params(pf) in loop(pf | p0, i2sz(0))
end // end of [let]
end // end of [parray_size]

(* ****** ****** *)

(* end of [parray.dats] *)

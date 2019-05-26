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
** $PATSHOME/prelude/DATS/CODEGEN/intrange.atxt
** Time of generation: Wed Oct 10 21:08:49 2018
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: June, 2012 *)

(* ****** ****** *)

implement
{}(*tmp*)
intrange_forall
  (l, r) =
  loop(l, r) where
{
//
fun
loop
(l: int, r: int): bool =
(
if
(l < r)
  then (
    if
    intrange_forall$pred<>(l)
    then loop(l+1, r) else false
  ) else true // end of [if]
// end of [if]
)
//
} (* end of [intrange_forall] *)

(* ****** ****** *)

implement
{}(*tmp*)
intrange_foreach
  (l, r) = let
  var env: void = ()
in
  intrange_foreach_env<void>(l, r, env)
end // end of [intrange_foreach]

implement
{tenv}(*tmp*)
intrange_foreach_env
  (l, r, env) = let
//
fun loop
(
  l: int, r: int, env: &tenv >> _
) : int =
(
//
if
l < r
then let
  val cont = intrange_foreach$cont<tenv>(l, env)
in
//
if
cont
then (
  intrange_foreach$fwork<tenv>(l, env); loop(succ(l), r, env)
) else l // end of [if]
//
end // end of [then]
else l // end of [else]
//
) // end of [loop]
//
in
  loop (l, r, env)
end // end of [intrange_foreach_env]

(* ****** ****** *)

implement
{tenv}(*tmp*)
intrange_foreach$cont(i, env) = true
(*
implement
{tenv}(*tmp*)
intrange_foreach$fwork(i, env) = ((*void*))
*)

(* ****** ****** *)

implement
{}(*tmp*)
intrange_rforeach
  (l, r) = let
  var env: void = ()
in
  intrange_rforeach_env<void>(l, r, env)
end // end of [intrange_rforeach]

implement
{tenv}(*tmp*)
intrange_rforeach_env
  (l, r, env) = let
//
fun loop
(
  l: int, r: int, env: &tenv
) : int =
(
//
if
l < r
then let
  val r1 = pred (r)
  val cont = intrange_rforeach$cont<tenv>(r1, env)
in
//
if
cont
then (
  intrange_rforeach$fwork<tenv>(r1, env); loop(l, r1, env)
) else r // end of [if]
//
end // end of [then]
else r // end of [else]
//
) // end of [loop]
//
in
  loop (l, r, env)
end // end of [intrange_rforeach_env]

(* ****** ****** *)

implement
{tenv}(*tmp*)
intrange_rforeach$cont(i, env) = true
(*
implement
{tenv}(*tmp*)
intrange_rforeach$fwork(i, env) = ((*void*))
*)

(* ****** ****** *)

implement
{}(*tmp*)
intrange2_foreach
  (l1, r1, l2, r2) = let
  var env: void = () in
  intrange2_foreach_env<void>(l1, r1, l2, r2, env)
end // end of [intrange2_foreach]

(* ****** ****** *)

implement
{tenv}(*tmp*)
intrange2_foreach_env
  (l1, r1, l2, r2, env) = let
//
fnx
loop1
(
  i: int, env: &(tenv) >> _
) : void =
(
if i < r1 then loop2(i, l2, env) else ()
)
//
and
loop2
(
  i: int, j: int, env: &(tenv) >> _
) : void =
(
if
j < r2
then (
  intrange2_foreach$fwork(i, j, env); loop2(i, j+1, env)
) else loop1 (i+1, env)
)
//
in
  loop1 (l1, env)
end // end of [intrange2_foreach]

(* ****** ****** *)

implement
{}(*tmp*)
streamize_intrange_l
  (m) = aux0(m) where
{
//
vtypedef res_vt = stream_vt(int)
//
fun aux0
(
  m: int
) : res_vt = $ldelay(stream_vt_cons(m, aux0(m+1)))
//
} (* end of [streamize_intrange_l] *)

(* ****** ****** *)

implement
{}(*tmp*)
streamize_intrange_0r(n) = streamize_intrange_lr<>(0, n)

(* ****** ****** *)

implement
{}(*tmp*)
streamize_intrange_lr
  (m, n) = aux0(m) where
{
//
vtypedef res_vt = stream_vt(int)
//
fun aux0
(
  m: int
) : res_vt = $ldelay
(
  if m < n
    then stream_vt_cons(m, aux0(m+1)) else stream_vt_nil()
  // end of [if]
) : stream_vt_con(int) // [aux0]
//
} (* end of [streamize_intrange_lr] *)

(* ****** ****** *)

(* end of [intrange.dats] *)

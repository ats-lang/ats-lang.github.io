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
(* Start time: Feburary, 2012 *)
(* Authoremail: gmhwxiATgmailDOTcom *)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/DATS/CODEGEN/option.atxt
** Time of generation: Wed Oct 10 21:08:51 2018
*)

(* ****** ****** *)

implement{a}
option_some(x) = Some(x)
implement{a}
option_none( ) = None(*void*)

(* ****** ****** *)

implement
{}(*tmp*)
option2bool
  (opt) =
(
case+ opt of
| Some _ => true | None _ => false
) (* end of [option2bool] *)

(* ****** ****** *)

implement
{}(*tmp*)
option_is_some
  (opt) =
(
case+ opt of
| Some _ => true | None _ => false
) (* end of [option_is_some] *)

implement
{}(*tmp*)
option_is_none
  (opt) =
(
case+ opt of
| Some _ => false | None _ => true
) (* end of [option_is_none] *)

(* ****** ****** *)
//
implement
{a}(*tmp*)
option_unsome
  (opt) =
(
  x0
) where { val+Some(x0) = opt }
//
implement
{a}(*tmp*)
option_unsome_exn
  (opt) =
(
case+ opt of
| Some x0 => x0
| None () => $raise NotSomeExn()
) (* option_unsome_exn *)
//
(* ****** ****** *)

implement
{a}(*tmp*)
option_equal
  (opt1, opt2) =
(
//
case+ opt1 of
| None () =>
  (
    case+ opt1 of
    | None() => true | Some _ => false
  ) (* end of [None] *)
| Some x1 =>
  (
    case+ opt2 of
    | None() => false
    | Some(x2) => option_equal$eqfn(x1, x2)
  ) (* end of [Some] *)
//
) (* end of [option_equal] *)

(* ****** ****** *)
//
implement
{a}(*tmp*)
print_option(opt) =
fprint_option<a>(stdout_ref, opt)
implement
{a}(*tmp*)
prerr_option(opt) =
fprint_option<a>(stderr_ref, opt)
//
implement
{a}(*tmp*)
fprint_option
  (out, opt) =
(
//
case+ opt of
| Some x => {
    val () =
      fprint_string(out, "Some(")
    // end of [val]
    val () = fprint_val<a> (out, x)
    val () = fprint_string (out, ")")
  } (* end of [Some] *)
| None _ => fprint_string(out, "None()")
//
) (* end of [fprint_option] *)
//
(* ****** ****** *)

(* end of [option.dats] *)

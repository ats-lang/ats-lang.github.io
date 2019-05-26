(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2013 Hongwei Xi, ATS Trustful Software, Inc.
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
(* Start time: June, 2013 *)
(* Authoremail: gmhwxiATgmailDOTcom *)

(* ****** ****** *)

#define ATS_PACKNAME "ATSLIB.libats.ML"
#define ATS_EXTERN_PREFIX "atslib_ML_" // prefix for external names

(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"

(* ****** ****** *)

typedef SHR(a:type) = a // for commenting purpose
typedef NSH(a:type) = a // for commenting purpose

(* ****** ****** *)
//
fun{}
getenv_exn (name: NSH(string)): string
//
fun{}
getenv_opt (name: NSH(string)): option0 (string)
//
(* ****** ****** *)
//
fun{}
setenv_exn
(
  name: NSH(string), value: NSH(string), overwrite: int
) : void // end of [setenv_exn]
//
fun{}
setenv_err
(
  name: NSH(string), value: NSH(string), overwrite: int
) : int(*err*) // end of [setenv_err]
//
(* ****** ****** *)
//
// HX:
// Default implementation
// is based on STDLIB.random
//
fun{}
randint{n:pos}(n: int(n)): natLt(n)
//
(* ****** ****** *)
//
fun{}
streamize_random((*void*)): stream_vt(intGte(0))
fun{}
streamize_randint{n:pos}(int(n)): stream_vt(natLt(n))
//
(* ****** ****** *)
//
(*
fun{}
streamize_random_r(seed: uint): stream_vt(intGte(0))
*)
//
(* ****** ****** *)

(* end of [stdlib.sats] *)

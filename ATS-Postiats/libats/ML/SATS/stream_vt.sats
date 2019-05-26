(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2016 Hongwei Xi, ATS Trustful Software, Inc.
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
(* Authoremail: gmmhwxiATgmailDOTcom *)
(* Start time: October, 2016 *)

(* ****** ****** *)
//
#define
ATS_PACKNAME "ATSLIB.libats.ML"
#define
ATS_EXTERN_PREFIX "atslib_ML_" // prefix for external names
//
(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)
//
fun
{a:t0p}
stream2list0_vt
  (xs: stream_vt(a)):<!wrt> list0(a)
//
(* ****** ****** *)
//
fun
{a:t0p}
stream_vt_make_list0
  (xs: list0(a)):<!laz> stream_vt(a)
//
(* ****** ****** *)
//
fun{}
intGte_stream_vt
  (start: int):<!laz> stream_vt(int)
//
(* ****** ****** *)
//
fun{}
stream_vt_make_intrange_lr
  (l: int, r: int):<!laz> stream_vt(int)
fun{}
stream_vt_make_intrange_lrd
  (l: int, r: int, d: int):<!laz> stream_vt(int)
//
(* ****** ****** *)
//
overload
intrange_stream_vt
with
stream_vt_make_intrange_lr
overload
intrange_stream_vt
with
stream_vt_make_intrange_lrd
//
(* ****** ****** *)
//
fun{
a:vt0p}{b:vt0p
} stream_vt_map_method
(
  stream_vt(INV(a)), TYPE(b)
) :
(
  (&a >> a?!) -<cloptr1> b
) -<lincloptr1> stream_vt(b)
//
overload .map with stream_vt_map_method
//
(* ****** ****** *)
//
fun{a:t0p}
stream_vt_filter_method
(
xs: stream_vt(INV(a))
) : ((&a)-<cloptr1>bool)-<lincloptr1>stream_vt(a)
//
overload .filter with stream_vt_filter_method
//
(* ****** ****** *)
//
fun{a:vt0p}
stream_vt_foreach_method
  (xs: stream_vt(INV(a))) 
: ((&a >> a?!) -<cloptr1> void) -<lincloptr1> void
//
fun{a:vt0p}
stream_vt_rforeach_method
  (xs: stream_vt(INV(a))) 
: ((&a >> a?!) -<cloptr1> void) -<lincloptr1> void
//
overload .foreach with stream_vt_foreach_method
overload .rforeach with stream_vt_rforeach_method
//
(* ****** ****** *)
//
fun{a:vt0p}
stream_vt_iforeach_method
  (xs: stream_vt(INV(a))) 
: ((intGte(0), &a >> a?!) -<cloptr1> void) -<lincloptr1> void
//
overload .iforeach with stream_vt_iforeach_method
//
(* ****** ****** *)
//
fun{
res:vt0p
}{a:vt0p}
stream_vt_foldleft_method
(
  xs: stream_vt(INV(a)), TYPE(res)
) : (res, (res, &a >> a?!) -<cloptr1> res) -<lincloptr1> res
fun{
res:vt0p
}{a:vt0p}
stream_vt_ifoldleft_method
(
  xs: stream_vt(INV(a)), TYPE(res)
) : (res, (intGte(0), res, &a >> a?!) -<cloptr1> res) -<lincloptr1> res
//
overload .foldleft with stream_vt_foldleft_method
overload .ifoldleft with stream_vt_ifoldleft_method
//
(* ****** ****** *)

(* end of [stream_vt.sats] *)

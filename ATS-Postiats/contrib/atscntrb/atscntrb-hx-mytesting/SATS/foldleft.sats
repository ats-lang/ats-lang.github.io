(***********************************************************************)
(*                                                                     *)
(*                         ATS/contrib/atshwxi                         *)
(*                                                                     *)
(***********************************************************************)

(*
** Copyright (C) 2012-2018 Hongwei Xi, ATS Trustful Software, Inc.
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
** 
*)

(* ****** ****** *)

(*
** HX:
** Some functions for
** left-folding aggregates
*)

(* ****** ****** *)
//
#define
ATS_PACKNAME "ATSCNTRB.HX.mytesting"
//
(* ****** ****** *)
//
fun
{res:vt0p}
foldleft_int(n: intGte(0), ini: res): res
fun
{res:vt0p}
foldleft_int$fwork(res: res, i: intGte(0)): res
//
(* ****** ****** *)
//
fun
{x:t0p}
{res:vt0p}
foldleft_list
  (xs: List(x), ini: res): res
fun
{x:t0p}
{res:vt0p}
foldleft_list$fwork(res: res, x: x): res
//
(* ****** ****** *)
//
fun
{x:vt0p}
{res:vt0p}
foldleft_list_vt
  (xs: !List_vt(x), ini: res): res
fun
{x:vt0p}
{res:vt0p}
foldleft_list_vt$fwork(res: res, x: &x >> _): res
//
(* ****** ****** *)
//
fun
{x:vt0p}
{res:vt0p}
foldleft_array
  {n:int}
(
  A: &(@[x][n]) >> _, n: size_t n, ini: res
) : res // end of [foldleft_array]
fun
{x:vt0p}
{res:vt0p}
foldleft_array$fwork(acc: res, x: &x >> _): res
//
(* ****** ****** *)

(* end of [foldleft.sats] *)

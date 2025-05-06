(***********************************************************************)
(*                                                                     *)
(*                         ATS/contrib/atshwxi                         *)
(*                                                                     *)
(***********************************************************************)

(*
** Copyright (C) 2012-2013 Hongwei Xi, ATS Trustful Software, Inc.
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
** Functions for generating random data
*)

(* ****** ****** *)

#define
ATS_PACKNAME "ATSCNTRB.atshwxi.testing"

(* ****** ****** *)

(*
sortdef t0p = t@ype and vt0p = viewt@ype
*)

(* ****** ****** *)

(*
** HX:
** please use srandom for seeding
*)

(* ****** ****** *)

fun{}
randint{n:pos} (n: int n): natLt (n)

(* ****** ****** *)

fun{a:vt0p}
randgen_val (): a // for randval generation
fun{a:vt0p}
randgen_ref (x: &(a?) >> a): void // for randval initialization

(* ****** ****** *)

fun{a:t0p}
randgen_list {n:nat} (n: int n): list (a, n)
fun{a:vt0p}
randgen_list_vt {n:nat} (n: int n): list_vt (a, n)

(* ****** ****** *)
//
fun{a:vt0p}
randgen_arrayptr
  {n:int} (n: size_t(n)): arrayptr (a, n)
fun{a:vt0p}
randgen_arrayref
  {n:int} (n: size_t(n)): arrayref (a, n)
fun{a:vt0p}
randgen_arrszref (n: size_t): arrszref (a)
//
(* ****** ****** *)

fun{a:vt0p}
randarr_initize
  {n:int} (A: &(@[a?][n]) >> @[a][n], n: size_t n): void
// end of [randarr_initize]

(* ****** ****** *)
//
fun{a:vt0p}
randgen_matrixptr
  {m,n:int}
  (size_t (m), size_t (n)): matrixptr (a, m, n)
fun{a:vt0p}
randgen_matrixref
  {m,n:int}
  (m: size_t (m), n: size_t (n)): matrixref (a, m, n)
fun{a:vt0p}
randgen_mtrxszref (m: size_t, n: size_t): mtrxszref (a)
//
(* ****** ****** *)

(* end of [randgen.sats] *)

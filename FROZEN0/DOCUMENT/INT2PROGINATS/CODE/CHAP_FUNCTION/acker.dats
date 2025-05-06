(*
** Copyright (C) 2011 Hongwei Xi, ATS Trustful Software, Inc.
**
** Permission is hereby granted, free of charge, to any person
** obtaining a copy of this software and associated documentation
** files (the "Software"), to deal in the Software without
** restriction, including without limitation the rights to use,
** copy, modify, merge, publish, distribute, sublicense, and/or sell
** copies of the Software, and to permit persons to whom the
** Software is furnished to do so, subject to the following
** conditions:
**
** The above copyright notice and this permission notice shall be
** included in all copies or substantial portions of the Software.
**
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
** OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
** NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
** HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
** WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
** FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
** OTHER DEALINGS IN THE SOFTWARE.
*)

(* ****** ****** *)

(*
** Example:
** Implementations of the Ackermann function
**
** Author: Hongwei Xi (hwxi AT cs DOT bu DOT edu)
** Time: January, 2011
*)

(* ****** ****** *)

(*
** Ported to ATS2 by Hongwei Xi (gmhwxiATgmailDOTcom)
** Time: May 10, 2013
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

fun acker1
  (m: int, n: int): int =
(
  if m > 0 then
    if n > 0 then acker1 (m-1, acker1 (m, n-1)) else acker1 (m-1, 1)
  else n+1 // end of [if]
)

(* ****** ****** *)

fun acker2
  (m: int) (n: int): int =
(
  if m > 0 then
    if n > 0 then acker2 (m-1) (acker2 m (n-1)) else acker2 (m-1) 1
  else n+1 // end of [if]
)

(* ****** ****** *)

(*
//
// HX-2015-01-29: no leaks
//
fun
acker3(m: int) =
lam (n: int): int =<cloptr1>
(
  if m > 0 then
    if n > 0 then acker3 (m-1) (acker3 m (n-1)) else acker3 (m-1) 1
  else n+1 // end of [if]
) (* end of [acker3] *)
*)

(* ****** ****** *)

implement
main0 () =
{
val () = assertloc (acker1 (3, 3) = 61)
val () = assertloc (acker2 (3) (3) = 61)
(*
val () = assertloc (acker3 (3) (3) = 61) // HX: no leaks
*)
} // end of [main0]

(* ****** ****** *)

(* end of [acker.dats]  *)

//usr/bin/env myatscc "$0"; exit
(* ****** ****** *)
//
// Illustrating tail-recursion
//
// Author: Hongwei Xi (December 31, 2012)
//
(* ****** ****** *)
(*
//
// HX-2017-05-22:
// For remote typechecking only!
//
##myatsccdef=\
curl --data-urlencode mycode@$1 \
http://www.ats-lang.org/SERVER/MYCODE/atslangweb_patsopt_tcats_0_.php | \
php -R 'if (\$argn != \"\") echo(json_decode(urldecode(\$argn))[1].\"\\n\");'
//
*)
(* ****** ****** *)
//
staload "prelude/lmacrodef.hats"
//
(* ****** ****** *)
//
staload INT = "prelude/DATS/integer.dats"
staload LINT = "prelude/DATS/integer_long.dats"
staload INTRANGE = "prelude/DATS/intrange.dats"
//
(* ****** ****** *)

fun tally
  (n: int): int = let
//
fun loop (n: int, res: int): int =
  if n > 0 then loop (n-1, res + n) else res
//
in
  loop (n, 0)
end // end of [tally]

(* ****** ****** *)

fun tally2
  (n: int): ullint = let
//
var n: int = n
var i: int // uninitialized
var res: ullint = 0ull
val () = for (i := 1 ; i <= n ; i :=+ 1) res :=+ g0i2u(i)
//
in
  res
end // end of [tally2]

(* ****** ****** *)

fun
tally3
(
 n: int
) : ullint =
  res where
{
//
var n: int = n
var i: int = 1
var res: ullint = 0ull
//
val () =
while (true)
(
if i > n
  then $break
  else (res :=+ g0i2u(i); i :=+ 1)
// end of [if]
) (* end of [val] *)
//
} // end of [tally3]

(* ****** ****** *)
//
// HX: this one makes use of closure
//
fun
tally4
(
 n: int
) : ullint = let
//
fun loop
(
  i: int, res: ullint
) : ullint =
if i <= n
  then loop (i+1, res + g0i2u(i)) else res
//
in
  loop (0, 0ull)
end // end of [tally4]

(* ****** ****** *)

fun
tally5
(
 n: int
) : int =
  res where
{
//
var res = 0: int
prval pf_res = view@ (res)
//
implement{env}
intrange_foreach$fwork
  (i, env) = let
//
prval
(pf_res, fpf) =
decode($vcopyenv_v(pf_res))
//
val () = res := res + i
//
prval ((*returned*)) = fpf(pf_res)
//
in
  // nothing
end
//
val _ = intrange_foreach(1, n+1)
//
prval ((*returned*)) = view@(res) := pf_res
//
} (* end of [tally5] *)

(* ****** ****** *)

implement 
main () = let
//
#define N 1000
//
val () = assertloc(tally (N) = N * (N+1) / 2)
val () = assertloc(tally2 (N) = N * (N+1) / 2)
val () = assertloc(tally3 (N) = N * (N+1) / 2)
val () = assertloc(tally4 (N) = N * (N+1) / 2)
val () = assertloc(tally5 (N) = N * (N+1) / 2)
//
val () = println!("Testing for [tally] is done!")
//
in
  0(*normalexit*)
end // end of [main]

(* ****** ****** *)

(* end of [tally.dats] *)

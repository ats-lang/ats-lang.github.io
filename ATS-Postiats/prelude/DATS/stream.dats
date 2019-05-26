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
(* Start time: July, 2012 *)
(* Authoremail: gmhwxiATgmailDOTcom *)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/DATS/CODEGEN/list.atxt
** Time of generation: Fri Feb 15 23:45:47 2019
*)

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
implement
{a}(*tmp*)
stream_is_nil(xs) =
(
case+ !xs of
| stream_nil _ => true | stream_cons _ => false
)
implement
{a}(*tmp*)
stream_is_cons(xs) = not(stream_is_nil<a>(xs))
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
stream_make_nil() =
  $delay(stream_nil{a}())
//
implement
{a}(*tmp*)
stream_make_cons
  (x, xs) = $delay(stream_cons{a}(x, xs))
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
stream_sing(x) =
  stream_cons{a}(x, $delay(stream_nil))
//
implement
{a}(*tmp*)
stream_make_sing(x) =
  $delay(stream_cons{a}(x, $delay(stream_nil)))
//
(* ****** ****** *)

implement
{a}(*tmp*)
stream2list (xs) = let
//
fun loop
(
  xs: stream(a)
, res: &ptr? >> List0_vt(a)
) : void = let
in
  case+ !xs of
  | stream_cons
      (x, xs) => let
      val () =
      res := list_vt_cons{a}{0}(x, _)
      val+list_vt_cons(_, res1) = res
      val ((*void*)) = loop (xs, res1)
    in
      fold@ (res)
    end // end of [stream_cons]
  | stream_nil() => res := list_vt_nil(*void*)
end // end of [loop]
var res: ptr // uninitialized
val () = $effmask_all (loop (xs, res))
//
in
  res
end // end of [stream2list]

(* ****** ****** *)

implement
{a}(*tmp*)
stream_length
  (xs) = loop(xs, 0) where
{
//
fun
loop
(
  xs: stream(a), j: intGte(0)
) :<!laz> intGte(0) =
(
case+ !xs of
| stream_nil() => j
| stream_cons(_, xs) => loop(xs, j+1)
)
//
} (* end of [stream_length] *)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_head_exn(xs) =
(
//
case+ !xs of
| stream_cons
    (x, _) => x
  // stream_cons
| stream_nil() => $raise StreamSubscriptExn()
//
) // end of [stream_head_exn]

implement
{a}(*tmp*)
stream_tail_exn(xs) =
(
//
case+ !xs of
| stream_cons
    (_, xs) => xs
  // stream_cons
| stream_nil() => $raise StreamSubscriptExn()
//
) // end of [stream_tail_exn]

(* ****** ****** *)

implement
{a}(*tmp*)
stream_nth_exn
  (xs, n) = let
in
  case+ !xs of
  | stream_cons
      (x, xs) =>
    (
      if n > 0
        then stream_nth_exn<a>(xs, pred(n))
        else (x)
      // end of [if]
    ) (* stream_cons *)
  | stream_nil() => $raise StreamSubscriptExn()
end // end of [stream_nth_exn]

(* ****** ****** *)

implement
{a}(*tmp*)
stream_nth_opt
  (xs, n) = let
in
//
try
Some_vt(stream_nth_exn<a>(xs, n)) with ~StreamSubscriptExn() => None_vt()
//
end // end of [stream_nth_opt]

(* ****** ****** *)

implement
{a}(*tmp*)
stream_get_at_exn(xs, n) = stream_nth_exn<a>(xs, n)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_takeLte
  (xs, n) = let
//
fun
auxmain
(
  xs: stream(a)
, n0: intGte(0)
) : stream_vt(a) = $ldelay
(
if
(n0 > 0)
then
(
case+ !xs of
| stream_nil() =>
    stream_vt_nil()
  // end of [stream_nil]
| stream_cons(x, xs) =>
    stream_vt_cons(x, auxmain(xs, n0-1))
  // end of [stream_cons]
)
else stream_vt_nil()
) (* end of [auxmain] *)
//
in
  auxmain(xs, n)
end // end of [stream_takeLte]

(* ****** ****** *)

implement
{a}(*tmp*)
stream_take_exn
  (xs, n) = let
//
fun
loop{n:nat}
(
  xs: stream(a)
, res: &ptr? >> list_vt(a, n-k), n: int(n)
) : #[k:nat | k <= n] int k =
(
//
if
(n > 0)
then (
  case+ !xs of
  | stream_cons
      (x, xs) => k where
    {
      val () =
      res := list_vt_cons{a}{0}(x, _)
      val+list_vt_cons (_, res1) = res
      val k = loop (xs, res1, pred(n))
      prval () = fold@ (res)
    } (* end of [stream_cons] *)
  | stream_nil() => let
      val () =
        res := list_vt_nil() in n
      // end of [val]
    end // end of [stream_nil]
) else (
  let val () = res := list_vt_nil() in n end
) (* end of [if] *)
//
) (* end of [loop] *)
//
var res: ptr // uninitialized
val k = $effmask_all (loop (xs, res, n))
//
in
//
$effmask_all (
if k = 0 then res else let
  val () = list_vt_free (res) in $raise StreamSubscriptExn()
end // end of [if]
) // end of [$effmask_all]
//
end // end of [stream_take_exn]

(* ****** ****** *)

implement
{a}(*tmp*)
stream_drop_exn
  (xs, n) = let
//
fun
aux:
$d2ctype
(
stream_drop_exn<a>
) =
lam(xs, n) => 
(
//
if n > 0 then
(
  case+ !xs of
  | stream_cons
      (_, xs) => aux(xs, pred(n))
    // stream_cons
  | stream_nil() => $raise StreamSubscriptExn()
) else (xs) // end of [if]
//
) (* end of [aux] *)
//
in
  aux(xs, n)
end // end of [stream_drop_exn]

(* ****** ****** *)

implement
{a}(*tmp*)
stream_drop_opt
  (xs, n) = let
fun
aux:
$d2ctype
(
stream_drop_opt<a>
) =
lam(xs, n) =>
(
//
if n > 0 then
(
  case+ !xs of
  | stream_nil() => None_vt()
  | stream_cons(_, xs) => aux(xs, pred(n))
) else Some_vt(xs) // end of [if]
//
) (* end of [aux] *)
//
in
  aux(xs, n)
end // end of [stream_drop_opt]

(* ****** ****** *)

implement
{a}(*tmp*)
stream_append
  (xs, ys) = let
//
fun aux
(
  xs: stream(a)
, ys: stream(a)
) : stream_con(a) =
  case+ !xs of
  | stream_nil() => !ys
  | stream_cons(x, xs) => stream_cons(x, $delay(aux(xs, ys)))
//
in
//
  $delay(aux(xs, ys))
//
end // end of [stream_append]

(* ****** ****** *)

implement
{a}(*tmp*)
stream_concat
  (xss) = let
//
fun aux1
(
  xss: stream(stream(a))
) : stream_con(a) =
(
  case+ !xss of
  | stream_nil() => stream_nil()
  | stream_cons(xs, xss) => aux2(xs, xss)
)
and aux2
(
  xs: stream(a), xss: stream(stream(a))
) : stream_con(a) =
  case+ !xs of
  | stream_nil() => aux1 (xss)
  | stream_cons(x, xs) => stream_cons (x, $delay(aux2(xs, xss)))
//
in
  $delay(aux1(xss))
end // end of [stream_concat]

(* ****** ****** *)

local

fun{a:t0p}
stream_filter_con
(
xs: stream(a)
) : stream_con(a) = let
in
//
case+ !xs of
| stream_cons
    (x, xs) =>
  (
    if stream_filter$pred<a>(x)
      then stream_cons{a}(x, stream_filter<a>(xs)) else stream_filter_con<a>(xs)
    // end of [if]
  ) // end of [stream_cons]
| stream_nil() => stream_nil()
//
end // end of [stream_filter_con]

in (* in of [local] *)

implement
{a}(*tmp*)
stream_filter(xs) =
$delay
(
stream_filter_con<a>(xs)
)
// end of [stream_filter]

implement
{a}(*tmp*)
stream_filter_fun
  (xs, p0) = let
//
implement{a2}
stream_filter$pred
  (x) = p0($UN.cast{a}(x))
//
in
  stream_filter<a>(xs)
end // end of [stream_filter_fun]

implement
{a}(*tmp*)
stream_filter_cloref
  (xs, p0) = let
//
implement
{a2}(*tmp*)
stream_filter$pred
  (x) = p0($UN.cast{a}(x))
//
in
  stream_filter<a>(xs)
end // end of [stream_filter_cloref]

end // end of [local]

(* ****** ****** *)

implement
{a}{b}
stream_map(xs) =
  auxmain(xs) where
{
//
fun
auxmain
(
xs: stream(a)
) :<!laz> stream(b) = $delay
(
case+ !xs of
| stream_nil() =>
  stream_nil()
| stream_cons(x, xs) => let
    val y =
    stream_map$fopr<a><b>(x)
  in
    stream_cons{b}(y, auxmain(xs))
  end // end of [stream_cons]
) : stream_con(b) // end of [$delay]
//
} (* end of [stream_map] *)

implement
{a}{b}
stream_map_fun
  (xs, f) = let
//
implement
{a2}{b2}
stream_map$fopr(x) =
$UN.cast{b2}
  (f($UN.cast{a}(x)))
//
in
  stream_map<a><b>(xs)
end // end of [stream_map_fun]

implement
{a}{b}
stream_map_cloref
  (xs, f) = let
//
implement
{a2}{b2}
stream_map$fopr(x) =
$UN.cast{b2}
  (f($UN.cast{a}(x)))
//
in
  stream_map<a><b>(xs)
end // end of [stream_map_cloref]

(* ****** ****** *)

implement
{a}{b}
stream_imap(xs) =
  auxmain(0, xs) where
{
//
fun
auxmain
(
 i: intGte(0), xs: stream(a)
) :<!laz> stream (b) = $delay
(
case+ !xs of
| stream_nil() => stream_nil()
| stream_cons
    (x, xs) => let
    val y =
      stream_imap$fopr<a><b>(i, x)
    // end of [val]
  in
    stream_cons{b}(y, auxmain(succ(i), xs))
  end // end of [stream_cons]
) : stream_con (b) // end of [$delay]
//
} (* end of [stream_imap] *)

implement
{a}{b}
stream_imap_fun
  (xs, f) = let
//
implement
{a2}{b2}
stream_imap$fopr
  (i, x) =
(
$UN.cast{b2}
(f(i, $UN.cast{a}(x)))
)
//
in
  stream_imap<a><b>(xs)
end // end of [stream_imap_fun]

implement
{a}{b}
stream_imap_cloref
  (xs, f) = let
//
implement
{a2}{b2}
stream_imap$fopr
  (i, x) =
(
$UN.cast{b2}
(f(i, $UN.cast{a}(x)))
)
//
in
  stream_imap<a><b>(xs)
end // end of [stream_imap_cloref]

(* ****** ****** *)

local

#define :: stream_cons

in (* in of [local] *)

implement
{a1,a2}{b}
stream_map2
(xs1, xs2) = $delay
(
(
case+ !xs1 of
| stream_nil() =>
  stream_nil()
| stream_cons(x1, xs1) =>
  (
  case+ !xs2 of
  | stream_nil() =>
    stream_nil()
  | stream_cons(x2, xs2) => let
      val y =
      stream_map2$fopr<a1,a2><b>(x1, x2)
    in
      stream_cons{b}
        (y, stream_map2<a1,a2><b>(xs1, xs2))
      // stream_cons
    end // stream_cons
  ) // end of [stream_cons]
) : stream_con(b)
) // end of [stream_map2]

end // end of [local]

implement
{a1,a2}{b}
stream_map2_fun
  (xs1, xs2, f) = let
//
implement
{a12,a22}{b2}
stream_map2$fopr
  (x1, x2) = let
//
val x1 = $UN.cast{a1}(x1)
val x2 = $UN.cast{a2}(x2)
//
in
  $UN.cast{b2}(f(x1, x2))
end // [stream_map2$fopr]
//
in
  stream_map2<a1,a2><b>(xs1, xs2)
end // end of [stream_map2_fun]

implement
{a1,a2}{b}
stream_map2_cloref
  (xs1, xs2, f) = let
//
implement
{a12,a22}{b2}
stream_map2$fopr (x1, x2) =
  $UN.cast{b2}(f($UN.cast{a1}(x1), $UN.cast{a2}(x2)))
//
in
  stream_map2<a1,a2><b>(xs1, xs2)
end // end of [stream_map2_cloref]

(* ****** ****** *)

implement
{res}{x}
stream_scan
  (xs, ini) = let
//
fun
auxmain
(
  xs: stream(x), ini: res
) :<!laz> stream(res) = $delay
(
case+ !xs of
| stream_nil() =>
  stream_nil()
| stream_cons(x, xs) =>
  stream_cons{res}
  (stream_scan$fopr<res><x>(ini, x), auxmain(xs, ini))
) // end of [$delay] // end of [auxmain]
//
in
  stream_make_cons<res>(ini, auxmain(xs, ini))
end // end of [stream_scan]

(* ****** ****** *)

implement
{res}{x}
stream_scan_fun
  (xs, ini, f) = let
//
implement
{res2}{x2}
stream_scan$fopr
  (ini, x) =
  $UN.cast{res2}(f($UN.cast{res}(ini), $UN.cast{x}(x)))
//
in
  stream_scan<res><x>(xs, ini)
end // end of [stream_scan_fun]

implement
{res}{x}
stream_scan_cloref
  (xs, ini, f) = let
//
implement
{res2}{x2}
stream_scan$fopr
  (ini, x) =
  $UN.cast{res2}(f($UN.cast{res}(ini), $UN.cast{x}(x)))
//
in
  stream_scan<res><x>(xs, ini)
end // end of [stream_scan_cloref]

(* ****** ****** *)

implement
{a,b}//tmp
stream_zip
  (xs, ys) =
(
  auxmain(xs, ys)
) where
{
fun
auxmain:
$d2ctype
(stream_zip<a,b>) =
lam(xs, ys) => $delay
(
case+ !xs of
| stream_nil() =>
  stream_nil()
| stream_cons(x0, xs) =>
  (
  case+ !ys of
  | stream_nil() =>
    stream_nil()
  | stream_cons(y0, ys) =>
    stream_cons((x0, y0), auxmain(xs, ys))
  )
) (* end of [auxmain] *)
} (* end of [stream_zip] *)

(* ****** ****** *)

implement
{a,b}//tmp
stream_cross
  (xs, ys) =
(
  auxmain(xs, ys)
) where
{
fun
auxmain:
$d2ctype
(stream_cross<a,b>) =
lam(xs, ys) => $delay
(
case+ !xs of
| stream_nil() =>
  stream_nil()
| stream_cons(x0, xs) => !
  (
    stream_append(xys, auxmain(xs, ys))
  ) where
  {
    val xys =
    (
    stream_map<b><(a,b)>(ys)
    ) where
    {
      implement
      stream_map$fopr<b><(a,b)>(y) = @(x0, y)
    }
  }
) (* end of [auxmain] *)
} (* end of [stream_cross] *)

(* ****** ****** *)

local

#define :: stream_cons

in (* in of [local] *)

implement
{a}(*tmp*)
stream_merge
  (xs10, xs20) = let
//
fun
auxmain:
$d2ctype
(
stream_merge<a>
) =
lam
(
xs10, xs20
) => $delay
(
case+ !xs10 of
| stream_nil
    ((*_*)) => !xs20
| stream_cons
    (x1, xs1) =>
  (
  case+ !xs20 of
  | stream_nil
      ((*_*)) =>
    stream_cons{a}(x1, xs1)
  | stream_cons
      (x2, xs2) => let
      val sgn =
      stream_merge$cmp<a>
        (x1, x2)
      // end of [val]
    in
      if
      (sgn <= 0)
      then
      stream_cons{a}
        (x1, auxmain(xs1, xs20))
      // end of [then]
      else
      stream_cons{a}
        (x2, auxmain(xs10, xs2))
      // end of [else]
    end // end of [::]
  ) (* end of [::] *)
) (* end of [auxmain] *)
//
in
  auxmain(xs10, xs20)
end // end of [stream_merge]

end // end of [local]

(* ****** ****** *)
//
implement
{a}(*tmp*)
stream_merge$cmp
  (x1, x2) =
  gcompare_val_val<a>(x1, x2)
//
(* ****** ****** *)

implement
{a}(*tmp*)
stream_merge_fun
  (xs1, xs2, cmp) = let
//
implement{a2}
stream_merge$cmp(x1, x2) =
  cmp($UN.cast{a}(x1), $UN.cast{a}(x2))
//
in
  stream_merge<a>(xs1, xs2)
end // end of [stream_merge_fun]

implement
{a}(*tmp*)
stream_merge_cloref
  (xs1, xs2, cmp) = let
//
implement{a2}
stream_merge$cmp(x1, x2) =
  cmp($UN.cast{a}(x1), $UN.cast{a}(x2))
//
in
  stream_merge<a>(xs1, xs2)
end // end of [stream_merge_cloref]

(* ****** ****** *)

local

#define :: stream_cons

in (* in of [local] *)

implement
{a}(*tmp*)
stream_mergeq
  (xs10, xs20) = let
//
fun
auxmain:
$d2ctype
(
stream_mergeq<a>
) =
lam
(
  xs10, xs20
) =>
$delay
(
case+ !xs10 of
| stream_nil() => !xs20
| stream_cons(x1, xs1) =>
  (
  case+ !xs20 of
  | stream_nil() =>
    stream_cons{a}(x1, xs1)
  | stream_cons(x2, xs2) => let
      val sgn =
        stream_mergeq$cmp<a>(x1, x2)
      // end of [val]
    in
      if
      (sgn < 0)
      then
        stream_cons{a}(x1, auxmain(xs1, xs20))
      else
      if
      (sgn > 0)
      then
        stream_cons{a}(x2, auxmain(xs10, xs2))
      else
        stream_cons{a}(x1(*=x2*), auxmain(xs1, xs2))
      // end of [if]
    end // end of [::]
  ) (* end of [stream_cons] *)
) (* end of [auxmain] *)
//
in
  auxmain(xs10, xs20)
end // end of [stream_mergeq]

end // end of [local]

(* ****** ****** *)
//
implement
{a}(*tmp*)
stream_mergeq$cmp
  (x1, x2) = gcompare_val_val<a>(x1, x2)
//
(* ****** ****** *)

implement
{a}(*tmp*)
stream_mergeq_fun
  (xs1, xs2, cmp) = let
//
implement{a2}
stream_mergeq$cmp(x1, x2) =
  cmp ($UN.cast{a}(x1), $UN.cast{a}(x2))
//
in
  stream_mergeq<a>(xs1, xs2)
end // end of [stream_mergeq_fun]

implement
{a}(*tmp*)
stream_mergeq_cloref
  (xs1, xs2, cmp) = let
//
implement{a2}
stream_mergeq$cmp(x1, x2) =
  cmp ($UN.cast{a}(x1), $UN.cast{a}(x2))
//
in
  stream_mergeq<a>(xs1, xs2)
end // end of [stream_mergeq_cloref]

(* ****** ****** *)
//
implement
{a}(*tmp*)
stream_union$cmp
  (x1, x2) = gcompare_val_val<a>(x1, x2)
implement
{a}(*tmp*)
stream_inter$cmp
  (x1, x2) = gcompare_val_val<a>(x1, x2)
implement
{a}(*tmp*)
stream_differ$cmp
  (x1, x2) = gcompare_val_val<a>(x1, x2)
implement
{a}(*tmp*)
stream_symdiff$cmp
  (x1, x2) = gcompare_val_val<a>(x1, x2)
//
(* ****** ****** *)

implement
{a}(*tmp*)
stream_union
(
  xs, ys
) = auxmain(xs, ys) where
{
//
fun
auxmain
( xs0: stream(a)
, ys0: stream(a)
) :<!laz> stream(a) = $delay
(
case+ !xs0 of
| stream_nil
    () => !(ys0)
  // stream_nil
| stream_cons
    (x0, xs1) =>
  (
    case+ !ys0 of
    | stream_nil() =>
      stream_cons(x0, xs1)
    | stream_cons(y0, ys1) => let
        val sgn =
        stream_union$cmp<a>(x0, y0)
      in
        ifcase
        | sgn < 0 =>
          stream_cons(x0, auxmain(xs1, ys0))
        | sgn > 0 =>
          stream_cons(y0, auxmain(xs0, ys1))
        | _(*sgn=0*) =>
          stream_cons(x0, auxmain(xs1, ys1))
      end // end of [stream_cons]
  )
) (* end of [auxmain] *)
//
} (* end of [stream_union] *)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_inter
(
  xs, ys
) = auxmain(xs, ys) where
{
//
fun
auxmain
( xs0: stream(a)
, ys0: stream(a)
) :<!laz> stream(a) = $delay
(
case+ !xs0 of
| stream_nil() =>
  stream_nil()
| stream_cons(x0, xs1) =>
  (
    case+ !ys0 of
    | stream_nil() =>
      stream_nil()
    | stream_cons(y0, ys1) => let
        val sgn =
        stream_inter$cmp<a>(x0, y0)
      in
        ifcase
        | sgn < 0 => !(auxmain(xs1, ys0))
        | sgn > 0 => !(auxmain(xs0, ys1))
        | _(*sgn=0*) =>
            stream_cons(x0, auxmain(xs1, ys1))
          // end of [else]
      end // end of [stream_cons]
  )
) (* end of [auxmain] *)
//
} (* end of [stream_inter] *)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_differ
(
  xs, ys
) = auxmain(xs, ys) where
{
//
fun
auxmain
( xs0: stream(a)
, ys0: stream(a)
) :<!laz> stream(a) = $delay
(
case+ !xs0 of
| stream_nil() =>
  stream_nil()
| stream_cons(x0, xs1) =>
  (
    case+ !ys0 of
    | stream_nil() =>
      stream_cons(x0, xs1)
    | stream_cons(y0, ys1) => let
        val sgn =
        stream_differ$cmp<a>(x0, y0)
      in
        ifcase
        | sgn < 0 =>
          stream_cons
            (x0, auxmain(xs1, ys0))
          // stream_cons
        | sgn > 0 => !(auxmain(xs0, ys1))
        | _(*sgn=0*) => !(auxmain(xs1, ys1))
      end // end of [stream_cons]
  )
) (* end of [auxmain] *)
//
} (* end of [stream_differ] *)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_symdiff
(
  xs, ys
) = auxmain(xs, ys) where
{
//
fun
auxmain
( xs0: stream(a)
, ys0: stream(a)
) :<!laz> stream(a) = $delay
(
case+ !xs0 of
| stream_nil
    () => !(ys0)
  // stream_nil
| stream_cons
    (x0, xs1) =>
  (
    case+ !ys0 of
    | stream_nil() =>
      stream_cons(x0, xs1)
    | stream_cons(y0, ys1) => let
        val sgn =
        stream_symdiff$cmp<a>(x0, y0)
      in
        ifcase
        | sgn < 0 =>
          stream_cons
            (x0, auxmain(xs1, ys0))
          // stream_cons
        | sgn > 0 =>
            stream_cons
            (y0, auxmain(xs0, ys1))
          // stream_cons
        | _(*sgn=0*) => !(auxmain(xs1, ys1))
      end // end of [stream_cons]
  )
) (* end of [auxmain] *)
//
} (* end of [stream_symdiff] *)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_tabulate
  ((*void*)) =
  auxmain(0) where
{
//
fun
auxmain{n:nat}
(
  n: int(n)
) : stream(a) = $delay
(
stream_cons{a}
  (stream_tabulate$fopr<a>(n), auxmain(n+1))
) (* end of [auxmain] *)
//
} (* end of [stream_tabulate] *)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_tabulate_fun
  (fopr) = let
//
implement
{a2}(*tmp*)
stream_tabulate$fopr
  (n) = $UN.cast{a2}(fopr(n))
//
in
  stream_tabulate ()
end // end of [stream_tabulate_fun]

implement
{a}(*tmp*)
stream_tabulate_cloref
  (fopr) = let
//
implement
{a2}(*tmp*)
stream_tabulate$fopr
  (n) = $UN.cast{a2}(fopr(n))
//
in
  stream_tabulate ()
end // end of [stream_tabulate_cloref]

(* ****** ****** *)

implement
{a}(*tmp*)
stream_labelize(xs) = let
//
vtypedef ia = @(intGte(0), a)
//
fun
auxmain
(
i0: intGte(0)
,
xs: stream(a)
) : stream(ia) = $delay
(
(
case+ !xs of
| stream_nil
    () => stream_nil()
  // end of [stream_nil]
| stream_cons
    (x, xs) =>
    stream_cons((i0, x), auxmain(i0+1, xs))
  // end of [stream_cons]
)
) (* end of [auxmain] *)
//
in
  auxmain(0, xs)
end // end of [stream_labelize]

(* ****** ****** *)

implement
{a}(*tmp*)
stream_foreach
  (xs) = let
  var env: void = ()
in
  stream_foreach_env<a><void>(xs, env)
end // end of [stream_foreach]

implement
{a}{env}
stream_foreach_env
  (xs, env) = let
//
fun loop
(
  xs: stream(a), env: &env >> _
) : void =
(
//
case+ !xs of
| stream_nil() => ()
| stream_cons(x, xs) => let
    val test =
      stream_foreach$cont<a><env>(x, env)
    // end of [val]
  in
    if test
      then let
        val () =
          stream_foreach$fwork<a><env>(x, env)
        // end of [val]
      in
        loop (xs, env)
      end // end of [then]
      else () // end of [else]
    // end of [if]
  end // end of [stream_cons]
//
) (* end of [loop] *)
//
in
  loop (xs, env)
end (* end of [stream_foreach_env] *)

implement(a,env)
stream_foreach$cont<a><env>(x0, env) = true(*cont*)

(* ****** ****** *)

implement
{a}(*tmp*)
stream_foreach_fun
  (xs, fwork) =
  loop(xs) where
{
//
fun
loop(xs: stream(a)): void =
(
  case+ !xs of
  | stream_nil() => ()
  | stream_cons(x, xs) => (fwork(x); loop(xs))
)
//
} (* end of [stream_foreach_fun] *)

implement
{a}(*tmp*)
stream_foreach_cloref
  (xs, fwork) =
  loop(xs) where
{
//
fun
loop(xs: stream(a)): void =
(
  case+ !xs of
  | stream_nil() => ()
  | stream_cons(x, xs) => (fwork(x); loop(xs))
)
//
} (* end of [stream_foreach_cloref] *)

(* ****** ****** *)
//
//
implement
{a}(*tmp*)
stream_iforeach_fun
  (xs, fwork) =
  loop(0, xs) where
{
//
fun
loop
( i: intGte(0)
, xs: stream(a)): void =
(
case+ !xs of
| stream_nil() => ()
| stream_cons(x, xs) =>
  let val () = fwork(i, x) in loop(i+1, xs) end
)
//
} (* end of [stream_iforeach_fun] *)
//
implement
{a}(*tmp*)
stream_iforeach_cloref
  (xs, fwork) =
  loop(0, xs) where
{
//
fun
loop
( i: intGte(0)
, xs: stream(a)): void =
(
case+ !xs of
| stream_nil() => ()
| stream_cons(x, xs) =>
  let val () = fwork(i, x) in loop(i+1, xs) end
)
//
} (* end of [stream_iforeach_cloref] *)
//
(* ****** ****** *)

implement
{res}{a}
stream_foldleft_fun
  (xs, ini, fopr) = let
//
fun
loop(xs: stream(a), res: res): res =
(
  case+ !xs of
  | stream_nil() => res
  | stream_cons(x, xs) => loop(xs, fopr(res, x))
)
in
  loop(xs, ini)
end // end of [stream_foldleft_fun]

implement
{res}{a}
stream_foldleft_cloref
  (xs, ini, fopr) = let
//
fun
loop(xs: stream(a), res: res): res =
(
  case+ !xs of
  | stream_nil() => res
  | stream_cons(x, xs) => loop(xs, fopr(res, x))
)
in
  loop(xs, ini)
end // end of [stream_foldleft_cloref]

(* ****** ****** *)

implement
{a}(*tmp*)
fprint_stream
  (out, xs, n) = let
//
var env: int = 0
typedef tenv = int
//
implement
stream_foreach$cont<a><tenv>
  (x, env) =
  if n > env then true else false
implement
stream_foreach$fwork<a><tenv>
  (x, env) =
{
  val () =
  if env > 0
    then fprint_stream$sep<>(out)
  // end of [if]
  val () = env := env + 1
  val () = fprint_val<a>(out, x)
} (* end of [stream_foreach$fwork] *)
//
in
  stream_foreach_env<a><tenv>(xs, env)
end // end of [fprint_stream]

implement
{}(*tmp*)
fprint_stream$sep (out) = fprint_string (out, ", ")

(* ****** ****** *)

implement
{a}(*tmp*)
stream_skip_while_cloref
  (xs0, test) = let
//
val p0 = addr@xs0
//
fun
loop
(
xs: stream(a), n0: intGte(0)
) : intGte(0) =
(
case+ !xs of
| stream_nil() => n0 where
  {
    val () = $UN.ptr0_set<stream(a)>(p0, xs)
  }
| stream_cons(x1, xs2) =>
  if test(x1) then loop(xs2, n0+1) else
    (let val () = $UN.ptr0_set<stream(a)>(p0, xs) in n0 end)
  // end of [if] // end of [stream_cons]
)
//
in
  loop(xs0, 0)
end // end of [stream_skip_while_cloref]

implement
{a}(*tmp*)
stream_skip_until_cloref
  (xs0, test) = let
//
var
test_not = lam@(x: a) =<clo1> ~test(x)
//
in
  stream_skip_while_cloref<a>(xs0, $UN.cast(addr@test_not))
end // end of [stream_skip_until_cloref]

(* ****** ****** *)

(* end of [stream.dats] *)

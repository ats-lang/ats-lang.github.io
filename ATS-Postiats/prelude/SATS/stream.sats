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
(* Start time: February, 2012 *)
(* Authoremail: gmhwxiATgmailDOTcom *)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/SATS/CODEGEN/stream.atxt
** Time of generation: Fri Feb 15 23:45:47 2019
*)

(* ****** ****** *)

sortdef t0p = t@ype

(* ****** ****** *)
//
#if(0)
//
// HX: lazy streams
// It is declared in [basics_dyn]
//
datatype
stream_con
  (a:t@ype+) =
//
// t@ype+: covariant
//
  | stream_nil of ((*void*))
  | stream_cons of (a, stream(a))
//
where stream (a:t@ype) = lazy (stream_con(a))
//
#endif // [#if(0)]
//
(* ****** ****** *)
//
exception StreamSubscriptExn of ((*void*))
//
(*
fun StreamSubscriptExn ():<> exn = "mac#StreamSubscriptExn_make"
fun isStreamSubscriptExn (x: !exn):<> bool = "mac#isStreamSubscriptExn"
*)
//
(* ****** ****** *)
//
fun
{a:t0p}
stream_is_nil(xs: stream(a)): bool
fun
{a:t0p}
stream_is_cons(xs: stream(a)): bool
//
(* ****** ****** *)
//
fun{a:t0p}
stream_make_nil(): stream(a)
fun{a:t0p}
stream_make_cons
  (a, stream(INV(a))):<> stream(a)
//
(* ****** ****** *)
//
fun{a:t0p}
stream_sing(a):<> stream_con(a)
fun{a:t0p}
stream_make_sing(x: a): stream(a)
//
(* ****** ****** *)

fun{a:t0p}
stream2list
  (xs: stream(INV(a))):<!laz> List0_vt(a)
// end of [stream2list]

(* ****** ****** *)
//
fun{a:t0p}
stream_length(stream(INV(a))):<!laz> intGte(0)
//
(* ****** ****** *)

fun{a:t0p}
stream_head_exn(xs: stream(INV(a))):<!laz> (a)
fun{a:t0p}
stream_tail_exn(xs: stream(INV(a))):<!laz> stream(a)

(* ****** ****** *)

fun{a:t0p}
stream_nth_exn
  (xs: stream(INV(a)), n: intGte(0)):<!laz> (a)
// end of [stream_nth_exn]
fun{a:t0p}
stream_nth_opt
  (xs: stream(INV(a)), n: intGte(0)):<!laz> Option_vt(a)
// end of [stream_nth_opt]

(* ****** ****** *)

fun{a:t0p}
stream_get_at_exn
  (xs: stream(INV(a)), n: intGte(0)):<!laz> (a)
// end of [stream_get_at_exn]

(* ****** ****** *)
//
// HX: this one returns a linear stream!!!
//
fun{a:t0p}
stream_takeLte
  (xs: stream(INV(a)), n: intGte(0)): stream_vt(a)
// end of [stream_takeLte]
//
(* ****** ****** *)

fun{a:t0p}
stream_take_exn{n:nat}
  (xs: stream(INV(a)), n: int n):<!laz> list_vt(a, n)
// end of [stream_take_exn]

(* ****** ****** *)

fun{a:t0p}
stream_drop_exn
  (xs: stream(INV(a)), n: intGte(0)):<!laz> stream(a)
// end of [stream_drop_exn]
fun{a:t0p}
stream_drop_opt
  (xs: stream(INV(a)), n: intGte(0)):<!laz> Option_vt(stream(a))
// end of [stream_drop_opt]

(* ****** ****** *)
//
fun{a:t0p}
stream_append
  (xs: stream(INV(a)), ys: stream(a)):<!laz> stream(a)
//
fun{a:t0p}
stream_concat(xss: stream(stream(INV(a)))):<!laz> stream(a)
//
(* ****** ****** *)
//
fun{a:t0p}
stream_filter
  (xs: stream(INV(a))):<!laz> stream(a)
//
fun{a:t0p} stream_filter$pred (x: a):<> bool
//
fun{a:t0p}
stream_filter_fun
(
  xs: stream(INV(a)), pred: (a) -<fun> bool
) :<!laz> stream(a) // end-of-function
fun{a:t0p}
stream_filter_cloref
(
  xs: stream(INV(a)), pred: (a) -<cloref> bool
) :<!laz> stream(a) // end-of-function
//
(* ****** ****** *)
//
fun{
a:t0p}{b:t0p
} stream_map
  (xs: stream(INV(a))):<!laz> stream(b)
fun{
a:t0p}{b:t0p
} stream_map$fopr (x: a):<(*none*)> (b)
//
fun{
a:t0p}{b:t0p
} stream_map_fun
  (xs: stream(INV(a)), fopr: (a) -<fun> b):<!laz> stream(b)
fun{
a:t0p}{b:t0p
} stream_map_cloref
  (xs: stream(INV(a)), fopr: (a) -<cloref> b):<!laz> stream(b)
//
(* ****** ****** *)
//
fun{
a:t0p}{b:t0p
} stream_imap
  (xs: stream(INV(a))):<!laz> stream(b)
//
fun{
a:t0p}{b:t0p
} stream_imap$fopr (i: intGte(0), x: a):<> (b)
//
fun{
a:t0p}{b:t0p
} stream_imap_fun
(
  xs: stream(INV(a)), fopr: (intGte(0), a) -<fun> b
) :<!laz> stream(b) // end-of-fun
fun{
a:t0p}{b:t0p
} stream_imap_cloref
(
  xs: stream(INV(a)), fopr: (intGte(0), a) -<cloref> b
) :<!laz> stream(b) // end-of-fun
//
(* ****** ****** *)
//
fun{
a1,a2:t0p}{b:t0p
} stream_map2
(
  xs1: stream(INV(a1))
, xs2: stream(INV(a2))
) :<!laz> stream(b) // end-of-fun
fun{
a1,a2:t0p}{b:t0p
} stream_map2$fopr (x1: a1, x2: a2):<> b
//
fun{
a1,a2:t0p}{b:t0p
} stream_map2_fun
(
  xs1: stream(INV(a1))
, xs2: stream(INV(a2)), fopr: (a1, a2) -<fun> b
) :<!laz> stream(b) // end-of-fun
fun{
a1,a2:t0p}{b:t0p
} stream_map2_cloref
(
  xs1: stream(INV(a1))
, xs2: stream(INV(a2)), fopr: (a1, a2) -<cloref> b
) :<!laz> stream(b) // end-of-fun
//
(* ****** ****** *)
//
fun{
res:t0p}{x:t0p
} stream_scan
  (stream(INV(x)), ini: res):<!laz> stream(res)
//
fun{
res:t0p}{x:t0p
} stream_scan$fopr(res: res, x: x):<(*none*)> res
//
fun{
res:t0p}{x:t0p
} stream_scan_fun
(
  stream(INV(x)), ini: res, (res, x) -<fun> res
) :<!laz> stream(res) // end-of-function
//
fun{
res:t0p}{x:t0p
} stream_scan_cloref
(
  stream(INV(x)), ini: res, (res, x) -<cloref> res
) :<!laz> stream(res) // end-of-function
//
(* ****** ****** *)

fun
{a,b:t0p}
stream_zip
(
  stream(INV(a)), stream(INV(b))
) : stream(@(a, b)) // end-of-fun
fun
{a,b:t0p}
stream_cross
(
  stream(INV(a)), stream(INV(b))
) : stream(@(a, b)) // end-of-fun

(* ****** ****** *)
//
// HX: duplicates are kept
//
fun
{a:t0p}
stream_merge
(
  xs1: stream(INV(a)), xs2: stream(a)
) :<!laz> stream(a) // end-of-function
//
fun{a:t0p}
stream_merge$cmp (x1: a, x2: a):<> int
//
fun
{a:t0p}
stream_merge_fun
(
  xs1: stream(INV(a))
, xs2: stream(a), cmp: (a, a) -<fun> int
) :<!laz> stream(a) // end of [stream_merge_fun]
fun
{a:t0p}
stream_merge_cloref
(
  xs1: stream(INV(a))
, xs2: stream(a), cmp: (a, a) -<cloref> int
) :<!laz> stream(a) // end of [stream_merge_cloref]

(* ****** ****** *)
//
// HX: duplicates are dropped
//
fun{a:t0p}
stream_mergeq
(
  xs1: stream(INV(a)), xs2: stream(a)
) :<!laz> stream(a)
//
fun{a:t0p}
stream_mergeq$cmp(x1: a, x2: a):<> int
//
fun{a:t0p}
stream_mergeq_fun
(
  xs1: stream(INV(a))
, xs2: stream(a), cmp: (a, a) -<fun> int
) :<!laz> stream(a) // end-of-function
fun{a:t0p}
stream_mergeq_cloref
(
  xs1: stream(INV(a))
, xs2: stream(a), cmp: (a, a) -<cloref> int
) :<!laz> stream(a) // end-of-function
//
(* ****** ****** *)
//
// HX-2017-06-13:
// The streams are assumed to be ordered!!!
//
fun{a:t0p}
stream_union$cmp(x1: a, x2: a):<> int
fun{a:t0p}
stream_inter$cmp(x1: a, x2: a):<> int
fun{a:t0p}
stream_differ$cmp(x1: a, x2: a):<> int
fun{a:t0p}
stream_symdiff$cmp(x1: a, x2: a):<> int
//
fun{a:t0p}
stream_union
  (stream(INV(a)), stream(a)):<!laz> stream(a)
fun{a:t0p}
stream_inter
  (stream(INV(a)), stream(a)):<!laz> stream(a)
fun{a:t0p}
stream_differ
  (stream(INV(a)), stream(a)):<!laz> stream(a)
fun{a:t0p}
stream_symdiff
  (stream(INV(a)), stream(a)):<!laz> stream(a)
//
(* ****** ****** *)
//
fun
{a:t0p}
stream_tabulate(): stream(a)
fun
{a:t0p}
stream_tabulate$fopr(i: intGte(0)): (a)
//
fun
{a:t0p}
stream_tabulate_fun
  (fopr: intGte(0) -> a): stream(a)
fun
{a:t0p}
stream_tabulate_cloref
  (fopr: intGte(0) -<cloref1> a): stream(a)
//
(* ****** ****** *)
//
fun
{a:t0p}
stream_labelize
  (stream(INV(a))): stream(@(intGte(0), a))
//
(* ****** ****** *)
//
fun
{a:t0p}
stream_foreach(xs: stream(a)): void
fun
{a:t0p}
{env:vt0p}
stream_foreach_env(xs: stream(a), &env >> _): void
//
fun
{a:t0p}
{env:vt0p}
stream_foreach$cont(x: a, env: &env): bool
fun
{a:t0p}
{env:vt0p}
stream_foreach$fwork(x: a, env: &env): void
//
fun{a:t0p}
stream_foreach_fun
  (xs: stream(a), fwork: (a) -<fun1> void): void
fun{a:t0p}
stream_foreach_cloref
  (xs: stream(a), fwork: (a) -<cloref1> void): void
//
(* ****** ****** *)
//
fun{a:t0p}
stream_iforeach_fun
( xs: stream(a)
, fwork: (intGte(0), a) -<fun1> void): void
fun{a:t0p}
stream_iforeach_cloref
( xs: stream(a)
, fwork: (intGte(0), a) -<cloref1> void): void
//
(* ****** ****** *)
//
fun{
res:vt0p}{a:t0p
} stream_foldleft_fun
  (xs: stream(a), ini: res, fopr: (res, a) -<fun1> res): res
fun{
res:vt0p}{a:t0p
} stream_foldleft_cloref
  (xs: stream(a), ini: res, fopr: (res, a) -<cloref1> res): res
//
(* ****** ****** *)
//
fun{}
fprint_stream$sep (out: FILEref): void
fun{a:t0p}
fprint_stream
  (out: FILEref, xs: stream(INV(a)), n: int): void
//
(* ****** ****** *)
//
fun{a:t0p}
stream_skip_while_cloref
  (xs: &stream(INV(a)) >> _, test: (a) -<cloref1> bool): intGte(0)
fun{a:t0p}
stream_skip_until_cloref
  (xs: &stream(INV(a)) >> _, test: (a) -<cloref1> bool): intGte(0)
//
(* ****** ****** *)
//
// overloading for certain symbols
//
(* ****** ****** *)

overload + with stream_append

(* ****** ****** *)

overload [] with stream_nth_exn

(* ****** ****** *)
//
overload iseqz with stream_is_nil
overload isneqz with stream_is_cons
//
(* ****** ****** *)
//
overload length with stream_length
//
(* ****** ****** *)
//
overload .head with stream_head_exn
overload .tail with stream_tail_exn
//
(* ****** ****** *)
//
overload .takeLte with stream_takeLte
//
(* ****** ****** *)

(* end of [stream.sats] *)

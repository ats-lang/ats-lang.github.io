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
** $PATSHOME/prelude/DATS/CODEGEN/list_vt.atxt
** Time of generation: Wed Oct 10 21:08:51 2018
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Start time: Feburary, 2012 *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)

(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
staload
_(*anon*) = "prelude/DATS/unsafe.dats"
//
(* ****** ****** *)

absvtype
List0_vt_(a:vt@ype+) = List0_vt(a)

(* ****** ****** *)
//
implement
{a}(*tmp*)
list_vt_tuple_0() = list_vt_nil()
//
implement
{a}(*tmp*)
list_vt_tuple_1(x0) = $list_vt{a}(x0)
implement
{a}(*tmp*)
list_vt_tuple_2(x0, x1) = $list_vt{a}(x0, x1)
implement
{a}(*tmp*)
list_vt_tuple_3(x0, x1, x2) = $list_vt{a}(x0, x1, x2)
//
implement
{a}(*tmp*)
list_vt_tuple_4
(x0, x1, x2, x3) = $list_vt{a}(x0, x1, x2, x3)
implement
{a}(*tmp*)
list_vt_tuple_5
(x0, x1, x2, x3, x4) = $list_vt{a}(x0, x1, x2, x3, x4)
implement
{a}(*tmp*)
list_vt_tuple_6
(x0, x1, x2, x3, x4, x5) = $list_vt{a}(x0, x1, x2, x3, x4, x5)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
list_vt_make_sing(x) =
  list_vt_cons{a}(x, list_vt_nil())
implement
{a}(*tmp*)
list_vt_make_pair(x1, x2) =
(
  list_vt_cons{a}
  (
    x1, list_vt_cons{a}(x2, list_vt_nil())
  )
) (* list_vt_cons *)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
print_list_vt(xs) =
  fprint_list_vt<a>(stdout_ref, xs)
//
implement
{a}(*tmp*)
prerr_list_vt(xs) =
  fprint_list_vt<a>(stderr_ref, xs)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
fprint_list_vt$sep
  (out) = fprint_list$sep<(*none*)>(out)
//
implement
{a}(*tmp*)
fprint_list_vt
  (out, xs) = let
//
implement(env)
list_vt_iforeach$fwork<a><env>
  (i, x, env) = let
//
val () =
if (i > 0)
  then fprint_list_vt$sep<(*none*)>(out)
// end of [val]
//
in
  fprint_ref<a>(out, x)
end // end of [list_iforeach$fwork]
//
val _(*n*) = list_vt_iforeach<a>(xs)
//
in
  // nothing
end // end of [fprint_list_vt]

implement
{a}(*tmp*)
fprint_list_vt_sep
  (out, xs, sep) = let
//
implement
fprint_list_vt$sep<(*none*)>
  (out) = fprint_string(out, sep)
//
in
  fprint_list_vt<a>(out, xs)
end // end of [fprint_list_vt_sep]

(* ****** ****** *)

implement
{x}(*tmp*)
list_vt_is_nil(xs) =
  case+ xs of list_vt_nil () => true | _ =>> false
// end of [list_vt_is_nil]

implement
{x}(*tmp*)
list_vt_is_cons(xs) =
  case+ xs of list_vt_cons _ => true | _ =>> false
// end of [list_vt_is_cons]

implement
{x}(*tmp*)
list_vt_is_sing (xs) =
  case+ xs of list_vt_sing (x) => true | _ =>> false
// end of [list_vt_is_sing]

implement
{x}(*tmp*)
list_vt_is_pair (xs) =
  case+ xs of list_vt_pair (x1, x2) => true | _ =>> false
// end of [list_vt_is_pair]

(* ****** ****** *)

implement
{}(*tmp*)
list_vt_unnil (xs) = let
  val+~list_vt_nil () = xs in (*nothing*)
end // end of [list_vt_unnil]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_uncons(xs) = let
  val+~list_vt_cons(x, xs1) = xs in xs := xs1; x
end // end of [list_vt_uncons]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_length(xs) = let
//
fun
loop
{i,j:nat} .<i>.
(
xs: !list_vt(a, i), j: int j
) :<> int (i+j) = let
in
//
case+ xs of
| list_vt_cons
    (_, xs) => loop(xs, j + 1)
| list_vt_nil () => j
//
end // end of [loop]
//
prval() = lemma_list_vt_param(xs)
//
in
  loop(xs, 0)
end // end of [list_vt_length]

(* ****** ****** *)

implement
{x}(*tmp*)
list_vt_copy(xs) = let
//
implement
{x2}(*tmp*)
list_vt_copylin$copy
  (x) = $UN.ptr0_get<x2>(addr@x)
//
in
  $effmask_all(list_vt_copylin<x>(xs))
end // end of [list_vt_copy]

implement
{x}(*tmp*)
list_vt_copylin
  (xs) = let
//
prval() = lemma_list_vt_param(xs)
//
fun
loop
{n:nat} .<n>.
(
  xs: !list_vt(x, n), res: &ptr? >> list_vt(x, n)
) : void = let
in
//
case+ xs of
| @list_vt_cons
    (x, xs1) => let
//
    val x =
    list_vt_copylin$copy<x>(x)
    val () =
    res := list_vt_cons{x}{0}(x, _)
    val+list_vt_cons(_, res1) = res
//
    val () = loop(xs1, res1)
//
    prval ((*folded*)) = fold@ (xs)
    prval ((*folded*)) = fold@ (res)
//
  in
    // nothing
  end // end of [list_vt_cons]
| list_vt_nil() => res := list_vt_nil()
//
end // end of [loop]
//
in
//
let
var res: ptr
val () = $effmask_all(loop(xs, res)) in res
end
//
end // end of [list_vt_copylin]

(* ****** ****** *)

implement
{x}(*tmp*)
list_vt_copylin_fun
  (xs, f1) = let
//
implement
{x2}(*tmp*)
list_vt_copylin$copy
  (x) = x2 where
{
//
val f2 =
$UN.cast{(&RD(x2))->x2}(f1)
//
val x2 = $effmask_all(f2(x))
//
} (* end of [copy] *)
//
in
  list_vt_copylin<x>(xs)
end // end of [list_vt_copylin_fun]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_getref_at
  {n}{i} (xs, i) = let
//
fun
loop {
  n,i:nat | i <= n
} .<i>. (
  xs: &list_vt(a, n), i: int i
) :<> Ptr1 = let
in
//
if
(i > 0)
then res where
{
  val+
  @list_vt_cons(_, xs1) = xs
  val res =
  loop{n-1,i-1}(xs1, pred(i))
  prval ((*folded*)) = fold@ (xs)
} (* end of [then] *)
else $UN.cast2Ptr1(addr@(xs))
//
end // end of [loop]
//
in
//
$UN.ptr2cptr{list_vt(a,n-i)}(loop(xs, i))
//
end // end of [list_vt_getref_at]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_get_at
  {n} (xs, i) = x where
{
//
var xs = __ref (xs) where
{
  extern
  castfn __ref
    (xs: !list_vt(a, n)):<> list_vt(a, n)
  // castfn
} // end of [val]
//
val pi =
list_vt_getref_at<a>(xs, i)
//
val+list_cons(x, _) =
  $UN.ptr1_get<List1(a)>(cptr2ptr(pi))
//
prval() =
__unref(xs) where
{
  extern
  praxi __unref(xs: list_vt(a, n)): void
} // end of [prval]
//
} // end of [list_vt_get_at]

implement
{a}(*tmp*)
list_vt_set_at
  {n}(xs, i, x0) = let
//
var xs =
__ref(xs) where
{
  extern
  castfn __ref
    (xs: !list_vt(a, n)):<> list_vt(a, n)
  // end of [__ref]
} (* end of [val] *)
//
val pi =
list_vt_getref_at<a>(xs, i)
val
(pf, fpf | pi) = $UN.cptr_vtake(pi)
//
val+@list_vt_cons(x1, xs1) = !pi
//
val () = x1 := x0
//
prval() = fold@(!pi); prval() = fpf(pf)
//
prval() = let
  extern
  praxi __unref (xs: list_vt(a, n)): void
in
  __unref(xs)
end // end of [prval]
//
in
  // nothing
end // end of [list_vt_set_at]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_exch_at
  {n}(xs, i, x0) = let
//
var xs =
__ref(xs) where
{
  extern
  castfn __ref
    (xs: !list_vt(a, n)):<> list_vt(a, n)
} // end of [val]
//
val pi =
list_vt_getref_at<a>(xs, i)
val
(pf, fpf | pi) = $UN.cptr_vtake(pi)
val+@list_vt_cons(x1, xs1) = !pi
//
val t = x1
val () = x1 := x0
val () = x0 := t
prval() = fold@(!pi); prval() = fpf(pf)
//
prval() =
__unref(xs) where
{
  extern
  praxi __unref (xs: list_vt(a, n)): void
} // end of [prval]
//
in
  // nothing
end // end of [list_vt_exch_at]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_insert_at
  {n} (xs, i, x) = let
//
val pi =
list_vt_getref_at<a>(xs, i)
val xs_i = $UN.cptr_get(pi)
val xs1_i = list_vt_cons(x, xs_i)
val () =
  $UN.ptr1_set<List1_vt(a)>(cptr2ptr(pi), xs1_i)
//
prval() =
__assert(xs) where
{
  extern
  praxi
  __assert(xs: &list_vt(a, n) >> list_vt(a, n+1)): void
} // end of [prval]
in
  // nothing
end // end of [list_vt_insert_at]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_takeout_at
{n} (xs, i) = x1 where
{
//
val pi =
list_vt_getref_at<a>(xs, i)
val xs_i = $UN.cptr_get(pi)
val+~list_vt_cons(x1, xs1_i) = xs_i
val () =
  $UN.ptr1_set<List0_vt(a)> (cptr2ptr(pi), xs1_i)
//
prval() =
__assert(xs) where
{
  extern
  praxi
  __assert(xs: &list_vt(a, n) >> list_vt(a, n-1)): void
} (* end of [prval] *)
//
} // end of [list_vt_takeout_at]

(* ****** ****** *)
//
implement
{a}(*tmp*)
list_vt_copy(xs) =
  list_copy<a>($UN.list_vt2t(xs))
//
(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_free(xs) = let
//
implement
(a2:t0p)
list_vt_freelin$clear<a2>
  (x) = let
  prval () = topize(x) in (*void*)
end // end of [list_vt_freelin$clear]
//
in
  list_vt_freelin<a>(xs)
end // end of [list_vt_free]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_freelin$clear
  (x) = gclear_ref<a>(x)
implement
{a}(*tmp*)
list_vt_freelin(xs) = let
//
prval() = lemma_list_vt_param(xs)
//
fun
loop
{n:nat} .<n>.
(
xs: list_vt(a, n)
) :<!wrt> void =
(
  case+ xs of
  | ~list_vt_nil
      () => ((*void*))
    // list_vt_nil
  | @list_vt_cons
      (x, xs1) => let
      val () =
        list_vt_freelin$clear<a>(x)
      val xs1 = xs1
      val ((*freed*)) = free@{a}{0}(xs)
    in
      loop(xs1)
    end // end of [list_vt_cons]
) (* end of [loop] *)
//
in
  loop(xs)
end // end of [list_vt_freelin]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_freelin_fun
  (xs, f1) = let
//
implement
{a2}(*tmp*)
list_vt_freelin$clear
  (x) = () where
{
//
val f2 =
  $UN.cast{(&a2 >> _?) -> void}(f1)
//
val ((*void*)) = $effmask_all(f2(x))
//
} (* end of [clear] *)
//
in
  list_vt_freelin<a>(xs)
end // end of [list_vt_freelin_fun]

(* ****** ****** *)
//
implement
{a}(*tmp*)
list_vt_uninitize
  {n}(xs) = let
//
prval() = lemma_list_vt_param(xs)
//
fun
loop
{n:nat} .<n>.
(
xs: !list_vt(a, n) >> list_vt(a?, n)
) :<!wrt> void =
(
  case+ xs of
  | @list_vt_nil
      () => fold@{a?}(xs)
    // end of [list_vt_nil]
  | @list_vt_cons
      (x, xs1) => let
      val () =
        list_vt_uninitize$clear(x)
      val () = loop(xs1)
      prval ((*folded*)) = fold@{a?}(xs)
    in
      // nothing
    end // end of [list_vt_cons]
) (* end of [loop] *)
//
in
  loop(xs)
end // end of [list_vt_uninitize]
//
implement
{a}(*tmp*)
list_vt_uninitize$clear(x) = gclear_ref<a>(x)
//
(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_append
  {m,n}(xs, ys) = let
//
prval() =
lemma_list_vt_param(xs)
prval() =
lemma_list_vt_param(ys)
//
fun
loop
{m:nat} .<m>.
(
xs: &list_vt(a, m) >> list_vt(a, m+n), ys: list_vt(a, n)
) :<!wrt> void = let
in
//
case+ xs of
| ~list_vt_nil
    () => (xs := ys)
  // end of [list_vt_nil]
| @list_vt_cons
    (x, xs1) => let
    val () = loop(xs1, ys); prval() = fold@(xs) in (*none*)
  end // end of [list_vt_cons]
//
end (* end of [loop] *)
//
var res = xs
//
in
  let val () = loop(res, ys) in res end
end // end of [list_vt_append]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_extend
  (xs, y) =
  list_vt_append<a>(xs, cons_vt{a}(y, nil_vt()))
// end of [list_vt_extend]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_unextend
  (xs) = let
//
fun loop
  {n:pos} .<n>.
(
xs: &list_vt(a, n) >> list_vt(a, n-1)
) :<!wrt> (a) = let
//
val+@list_vt_cons(x, xs1) = xs
//
in
//
case+ xs1 of
| list_vt_nil() => let
    val x = x
    val xs1 = xs1
    val () = free@{a}{0}(xs)
  in
    xs := xs1; x
  end // end of [list_vt_nil]
| list_vt_cons _ => let
    val x = loop(xs1)
    prval() = fold@ (xs) in (x)
  end // end of [list_vt_cons]
//
end // end of [loop]
//
in
  loop(xs)
end // end of [list_vt_unextend]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_reverse (xs) =
list_vt_reverse_append<a>(xs, list_vt_nil(*void*))

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_reverse_append
  (xs, ys) = let
//
prval() = lemma_list_vt_param(xs)
prval() = lemma_list_vt_param(ys)
//
fun
loop
{m,n:nat} .<m>.
(
xs: list_vt(a, m), ys: list_vt(a, n)
) :<!wrt> list_vt(a, m+n) =
(
  case+ xs of
  | ~list_vt_nil
      () => ys
    // list_vt_nil
  | @list_vt_cons
      (_, xs1) => let
      val xs1_ = xs1
      val () = xs1 := ys; prval() = fold@ (xs)
    in
      loop(xs1_, xs)
    end // end of [cons]
) (* end of [loop] *)
//
in
  loop(xs, ys)
end // end of [list_vt_reverse_append]

(* ****** ****** *)

implement
{x}(*tmp*)
list_vt_split_at
  (xs, i) = let
//
fun loop
  {n:int}
  {i:nat | i <= n} .<n>.
(
xs: &list_vt(x, n) >> list_vt(x, i), i: int i
) :<!wrt> list_vt(x, n-i) =
(
if i > 0 then let
//
val+@cons_vt(x, xs1) = xs
//
val res = loop(xs1, i-1)
prval ((*folded*)) = fold@ (xs)
//
in
  res
end else let
  val res = xs
  val () = xs := list_vt_nil((*void*))
in
  res
end // end of [if]
) // end of [loop]
//
var xs = xs
val res = loop(xs, i)
//
in
  (xs, res)
end // end of [list_split_vt_at]

(* ****** ****** *)

(*
implement
{a}(*tmp*)
list_vt_concat
  (xss) = let
//
viewtypedef VT = List_vt(a)
viewtypedef VT0 = List0_vt(a)
//
fun loop
  {n:nat} .<n>.
(
  res: VT, xss: list_vt(VT, n)
) :<!wrt> VT0 = let
in
  case+ xss of
  | ~list_vt_cons
      (xs, xss) => let
      val res =
      list_vt_append<a>(xs, res)
    in
      loop(res, xss)
    end // end of [list_vt_cons]
  | ~list_vt_nil() => let
      prval() = lemma_list_vt_param(res) in res
    end // end of [list_vt_nil]
end (* end of [loop] *)
//
val xss = list_vt_reverse<a>(xss)
//
prval() = lemma_list_vt_param(xss)
//
in
//
case+ xss of
| ~list_vt_cons
    (xs, xss) => loop(xs, xss)
| ~list_vt_nil() => list_vt_nil()
//
end // end of [list_vt_concat]
*)

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_concat
  (xss) = let
//
fun
last(res: ptr): ptr = let
//
val xs0 =
$UN.ptr0_get<List_vt(a)>(res)
//
in
//
case+ xs0 of
| list_vt_nil
    () => res where
  {
    prval () = $UN.cast2void(xs0)
  }
| @list_vt_cons
    (x0, xs1) => let
    val res = addr@xs1
    prval () = fold@(xs0)
    prval () = $UN.cast2void(xs0)
  in
    last(res)
  end // end of [list_vt_cons]
//
end // end of [last]
//
fun
loop
( res: ptr,
  xss: List_vt(List_vt(a))) : void =
(
case+ xss of
| ~list_vt_nil() => ()
| ~list_vt_cons(xs, xss) =>
    loop(last(res), xss) where
  {
    val () =
    $UN.ptr0_set<List_vt(a)>(res, xs)
  }
)
//
var
res0:
List0_vt(a) = list_vt_nil()
//
in
  $effmask_all(loop(addr@res0, xss)); res0
end // end of [list_vt_concat]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_filter(xs) = let
//
implement
list_vt_filterlin$pred<a>
  (x) = list_vt_filter$pred<a>(x)
implement
list_vt_filterlin$clear<a>
  (x) = let
  prval () = topize (x) in (*void*)
end // end of [list_vt_filterlin$clear]
//
in
  list_vt_filterlin<a>(xs)
end // end of [list_vt_filter]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_filterlin(xs) = let
//
prval() = lemma_list_vt_param(xs)
//
fun
loop
{n:nat} .<n>.
(
xs: &list_vt(a, n) >> listLte_vt(a, n)
) :<!wrt> void = let
in
//
case+ xs of
| @list_vt_nil
    () => fold@ (xs)
  // list_vt_nil
| @list_vt_cons
    (x, xs1) => let
    val test =
      list_vt_filterlin$pred<a>(x)
    // end of [val]
  in
    if test then let
      val () = loop(xs1)
    in
      fold@ (xs)
    end else let
      val xs1 = xs1
      val () =
        list_vt_filterlin$clear<a>(x)
      val ((*freed*)) = free@{a}{0}(xs)
    in
      let val () = xs := xs1 in loop(xs) end
    end // end of [if]
  end // end of [list_vt_cons]
//
end // end of [loop]
//
in
  let var xs = xs in loop(xs); xs end
end // end of [list_vt_filterlin]

(* ****** ****** *)
//
implement
{a}(*tmp*)
list_vt_filterlin$clear(x) = gclear_ref<a>(x)

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_separate
  (xs, n1) = res2 where
{
//
prval() = lemma_list_vt_param(xs)
//
fun
loop
{k,n:nat} .<n>.
(
  xs: list_vt(a, n)
, n1: &int(k) >> int(n1+k)
, res1: &ptr? >> list_vt(a, n1)
, res2: &ptr? >> list_vt(a, n2)
) : #[n1,n2:nat | n1+n2==n] void =
(
//
case+ xs of
| ~list_vt_nil() =>
  (
    res1 := list_vt_nil();
    res2 := list_vt_nil();
  ) (* end of [list_vt_nil] *)
| @list_vt_cons
    (x, xs_tl) => let
    val xs_tl_ = xs_tl
    val test =
      list_vt_separate$pred<a>(x)
    // end of [val]
  in
    if test
      then let
      val () = n1 := n1+1
      val () = res1 := xs
      val () = loop(xs_tl_, n1, xs_tl, res2)
    in
      fold@(res1)
    end else let
      val () = res2 := xs
      val () = loop(xs_tl_, n1, res1, xs_tl)
    in
      fold@(res2)
    end // end of [if]
  end // end of [list_vt_cons]
//
) (* end of [loop] *)
//
var res1: ptr
var res2: ptr
//
val () = n1 := 0
val () = loop(xs, n1, res1, res2)
val () = xs := res1
//
} (* end of [list_vt_separate] *)

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_take_until
  (xs, n1) = res1 where
{
//
prval() = lemma_list_vt_param(xs)
//
fun
loop
{k,n:nat} .<n>.
(
  xs: list_vt(a, n)
, n1: &int(k) >> int(n1+k)
, res1: &ptr? >> list_vt(a, n1)
, res2: &ptr? >> list_vt(a, n2)
) : #[n1,n2:nat | n1+n2==n] void =
(
//
case+ xs of
| ~list_vt_nil() =>
  (
    res1 := list_vt_nil();
    res2 := list_vt_nil();
  ) (* end of [list_vt_nil] *)
| @list_vt_cons
    (x, xs_tl) => let
    val test =
      list_vt_take_until$pred<a>(x)
    // end of [val]
  in
    if test
      then let
      val () =
      res1 := list_vt_nil
      val () = res2 := xs
    in
      fold@(res2) // folded
    end else let
      val xs_tl_ = xs_tl
      val () = n1 := n1+1
      val () = res1 := xs
      val () = loop(xs_tl_, n1, xs_tl, res2)
    in
      fold@(res1) // folded
    end // end of [if]
  end // end of [list_vt_cons]
//
) (* end of [loop] *)
//
var res1: ptr
var res2: ptr
//
val () = n1 := 0
val () = loop(xs, n1, res1, res2)
val () = xs := res2
//
} (* end of [list_vt_take_until] *)

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_app
  (xs) =
  loop(xs) where
{
//
fun
loop
(
xs: !List_vt(a)
) : void =
(
case+ xs of
| @list_vt_cons
    (x, xs1) =>
  {
    val () =
    list_vt_app$fwork<a>(x)
    val () = loop(xs1)
    prval ((*folded*)) = fold@(xs)
  } (* end of [cons] *)
| list_vt_nil((*void*)) => ()
)
//
} // end of [list_vt_app]

implement
{a}(*tmp*)
list_vt_appfree
  (xs) =
  loop(xs) where
{
fun
loop
(
xs: List_vt(a)
) : void = (
//
case+ xs of
| @list_vt_cons
    (x, xs1) =>
    loop(xs1) where
  {
    val xs1 = xs1
    val () =
    list_vt_appfree$fwork<a>(x)
    val ((*freed*)) = free@{a}{0}(xs)
  } (* end of [cons] *)
| ~list_vt_nil((*void*)) => ()
//
) (* end of [loop] *)
} // end of [list_vt_appfree]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_iapp
  (xs) =
  loop(0, xs) where
{
//
fun
loop
(
i0: intGte(0),
xs: !List_vt(a)
) : void =
(
case+ xs of
| @list_vt_cons
    (x, xs1) =>
  {
    val () =
    list_vt_iapp$fwork<a>(i0, x)
    val () = loop(i0+1, xs1)
    prval ((*folded*)) = fold@(xs)
  } (* end of [cons] *)
| list_vt_nil((*void*)) => ((*void*))
)
//
} // end of [list_vt_iapp]

implement
{a}(*tmp*)
list_vt_iappfree
  (xs) =
  loop(0, xs) where
{
fun
loop
(
i0: intGte(0),
xs: List_vt(a)
) : void = (
//
case+ xs of
| @list_vt_cons
    (x, xs1) =>
    loop(i0+1, xs1) where
  {
    val xs1 = xs1
    val () =
    list_vt_iappfree$fwork<a>(i0, x)
    val ((*freed*)) = free@{a}{0}(xs)
  } (* end of [cons] *)
| ~list_vt_nil((*void*)) => ((*void*))
//
) (* end of [loop] *)
} // end of [list_vt_iappfree]

(* ****** ****** *)

implement
{a}{b}
list_vt_map
  (xs) = let
//
prval() =
lemma_list_vt_param(xs)
//
fun
loop
{n:nat} .<n>.
(
  xs: !list_vt(a, n)
, res: &ptr? >> list_vt(b, n)
) : void = let
in
  case+ xs of
  | list_vt_nil() =>
      (res := list_vt_nil())
    // end of [list_vt_nil]
  | @list_vt_cons
      (x, xs1) => let
      val y =
      list_vt_map$fopr<a><b>(x)
      // end of [val]
      val () =
      res := list_vt_cons{b}{0}(y, _)
      val+list_vt_cons(_, res1) = res
      val () = loop(xs1, res1)
      prval ((*folded*)) = fold@ (xs)
      prval ((*folded*)) = fold@ (res)
    in
      // nothing
    end // end of [list_vt_cons]
end // end of [loop]
//
in
  let var res: ptr in loop(xs, res); res end
end // end of [list_vt_map]

(* ****** ****** *)

implement
{a}{b}
list_vt_mapfree
  (xs) = let
//
prval() =
lemma_list_vt_param(xs)
//
fun
loop
{n:nat} .<n>.
(
  xs: list_vt(a, n)
, res: &ptr? >> list_vt(b, n)
) : void = let
in
  case+ xs of
  | @list_vt_cons
      (x, xs1) => let
      val y =
      list_vt_mapfree$fopr<a><b>(x)
      val xs1_val = xs1
      val ((*freed*)) = free@{a}{0}(xs)
      val () =
      res := list_vt_cons{b}{0}(y, _)
      val+list_vt_cons(_, res1) = res
      val () = loop(xs1_val, res1)
      prval ((*folded*)) = fold@(res)
    in
      // nothing
    end // end of [list_vt_cons]
  | ~list_vt_nil() => (res := list_vt_nil())
end // end of [loop]
//
in
  let var res: ptr in loop(xs, res); res end
end // end of [list_vt_mapfree]

(* ****** ****** *)

implement
{x}(*tmp*)
list_vt_foreach
  (xs) = let
  var env: void = ()
in
  list_vt_foreach_env<x><void> (xs, env)
end // end of [list_vt_foreach]

implement
{x}{env}
list_vt_foreach_env
  (xs, env) = let
//
prval() =
lemma_list_vt_param(xs)
//
fun loop
  {n:nat} .<n>.
(
  xs: !list_vt(x, n), env: &env
) : void = let
in
//
case+ xs of
| @list_vt_cons
    (x, xs1) => let
    val test =
      list_vt_foreach$cont<x><env>(x, env)
    // end of [val]
  in
    if test then let
      val () =
        list_vt_foreach$fwork<x><env>(x, env)
      val () = loop(xs1, env)
      prval ((*void*)) = fold@ (xs)
    in
      // nothing
    end else let
      prval ((*void*)) = fold@ (xs) in (*nothing*)
    end // end of [if]
  end // end of [cons]
| list_vt_nil((*void*)) => ()
//
end // end of [loop]
//
in
  loop(xs, env)
end // end of [list_vt_foreach_env]

(* ****** ****** *)

implement
{x}{env}
list_vt_foreach$cont(x, env) = true

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_foreach_funenv
  {v}{vt}{fe}
  (pf | xs, f0, env) = let
//
prval() =
lemma_list_vt_param(xs)
//
fun
loop
{n:nat} .<n>.
(
  pf: !v
| xs: !list_vt(a, n)
, f0: (!v | &a, !vt) -<fe> void
, env: !vt
) :<fe> void =
  case+ xs of
  | @list_vt_cons
      (x, xs1) => let
      val () = f0 (pf | x, env)
      val () = loop(pf | xs1, f0, env)
    in
      fold@ (xs)
    end // end of [cons]
  | list_vt_nil ((*void*)) => ()
// end of [loop]
//
in
  loop(pf | xs, f0, env)
end // end of [list_vt_foreach_funenv]

(* ****** ****** *)

implement
{x}(*tmp*)
list_vt_iforeach
  (xs) = let
  var env: void = ()
in
  list_vt_iforeach_env<x><void> (xs, env)
end // end of [list_vt_iforeach]

implement
{x}{env}
list_vt_iforeach_env
  (xs, env) = let
//
prval() =
lemma_list_vt_param(xs)
//
fun
loop
{n:nat}{i:nat} .<n>.
(
  i: int i, xs: !list_vt(x, n), env: &env
) : intBtwe(i, n+i) = let
in
  case+ xs of
  | @list_vt_cons
      (x, xs1) => let
      val test =
      list_vt_iforeach$cont<x><env>
        (i, x, env)
      // end of [val]
    in
      if test then let
        val () =
        list_vt_iforeach$fwork<x><env>
          (i, x, env)
        // end of [val]
        val i = loop(succ(i), xs1, env)
        prval ((*folded*)) = fold@ (xs)
      in
        i // the number of processed elements
      end else let
        prval ((*folded*)) = fold@ (xs)
      in
        i // the number of processed elements
      end // end of [if]
    end // end of [cons]
  | list_vt_nil ((*void*)) => (i) // |processed-elements|
end // end of [loop]
//
in
  loop(0, xs, env)
end // end of [list_vt_iforeach_env]

(* ****** ****** *)

implement
{x}{env}
list_vt_iforeach$cont(i, x, env) = true

(* ****** ****** *)

#include "./SHARE/list_vt_mergesort.dats"
#include "./SHARE/list_vt_quicksort.dats"

(* ****** ****** *)

implement
{a}(*tmp*)
streamize_list_vt_elt
  (xs) = let
//
fun
auxmain
(
xs: List_vt(a)
) : stream_vt(a) = $ldelay
(
//
(
case+ xs of
| ~list_vt_nil
    () => stream_vt_nil()
| ~list_vt_cons
    (x, xs) =>
    stream_vt_cons(x, auxmain(xs))
) : stream_vt_con(a)
//
,
//
list_vt_freelin<a>(xs)
) (* end of [auxmain] *)
//
in
  $effmask_all(auxmain(xs))
end (* end of [streamize_list_vt_elt] *)

(* ****** ****** *)

implement
{a,b}(*tmp*)
streamize_list_vt_zip
  (xs, ys) =
  auxmain(xs, ys) where
{
//
fun
auxmain:
$d2ctype
(
streamize_list_vt_zip<a,b>
) =
lam
(
xs, ys
) => $ldelay (
(
case+ xs of
| ~list_vt_nil() =>
  (
    stream_vt_nil()
  ) where
  {
    val+~list_vt_nil() = ys
  }
| ~list_vt_cons(x, xs) =>
  (
    case+ ys of
(*
    | ~list_vt_nil() => let
        var x = x
        val () = list_vt_freelin$clear<a>(x)
      in
        list_vt_freelin(xs); stream_vt_nil()
      end // end of [list_vt_nil]
*)
    | ~list_vt_cons(y, ys) =>
      (
        stream_vt_cons((x, y), auxmain(xs, ys))
      )
  ) (* end of [list_vt_cons] *)
)
, (list_vt_freelin(xs); list_vt_freelin(ys))
) (* end of [$ldelay] *)
//
} (* end of [streamize_list_vt_zip] *)

(* ****** ****** *)

implement
{tk}(*tmp*)
listize_g0int_rep
  (i0, base) = let
//
fun
loop{i:int}
(
i0: g1int(tk, i), res: List0_vt(int)
) : List0_vt(int) =
(
if
isgtz(i0)
then
loop
( ndiv_g1int_int1(i0, base)
, list_vt_cons(nmod_g1int_int1(i0, base), res)
) (* end of [then] *)
else res // end-of-else
)
//
in
//
$UN.castvwtp0
(
$effmask_all(loop(g1ofg0_int(i0), list_vt_nil(*void*)))
) (* $UN.castvwtp0 *)
//
end // end of [listize_g0int_rep]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_permute
  {n}(xs) = xs where
{
//
prval() =
lemma_list_vt_param(xs)
//
fun
loop1
{n:nat} .<n>.
(
p0: ptr, xs: !list_vt(a, n)
) : void =
(
case+ xs of
| list_vt_nil
    () => ((*void*))
  // list_vt_nil
| list_vt_cons
    (_, xs_tl) => let
    val () =
    $UN.ptr0_set<ptr>
      (p0, $UN.castvwtp1{ptr}(xs))
    // end of [val]
  in
    loop1(ptr_succ<ptr>(p0), xs_tl)
  end // end of [loop1]
)
//
val n0 =
  i2sz(list_vt_length<a>(xs))
//
val A0 =
  arrayptr_make_uninitized<ptr>(n0)
val () = loop1(ptrcast(A0), xs)
val xs = $UN.castvwtp0{ptr}(xs)
val A0 = $UN.castvwtp0{arrayptr(ptr,n)}(A0)
//
local
//
implement
array_permute$randint<>(n) =
i2sz(list_vt_permute$randint<>(sz2i(n)))
//
in (* in-of-local *)
//
val
(pf | p0) =
arrayptr_takeout_viewptr{ptr}(A0)
//
val
((*void*)) = array_permute<ptr>(!p0, n0)
//
prval
((*void*)) = arrayptr_addback{ptr}(pf | A0)
//
end // end of [local]
//
fun
loop2
{i:nat|i <= n} .<i>.
(
pz: ptr, i0: size_t(i), res: list_vt(a, n-i)
) : list_vt(a, n) =
(
//
if
(i0 > 0)
then let
//
val pz = ptr_pred<ptr>(pz)
val xs =
$UN.ptr0_get<
  list_vt_cons_pstruct(a,ptr?)>(pz)
//
val+
list_vt_cons(_, xs_tl) = xs
//
val () = (xs_tl := res)
prval((*folded*)) = fold@(xs)
//
in
  loop2(pz, pred(i0), xs(*res*))
end // end of [then]
else res // end of [else]
//
) (* end of [loop2] *)
//
val pz = ptr_add<ptr>(ptrcast(A0), n0)
val xs = loop2(pz, n0, list_vt_nil(*void*))
//
val ((*freed*)) = arrayptr_free{ptr}(A0)
//
} (* end of [list_vt_permute] *)

(* ****** ****** *)

(* end of [list_vt.dats] *)

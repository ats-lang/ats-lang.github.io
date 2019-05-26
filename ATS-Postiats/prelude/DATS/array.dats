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
** $PATSHOME/prelude/DATS/CODEGEN/array.atxt
** Time of generation: Wed Oct 10 21:08:52 2018
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Start time: Feburary, 2012 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

macdef
castvwtp_trans = $UN.castvwtp0 // former name

(* ****** ****** *)

implement
{a}(*tmp*)
array_getref_at
  (A, i) = let
//
val p =
  ptr0_add_guint<a>(addr@(A), i) in $UN.cast{cPtr1(a)}(p)
//
end // end of [array_getref_at]

(* ****** ****** *)

implement
{a}{tk}(*tmp*)
array_get_at_gint (A, i) = let
  val p = ptr0_add_gint<a>(addr@(A), i) in $UN.ptr0_get<a>(p)
end // end of [array_get_at_gint]
implement
{a}{tk}(*tmp*)
array_get_at_guint (A, i) = let
  val p = ptr0_add_guint<a>(addr@(A), i) in $UN.ptr0_get<a>(p)
end // end of [array_get_at_guint]

(* ****** ****** *)

implement
{a}{tk}(*tmp*)
array_set_at_gint (A, i, x) = let
  val p = ptr0_add_gint<a>(addr@(A), i) in $UN.ptr0_set<a>(p, x)
end // end of [array_set_at_uint]
implement
{a}{tk}(*tmp*)
array_set_at_guint (A, i, x) = let
  val p = ptr0_add_guint<a>(addr@(A), i) in $UN.ptr0_set<a>(p, x)
end // end of [array_set_at_guint]

(* ****** ****** *)

implement
{a}{tk}(*tmp*)
array_exch_at_gint (A, i, x) = let
  val p = ptr0_add_gint<a>(addr@(A), i) in $UN.ptr0_exch<a>(p, x)
end // end of [array_exch_at_gint]
implement
{a}{tk}(*tmp*)
array_exch_at_guint (A, i, x) = let
  val p = ptr0_add_guint<a>(addr@(A), i) in $UN.ptr0_exch<a>(p, x)
end // end of [array_exch_at_guint]

(* ****** ****** *)

implement
{a}(*tmp*)
array_subreverse
  (A, i, j) = let
//
fun
loop
(
  p1: ptr, p2: ptr
) : void =
(
if
p1 < p2
then let
  val x = $UN.ptr0_get<a>(p1)
  val () =
  $UN.ptr0_set<a>(p1, $UN.ptr0_get<a>(p2))
  val () = $UN.ptr0_set<a>(p2, x)
in
  loop(ptr0_succ<a>(p1), ptr0_pred<a>(p2))
end // end of [then]
else () // end of [else]
) (* end of [loop] *)
//
val pA = addr@A
val pi = ptr_add<a>(pA, i)
val pj = ptr_add<a>(pA, j)
//
in
  $effmask_all(loop(pi, ptr0_pred<a>(pj)))
end // end of [array_subreverse]

(* ****** ****** *)

implement
{a}(*tmp*)
array_interchange
  (A, i, j) = let
//
(*
val () =
  println! ("array_interchange")
*)
//
in
//
if i != j then let
  val p0 = addr@(A)
  val pi = ptr0_add_guint<a>(p0, i)
  val pj =
    g1ofg0_ptr(ptr0_add_guint<a>(p0, j))
  // end of [val]
  val (pf, fpf | pj) = $UN.ptr_vtake{a}(pj)
  val () = $UN.ptr0_exch<a>(pi, !pj)
  prval ((*returned*)) = fpf(pf)
in
  // nothing
end else () // end of [if]
//
end // end of [array_interchange]

(* ****** ****** *)

implement
{a}(*tmp*)
array_subcirculate
  (A, i, j) = let
//
extern
fun
memmove
(
  dst: ptr, src: ptr, bsz: size_t
) :<!wrt> ptr = "mac#atspre_array_memmove"
//
in
//
if i < j then
{
//
val p0 =
  ptr_add<a>(addr@(A), i)
val p1 =
  ptr_add<a>(addr@(A), j)
//
val A1 = $UN.ptr0_get<a>(p1)
val _(*ptr*) = memmove (ptr_succ<a>(p0), p0, (j-i)*sizeof<a>)
val ((*void*)) = $UN.ptr0_set<a>(p0, A1)
//
} else if i > j then
{
//
val p0 =
  ptr_add<a>(addr@(A), j)
val p1 =
  ptr_add<a>(addr@(A), i)
//
val A0 = $UN.ptr0_get<a>(p0)
val _(*ptr*) = memmove (p0, ptr_succ<a>(p0), (i-j)*sizeof<a>)
val ((*void*)) = $UN.ptr0_set<a>(p1, A0)
//
} else ((*void*)) // end of [if]
//
end // end of [array_subcirculate]

(* ****** ****** *)

implement
{a}(*tmp*)
array_ptr_takeout
  {l}{n}{i}(pf | p, i) = let
  prval(pf, fpf) =
    array_v_takeout{a}{l}{n}{i}(pf)
  // end of [prval]
in
  (pf, fpf | ptr1_add_guint<a>(p, i))
end // end of [array_ptr_takeout]

(* ****** ****** *)

implement
{a}(*tmp*)
array_ptr_alloc
  {n}(asz) = let
//
val
[l:addr]
(
  pf, pfgc | p
) = malloc_gc (asz * sizeof<a>)
prval pf =
__assert(pf) where
{
extern praxi __assert
  (pf: b0ytes (n*sizeof(a)) @ l): array_v (a?, l, n)
// end of [__assert]
} // end of [where] // end of [prval]
//
in
  (pf, pfgc | p)
end // end of [array_ptr_alloc]

(* ****** ****** *)

implement
{}(*tmp*)
array_ptr_free
  {a}{l}{n}
  (pf, pfgc | p) = let
//
prval pf =
__assert(pf) where
{
//
extern praxi __assert
  (pf: array_v (a?, l, n)): b0ytes (n*sizeof(a)) @ l
// end of [__assert]
} // end of [where] // end of [prval]
//
in
  mfree_gc(pf, pfgc | p)
end // end of [array_ptr_free]

(* ****** ****** *)

implement
{a}(*tmp*)
array_ptr_tabulate
  (asz) = let
//
val
(
  pf, pfgc | p
) = array_ptr_alloc<a>(asz)
//
local
implement
{a2}(*tmp*)
array_initize$init
  (i, x) =
(
x :=
array_tabulate$fopr<a2>(i)
)
in (*in of [local]*)
//
val () = array_initize<a>(!p, asz)
//
end // end of [local]
//
in
  @(pf, pfgc | p)
end // end of [array_ptr_tabulate]

(* ****** ****** *)

implement
{a}(*tmp*)
fprint_array_int
  (out, A, asz) = let
//
prval() = lemma_array_param(A)
//
in
  fprint_array_size (out, A, i2sz(asz))
end // end of [fprint_array_int]

implement
{a}(*tmp*)
fprint_array_size
  (out, A, asz) = let
//
typedef tenv = int
//
implement
array_foreach$fwork<a><tenv>
  (x, env) = let
  val n = env
  val () = if n > 0 then fprint_array$sep<>(out)
  val () = env := n + 1
in
  fprint_ref<a>(out, x)
end // end of [array_foreach$fwork]
//
var env: tenv = 0
val _(*n*) = array_foreach_env<a><tenv> (A, asz, env)
//
in
  // nothing
end // end of [fprint_array_size]

(* ****** ****** *)

implement
{}(*tmp*)
fprint_array$sep(out) = fprint(out, ", ")

(* ****** ****** *)

implement
{a}(*tmp*)
fprint_array_sep
  (out, A, asz, sep) = let
//
implement
fprint_array$sep<>(out) = fprint (out, sep)
//
in
  fprint_array<a>(out, A, asz)
end // end of [fprint_array_sep]

(* ****** ****** *)

implement
{a}(*tmp*)
array_copy
  {n} (to, from, n) = let
//
val p_to = addr@(to) and p_from = addr@(from)
//
val _ =
$extfcall
(
  ptr, "atspre_array_memcpy", p_to, p_from, n*sizeof<a>
) (* end of [val] *)
//
extern
praxi __assert {l1,l2:addr}
(
  pf1: !array_v(a?, l1, n) >> array_v(a  , l1, n)
, pf2: !array_v(a , l2, n) >> array_v(a?!, l2, n)
) : void // end of [__assert]
//
prval() = __assert(view@(to), view@(from))
//
in
  // nothing
end // end of [array_copy]

(* ****** ****** *)

implement
{a}(*tmp*)
array_copy_from_list
  (A, xs) = let
//
prval() = lemma_list_param(xs)
//
fun loop
  {l:addr}{n:nat} .<n>.
(
  pf: !array_v (a?, l, n) >> array_v (a, l, n)
| p0: ptr l, xs: list (a, n)
) :<!wrt> void = (
  case+ xs of
  | list_nil() => let
      prval () = (pf := array_v_unnil_nil(pf))
    in
      // nothing
    end // end of [list_nil]
  | list_cons(x, xs) => let
      prval
      (pf1, pf2) = array_v_uncons(pf)
      val () = !p0 := x
      val () = loop(pf2 | ptr1_succ<a>(p0), xs)
      prval () = (pf := array_v_cons(pf1, pf2))
    in
      // nothing
    end // end of [list_cons]
) (* end of [loop] *)
//
in
  loop(view@(A) | addr@(A), xs)
end // end of [array_copy_from_list]

(* ****** ****** *)

implement
{a}(*tmp*)
array_copy_from_list_vt
  (A, xs) = let
//
prval() = lemma_list_vt_param(xs)
//
fun loop
  {l:addr}{n:nat} .<n>.
(
  pf: !array_v(a?, l, n)
        >> array_v(a, l, n)
| p0: ptr l, xs: list_vt (a, n)
) :<!wrt> void = (
  case+ xs of
  | ~list_vt_nil() => let
      prval () =
        (pf := array_v_unnil_nil(pf))
      // end of [prval]
    in
      // nothing
    end // end of [list_vt_nil]
  | ~list_vt_cons(x, xs) => let
      prval
      (pf1, pf2) = array_v_uncons(pf)
      val () = !p0 := x
      val () =
        loop(pf2 | ptr1_succ<a>(p0), xs)
      // end of [val]
      prval () = pf := array_v_cons(pf1, pf2)
    in
      // nothing
    end // end of [list_vt_cons]
) (* end of [loop] *)
//
in
  loop(view@(A) | addr@(A), xs)
end // end of [array_copy_from_list_vt]

(* ****** ****** *)

implement
{a}(*tmp*)
array_copy_to_list_vt
  (A, n) = res where {
//
prval() = lemma_array_param(A)
//
fun
loop
{l:addr}{n:nat} .<n>.
(
  pf: !array_v (a, l, n) >> array_v (a?!, l, n)
| p0: ptr l, nz: size_t n, res: &ptr? >> list_vt (a, n)
) :<!wrt> void = (
//
if
nz > 0
then let
  prval
  (pf1, pf2) = array_v_uncons(pf)
  val () =
    res := list_vt_cons{a}{0}(!p0, _)
  // end of [val]
  val+list_vt_cons(_, res1) = res
  val () = loop(pf2 | ptr1_succ<a>(p0), pred(nz), res1)
  prval () = (pf := array_v_cons(pf1, pf2))
  prval () = fold@ (res)
in
  // nothing
end else let
  prval () =
    pf := array_v_unnil_nil(pf) in res := list_vt_nil(*void*)
  // end of [prval]
end // end of [if]
) (* end of [loop] *)
//
var res: ptr
val () = loop(view@(A) | addr@(A), n, res)
//
} // end of [array_copy_to_list_vt]

(* ****** ****** *)

implement
{a}(*tmp*)
array_foreach
  (A, asz) = let
  var env: void = ()
in
  array_foreach_env<a><void> (A, asz, env)
end // end of [array_foreach]

implement
{a}{env}(*tmp*)
array_foreach_env
  {n0}(A, asz, env) = let
//
prval() = lemma_array_param(A)
//
fun
loop
{l:addr}
{n:nat | n <= n0} .<n>.
(
  pf: !array_v (a, l, n)
| p0: ptr l, nz: size_t n, env: &env
) : sizeLte(n0) = let
//
(*
val () =
println! ("array_foreach_env: loop")
*)
//
in
//
if
(nz > 0)
then let
  prval
  (
    pf1, pf2
  ) = array_v_uncons(pf)
  val cont =
    array_foreach$cont<a><env>(!p0, env)
  // end of [val]
in
  if cont then let
    val () =
      array_foreach$fwork<a><env>(!p0, env)
    // end of [val]
    val res =
      loop(pf2 | ptr1_succ<a>(p0), pred(nz), env)
    // end of [val]
    prval () = (pf := array_v_cons(pf1, pf2))
  in
    res
  end else let
    prval () = pf := array_v_cons(pf1, pf2) in (nz)
  end (* end of [if] *)
end else nz(*0*) // end of [if]
//
end // end of [loop]
//
val p0 = addr@(A)
//
val nz = loop(view@(A) | p0, asz, env)
//
in
  asz - nz
end // end of [array_foreach_env]

(* ****** ****** *)
//
implement
{a}{env}(*tmp*)
array_foreach$cont (x, env) = true
//
(*
implement
{a}{env}(*tmp*)
array_foreach$fwork (x, env) = ((*void*))
*)
//
(* ****** ****** *)

implement
{a}(*tmp*)
array_foreach_funenv
  {v}{vt}
(
  pf | A0, asz, fwork, env
) =
(
//
array_foreach_funenv_tsz
  {a}{v}{vt}(pf | A0, asz, sizeof<a>, fwork, env)
//
) (* end of [array_foreach_funenv] *)

(* ****** ****** *)

implement
{a1,a2}(*tmp*)
array_foreach2
  (A1, A2, asz) = let
  var env: void = ()
in
  array_foreach2_env<a1,a2><void> (A1, A2, asz, env)
end // end of [array_foreach2]

implement
{a1,a2}{env}
array_foreach2_env
  {n0}
  (A1, A2, asz, env) = let
//
prval() = lemma_array_param(A1)
//
fun
loop
{l1,l2:addr}
{n:nat | n <= n0} .<n>.
(
  pf1: !array_v(a1, l1, n)
, pf2: !array_v(a2, l2, n)
| p1: ptr l1, p2: ptr l2, nz: size_t n, env: &env
) : sizeLte(n0) = let
//
(*
//
val () =
println! ("array_foreach2_env: loop")
//
*)
//
in
//
if
(nz > 0)
then let
  prval
  (pf11, pf12) = array_v_uncons(pf1)
  prval
  (pf21, pf22) = array_v_uncons(pf2)
  val cont =
    array_foreach2$cont<a1,a2><env>(!p1, !p2, env)
  // end of [val]
in
  if cont then let
    val () =
      array_foreach2$fwork<a1,a2><env>(!p1, !p2, env)
    val res =
      loop (
        pf12, pf22
      | ptr1_succ<a1>(p1), ptr1_succ<a2>(p2), pred(nz), env
      ) (* loop *)
    prval () = pf1 := array_v_cons(pf11, pf12)
    prval () = pf2 := array_v_cons(pf21, pf22)
  in
    res
  end else let
    prval () = pf1 := array_v_cons(pf11, pf12)
    prval () = pf2 := array_v_cons(pf21, pf22) in (nz)
  end (* end of [if] *)
end else nz(*0*)
//
end // end of [loop]
//
val nz = loop(view@(A1), view@(A2) | addr@(A1), addr@(A2), asz, env)
//
in
  asz - nz
end // end of [array_foreach2_env]

(* ****** ****** *)

implement
{a1,a2}{env}
array_foreach2$cont (x1, x2, env) = true
(*
implement
{a1,a2}{env}
array_foreach2$fwork (x1, x2, env) = ((*void*))
*)

(* ****** ****** *)

implement
{a}(*tmp*)
array_iforeach
  (A, asz) = let
  var env: void = ()
in
  array_iforeach_env<a><void> (A, asz, env)
end // end of [array_iforeach]

implement
{a}{env}(*tmp*)
array_iforeach_env
  {n0} (A, asz, env) = let
//
prval() = lemma_array_param(A)
//
fun
loop
{l:addr}
{n:nat | n <= n0} .<n>.
(
  pf: !array_v (a, l, n)
| p0: ptr l, nz: size_t n, i0: size_t, env: &env
) : sizeLte (n0) = let
//
(*
val () =
println! ("array_iforeach_env: loop")
*)
//
in
//
if
(nz > 0)
then let
  prval (
    pf1, pf2
  ) = array_v_uncons(pf)
  val cont =
    array_iforeach$cont<a><env>(i0, !p0, env)
  // end of [val
in
  if cont then let
    val () =
      array_iforeach$fwork<a><env>(i0, !p0, env)
    val res =
      loop(pf2 | ptr1_succ<a>(p0), pred(nz), succ(i0), env)
    prval () = pf := array_v_cons{a}(pf1, pf2)
  in
    res
  end else let
    prval () = pf := array_v_cons(pf1, pf2) in (nz)
  end (* end of [if] *)
end // end of [then]
else nz(*0*) // end of [else]
//
end // end of [loop]
//
val p0 = addr@(A)
val nz = loop(view@(A) | p0, asz, g0int2uint(0), env)
//
in
  asz - nz
end // end of [array_iforeach_env]

(* ****** ****** *)
//
implement
{a}{env}(*tmp*)
array_iforeach$cont (i, x, env) = true
(*
implement
{a}{env}(*tmp*)
array_iforeach$fwork (i, x, env) = ((*void*))
*)
//
(* ****** ****** *)

implement
{a}(*tmp*)
array_rforeach
  (A, asz) = let
  var env: void = ()
in
  array_rforeach_env<a><void> (A, asz, env)
end // end of [array_rforeach]

implement
{a}{env}(*tmp*)
array_rforeach_env
  {n0} (A, asz, env) = let
//
prval() = lemma_array_param(A)
//
fun
loop
{l:addr}
{n:nat | n <= n0} .<n>.
(
  pf: !array_v (a, l, n)
| pz: ptr (l+n*sizeof(a)), nz: size_t n, env: &env
) : sizeLte (n0) = let
//
(*
//
val () =
println! ("array_rforeach_env: loop")
//
*)
//
in
//
if
(nz > 0)
then let
  prval
  (
    pf1, pf2
  ) = array_v_unextend(pf)
  val p1 = ptr1_pred<a>(pz)
  val (pf2 | p1) = viewptr_match(pf2 | p1)
  val cont = array_rforeach$cont<a><env>(!p1, env)
in
  if cont then let
    val () =
    array_rforeach$fwork<a><env>(!p1, env)
    val res = loop(pf1 | p1, pred(nz), env)
    prval () = pf := array_v_extend(pf1, pf2)
  in
    res
  end else let
    prval () = pf := array_v_extend{a}(pf1, pf2) in nz
  end (* end of [if] *)
end else nz(*0*) // end of [if]
//
end // end of [loop]
//
val pz =
  ptr1_add_guint<a>(addr@(A), asz)
//
val n0 = loop(view@(A) | pz, asz, env)
//
in
  asz - n0
end // end of [array_rforeach_env]

(* ****** ****** *)
//
implement
{a}{env}(*tmp*)
array_rforeach$cont (x, env) = true
(*
implement
{a}{env}(*tmp*)
array_rforeach$fwork (x, env) = ((*void*))
*)
//
(* ****** ****** *)

implement
{a}(*tmp*)
array_initize
  (A, asz) = let
//
stadef V = array_v
//
fun loop
  {l:addr}{n:nat} .<n>.
(
  pf: !V (a?, l, n) >> V (a, l, n)
| p0: ptr l, nz: size_t n, i0: size_t
) : void =
(
if
(nz > 0)
then let
//
  prval
  (pf1, pf2) = array_v_uncons(pf)
//
  val () =
    array_initize$init<a>(i0, !p0)
  // end of [val]
  val () =
    loop(pf2 | ptr1_succ<a>(p0), pred(nz), succ(i0))
  // end of [val]
//
  prval () = pf := array_v_cons{a}(pf1, pf2)
//
in
  // nothing
end else let
  prval () = pf := array_v_unnil_nil(pf)
in
  // nothing
end // end of [if]
) (* end of [loop] *)
//
prval() = lemma_g1uint_param(asz)
//
in
  loop(view@ (A) | addr@(A), asz, g0int2uint(0))
end // end of [array_initize]

(* ****** ****** *)

implement
{a}(*tmp*)
array_initize_elt
  (A, asz, elt) = let
//
implement
{a2}(*tmp*)
array_initize$init
  (i, xi) = xi := $UN.castvwtp0{a2}(elt)
//
in
  $effmask_all (array_initize<a>(A, asz))
end // end of [array_initize_elt]

(* ****** ****** *)

implement
{a}(*tmp*)
array_initize_list
  {n} (A, asz, xs) = let
//
typedef list0 = listGte (a, 0)
typedef list1 = listGte (a, 1)
//
fun loop
(
  p0: ptr, p1: ptr, xs: list0
) : void = let
//
(*
//
val () =
println!
  ("array_initize_list: loop")
//
*)
//
in
//
if (
p0 < p1
) then let
  val xs =
    $UN.cast{list1}(xs)
  // end of [val]
  val+list_cons(x, xs) = xs
  val () =
    $UN.ptr0_set<a>(p0, x)
  // end of [val]
  val p0 = ptr_succ<a>(p0)
in
  loop(p0, p1, xs)
end else () // end of [if]
//
end // end of [loop]
//
prval() = lemma_list_param(xs)
//
val p0 = addr@(A)
val p1 = ptr_add<a>(p0, asz)
val () = $effmask_all(loop(p0, p1, xs))
//
prval() =
__assert(A) where
{
//
extern
praxi
__assert (A: &array(a?, n) >> array(a, n)): void
//
} (* end of [prval] *)
//
in
  // nothing
end // end of [array_initize_list]

(* ****** ****** *)

implement
{a}(*tmp*)
array_initize_rlist
  {n} (A, asz, xs) = let
//
typedef list0 = listGte (a, 0)
typedef list1 = listGte (a, 1)
//
fun loop
(
  pz: ptr, p0: ptr, xs: list0
) : void = let
//
(*
//
val () =
println!
  ("array_initize_rlist: loop")
//
*)
//
in
//
if pz > p0 then let
  val xs =
    $UN.cast{list1}(xs)
  // end of [val]
  val+list_cons(x, xs) = xs
  val pz = ptr_pred<a>(pz)
  val () = $UN.ptr0_set<a>(pz, x)
in
  loop(pz, p0, xs)
end else () // end of [if]
//
end // end of [loop]
//
prval() = lemma_list_param(xs)
//
val p0 = addr@(A)
val pz = ptr_add<a>(p0, asz)
val () = $effmask_all(loop(pz, p0, xs))
//
prval() =
__assert(A) where
{
extern
praxi
__assert (A: &array(a?, n) >> array(a, n)): void
} (* end of [prval] *)
//
in
  // nothing
end // end of [array_initize_rlist]

(* ****** ****** *)

implement
{a}(*tmp*)
array_initize_list_vt
  {n} (A, asz, xs) = let
//
vtypedef list0 = listGte_vt (a, 0)
vtypedef list1 = listGte_vt (a, 1)
//
fun loop
(
  p0: ptr, p1: ptr, xs: list0
) : void = let
//
(*
val () =
println!
  ("array_initize_list_vt: loop")
*)
//
in
//
if p0 < p1 then let
  val xs =
    $UN.castvwtp0{list1}(xs)
  // end of [val]
  val+~list_vt_cons(x, xs) = xs
  val () = $UN.ptr0_set<a>(p0, x)
  val p0 = ptr_succ<a>(p0)
in
  loop(p0, p1, xs)
end else let
  prval () = $UN.cast2void (xs) in (*nothing*)
end // end of [if]
//
end // end of [loop]
//
prval () = lemma_list_vt_param (xs)
//
val p0 = addr@(A)
val p1 = ptr_add<a>(p0, asz)
val () = $effmask_all(loop(p0, p1, xs))
//
prval() =
__assert(A) where
{
//
extern
praxi
__assert (A: &array(a?, n) >> array(a, n)): void
//
} (* end of [prval] *)
//
in
  // nothing
end // end of [array_initize_list_vt]

(* ****** ****** *)

implement
{a}(*tmp*)
array_initize_rlist_vt
  {n} (A, asz, xs) = let
//
vtypedef list0 = listGte_vt (a, 0)
vtypedef list1 = listGte_vt (a, 1)
//
fun loop
(
  pz: ptr, p0: ptr, xs: list0
) : void = let
//
(*
val () =
println!
  ("array_initize_rlist_vt: loop")
*)
//
in
//
if pz > p0 then let
  val xs =
    $UN.castvwtp0{list1}(xs)
  // end of [val]
  val+~list_vt_cons(x, xs) = xs
  val pz = ptr_pred<a>(pz)
  val () = $UN.ptr0_set<a>(pz, x)
in
  loop(pz, p0, xs)
end else let
  prval () = $UN.cast2void (xs) in (*nothing*)
end // end of [if]
//
end // end of [loop]
//
prval() = lemma_list_vt_param(xs)
//
val p0 = addr@(A)
val pz = ptr_add<a>(p0, asz)
val () = $effmask_all(loop(pz, p0, xs))
//
prval() =
__assert(A) where
{
//
extern
praxi
__assert (A: &array(a?, n) >> array(a, n)): void
//
} (* end of [prval] *)
//
in
  // nothing
end // end of [array_initize_rlist_vt]

(* ****** ****** *)

implement
{a}(*tmp*)
array_uninitize
  (A, asz) = let
//
fun loop
  {l:addr}{n:nat} .<n>.
(
  pf: !array_v(a, l, n)
        >> array_v(a?, l, n)
| p0: ptr l, nz: size_t n, i0: size_t
) : void = let
//
(*
val () =
println! ("array_uninitize: loop")
*)
//
in
//
if
(nz > 0)
then let
//
  prval
  (pf1, pf2) = array_v_uncons(pf)
//
  val () =
    array_uninitize$clear<a>(i0, !p0)
  val () =
    loop(pf2 | ptr_succ<a>(p0), pred(nz), succ(i0))
//
  prval () = (pf := array_v_cons(pf1, pf2))
//
in
  // nothing
end else let
  prval () = pf := array_v_unnil_nil{a,a?}(pf)
in
  // nothing
end // end of [if]
//
end // end of [loop]
//
prval() = lemma_array_param(A)
//
prval pf = view@ (A)
//
val () = loop(pf | addr@(A), asz, i2sz(0))
//
prval () = view@ (A) := pf
//
in
  // nothing  
end // end of [array_uninitize]

(* ****** ****** *)

implement
{a}{b}
array_mapto
  {n}(A, B, n) = let
//
val pa = addr@(A)
val pa2 = ptr_add<a>(pa, n)
val pb = addr@(B)
//
fun loop{la,lb:addr}
(
  pa: ptr la, pa2: ptr, pb: ptr lb
) : void =
(
if pa < pa2 then let
  val (pfa, fpfa | pa) = $UN.ptr_vtake{a}(pa)
  val (pfb, fpfb | pb) = $UN.ptr_vtake{b?}(pb)
  val () = array_mapto$fwork<a><b> (!pa, !pb)
  prval () = fpfa(pfa)
  prval () = fpfb($UN.castview0{(b?)@lb}(pfb))
in
  loop(ptr_succ<a>(pa), pa2, ptr_succ<b> (pb))
end (* end of [if] *)
)
//
val () = loop(pa, pa2, pb)
prval [lb:addr] EQADDR () = ptr_get_index (pb)
prval () = view@(B) := $UN.castview0{array_v (b, lb, n)}(view@(B))
//
in
  // nothing
end (* end of [array_mapto] *)

(* ****** ****** *)

implement
{a,b}{c}
array_map2to
  {n}(A, B, C, n) = let
//
val pa = addr@(A)
val pa2 = ptr_add<a>(pa, n)
val pb = addr@(B)
val pc = addr@(C)
//
fun
loop
{la,lb,lc:addr}
(
  pa: ptr la, pa2: ptr, pb: ptr lb, pc: ptr lc
) : void =
(
if pa < pa2 then let
  val (pfa, fpfa | pa) = $UN.ptr_vtake{a}(pa)
  val (pfb, fpfb | pb) = $UN.ptr_vtake{b}(pb)
  val (pfc, fpfc | pc) = $UN.ptr_vtake{c?}(pc)
  val () = array_map2to$fwork<a,b><c>(!pa, !pb, !pc)
  prval () = fpfa(pfa)
  prval () = fpfb(pfb)
  prval () = fpfc($UN.castview0{(c?)@lc}(pfc))
in
  loop(ptr_succ<a>(pa), pa2, ptr_succ<b>(pb), ptr_succ<c>(pc))
end (* end of [if] *)
)
//
val () = loop(pa, pa2, pb, pc)
//
prval [lc:addr] EQADDR() = ptr_get_index (pc)
prval () = view@(C) := $UN.castview0{array_v (c, lc, n)}(view@(C))
//
in
  // nothing
end (* end of [array_map2to] *)

(* ****** ****** *)

implement
{a}(*tmp*)
array_permute
  (A, asz) = let
//
prval() = lemma_array_param(A)
//
fun
loop
{l:addr}{n:nat} .<n>.
(
  pf: !array_v(a, l, n) | p0: ptr l, nz: size_t n
) : void = let
//
(*
val () =
  println! ("array_permute: loop")
*)
//
in
//
if
(nz >= 2)
then let
  val i = array_permute$randint<>(nz)
  prval(pf1, pf2) = array_v_uncons(pf)
//
  val () =
  if i > 0 then
  $UN.ptr0_exch<a>
    (ptr0_add_guint<a>(p0, i), !p0)
  // end of [if]
  val () = loop(pf2 | ptr1_succ<a>(p0), pred(nz))
//
  prval((*returned*)) = pf := array_v_cons(pf1, pf2)
in
  // nothing
end else ((*void*)) // end of [if]
//
end // end of [loop]
//
in
  loop(view@ (A) | addr@(A), asz)
end // end of [array_permute]

(* ****** ****** *)

#include "./SHARE/array_bsearch.dats"
#include "./SHARE/array_quicksort.dats"

(* ****** ****** *)

(* end of [array.dats] *)

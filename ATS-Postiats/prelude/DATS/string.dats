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
** $PATSHOME/prelude/DATS/CODEGEN/string.atxt
** Time of generation: Wed Oct 10 21:08:46 2018
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: April, 2012 *)

(* ****** ****** *)
//
// HX:
#define // there is no need
ATS_DYNLOADFLAG 0 // for dynloading
//
(* ****** ****** *)
//
staload UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#define CNUL '\000'

(* ****** ****** *)

overload + with add_ptr_bsz

(* ****** ****** *)
//
// HX:
// castvwtp_trans: formerly used name
//
macdef castvwtp_trans = $UN.castvwtp0
//
(* ****** ****** *)
//
extern
fun
memcpy
( d0: ptr
, s0: ptr
, n0: size_t
) :<!wrt> ptr = "mac#atspre_string_memcpy"
// end of [memcpy]
//
(* ****** ****** *)
//
implement
{}(*tmp*)
string_char(str) =
  $UN.ptr0_get<char>(string2ptr(str))
//
(* ****** ****** *)

implement
{}(*tmp*)
string_nil() = let
//
val (pfat, pfgc | p0) = malloc_gc(i2sz(1))
val ((*void*)) = $UN.ptr0_set<char> (p0, '\000')
//
in
  $UN.castvwtp0{strnptr(0)}((pfat, pfgc | p0))
end // end of [string_nil]

implement
{}(*tmp*)
string_sing(chr) = let
//
val (pfat, pfgc | p0) = malloc_gc(i2sz(2))
val ((*void*)) = $UN.ptr0_set<char> (p0, chr)
val ((*void*)) = $UN.ptr0_set_at<char> (p0, 1, '\000')
//
in
  $UN.castvwtp0{strnptr(1)}((pfat, pfgc | p0))
end // end of [string_sing]

(* ****** ****** *)

implement
{}(*tmp*)
string_is_empty
  {n}(str) = let
//
val p = string2ptr(str)
//
in
  $UN.cast{bool(n==0)}($UN.ptr1_get<char>(p) = CNUL)
end // end of [string_is_empty]
implement{}
string_isnot_empty
  {n}(str) = let
//
val p = string2ptr(str)
//
in
  $UN.cast{bool(n > 0)}($UN.ptr1_get<char>(p) != CNUL)
end // end of [string_isnot_empty]

(* ****** ****** *)

implement
{}(*tmp*)
string_is_atend_size
  {n}{i}(str, i) = let
//
val p_i =
  add_ptr_bsz(string2ptr(str), i)
//
in
  $UN.cast{bool(n==i)}($UN.ptr1_get<char>(p_i) = CNUL)
end // end of [string_is_atend_size]

implement
{tk}(*tmp*)
string_is_atend_gint(str, i) =
  string_is_atend_size(str, g1int2uint(i))
// end of [string_is_atend_gint]
implement
{tk}(*tmp*)
string_is_atend_guint(str, i) =
  string_is_atend_size(str, g1uint2uint(i))
// end of [string_is_atend_guint]

(* ****** ****** *)

implement
{}(*tmp*)
string_get_at_size(str, i) =
  $UN.ptr1_get<charNZ>(string2ptr(str)+i)
// end of [string_get_at_size]

implement
{tk}(*tmp*)
string_get_at_gint(str, i) =
  string_get_at_size(str, g1int2uint(i))
// end of [string_get_at_gint]
implement
{tk}(*tmp*)
string_get_at_guint(str, i) =
  string_get_at_size(str, g1uint2uint(i))
// end of [string_get_at_guint]

(* ****** ****** *)

implement
{}(*tmp*)
string_test_at_size
  {n}{i}(str, i) = let
//
extern
castfn
__cast
(
  c: char
) :<>
[c:int]
(
  string_index_p(n, i, c) | char(c)
)
//
in
//
__cast
(
  $UN.ptr1_get<char>(string2ptr(str)+i)
) (* __cast *)
//
end // end of [string_test_at_size]

implement
{tk}(*tmp*)
string_test_at_gint (str, i) =
  string_test_at_size (str, g1int2uint(i))
// end of [string_test_at_gint]
implement
{tk}(*tmp*)
string_test_at_guint (str, i) =
  string_test_at_size (str, g1uint2uint(i))
// end of [string_test_at_guint]

(* ****** ****** *)

implement
{}(*tmp*)
strcmp(x1, x2) = let
//
extern
fun
__strcmp__
(
  x1: string, x2: string
) :<> int = "mac#atspre_strcmp"
//
in
  __strcmp__(x1, x2)
end // end of [let] // end of [strcmp]

(* ****** ****** *)

implement
{}(*tmp*)
strintcmp
  {n1,n2}(x1, n2) = let
//
prval() =
  lemma_string_param (x1)
//
fun loop
  {n2:nat} .<n2>.
(
  p1: ptr, n2: int n2
) :<> int = let
//
  val c = $UN.ptr0_get<char>(p1)
//
in
//
if
c != CNUL
then (
  if n2 > 0
    then loop (ptr_succ<char>(p1), n2-1)
    else 1(*gt*)
  // end of [if]
) else (
  if n2 > 0 then ~1(*lt*) else 0(*eq*)
) (* end of [else] *)
//
end // end of [loop]
//
in
  $UN.cast{int(sgn(n1-n2))}(loop (string2ptr(x1), n2))
end // end of [strintcmp]

(* ****** ****** *)

implement
{}(*tmp*)
strlencmp
  {n1,n2}(x1, x2) = let
//
prval () = lemma_string_param (x1)
prval () = lemma_string_param (x2)
//
//
fun loop
  {n1:nat} .<n1>. (
  p1: ptr, p2: ptr
) :<> int = let
//
val c1 = $UN.ptr0_get<char>(p1)
val c2 = $UN.ptr0_get<char>(p2)
//
in
//
if
c1 != CNUL
then let
  prval () =
  __assert() where
  {
    extern
    praxi __assert(): [n1 > 0] void
  } (* end of [prval] *)
in
  if c2 != CNUL
    then (
      loop{n1-1}(ptr_succ<char>(p1), ptr_succ<char>(p2))
    ) else 1(*gt*) // end of [else]
  // end of [if]
end else (
  if c2 != CNUL then ~1(*lt*) else 0(*eq*)
) (* end of [if] *)
//
end // end of [loop]
//
in
  $UN.cast{int(sgn(n1-n2))}(loop{n1}(string2ptr(x1), string2ptr(x2)))
end // end of [strlencmp]

(* ****** ****** *)

implement
{}(*tmp*)
string_make_list(cs) =
  string_make_listlen(cs, list_length(cs))
// end of [string_make_list]

implement
{}(*tmp*)
string_make_listlen
  {n}(cs, n) = let
//
prval () = lemma_list_param (cs)
//
fun loop
  {n:nat} .<n>.
(
  cs: list (char, n), n: int n, p: ptr
) :<!wrt> ptr = let
in
  if n > 0 then let
    val+list_cons (c, cs) = cs
    val () = $UN.ptr0_set<char>(p, c)
  in
    loop (cs, n-1, ptr_succ<char>(p))
  end else p // end of [if]
end // end of [loop]
//
val n1 = n + 1
//
val (pf, pfgc | p0) =
  $effmask_wrt (malloc_gc(i2sz(n1)))
//
val p1 = $effmask_wrt(loop(cs, n, p0))
//
val () =
  $effmask_wrt ($UN.ptr0_set<char>(p1, CNUL))
//
in
  castvwtp_trans{strnptr(n)}((pf, pfgc | p0))
end // end of [string_make_listlen]

(* ****** ****** *)

implement
{}(*tmp*)
string_make_rlist(cs) =
  string_make_rlistlen(cs, list_length(cs))
// end of [string_make_rlist]

implement
{}(*tmp*)
string_make_rlistlen
  {n}(cs, n) = let
//
prval() = lemma_list_param (cs)
//
fun loop
  {n:nat} .<n>.
(
  cs: list(char, n), n: int n, p: ptr
) :<!wrt> ptr = let
in
//
if
n > 0
then let
  val p1 = ptr_pred<char>(p)
  val+list_cons (c, cs) = cs
  val () = $UN.ptr0_set<char>(p1, c)
in
  loop (cs, n-1, p1)
end // end of [then]
else (p) // end of [else]
//
end // end of [loop]
//
val n1 = n + 1
//
val
(pf, pfgc | p0) =
$effmask_wrt(malloc_gc(i2sz(n1)))
//
val p1 = ptr_add<char>(p0, n)
val () =
$effmask_wrt
  ($UN.ptr0_set<char>(p1, CNUL))
//
val p0 = $effmask_wrt(loop(cs, n, p1))
//
in
  castvwtp_trans{strnptr(n)}((pf, pfgc | p0))
end // end of [string_make_rlistlen]

(* ****** ****** *)
//
implement
{}(*tmp*)
string_make_list_vt
  (cs) = let
//
val n = list_vt_length(cs)
//
in
  string_make_listlen_vt(cs, n)
end (* end of [string_make_list_vt] *)
//
implement
{}(*tmp*)
string_make_listlen_vt
  (cs, n) = str where
{
//
  val cs2 = $UN.list_vt2t(cs)
  val str = string_make_listlen(cs2, n)
  val ((*freed*)) = list_vt_free<char>(cs)
//
} (* end of [string_make_listlen_vt] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
string_make_rlist_vt
  (cs) = let
//
val n = list_vt_length(cs)
//
in
  string_make_rlistlen_vt(cs, n)
end (* end of [string_make_rlist_vt] *)
//
implement
{}(*tmp*)
string_make_rlistlen_vt
  (cs, n) = str where
{
//
  val cs2 = $UN.list_vt2t(cs)
  val str = string_make_rlistlen(cs2, n)
  val ((*freed*)) = list_vt_free<char>(cs)
//
} (* end of [string_make_rlistlen_vt] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
string_make_substring
  {n}{st,ln}
  (str, st, ln) = $effmask_wrt let
//
val ln1 = succ(ln)
val (pf, pfgc | p_dst) = malloc_gc(ln1)
//
val
p_src = string2ptr(str)
val
p_dst = memcpy(p_dst, p_src + st, ln)
//
val () = $UN.ptr0_set<char>(p_dst + ln, CNUL)
//
in
  castvwtp_trans{strnptr(ln)}((pf, pfgc | p_dst))
end // end of [string_make_substring]

(* ****** ****** *)

implement
{}(*tmp*)
string_make_stream
  (cs) = let
//
fun
loop
{l:addr}
{n:int}
{i:nat|i <= n}
(
  pf: b0ytes(n)@l
, fpf: mfree_gc_v(l)
| cs: stream(charNZ)
, p0: ptr(l), pi: ptr, n: size_t(n), i: size_t(i)
) : Strptr1 = (
if
(i < n)
then
(
case+ !cs of
| stream_nil() => let
    val () =
    $UN.ptr0_set<char>(pi, CNUL)
  in
    $UN.castvwtp0((pf, fpf | p0))
  end // end of [stream_nil]
| stream_cons(c, cs) => let
    val () = $UN.ptr0_set<char>(pi, c)
  in
    loop
    ( pf, fpf
    | cs, p0, ptr_succ<char>(pi), n, succ(i))
  end // end of [stream_cons]
)
else let
//
  val n2 = n + n
  val (pf2, fpf2 | p02) = malloc_gc(n2)
//
  val _(*p02*) = memcpy(p02, p0, i)
  val ((*freed*)) = mfree_gc(pf, fpf | p0)
//
in
  loop
  (pf2, fpf2 | cs, p02, ptr_add<char>(p02, i), n2, i)
end // end of [
) (* end of [loop] *)
//
val n0 =
string_make_stream$bufsize<>()
//
val n0 = i2sz(n0)
val (pf, fpf | p0) = malloc_gc(n0)
//
in
//
  $effmask_all(loop(pf, fpf | cs, p0, p0, n0, i2sz(0)))
//
end // end of [string_make_stream]

(* ****** ****** *)

implement
{}(*tmp*)
string_make_stream_vt
  (cs) = let
//
fun
loop
{l:addr}
{n:int}
{i:nat|i <= n}
(
  pf: b0ytes(n)@l
, fpf: mfree_gc_v(l)
| cs: stream_vt(charNZ)
, p0: ptr(l), pi: ptr, n: size_t(n), i: size_t(i)
) : Strptr1 = (
if
(i < n)
then
(
case+ !cs of
| ~stream_vt_nil() => let
    val () =
    $UN.ptr0_set<char>(pi, CNUL)
  in
    $UN.castvwtp0((pf, fpf | p0))
  end // end of [stream_nil]
| ~stream_vt_cons(c, cs) => let
    val () = $UN.ptr0_set<char>(pi, c)
  in
    loop(pf, fpf | cs, p0, ptr_succ<char>(pi), n, succ(i))
  end // end of [stream_cons]
)
else let
//
  val n2 = n + n
  val (pf2, fpf2 | p02) = malloc_gc(n2)
//
  val _(*p02*) = memcpy(p02, p0, i)
  val ((*freed*)) = mfree_gc(pf, fpf | p0)
//
in
//
  loop
  ( pf2, fpf2
  | cs, p02, ptr_add<char>(p02, i), n2, i)
//
end // end of [
) (* end of [loop] *)
//
val n0 =
string_make_stream$bufsize<>()
//
val n0 = i2sz(n0)
val (pf, fpf | p0) = malloc_gc(n0)
//
in
  $effmask_all(loop(pf, fpf | cs, p0, p0, n0, i2sz(0)))
end // end of [string_make_stream_vt]

(* ****** ****** *)
//
implement
string_make_stream$bufsize<> ((*void*)) = 16
//
(* ****** ****** *)
//
implement
{}(*tmp*)
string_head
  (str) =
  $UN.ptr0_get<charNZ>(string2ptr(str))
//
implement
{}(*tmp*)
string_tail
  {n}(str) =
(
  $UN.cast{string(n-1)}(ptr_succ<char>(string2ptr(str)))
) (* end of [string_tail] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
string0_length
  (str) = string1_length<>(g1ofg0(str))
// end of [string0_length]

implement
{}(*tmp*)
string1_length
  {n}(str) =
  __strlen__(str) where
{
  extern
  fun
  __strlen__(string(n)):<> size_t(n) = "mac#atspre_strlen"
} // end of [where] // end of [string1_length]

(* ****** ****** *)
//
implement
{}(*tmp*)
string0_nlength
  (str1, n2) =
  string1_nlength<> (g1ofg0(str1), g1ofg0(n2))
// end of [string0_nlength]
//
implement
{}(*tmp*)
string1_nlength
  (str1, n2) = let
//
fun
loop{n1,n2,r:nat} .<n1>.
(
  str1: string(n1), n2: size_t(n2), r: size_t(r)
) :<> size_t(min(n1,n2)+r) = (
//
if
(n2 > 0)
then (
//
if
isneqz(str1)
then loop(str1.tail(), pred(n2), succ(r)) else (r)
//
) (* end of [then] *)
else (r) // end of [else]
//
) (* end of [loop] *)
//
prval () =
  lemma_string_param(str1)
//
prval () = lemma_g1uint_param(n2)
//
in
  loop (str1, n2, i2sz(0))
end // end of [string1_nlength]
//
(* ****** ****** *)

implement
{}(*tmp*)
string0_copy
  (str) = let
//
val str = g1ofg0(str)
val str2 = string1_copy(str)
//
prval () = lemma_strnptr_param(str2)
//
in
  strnptr2strptr(str2)
end // end of [string0_copy]

implement
{}(*tmp*)
string1_copy
  {n}(str) = let
//
val n =
string1_length(str)
val n1 = g1uint_succ(n)
val (pf, pfgc | p) = malloc_gc(n1)
//
val _(*p*) =
$effmask_wrt(memcpy(p, string2ptr(str), n1))
//
in
  castvwtp_trans{strnptr(n)}((pf, pfgc | p))
end // end of [string1_copy]

(* ****** ****** *)
//
implement
{}(*tmp*)
string_fset_at_size
  (s0, i, c) = let
  val s1 = string1_copy(s0)
in
//
let val () = s1[i] := c in strnptr2string(s1) end
//
end // end of [string_fset_at_size]
//
(* ****** ****** *)

implement
{}(*tmp*)
strchr{n}(str, c0) = let
//
prval () = lemma_string_param(str)
extern
fun __strchr__(string, int):<> ptr = "mac#atspre_strchr"
extern
fun sub_ptr_ptr(ptr, ptr):<> ssizeBtw(0, n) = "mac#atspre_sub_ptr_ptr"
//
val p0 = string2ptr(str)
val p1 = __strchr__(str, (char2int0)c0)
//
in
  if p1 > the_null_ptr then sub_ptr_ptr(p1, p0) else i2ssz(~1)
end // end of [strchr]

implement
{}(*tmp*)
strrchr{n}(str, c0) = let
//
prval () = lemma_string_param (str)
extern
fun __strrchr__(string, int):<> ptr = "mac#atspre_strrchr"
extern
fun sub_ptr_ptr(ptr, ptr):<> ssizeBtw(0, n) = "mac#atspre_sub_ptr_ptr"
//
val p0 = string2ptr(str)
val p1 = __strrchr__(str, (char2int0)c0)
//
in
  if p1 > the_null_ptr then sub_ptr_ptr(p1, p0) else i2ssz(~1)
end // end of [strrchr]

(* ****** ****** *)

implement
{}(*tmp*)
strstr{n}
  (haystack, needle) = let
//
prval () = lemma_string_param (haystack)
//
extern
fun __strstr__(string, string):<> ptr = "mac#atspre_strstr"
extern
fun sub_ptr_ptr(ptr, ptr):<> ssizeBtw(0, n) = "mac#atspre_sub_ptr_ptr"
//
val p0 = string2ptr(haystack)
val p1 = __strstr__(haystack, needle)
//
in
  if p1 > the_null_ptr then sub_ptr_ptr(p1, p0) else i2ssz(~1)
end // end of [strstr]

(* ****** ****** *)

implement
{}(*tmp*)
strspn{n}
(subject, accept) = let
//
prval () = lemma_string_param(subject)
//
extern
fun
__strspn__(string, string):<> sizeLte(n) = "mac#atspre_strspn"
//
in
  __strspn__(subject, accept)
end // end of [strspn]

implement
{}(*tmp*)
strcspn{n}
(subject, reject) = let
//
prval() = lemma_string_param(subject)
//
extern
fun
__strcspn__(string, string):<> sizeLte(n) = "mac#atspre_strcspn"
//
in
  __strcspn__(subject, reject)
end // end of [strcspn]

(* ****** ****** *)

implement
{}(*tmp*)
string_index
  {n}(str, c) = $UN.cast{ssizeBtw(~1,n)}(strchr(str, c))
// end of [string_index]

implement
{}(*tmp*)
string_rindex
  {n}(str, c) = $UN.cast{ssizeBtw(~1,n)}(strrchr(str, c))
// end of [string_rindex]

(* ****** ****** *)

implement
{}(*tmp*)
string0_append
  (x1, x2) = let
//
val x1 = g1ofg0(x1)
val x2 = g1ofg0(x2)
val x12 = string1_append(x1, x2)
prval () = lemma_strnptr_param(x12)
//
in
  strnptr2strptr (x12)
end // end of [string0_append]

implement
{}(*tmp*)
string1_append
  {n1,n2}(x1, x2) = let
//
val n1 = strlen(x1) and n2 = strlen(x2)
//
val n12 = n1 + n2
val (pf, fpf | p) = malloc_gc(succ(n12))
//
val p1 = memcpy(p, string2ptr(x1), n1)
val p2 = memcpy(p + n1, string2ptr(x2), succ(n2))
//
in
  castvwtp_trans{strnptr(n1+n2)}((pf, fpf | p))
end // end of [string1_append]

(* ****** ****** *)

implement
{}(*tmp*)
string0_append3
  (x1, x2, x3) = let
//
var xs = @[string](x1, x2, x3)
//
in
//
stringarr_concat<>
  ($UN.cast{arrayref(string,3)}(addr@xs), i2sz(3))
//
end // end of [string0_append3]

implement
{}(*tmp*)
string0_append4
  (x1, x2, x3, x4) = let
//
var xs = @[string](x1, x2, x3, x4)
//
in
//
stringarr_concat<>
  ($UN.cast{arrayref(string,4)}(addr@xs), i2sz(4))
//
end // end of [string0_append4]

implement
{}(*tmp*)
string0_append5
  (x1, x2, x3, x4, x5) = let
//
var xs = @[string](x1, x2, x3, x4, x5)
//
in
//
stringarr_concat<>
  ($UN.cast{arrayref(string,5)}(addr@xs), i2sz(5))
//
end // end of [string0_append5]

implement
{}(*tmp*)
string0_append6
  (x1, x2, x3, x4, x5, x6) = let
//
var xs = @[string](x1, x2, x3, x4, x5, x6)
//
in
//
stringarr_concat<>
  ($UN.cast{arrayref(string,6)}(addr@xs), i2sz(6))
//
end // end of [string0_append6]

(* ****** ****** *)

implement
{}(*tmp*)
stringarr_concat
  (xs, asz) = let
//
fun loop
(
  p1: ptr, p2: ptr, i: size_t, ntot: size_t
) : size_t = let
in
//
if
i > 0
then let
  val x = $UN.ptr0_get<string>(p1)
  val nx: size_t = string_length(x)
  val () = $UN.ptr0_set<size_t>(p2, nx)
in
  loop(ptr_succ<string>(p1), ptr_succ<size_t>(p2), pred(i), ntot+nx)
end // end of [then]
else ntot // end of [else]
//
end // end of [loop]
//
fun loop2
(
  p1: ptr, p2: ptr, i: size_t, pres: ptr
) : void = let
in
//
if
i > 0
then let
//
val x = $UN.ptr0_get<string>(p1)
val nx = $UN.ptr0_get<size_t>(p2)
val _(*ptr*) = memcpy(pres, $UN.cast{ptr}(x), nx)
//
in
  loop2(ptr_succ<string>(p1), ptr_succ<size_t>(p2), pred(i), pres+nx)
end // end of [then]
else
(
  $UN.ptr0_set<char>(pres, CNUL)
)
//
end // end of [loop2]
//
val p1 =
  $UN.cast{ptr}(xs)
//
val A0 =
  arrayptr_make_uninitized<size_t>(asz)
//
val p2 = arrayptr2ptr(A0)
//
val ntot =
  $effmask_all(loop(p1, p2, asz, i2sz(0)))
//
val
( pf
, pfgc
| pres
) = malloc_gc(g1ofg0(succ(ntot)))
//
val ((*void*)) =
  $effmask_all(loop2(p1, p2, asz, pres))
//
val ((*freed*)) = arrayptr_free{size_t?}(A0)
//
in
  castvwtp_trans{Strptr1}((pf, pfgc | pres))
end // end of [stringarr_concat]

(* ****** ****** *)

implement
{}(*tmp*)
stringlst_concat
  (xs) = res where
{
//
val n = list_length(xs)
//
prval() = lemma_list_param(xs)
//
prval
[n:int]
EQINT() = eqint_make_gint(n)
typedef
stringarr = arrayref(string,n)
//
val xs2 = arrayptr_make_list (n, xs)
//
val res =
stringarr_concat
  ($UN.castvwtp1{stringarr}(xs2), i2sz(n))
//
val ((*freed*)) = arrayptr_free{string}(xs2)
//
} (* end of [stringlst_concat] *)

(* ****** ****** *)
//
implement
{}(*tmp*)
string_implode
  (cs) = string_make_list<>(cs)
//
(* ****** ****** *)

implement
{}(*tmp*)
string_explode
  {n}(x0) = let
//
prval () = lemma_string_param(x0)
//
viewtypedef res(n) = list_vt(charNZ, n)
//
fun loop
  {n:nat} .<n>.
(
  x0: string(n)
, res: &ptr? >> res(n)
) :<!wrt> void = let
  val p = string2ptr(x0)
  val c = $UN.ptr1_get<Char>(p)
in
//
if
(c != CNUL)
then let
  prval() =
  __assert() where
  {
    extern
    praxi __assert(): [n > 0] void
  } (* prval *)
  val () =
    res :=
    list_vt_cons{charNZ}{0}(c, _)
  // end of [val]
  val+list_vt_cons (_, res1) = res
  val x1 =
  $UN.cast
    {string(n-1)}(ptr1_succ<char>(p))
  // end of [val]
  val ((*void*)) = loop (x1, res1)
in
  fold@(res)
end // end of [then]
else let
  prval() =
  __assert() where
  {
    extern
    praxi __assert(): [n == 0] void
  } (* [prval] *)
in
  res := list_vt_nil{charNZ}((*void*))
end // end of [else]
//
end // end of [loop]
//
var res: ptr
val () = $effmask_wrt(loop(x0, res))
//
in
  res
end // end of [string_explode]

(* ****** ****** *)

implement
{}(*tmp*)
string_tabulate{n}(n) = let
//
prval () =
lemma_g1uint_param(n)
//
fun
loop
(
 p: ptr, n: size_t, i: size_t
) : void = let
in
//
if
(i < n)
then let
  val c =
  string_tabulate$fopr(i)
  val () =
  $UN.ptr0_set<char>(p, c)
in
  loop(ptr_succ<char>(p), n, succ(i))
end else
  $UN.ptr0_set<char>(p, CNUL)
// end of [if]
//
end // end of [loop]
//
val n1 = succ(n)
val (pf, fpf | p0) = malloc_gc(n1)
val () = loop(p0, n, g1int2uint(0))
//
in
  castvwtp_trans{strnptr(n)}((pf, fpf | p0))
end // end of [string_tabulate]

(* ****** ****** *)

implement
{}(*tmp*)
string_forall
  (str) = let
//
fun
loop
(
  p: ptr
) : bool = let
  val c0 = $UN.ptr0_get<char>(p)
in
//
if
c0 = CNUL
then true else
(
if
string_forall$pred<>(c0)
then loop(ptr0_succ<char>(p)) else false
) (* end of [if] *)
//
end // end of [loop]
//
in
  loop(string2ptr(str))
end // end of [string_forall]

(* ****** ****** *)

implement
{}(*tmp*)
string_iforall
  (str) = let
//
fun
loop
(
  i: int, p: ptr
) : bool = let
  val c0 = $UN.ptr0_get<char>(p)
in
//
if
c0 = CNUL
then true else
(
  if string_iforall$pred(i, c0) then loop(i+1, ptr0_succ<char>(p)) else false
) (* end of [if] *)
//
end // end of [loop]
//
in
  loop(0, string2ptr(str))
end // end of [string_iforall]

(* ****** ****** *)

implement
{}(*tmp*)
string_foreach
  (str) = let
  var env: void = ()
in
  string_foreach_env<void>(str, env)
end // end of [string_foreach]

implement
{env}
string_foreach_env
  {n}(str, env) = let
//
fun loop (
  p: ptr, env: &env
) : ptr = let
  val c = $UN.ptr0_get<char>(p)
  val cont = (
    if c != CNUL
      then string_foreach$cont<env>(c, env) else false
    // end of [if]
  ) : bool // end of [val]
in
  if cont then let
    val () =
      string_foreach$fwork<env>(c, env) in loop(ptr_succ<char> (p), env)
    // end of [val]
  end else (p) // end of [if]
end // end of [fun]
//
val p0 =
  string2ptr (str)
val p1 = loop (p0, env)
//
in
  $UN.cast{sizeLte(n)}(p1 - p0)
end // end of [string_foreach_env]

(* ****** ****** *)

implement
{env}
string_foreach$cont(c, env) = true
implement{env}
string_foreach$fwork(c, env) = ((*void*))

(* ****** ****** *)

implement
{}(*tmp*)
string_rforeach
  (str) = let
  var env: void = ()
in
  string_rforeach_env<void>(str, env)
end // end of [string_rforeach]

implement
{env}(*tmp*)
string_rforeach_env
  {n}(str, env) = let
//
fun loop
(
  p0: ptr, p1: ptr, env: &env >> _
) : ptr = let
in
//
if
(p1 > p0)
then let
  val p2 = ptr_pred<char>(p1)
  val c2 = $UN.ptr0_get<charNZ>(p2)
  val cont =
    string_rforeach$cont<env>(c2, env)
  // end of [val]
in
  if cont
    then let
      val () =
      string_rforeach$fwork<env>(c2, env)
    in
      loop(p0, p2, env)
    end // end of [then]
    else (p1) // end of [else]    
end // end of [then]
else (p1) // end of [else]
//
end // end of [loop]
//
val p0 = ptrcast(str)
val p1 = ptr_add<char>(p0, length(str))
//
in
  $UN.cast{sizeLte(n)}(p1 - loop(p0, p1, env))
end // end of [string_rforeach_env]

(* ****** ****** *)

implement
{env}
string_rforeach$cont(c, env) = true
implement
{env}
string_rforeach$fwork(c, env) = ((*void*))

(* ****** ****** *)

implement
{}(*tmp*)
streamize_string_char
  (str) = let
//
typedef elt = charNZ
//
fun
auxmain
(
 p: ptr
) : stream_vt(elt) = $ldelay
(
//
let
//
val c0 = $UN.ptr0_get<Char>(p)
//
in
//
if
isneqz(c0)
then (
stream_vt_cons
( c0
, auxmain(ptr0_succ<Char>(p))
) (* stream_vt_cons *)
) else stream_vt_nil((*void*))
//
end : stream_vt_con(elt) // end of [let]
) (* end of [auxmain] *)
//
in
  auxmain(string2ptr(str))
end // end of [streamize_string_char]

(* ****** ****** *)
//
implement
{}(*tmp*)
un_streamize_string_char
  (cs) =
  strnptr2strptr(cs) where
{
//
  val cs = stream2list_vt(cs)
//
prval () = lemma_list_vt_param(cs)
//
  val cs = string_make_list_vt(cs)
//
prval () = lemma_strnptr_param(cs)
//
} (* un_streamize_string_char *)
//
(* ****** ****** *)

(*
//
// HX-2013-03: it is now defined as a macro
//
implement
stropt_none () = $UN.cast{stropt(~1)}(the_null_ptr)
*)

(* ****** ****** *)

implement
{}(*tmp*)
stropt_is_none{n}(x) =
(
  $UN.cast{bool(n < 0)}(ptr0_is_null($UN.cast2ptr(x)))
) // end of [stropt_is_none]

implement
{}(*tmp*)
stropt_is_some{n}(x) =
(
  $UN.cast{bool(n>=0)}(ptr0_isnot_null($UN.cast2ptr(x)))
) // end of [stropt_is_some]

(* ****** ****** *)

implement
{}(*tmp*)
stropt_length (x) = let
//
prval() = lemma_stropt_param(x)
//
in
//
if
stropt_is_some(x)
then g1uint2int(string1_length(stropt_unsome(x))) else i2ssz(~1)
//
end // end of [stropt_length]

(* ****** ****** *)

implement fprint_val<string> = fprint_string
implement fprint_val<stropt> = fprint_stropt

(* ****** ****** *)

%{$
//
atstype_string
atspre_string_make_snprintf
(
  atstype_string fmt, ...
) {
  char *res ;
  va_list ap0 ;
//
  va_start(ap0, fmt) ;
//
// HX: [8] is kind of random
//
  res =
  atspre_string_make_vsnprintf(8, fmt, ap0) ;
//
  va_end(ap0) ;
//
  return (res) ;
//
} // end of [atspre_string_make_snprintf]
//
atstype_string
atspre_string_make_vsnprintf
(
  atstype_size bsz
, atstype_string fmt, va_list ap0
) {
//
  int ntot ;
  char *res ;
  va_list ap1 ;
//
  res = atspre_malloc_gc(bsz) ;
//
  va_copy(ap1, ap0) ;
  ntot = vsnprintf(res, bsz, (char*)fmt, ap1) ;
  va_end(ap1) ;
//
  if (ntot >= bsz)
  {
    bsz = ntot + 1 ;
    res = atspre_realloc_gc(res, bsz) ;
    ntot = vsnprintf(res, bsz, (char*)fmt, ap0) ;
  }
//
  if (ntot < 0) {
    atspre_mfree_gc(res) ; return (char*)0 ;
  }
//
  return (res) ;
//
} // end of [atspre_string_make_vsnprintf]
//
%}

(* ****** ****** *)

(* end of [string.dats] *)

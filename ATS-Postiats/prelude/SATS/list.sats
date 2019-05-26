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
** $PATSHOME/prelude/SATS/CODEGEN/list.atxt
** Time of generation: Fri Jan 11 08:42:03 2019
*)

(* ****** ****** *)

#define NSH (x) x // for commenting: no sharing
#define SHR (x) x // for commenting: it is shared

(* ****** ****** *)

#if(0)
//
// HX:
// these declarations
// are available in [basic_dyn.sats]
//
datatype
list_t0ype_int_type
  (a:t@ype+, int) =
//
// t@ype+: covariant
//
  | list_nil(a, 0) of ((*void*))
  | {n:int | n >= 0}
    list_cons(a, n+1) of (a, list_t0ype_int_type(a, n))
// end of [list_t0ype_int_type]
//
stadef
list = list_t0ype_int_type
//
typedef
List(a:t0p) = [n:int] list(a, n)
typedef
List0(a:t0p) = [n:int | n >= 0] list(a, n)
typedef
List1(a:t0p) = [n:int | n >= 1] list(a, n)
typedef listLt
  (a:t0p, n:int) = [k:nat | k < n] list(a, k)
typedef listLte
  (a:t0p, n:int) = [k:nat | k <= n] list(a, k)
typedef listGt
  (a:t0p, n:int) = [k:int | k > n] list(a, k)
typedef listGte
  (a:t0p, n:int) = [k:int | k >= n] list(a, k)
typedef listBtw
  (a:t0p, m:int, n:int) = [k:int | m <= k; k < n] list(a, k)
typedef listBtwe
  (a:t0p, m:int, n:int) = [k:int | m <= k; k <= n] list(a, k)
//
#endif

(* ****** ****** *)

#define nil list_nil
#define cons list_cons

(* ****** ****** *)

exception
ListSubscriptExn of ()
(*
//
fun
ListSubscriptExn():<> exn = "mac#%ListSubscriptExn_make"
fun
isListSubscriptExn(x: !exn):<> bool = "mac#%isListSubscriptExn"
//
macdef
ifListSubscriptExn
  {tres}(exn, body) =
(
let val x = ,(exn) in
(
//
if
isListSubscriptExn(x)
then
  let prval () = __vfree_exn(x) in ,(body) end
else $raise (x)
//
) : tres // end of [if]
end (* end of [let] *)
) // end of [ifListSubscriptExn]
*)

(* ****** ****** *)

prfun
lemma_list_param
  {x:t0p}{n:int}
  (xs: list(INV(x), n)): [n >= 0] void
// end of [lemma_list_param]

(* ****** ****** *)

castfn
list_cast
  {x:t0p}{n:int}
  (xs: list(INV(x), n)):<> list(x, n)
// end of [list_cast]

(* ****** ****** *)
//
castfn
list_vt2t
  {x:t0p}{n:int}
  (xs: list_vt(INV(x), n)):<> list(x, n)
castfn
list_of_list_vt
  {x:t0p}{n:int}
  (xs: list_vt(INV(x), n)):<!wrt> list(x, n)
//
(* ****** ****** *)

#define list_sing(x)
  list_cons(x, list_nil())
#define list_pair(x1, x2)
  list_cons(x1, list_cons(x2, list_nil()))

(* ****** ****** *)
//
fun{a:t0p}
list_tuple_0(): list(a, 0)
//
fun{a:t0p}
list_tuple_1(x0: a): list(a, 1)
fun{a:t0p}
list_tuple_2(x0: a, x1: a): list(a, 2)
fun{a:t0p}
list_tuple_3(x0: a, x1: a, x2: a): list(a, 3)
//
fun{a:t0p}
list_tuple_4
  (x0: a, x1: a, x2: a, x3: a): list(a, 4)
fun{a:t0p}
list_tuple_5
  (x0: a, x1: a, x2: a, x3: a, x4: a): list(a, 5)
fun{a:t0p}
list_tuple_6
  (x0: a, x1: a, x2: a, x3: a, x4: a, x5: a): list(a, 6)
//
(* ****** ****** *)
//
symintr list_tuple
//
overload
list_tuple with list_tuple_0
overload
list_tuple with list_tuple_1
overload
list_tuple with list_tuple_2
overload
list_tuple with list_tuple_3
overload
list_tuple with list_tuple_4
overload
list_tuple with list_tuple_5
overload
list_tuple with list_tuple_6
//
(* ****** ****** *)

fun{x:t0p}
list_make_sing(x: x):<!wrt> list_vt(x, 1)
fun{x:t0p}
list_make_pair(x1: x, x2: x):<!wrt> list_vt(x, 2)

(* ****** ****** *)

fun{x:t0p}
list_make_elt
  {n:nat} (n: int n, x: x):<!wrt> list_vt(x, n)
// end of [list_make_elt]

(* ****** ****** *)

fun{}
list_make_intrange
  {l,r:int | l <= r}
  (l: int l, r: int r):<!wrt> list_vt(intBtw(l, r), r-l)
// end of [list_make_intrange]

(* ****** ****** *)

fun
{a:vt0p}
list_make_array
  {n:int} (
  A: &(@[INV(a)][n]) >> @[a?!][n], n: size_t(n)
) :<!wrt> list_vt(a, n) // endfun

(* ****** ****** *)
//
symintr list
//
fun
{a:vt0p}
list_make_arrpsz
  {n:int}
  (psz: arrpsz(INV(a), n)):<!wrt> list_vt(a, n)
//
overload list with list_make_arrpsz
//
(* ****** ****** *)
//
fun{x:t0p}
print_list(xs: List(INV(x))): void
fun{x:t0p}
prerr_list(xs: List(INV(x))): void
//
fun{x:t0p}
fprint_list(out: FILEref, xs: List(INV(x))): void
fun{x:t0p}
fprint_list_sep
  (out: FILEref, xs: List(INV(x)), sep: string): void
// end of [fprint_list_sep]
//
fun{}
fprint_list$sep(out: FILEref): void
//
(* ****** ****** *)

fun{x:t0p}
fprint_listlist_sep
( out: FILEref
, xss: List(List(INV(x))), sep1: string, sep2: string
) : void // end of [fprint_listlist_sep]

(* ****** ****** *)
(*
//
// HX: for testing macdef
//
*)
//
(*
//
macdef
fprintlst_mac
  {T:t@ype}
  (fpr, out, xs0, sep) = let
//
val out = ,(out)
val xs0 = ,(xs0); val sep = ,(sep)
//
fun
loop (
xs: List(T), i: int
) : void =
  case+ xs of
  | list_nil
      () => ((*void*))
    // list_nil
  | list_cons
      (x, xs) => let
      val () =
      if i > 0
        then fprint_string(out, sep)
      // end of [if]
      val () = ,(fpr)(out, x)
    in
      loop (xs, i+1)
    end // end of [list_cons]
//
in
  loop(xs0, 0)
end // end of [fprintlst_mac]
*)
//
(* ****** ****** *)
//
fun{}
list_is_nil
  {x:t0p}{n:int}(xs: list(x, n)):<> bool(n==0)
fun{}
list_is_cons
  {x:t0p}{n:int}(xs: list(x, n)):<> bool(n > 0)
//
fun{x:t0p}
list_is_sing
  {n:int}(xs: list(INV(x), n)):<> bool(n == 1)
fun{x:t0p}
list_is_pair
  {n:int}(xs: list(INV(x), n)):<> bool(n == 2)
//
fun{x:t0p}
list_isnot_sing
  {n:int}(xs: list(INV(x), n)):<> bool(n != 1)
fun{x:t0p}
list_isnot_pair
  {n:int}(xs: list(INV(x), n)):<> bool(n != 2)
//
(* ****** ****** *)

fun{x:t0p}
list_head{n:pos}(xs: list(INV(x), n)):<> (x)
fun{x:t0p}
list_head_exn{n:int}(xs: list(INV(x), n)):<!exn> (x)

(* ****** ****** *)

fun{x:t0p}
list_tail{n:pos}
  (xs: SHR(list(INV(x), n))):<> list(x, n-1)
fun{x:t0p}
list_tail_exn{n:int}
  (xs: SHR(list(INV(x), n))):<!exn> list(x, n-1)

(* ****** ****** *)

fun{x:t0p}
list_last{n:pos} (xs: list(INV(x), n)):<> (x)
fun{x:t0p}
list_last_exn{n:int} (xs: list(INV(x), n)):<!exn> (x)

(* ****** ****** *)
//
fun{
x:t0p
} list_nth{n:int}
  (list(INV(x), n), natLt(n)):<> (x)
fun{x:t0p}
list_nth_opt
  (xs: List(INV(x)), i: intGte(0)):<> Option_vt(x)
//
fun{x:t0p}
list_get_at{n:int}
  (list(INV(x), n), natLt(n)):<> (x)
fun{x:t0p}
list_get_at_opt
  (xs: List(INV(x)), i: intGte(0)):<> Option_vt(x)
//
(* ****** ****** *)
//
fun{x:t0p}
list_fset_at{n:nat}
  (list(INV(x), n), natLt(n), x):<> list(x, n)
fun{x:t0p}
list_fexch_at{n:nat}
  (list(INV(x), n), natLt(n), x):<> (list(x, n), x)
//
(* ****** ****** *)

fun{x:t0p}
list_insert_at
  {n:int}
(
xs: SHR(list(INV(x), n)), i: natLte(n), x: x
) :<> list(x, n+1) // end of [list_insert_at]

fun{x:t0p}
list_remove_at
  {n:int} (
  xs: SHR(list(INV(x), n)), i: natLt(n)
) :<> list(x, n-1) // end of [list_remove_at]

fun{x:t0p}
list_takeout_at
  {n:int} (
  xs: SHR(list(INV(x), n)), i: natLt(n), x: &(x)? >> x
) :<!wrt> list(x, n-1) // end of [list_takeout_at]

(* ****** ****** *)

fun{x:t0p}
list_length
  {n:int} (xs: list(INV(x), n)):<> int(n)
// end of [list_length]

(* ****** ****** *)
//
fun{x:t0p}
list_length_gte
  {n1,n2:int}
  (xs: list(INV(x), n1), n2: int(n2)): bool(n1 >= n2)
fun{x:t0p}
list_length_compare
  {n1,n2:int}
  (xs: list(INV(x), n1), n2: int(n2)): int(sgn(n1-n2))
//
overload >= with list_length_gte
overload compare with list_length_compare
//
(* ****** ****** *)

fun
{x:t0p}
list_copy
  {n:int}
  (xs: list(INV(x), n)):<!wrt> list_vt(x, n)
// end of [list_copy]

(* ****** ****** *)
//
fun
{a:t0p}
list_append
  {m,n:int}
(
xs: NSH(list(INV(a), m)), ys: SHR(list(a, n))
) :<> list(a, m+n) // end of [list_append]
//
(* ****** ****** *)

fun
{a:t0p}
list_append1_vt
  {i,j:int} (
  xs: list_vt(INV(a), i), ys: SHR(list(a, j))
) :<!wrt> list(a, i+j) // endfun
fun
{a:t0p}
list_append2_vt
  {i,j:int} (
  xs: NSH(list(INV(a), i)), ys: list_vt(a, j)
) :<!wrt> list_vt(a, i+j) // endfun

(* ****** ****** *)
//
fun{
x:t0p
} list_extend{n:int}
  (xs: list(INV(x), n), x: x):<!wrt> list_vt(x, n+1)
// end of [list_extend]
//
macdef list_snoc (xs, x) = list_extend (,(xs), ,(x))
//
(* ****** ****** *)
//
fun
{a:t0p}
mul_int_list
  {m,n:int | m >= 0}
  (m: int(m), xs: list(a, n)):<!wrt> list_vt(a, m*n)
//
(* ****** ****** *)

fun{x:t0p}
list_reverse
  {n:int} (xs: list(INV(x), n)):<!wrt> list_vt(x, n)
// end of [list_reverse]

(* ****** ****** *)
//
fun{a:t0p}
list_reverse_append
  {m,n:int}
  (xs: NSH(list(INV(a), m)), ys: SHR(list(a, n))):<> list(a, m+n)
// end of [list_reverse_append]
//
fun{a:t0p}
list_reverse_append1_vt
  {m,n:int}
  (xs: list_vt(INV(a), m), ys: SHR(list(a, n))):<!wrt> list(a, m+n)
// end of [list_reverse_append1_vt]
fun{a:t0p}
list_reverse_append2_vt
  {m,n:int}
  (xs: NSH(list(INV(a), m)), ys: list_vt(a, n)):<!wrt> list_vt(a, m+n)
// end of [list_reverse_append2_vt]
//
macdef list_revapp = list_reverse_append
macdef list_revapp1_vt = list_reverse_append1_vt
macdef list_revapp2_vt = list_reverse_append2_vt
//
(* ****** ****** *)

fun{x:t0p}
list_concat(xss: List(List(INV(x)))):<!wrt> List0_vt(x)

(* ****** ****** *)
//
fun{
x:t0p
} list_take
  {n:int}{i:nat | i <= n}
  (xs: list(INV(x), n), i: int i):<!wrt> list_vt(x, i)
fun{
x:t0p
} list_take_exn
  {n:int}{i:nat} // it may raise [ListSubscriptException]
  (xs: list(INV(x), n), i: int i):<!exnwrt> [i <= n] list_vt(x, i)
//
(* ****** ****** *)
//
fun{
x:t0p
} list_drop
  {n:int}{i:nat | i <= n}
  (xs: SHR(list(INV(x), n)), i: int i):<> list(x, n-i)
fun{
x:t0p
} list_drop_exn
  {n:int}{i:nat} // it may raise [ListSubscriptException]
  (xs: SHR(list(INV(x), n)), i: int i):<!exn> [i <= n] list(x, n-i)
//
(* ****** ****** *)

fun{
x:t0p
} list_split_at
  {n:int}{i:nat | i <= n}
  (xs: SHR(list(INV(x), n)), i: int i):<!wrt> (list_vt(x, i), list(x, n-i))
// end of [list_split_at]

(* ****** ****** *)
//
fun{x:t0p}
list_exists$pred(x: x):<> bool
fun{x:t0p}
list_exists(xs: List(INV(x))):<> bool
//
(* ****** ****** *)
//
fun{x:t0p}
list_forall$pred(x: x):<> bool
fun{x:t0p}
list_forall(xs: List(INV(x))):<> bool
//
(* ****** ****** *)
//
fun{x:t0p}
list_equal$eqfn(x1: x, x2: x):<> bool
fun{x:t0p}
list_equal(xs1: List(INV(x)), xs2: List(x)):<> bool
//
(* ****** ****** *)
//
fun{x:t0p}
list_compare$cmpfn(x1: x, x2: x):<> int
fun{x:t0p}
list_compare(xs1: List(INV(x)), xs2: List(x)):<> int
//
(* ****** ****** *)
//
fun{
x:t0p
} list_find{n:int}
(
  xs: list(INV(x), n), x0: &(x)? >> opt(x, i >= 0)
) :<!wrt> #[i:int | i < n] int(i) // end-of-function
//
fun{x:t0p} list_find$pred (x):<> bool
//
fun{x:t0p} list_find_exn (xs: List(INV(x))):<!exn> x
fun{x:t0p} list_find_opt (xs: List(INV(x))):<> Option_vt(x)
//
(* ****** ****** *)
//
fun{
key,itm:t0p
} list_assoc
(
  List@(INV(key), itm), key, x: &itm? >> opt(itm, b)
) :<> #[b:bool] bool(b) // end of [list_assoc]
//
fun{key:t0p}
list_assoc$eqfn (k1: key, k2: key):<> bool
//
fun{
key,itm:t0p
} list_assoc_exn
  (kxs: List @(INV(key), itm), k: key):<!exn> itm
fun{
key,itm:t0p
} list_assoc_opt
  (kxs: List @(INV(key), itm), k: key):<> Option_vt(itm)
//
(* ****** ****** *)
//
fun{
x:t0p
} list_filter{n:int}
  (xs: list(INV(x), n)): listLte_vt(x, n)
//
fun{x:t0p} list_filter$pred (x): bool
//
(*
fun{
x:t0p
} list_filter_funenv
  {v:view}{vt:viewtype}{n:int}{fe:eff}
(
  pfv: !v |
  xs: list(INV(x), n)
, f: (!v | x, !vt) -<fun,fe> bool, env: !vt
) :<fe,!wrt> listLte_vt(x, n) // end-of-function
*)
//
(* ****** ****** *)

fun{
x:t0p
} list_labelize{n:int}
  (xs: list(INV(x), n)):<!wrt> list_vt(@(int, x), n)
// end of [list_labelize]

(* ****** ****** *)
//
fun{x:t0p}
list_app (xs: List(INV(x))): void
//
fun{x:t0p} list_app$fwork (x): void
//
(* ****** ****** *)
//
(*
fun{
x:t0p
} list_app_funenv
  {v:view}{vt:viewtype}{n:int}{fe:eff} (
  pfv: !v |
  xs: list(INV(x), n)
, f: (!v | x, !vt) -<fun,fe> void, env: !vt
) :<fe> void // end of [list_app_funenv]
*)
//
(* ****** ****** *)
//
fun{
x:t0p}{y:vt0p
} list_map{n:int}
  (xs: list(INV(x), n)): list_vt(y, n)
// end of [list_map]
//
fun{x:t0p}{y:vt0p} list_map$fopr(x: x): (y)
//
(* ****** ****** *)
//
(*
fun{
x:t0p}{y:vt0p
} list_map_funenv
  {v:view}{vt:viewtype}{n:int}{fe:eff} (
  pfv: !v |
  xs: list(INV(x), n)
, fopr: (!v | x, !vt) -<fun,fe> y, env: !vt
) :<fe,!wrt> list_vt(y, n) // end of [list_map_funenv]
*)
//
(* ****** ****** *)
//
fun
{x:t0p}
{y:vt0p}
list_imap{n:int}
  (xs: list(INV(x), n)): list_vt(y, n)
//
fun
{x:t0p}
{y:vt0p}
list_imap$fopr(i: intGte(0), x: x): (y)
//
(* ****** ****** *)
//
fun
{x:t0p}
{y:vt0p}
list_mapopt{n:int}
  (xs: list(INV(x), n)): listLte_vt(y, n)
//
fun
{x:t0p}
{y:vt0p}
list_mapopt$fopr(x: x): Option_vt(y)
//
(*
fun{
x:t0p}{y:t0p
} list_mapopt_funenv
  {v:view}{vt:viewtype}{n:int}{fe:eff}
(
  pfv: !v |
  xs: list(INV(x), n)
, f: (!v | x, !vt) -<fun,fe> Option_vt(y), env: !vt
) :<fe> listLte_vt(y, n) // end of [list_mapopt_funenv]
*)
//
(* ****** ****** *)

fun{
x1,x2:t0p}{y:vt0p
} list_map2{n1,n2:int}
(
  xs1: list(INV(x1), n1)
, xs2: list(INV(x2), n2)
) : list_vt(y, min(n1,n2)) // end of [list_map2]
//
fun{
x1,x2:t0p}{y:vt0p
} list_map2$fopr(x1: x1, x2: x2): (y)
//
(*
fun{
x1,x2:t0p}{y:t0p
} list_map2_funenv
  {v:view}{vt:viewtype}{n1,n2:int}{fe:eff}
(
  pfv: !v |
  xs1: list(INV(x1), n1)
, xs2: list(INV(x2), n2)
, f: (!v | x1, x2, !vt) -<fun,fe> y, env: !vt
) :<fe> list_vt(y, min(n1,n2)) // end of [list_map2_funenv]
*)
//
(* ****** ****** *)
//
fun{
a:vt0p
} list_tabulate{n:nat}(n: int(n)): list_vt(a, n)
//
fun{a:vt0p} list_tabulate$fopr(index: intGte(0)): (a)
//
(* ****** ****** *)
//
fun{
x,y:t0p
} list_zip{m,n:int}
(
  xs: list(INV(x), m)
, ys: list(INV(y), n)
) :<!wrt> list_vt((x, y), min(m,n))
//
fun
{x,y:t0p}
{res:vt0p}
list_zipwith{m,n:int}
(
  xs: list(INV(x), m)
, ys: list(INV(y), n)
) : list_vt(res, min(m,n)) // endfun
//
fun
{x,y:t0p}
{res:vt0p}
list_zipwith$fopr(x: x, y: y): (res)
//
(* ****** ****** *)
//
fun
{x,y:t0p}
list_cross
  {m,n:int}
(
  xs: list(INV(x), m)
, ys: list(INV(y), n)
) :<!wrt> list_vt((x, y), m*n) // endfun
//
fun
{x,y:t0p}
{res:vt0p}
list_crosswith
  {m,n:int}
(
  xs: list(INV(x), m)
, ys: list(INV(y), n)
) : list_vt(res, m*n) // end of [list_crosswith]
//
fun
{x,y:t0p}
{res:vt0p}
list_crosswith$fopr(x: x, y: y): (res)
//
(* ****** ****** *)

fun
{x:t0p}
list_foreach(xs: List(INV(x))): void
fun
{x:t0p}
{env:vt0p}
list_foreach_env
  (xs: List(INV(x)), env: &(env) >> _): void
//
fun
{x:t0p}
{env:vt0p}
list_foreach$cont (x: x, env: &env): bool
fun
{x:t0p}
{env:vt0p}
list_foreach$fwork (x: x, env: &(env) >> _): void
//
(* ****** ****** *)
//
fun
{x:t0p}
list_foreach_funenv
  {v:view}{env:viewtype}{fe:eff}
(
  pf: !v
| xs: List(INV(x))
, fwork: (!v | x, !env) -<fun,fe> void, env: !env
) :<fe> void // end of [list_foreach_funenv]
//
(* ****** ****** *)
//
fun{
x,y:t0p
} list_foreach2
  (xs: List(INV(x)), ys: List(INV(y))): void
//
fun{
x,y:t0p}{env:vt0p
} list_foreach2_env
  (xs: List(INV(x)), ys: List(INV(y)), env: &(env) >> _): void
//
fun{
x,y:t0p}{env:vt0p
} list_foreach2$cont(x: x, y: y, env: &env): bool
fun{
x,y:t0p}{env:vt0p
} list_foreach2$fwork(x: x, y: y, env: &(env) >> _): void
//
(* ****** ****** *)

fun{
x:t0p
} list_iforeach{n:int}
  (xs: list(INV(x), n)): natLte(n)

fun{
x:t0p}{env:vt0p
} list_iforeach_env{n:int}
  (xs: list(INV(x), n), env: &(env) >> _): natLte(n)
//
fun{
x:t0p}{env:vt0p
} list_iforeach$cont(i: intGte(0), x: x, env: &env): bool
fun{
x:t0p}{env:vt0p
} list_iforeach$fwork(i: intGte(0), x: x, env: &(env) >> _): void
//
(* ****** ****** *)

fun{
x:t0p // type for elements
} list_iforeach_funenv
  {v:view}{vt:viewtype}{n:int}{fe:eff} (
  pfv: !v |
  xs: list(INV(x), n)
, fwork: (!v | natLt(n), x, !vt) -<fun,fe> void, env: !vt
) :<fe> int (n) // end of [list_iforeach_funenv]

(* ****** ****** *)

fun{
x,y:t0p
} list_iforeach2{m,n:int}
(
  xs: list(INV(x), m), ys: list(INV(y), n)
) : natLte(min(m,n)) // end-of-function

fun{
x,y:t0p}{env:vt0p
} list_iforeach2_env{m,n:int}
(
  xs: list(INV(x), m), ys: list(INV(y), n), env: &(env) >> _
) : natLte(min(m,n)) // end-of-function
//
fun{
x,y:t0p}{env:vt0p
} list_iforeach2$cont
  (i: intGte(0), x: x, y: y, env: &env): bool
fun{
x,y:t0p}{env:vt0p
} list_iforeach2$fwork
  (i: intGte(0), x: x, y: y, env: &(env) >> _): void
//
(* ****** ****** *)
//
fun{
res:vt0p}{x:t0p
} list_foldleft
  (xs: List(INV(x)), ini: res): res
fun{
res:vt0p}{x:t0p
} list_foldleft$fopr(acc: res, x: x): res
//
(* ****** ****** *)
//
fun{
x:t0p}{res:vt0p
} list_foldright
  (xs: List(INV(x)), snk: res): res
fun{
x:t0p}{res:vt0p
} list_foldright$fopr(x: x, acc: res): res
//
(* ****** ****** *)
//
// HX-2017-02-19:
// Using [gcompare_val_val] to check
//
fun
{a:t0p}
list_is_ordered(xs: List(INV(a))): bool
//
(* ****** ****** *)
//
fun{a:t0p}
list_mergesort{n:int}
  (xs: list(INV(a), n)):<!wrt> list_vt(a, n)
//
fun{a:t0p}
list_mergesort$cmp(x1: a, x2: a):<> int (* sign *)
//
(* ****** ****** *)

fun{
a:t0p
} list_mergesort_fun
  {n:int} (
  xs: list(INV(a), n), cmp: cmpval (a)
) :<!wrt> list_vt(a, n) // end-of-function

fun{
a:t0p
} list_mergesort_cloref
  {n:int} (
  xs: list(INV(a), n), cmp: (a, a) -<cloref> int
) :<!wrt> list_vt(a, n) // end of [list_mergesort_cloref]

(* ****** ****** *)
//
fun{
a:t0p
} list_quicksort{n:int}
  (xs: list(INV(a), n)) :<!wrt> list_vt(a, n)
//
fun{a:t0p}
list_quicksort$cmp(x1: a, x2: a):<> int (* sign *)
//
(* ****** ****** *)

fun{
a:t0p
} list_quicksort_fun
  {n:int} (
  xs: list(INV(a), n), cmp: cmpval (a)
) :<!wrt> list_vt(a, n) // end-of-function

fun{
a:t0p
} list_quicksort_cloref
  {n:int} (
  xs: list(INV(a), n), cmp: (a, a) -<cloref> int
) :<!wrt> list_vt(a, n) // end of [list_quicksort_cloref]

(* ****** ****** *)
//
fun{a:t0p}
streamize_list_elt
  (xs: List(INV(a))):<!wrt> stream_vt(a)
//
fun{a:t0p}
streamize_list_choose2
  (xs: List(INV(a))):<!wrt> stream_vt(@(a, a))
//
(* ****** ****** *)
//
fun
{a,b:t0p}
streamize_list_zip
  (List(INV(a)), List(INV(b))):<!wrt> stream_vt(@(a, b))
//
fun
{a,b:t0p}
streamize_list_cross
  (List(INV(a)), List(INV(b))):<!wrt> stream_vt(@(a, b))
//
(* ****** ****** *)
//
// HX: overloading
// for certain symbols
//
(* ****** ****** *)
//
overload = with list_equal
//
overload + with list_append
//
(*
overload * with mul_int_list
*)
//
overload [] with list_get_at
//
overload iseqz with list_is_nil
overload isneqz with list_is_cons
//
overload .head with list_head
overload .tail with list_tail
//
overload length with list_length
//
overload copy with list_copy
//
overload print with print_list
overload prerr with prerr_list
overload fprint with fprint_list
overload fprint with fprint_list_sep
//
(* ****** ****** *)

overload reverse with list_reverse
 
(* ****** ****** *)

(* end of [list.sats] *)

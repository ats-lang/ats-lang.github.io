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
** $PATSHOME/prelude/SATS/CODEGEN/string.atxt
** Time of generation: Fri Nov 30 08:45:19 2018
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: September, 2011 *)

(* ****** ****** *)

(*
** HX: a string is a null-terminated arrayref of characters
*)

(* ****** ****** *)

sortdef tk = tkind

(* ****** ****** *)

typedef SHR(a:type) = a // for commenting purpose
typedef NSH(a:type) = a // for commenting purpose

(* ****** ****** *)
//
typedef
stringLt(n:int) = [k:nat | k < n] string(k)
typedef
stringLte(n:int) = [k:nat | k <= n] string(k)
//
typedef
stringGt(n:int) = [k:int | k > n] string(k)
typedef
stringGte(n:int) = [k:int | k >= n] string(k)
//
typedef
stringBtw
  (m:int, n:int) = [k:int | m <= k; k < n] string(k)
typedef
stringBtwe
  (m:int, n:int) = [k:int | m <= k; k <= n] string(k)
//
(* ****** ****** *)
//
typedef stringlst = List0(string)
vtypedef stringlst_vt = List0_vt(string)
//
(* ****** ****** *)
//
typedef stringopt = Option(string)
//
(* ****** ****** *)

dataprop
string_index_p
(
  n: int, int(*i*), int(*c*)
) =
  | string_index_p_eqz(n, n, 0)
  | {i:int | n > i}
    {c:int8 | c != 0}
    string_index_p_neqz(n, i, c)
// end of [string_index_p]

(* ****** ****** *)

exception StringSubscriptExn of ((*void*))

(* ****** ****** *)
//
praxi
lemma_string_param{n:int}(string n): [n >= 0] void
//
(* ****** ****** *)

castfn
string2ptr (x: string):<> Ptr1
overload ptrcast with string2ptr

(* ****** ****** *)
//
// HX:
// [string2string] = [string1_of_string0]
//
castfn g0ofg1_string (x: String):<> string
castfn g1ofg0_string (x: string):<> String0
//
overload g0ofg1 with g0ofg1_string // index-erasing
overload g1ofg0 with g1ofg0_string // index-inducing
//
(* ****** ****** *)

fun{}
string_char (str: string):<> char

(* ****** ****** *)
//
fun{}
string_nil((*void*)):<!wrt> strnptr(0)
fun{}
string_sing(chr: charNZ):<!wrt> strnptr(1)
//
(* ****** ****** *)
//
fun{}
string_is_empty
  {n:int}(str: string(n)):<> bool(n==0)
fun{}
string_isnot_empty
  {n:int}(str: string(n)):<> bool(n > 0)
//
(* ****** ****** *)
//
fun{}
string_is_atend_size
  {n:int}{i:nat | i <= n}
  (s: string(n), i: size_t(i)):<> bool(i==n)
fun{tk:tk}
string_is_atend_gint
  {n:int}{i:nat | i <= n}
  (s: string(n), i: g1int(tk, i)):<> bool(i==n)
fun{tk:tk}
string_is_atend_guint
  {n:int}{i:nat | i <= n}
  (s: string(n), i: g1uint(tk, i)):<> bool(i==n)
//
symintr string_is_atend
overload string_is_atend with string_is_atend_gint
overload string_is_atend with string_is_atend_guint
//
(* ****** ****** *)

macdef
string_isnot_atend
  (string, index) = ~string_is_atend (,(string), ,(index))
// end of [string_isnot_atend]

(* ****** ****** *)
//
fun{}
string_head{n:pos} (str: string(n)):<> charNZ
fun{}
string_tail{n:pos} (str: string(n)):<> string(n-1)
//
(* ****** ****** *)

fun{}
string_get_at_size
  {n:int}{i:nat | i < n}
  (s: string(n), i: size_t(i)):<> charNZ
fun{tk:tk}
string_get_at_gint
  {n:int}{i:nat | i < n}
  (s: string(n), i: g1int(tk, i)):<> charNZ
fun{tk:tk}
string_get_at_guint
  {n:int}{i:nat | i < n}
  (s: string(n), i: g1uint(tk, i)):<> charNZ
//
symintr string_get_at
overload string_get_at with string_get_at_size of 1
overload string_get_at with string_get_at_gint of 0
overload string_get_at with string_get_at_guint of 0
//
(* ****** ****** *)

fun{}
string_test_at_size
  {n:int}{i:nat | i <= n}
  (s: string(n), i: size_t(i)):<> [c:int] (string_index_p(n, i, c) | char(c))
fun{tk:tk}
string_test_at_gint
  {n:int}{i:nat | i <= n}
  (s: string(n), i: g1int(tk, i)):<> [c:int] (string_index_p(n, i, c) | char(c))
fun{tk:tk}
string_test_at_guint
  {n:int}{i:nat | i <= n}
  (s: string(n), i: g1uint(tk, i)):<> [c:int] (string_index_p(n, i, c) | char(c))
//
symintr string_test_at
overload string_test_at with string_test_at_size of 1
overload string_test_at with string_test_at_gint of 0
overload string_test_at with string_test_at_guint of 0
//
(* ****** ****** *)

fun lt_string_string
  (x1: string, x2: string):<> bool = "mac#%"
overload < with lt_string_string
fun lte_string_string
  (x1: string, x2: string):<> bool = "mac#%"
overload <= with lte_string_string

fun gt_string_string
  (x1: string, x2: string):<> bool = "mac#%"
overload > with gt_string_string
fun gte_string_string
  (x1: string, x2: string):<> bool = "mac#%"
overload >= with gte_string_string

fun eq_string_string
  (x1: string, x2: string):<> bool = "mac#%"
overload = with eq_string_string
fun neq_string_string
  (x1: string, x2: string):<> bool = "mac#%"
overload != with neq_string_string
overload <> with neq_string_string

fun compare_string_string
  (x1: string, x2: string):<> Sgn = "mac#%"
overload compare with compare_string_string

(* ****** ****** *)

fun{
} strcmp (x1: string, x2: string):<> int

fun{
} strintcmp
  {n1,n2:int | n2 >=0}
  (x1: string n1, n2: int n2):<> int(sgn(n1-n2))
// end of [strintcmp]

fun{
} strlencmp
  {n1,n2:int}
  (x1: string n1, x2: string n2):<> int(sgn(n1-n2))
// end of [strlencmp]

(* ****** ****** *)

fun{}
string_make_list
  {n:int}
  (cs: list(charNZ, n)):<!wrt> strnptr(n)
fun{}
string_make_listlen
  {n:int}
  (cs: list(charNZ, n), n: int(n)):<!wrt> strnptr(n)

(* ****** ****** *)

fun{}
string_make_rlist
  {n:int}
  (cs: list(charNZ, n)):<!wrt> strnptr(n)
// end of [string_make_rlist]

fun{}
string_make_rlistlen
  {n:int}
  (cs: list(charNZ, n), n: int(n)):<!wrt> strnptr(n)
// end of [string_make_rlistlen]

(* ****** ****** *)
//
fun{}
string_make_list_vt
  {n:int}
  (cs: list_vt(charNZ, n)):<!wrt> strnptr(n)
//
fun{}
string_make_listlen_vt
  {n:int}
  (cs: list_vt(charNZ, n), n: int(n)):<!wrt> strnptr(n)
//
(* ****** ****** *)
//
fun{}
string_make_rlist_vt
  {n:int}
  (cs: list_vt(charNZ, n)):<!wrt> strnptr(n)
//
fun{}
string_make_rlistlen_vt
  {n:int}
  (cs: list_vt(charNZ, n), n: int(n)):<!wrt> strnptr(n)
//
(* ****** ****** *)
//
fun{}
string_make_stream
  (cs: stream(charNZ)):<!wrt> Strptr1
fun{}
string_make_stream_vt
  (cs: stream_vt(charNZ)):<!wrt> Strptr1
//
fun{}
string_make_stream$bufsize
   ((*void*)):<> intGte(1) // HX: the default = 16
//
(* ****** ****** *)

fun{}
string_make_substring
  {n:int}{st,ln:nat | st+ln <= n}
  (str: string(n), st: size_t st, ln: size_t ln):<!wrt> strnptr(ln)
// end of [string_make_substring]

(* ****** ****** *)
//
fun
print_string(x: string): void = "mac#%"
fun
prerr_string(x: string): void = "mac#%"
fun
fprint_string(out: FILEref, x: string): void = "mac#%"
//
(* ****** ****** *)
//
fun
fprint_substring
  {n:int}{st,ln:nat | st+ln <= n}
(
  out: FILEref, str: string(n), st: size_t(st), ln: size_t(ln)
) : void = "mac#%" // end of [fprint_substring]
//
(* ****** ****** *)

fun{}
strchr{n:int}
  (str: string(n), c0: char):<> ssizeBtwe(~1, n)
// end of [strchr]

fun{}
strrchr{n:int}
  (str: string(n), c0: char):<> ssizeBtwe(~1, n)
// end of [strrchr]

fun{}
strstr{n:int}
  (haystack: string(n), needle: string):<> ssizeBtw(~1, n)
// end of [strstr]

(* ****** ****** *)

fun{}
strspn{n:int} // spanning
  (str: string(n), accept: string):<> sizeLte(n)
// end of [strspn]
fun{}
strcspn{n:int} // complement spanning
  (str: string(n), accept: string):<> sizeLte(n)
// end of [strcspn]

(* ****** ****** *)

fun{}
string_index{n:int}
  (str: string(n), c0: charNZ):<> ssizeBtw(~1, n)
// end of [string_index]

fun{}
string_rindex{n:int}
  (str: string(n), c0: charNZ):<> ssizeBtw(~1, n)
// end of [string_rindex]

(* ****** ****** *)
//
fun{}
string0_length
  (x: NSH(string)):<> size_t
fun{}
string1_length
  {n:int} (x: NSH(string(n))):<> size_t(n)
//
symintr strlen
symintr string_length
overload strlen with string0_length of 0
overload strlen with string1_length of 10
overload string_length with string0_length of 0
overload string_length with string1_length of 10
//
(* ****** ****** *)
//
fun{}
string0_nlength
  (x: NSH(string), n: size_t):<> size_t
fun{}
string1_nlength
  {n1,n2:int}
  (NSH(string(n1)), size_t(n2)):<> size_t(min(n1,n2))
//
symintr string_nlength
overload string_nlength with string0_nlength of 0
overload string_nlength with string1_nlength of 10
//
(* ****** ****** *)
//
fun{}
string0_copy
  (cs: NSH(string)):<!wrt> Strptr1
fun{}
string1_copy
  {n:int}
  (cs: NSH(string(n))):<!wrt> strnptr(n)
//
(* ****** ****** *)
//
// HX-2016-11-13:
// This can be done by calling
// [string_copy] and then [strptr_set_at]
//
fun{}
string_fset_at_size
  {n:int}{i:nat | i < n}
  (NSH(string(n)), i: size_t(i), c: charNZ):<!wrt> string(n)
//
(*
fun{tk:tk}
string_fset_at_gint
  {n:int}{i:nat | i < n}
  (NSH(string(n)), i: g1int(tk, i), c: charNZ):<!wrt> string(n)
fun{tk:tk}
string_fset_at_guint
  {n:int}{i:nat | i < n}
  (NSH(string(n)), i: g1uint(tk, i), c: charNZ):<!wrt> string(n)
*)
//
symintr string_fset_at
overload string_fset_at with string_fset_at_size of 1
//
(* ****** ****** *)
//
fun{}
string0_append
(
  x1: NSH(string), x2: NSH(string)
) :<!wrt> Strptr1 // end-of-function
fun{}
string1_append
  {n1,n2:int} (
  x1: NSH(string(n1)), x2: NSH(string(n2))
) :<!wrt> strnptr(n1+n2) // end of [string1_append]
//
symintr string_append
overload string_append with string0_append of 0
(*
//
// HX: too much of a surprise!
//
overload string_append with string1_append of 20
*)
//
(* ****** ****** *)
//
fun{}
string0_append3
(
  x1: NSH(string)
, x2: NSH(string), x3: NSH(string)
) :<!wrt> Strptr1 // end-of-function
fun{}
string0_append4
(
  x1: NSH(string), x2: NSH(string)
, x3: NSH(string), x4: NSH(string)
) :<!wrt> Strptr1 // end-of-function
fun{}
string0_append5
(
  x1: NSH(string), x2: NSH(string)
, x3: NSH(string), x4: NSH(string), x5: NSH(string)
) :<!wrt> Strptr1 // end-of-function
fun{}
string0_append6
(
  x1: NSH(string), x2: NSH(string), x3: NSH(string)
, x4: NSH(string), x5: NSH(string), x6: NSH(string)
) :<!wrt> Strptr1 // end-of-function
//
overload string_append with string0_append3 of 0
overload string_append with string0_append4 of 0
overload string_append with string0_append5 of 0
overload string_append with string0_append6 of 0
//
(* ****** ****** *)
//
fun{}
stringarr_concat{n:int}
(
xs: arrayref(string, n), n: size_t(n)
) :<!wrt> Strptr1 // end of [stringarr]
//
fun{}
stringlst_concat(List(string)):<!wrt> Strptr1
//
(* ****** ****** *)
//
fun{}
string_implode
  {n:int}
  (cs: list(charNZ, n)):<!wrt> strnptr(n)
//
fun{}
string_explode
  {n:int} (x: string(n)):<!wrt> list_vt(charNZ, n)
//
(* ****** ****** *)
//
fun{}
string_tabulate$fopr(size_t): charNZ
fun{}
string_tabulate{n:int}(n: size_t(n)): strnptr(n)
//
(* ****** ****** *)
//
fun{}
string_forall(str: string): bool
fun{}
string_forall$pred(c: char): bool
//
fun{}
string_iforall(str: string): bool
fun{}
string_iforall$pred(i: int, c: char): bool
//
(* ****** ****** *)
//
fun{
env:vt0p
} string_foreach$cont(c: char, env: &env): bool
fun{
env:vt0p
} string_foreach$fwork(c: char, env: &(env) >> _): void
//
fun{}
string_foreach{n:int}(str: string(n)): sizeLte(n)
fun{
env:vt0p
} string_foreach_env
  {n:int}(str: string(n), env: &(env) >> _): sizeLte(n)
// end of [string_foreach_env]
//
(* ****** ****** *)
//
fun{
env:vt0p
} string_rforeach$cont(c: char, env: &env): bool
fun{
env:vt0p
} string_rforeach$fwork(c: char, env: &(env) >> _): void
//
fun{}
string_rforeach{n:int}(str: string(n)): sizeLte(n)
fun{
env:vt0p
} string_rforeach_env
  {n:int}(str: string(n), env: &(env) >> _): sizeLte(n)
// end of [string_rforeach_env]
//
(* ****** ****** *)
//
fun{}
streamize_string_char(string): stream_vt(charNZ)
fun{}
un_streamize_string_char(stream_vt(charNZ)): Strptr1
//
(* ****** ****** *)
//
(*
** HX:
** [stropt_none] is just the null pointer
*)
fun stropt_none((*void*)):<> stropt(~1) = "mac#%"
//
(* ****** ****** *)
//
castfn stropt0_some(x: SHR(string)):<> Stropt1
castfn stropt1_some{n:int}(x: SHR(string(n))):<> stropt(n)
//
symintr stropt_some
overload stropt_some with stropt0_some of 0
overload stropt_some with stropt1_some of 10
//
(* ****** ****** *)

fun{}
stropt_is_none{n:int}(stropt(n)):<> bool(n < 0)
fun{}
stropt_is_some{n:int}(stropt(n)):<> bool(n >= 0)

(* ****** ****** *)

castfn
stropt_unsome{n:nat}(opt: stropt(n)):<> string(n)

(* ****** ****** *)
//
fun{}
stropt_length{n:int}(opt: stropt(n)):<> ssize_t(n)
//
(* ****** ****** *)
//
fun
print_stropt(opt: Stropt0): void = "mac#%"
fun
prerr_stropt(opt: Stropt0): void = "mac#%"
fun
fprint_stropt(out: FILEref, opt: Stropt0): void = "mac#%"
//
(* ****** ****** *)
//
// overloading for certain symbols
//
overload
[] with string_get_at_size of 1
overload
[] with string_get_at_gint of 0
overload
[] with string_get_at_guint of 0
//
overload
iseqz with string_is_empty of 10
overload
isneqz with string_isnot_empty of 10
//
overload length with string_length
//
(* ****** ****** *)
//
overload .head with string_head of 10
overload .tail with string_tail of 10
//
(* ****** ****** *)
//
overload copy with string0_copy of 0
//
(*
//
// HX: too much of a surprise!
//
overload copy with string1_copy of 10
*)
//
overload print with print_string of 0
overload prerr with prerr_string of 0
overload fprint with fprint_string of 0
//
(* ****** ****** *)
//
overload unsome with stropt_unsome
//
overload iseqz with stropt_is_none
overload isneqz with stropt_is_some
//
overload length with stropt_length of 0
//
overload print with print_stropt of 0
overload prerr with prerr_stropt of 0
overload fprint with fprint_stropt of 0
//
(* ****** ****** *)

(* end of [string.sats] *)

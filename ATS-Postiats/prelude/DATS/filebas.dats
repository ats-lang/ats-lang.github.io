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
(* Start time: Feburary, 2012 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/DATS/CODEGEN/filebas.atxt
** Time of generation: Wed Oct 10 21:08:49 2018
*)

(* ****** ****** *)

#define
ATS_DYNLOADFLAG 0 // no dynloading at run-time

(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload
_(*INT*) = "prelude/DATS/integer.dats"

(* ****** ****** *)

staload
STDIO = "libats/libc/SATS/stdio.sats"
vtypedef
FILEptr1 = $STDIO.FILEptr1 (*linear/nonnull*)
//
(* ****** ****** *)
//
staload STAT = "libats/libc/SATS/sys/stat.sats"
//
(* ****** ****** *)

#define c2i char2int0
#define i2c int2char0

(* ****** ****** *)
//
// HX-2013-06:
// this is just Unix convention
//
implement{} dirsep_get () = '/'
implement{} dirsep_gets () = "/"
implement{} dirname_self () = "."
implement{} dirname_parent () = ".."
//
(* ****** ****** *)

implement
{}(*tmp*)
filename_get_ext
  (name) = let
//
val sep = dirsep_get<>()
//
#define NUL '\000'
overload + with add_ptr_bsz
//
fun
loop
(
  p1: ptr, p2: ptr, c0: char
) : ptr = let
  val c1 =
  $UN.ptr0_get<char>(p1)
in
  if (c1 != NUL) then let
    val p1 = p1 + i2sz(1)
  in
    if
    (c1 != sep)
    then (
      if c1 != c0
        then loop(p1, p2, c0) else loop(p1, p1, c0)
      // end of [if]
    ) else loop(p1, the_null_ptr, c0)
  end else p2 // end of [if]
end // end of [loop]
//
val p1 = string2ptr(name)
val p2 = $effmask_all(loop(p1, the_null_ptr, '.'))
//
in
  $UN.castvwtp0{vStrptr0}(p2)
end // end of [filename_get_ext]

(* ****** ****** *)

implement
{}(*tmp*)
filename_test_ext
  (name, ext0) = let
//
val (fpf | ext) = filename_get_ext (name)
//
val ans =
(
  if strptr2ptr(ext) > 0
    then eq_string_string (ext0, $UN.strptr2string(ext))
    else false
  // end of [if]
) : bool // end of [val]
//
prval () = fpf (ext)
//
in
  ans
end // end of [filename_test_ext]

(* ****** ****** *)

implement
{}(*tmp*)
filename_get_base (name) = let
//
#define NUL '\000'
overload + with add_ptr_bsz
//
fun loop
(
  p1: ptr, p2: ptr, c0: char
) : ptr = let
  val c = $UN.ptr0_get<char> (p1)
in
  if c != NUL then let
    val p1 = p1 + i2sz(1)
  in
    if c != c0 then loop (p1, p2, c0) else loop (p1, p1, c0)
  end else p2 // end of [if]
end // end of [loop]
//
val c0 = dirsep_get<> ()
val p1 = string2ptr(name)
val p2 = $effmask_all (loop (p1, p1, c0))
//
in
  $UN.castvwtp0{vStrptr1}(p2)
end // end of [filename_get_base]

(* ****** ****** *)

implement
{}(*tmp*)
filename_test_base
  (name, base0) = let
//
val (fpf | base) = filename_get_base (name)
//
val ans = eq_string_string (base0, $UN.strptr2string(base))
//
prval () = fpf (base)
//
in
  ans
end // end of [filename_test_base]

(* ****** ****** *)

(*
//
// HX-2013-04:
// this is now implemented in [filebas.cats].
//
local

extern
castfn file_mode
  {fm:file_mode} (x: string):<> file_mode (fm)
// end of [extern]

in (* in of [local] *)

implement file_mode_r = file_mode ("r")
implement file_mode_rr = file_mode ("r+")
implement file_mode_w = file_mode ("w")
implement file_mode_ww = file_mode ("w+")
implement file_mode_a = file_mode ("a")
implement file_mode_aa = file_mode ("a+")

end // end of [local]
*)

(* ****** ****** *)

extern
castfn
__cast_filp (r: FILEref): FILEptr1

(* ****** ****** *)

implement
{}(*tmp*)
test_file_mode
  (path) = let
//
typedef stat = $STAT.stat
//
var st: stat?
val err = $STAT.stat (path, st)
//
in
//
if err >= 0
then let
  prval () = opt_unsome{stat}(st)
  val test =
  test_file_mode$pred<> ($UN.cast{uint}(st.st_mode))
in
  if test then 1(*true*) else 0(*false*)
end // end of [then]
else let
  prval () = opt_unnone{stat}(st) in ~1(*failure*)
end // end of [else]
//
end // end of [test_file_mode]

(* ****** ****** *)

implement
{}(*tmp*)
fileref_open_opt
  (path, fm) = let
//
val
filp = $STDIO.fopen (path, fm)
val
isnot = $STDIO.FILEptr2ptr(filp) > 0
//
in
//
if
isnot
then let
//
val filr =
  $STDIO.FILEptr_refize(filp)
//
in
  Some_vt{FILEref}(filr) // success
end // end of [then]
else let
//
prval () =
  $STDIO.FILEptr_free_null(filp)
//
in
  None_vt{FILEref}((*void*)) // failure
end // end of [else]
//
end // end of [fileref_open_opt]

(* ****** ****** *)

(*
//
// HX: atspre_fileref_close
//
implement
fileref_close (fil) = $STDIO.fclose0_exn (fil)
*)

(* ****** ****** *)

(*
//
// HX: atspre_fileref_flush
//
implement
fileref_flush (fil) = $STDIO.fflush0_exn (fil)
*)

(* ****** ****** *)

(*
//
// HX: atspre_fileref_getc
//
implement fileref_getc (inp) = $STDIO.fgetc0 (inp)
*)

(* ****** ****** *)

(*
//
// HX: atspre_fileref_putc_int
// HX: atspre_fileref_putc_char
//
implement
fileref_putc_int (out, c) = let
  val _(*ignored*) = $STDIO.fputc0 (c, out) in (*nothing*)
end // end of [fileref_putc_int]
implement
fileref_putc_char (out, c) = fileref_putc_int (out, (c2i)c)
*)

(* ****** ****** *)

(*
//
// HX: atspre_fileref_puts
//
implement
fileref_puts (out, s) = let
  val _(*ignored*) = $STDIO.fputs0 (s, out) in (*nothing*)
end // end of [fileref_puts]
*)

(* ****** ****** *)

(*
//
// HX: atspre_fileref_is_eof
//
implement
fileref_is_eof (fil) =
  if $STDIO.feof0 (fil) != 0 true else false
// end of [fileref_is_eof]
*)

(* ****** ****** *)
//
implement fileref_load<int> = fileref_load_int
implement fileref_load<lint> = fileref_load_lint
implement fileref_load<uint> = fileref_load_uint
implement fileref_load<ulint> = fileref_load_ulint
//
implement fileref_load<float> = fileref_load_float
implement fileref_load<double> = fileref_load_double
//
(* ****** ****** *)

implement{a}
fileref_get_optval (r) = let
  var x: a?
  val yn = fileref_load<a> (r, x)
in
  option_vt_make_opt<a> (yn, x)
end // end of [fileref_get_optval]

(* ****** ****** *)

implement{a}
fileref_get_exnmsg
  (r, msg) = let
  var x: a?
  val yn = fileref_load<a> (r, x)
in
  if yn then let
    prval () = opt_unsome (x) in x
  end else let
    prval () = opt_unnone (x) in exit_errmsg (1, msg)
  end (* end of [if] *)
end // end of [fileref_get_exnmsg]

(* ****** ****** *)

implement
fileref_get_line_charlst
  (inp) = let
//
val EOL = '\n'
//
fun loop
(
  inp: FILEref, res: &ptr? >> charlst_vt
) : void = let
  val i = fileref_getc (inp)
in
//
if i >= 0 then let
  val c = int2char0(i)
in
//
if (c != EOL) then let
  val () =
  (
    res :=
    list_vt_cons{char}{0}(c, _)
  )
  val+list_vt_cons (_, res1) = res
  val () = loop (inp, res1)
  prval () = fold@ (res)
in
  // nothing
end else (res := list_vt_nil)
//
end else (res := list_vt_nil)
//
end // end of [loop]
//
var res: ptr
val () = loop (inp, res)
//
in
  res
end // end of [fileref_get_line_charlst]

(* ****** ****** *)

implement
fileref_get_lines_charlstlst
  (inp) = let
//
vtypedef line = charlst_vt
vtypedef lines = List0_vt (line)
//
fun loop
(
  inp: FILEref
, res: &lines? >> lines
) : void = let
  val iseof = fileref_is_eof (inp)
in
//
if iseof then let
  val () = (res := list_vt_nil ())
in
  // nothing
end else let
  val line =
    fileref_get_line_charlst (inp)
  val () =
  (
    res := list_vt_cons{line}{0}(line, _)
  )
  val+list_vt_cons (_, res1) = res
  val () = loop (inp, res1)
  prval () = fold@ (res)
in
  // nothing
end // end of [if]
//
end // end of [loop]
//
var res: lines
val () = loop (inp, res)
//
in
  res
end // end of [fileref_get_lines_charlstlst]

(* ****** ****** *)
//
implement
fileref_get_file_charlst
  (inp) = fileref_get2_file_charlst (inp, ~1)
//
(* ****** ****** *)

local

fun loop
(
  inp: FILEref
, n: int, res: &ptr? >> charlst_vt
) : int = let
in
//
if n != 0 then let
  val i = fileref_getc (inp)
in
  if i >= 0 then let
    val () =
    (
      res :=
      list_vt_cons{char}{0}(i2c(i), _)
    )
    val+list_vt_cons (_, res1) = res
    val n = loop (inp, pred(n), res1)
    prval () = fold@ (res)
  in
    n
  end else let
    val () = res := list_vt_nil () in (n)
  end // end of [if]
end else let
  val () = res := list_vt_nil () in n(*=0*)
end // end of [if]
//
end // end of [loop]

in (* in of [local] *)

implement
fileref_get2_file_charlst
  (inp, n) = res where
{
  var res: ptr; val _(*nleft*) = loop (inp, n, res)
} // end of [fileref_nget_file_charlst]

end // end of [local]

(* ****** ****** *)
//
implement
fileref_put_string
  (out, cs) =
(
  fileref_puts(out, cs)
)
//
implement
fileref_put_charlst
  (out, cs) = let
//
fun loop
(
  out: FILEref, cs: List(char)
) : void = let
in
//
case+ cs of
| list_nil() => ()
| list_cons(c, cs) => let
    val () = fileref_putc(out, c) in loop(out, cs)
  end // end of [list_cons]
//
end // end of [loop]
//
in
  loop(out, cs)
end // end of [fileref_put_charlst]
//
(* ****** ****** *)
//
implement
{}(*tmp*)
fileref_get_line_string$bufsize() = 64
implement
{}(*tmp*)
fileref_get_file_string$bufsize() = 1024
//
(* ****** ****** *)

implement
{}(*tmp*)
fileref_get_line_string
  (inp) = let
//
var nlen: int // uninitialized
val line = fileref_get_line_string_main(inp, nlen)
prval () = lemma_strnptr_param(line)
//
in
  strnptr2strptr(line)
end // end of [fileref_get_line_string]

(* ****** ****** *)

implement
{}(*tmp*)
fileref_get_line_string_main
  (inp, nlen) = let
//
val
bsz =
fileref_get_line_string$bufsize<>()
//
val
[l:addr,n:int]
str = $extfcall
( Strnptr0
, "atspre_fileref_get_line_string_main2"
, bsz, inp, addr@(nlen)
)
//
prval () =
  lemma_strnptr_param(str)
//
prval () =
  __assert(view@(nlen)) where
{
extern praxi
__assert{l:addr}(pf: !int? @ l >> int (n) @ l): void
}
//
val isnot = strnptr_isnot_null(str)
//
in
//
if
isnot
then str else let
  val () =
  exit_errmsg_void
  (1, "[fileref_get_line_string_main] failed.")
  val () = assert (nlen >= 0) // HX: for TC // deadcode
in
  str // HX: [str]=null is not returned
end (* end of [if] *)
//
end // end of [fileref_get_line_string_main]

(* ****** ****** *)

implement
{}(*tmp*)
fileref_get_lines_stringlst
  (inp) = let
//
vtypedef line = Strptr1
vtypedef lines = List0_vt (line)
//
fun loop
(
  inp: FILEref
, res: &lines? >> lines
) : void = let
  val iseof = fileref_is_eof (inp)
in
//
if
iseof
then let
  val () =
  (res := list_vt_nil())
in
  // nothing
end else let
  val
  line =
  fileref_get_line_string(inp)
  val () =
  (
    res :=
    list_vt_cons{line}{0}(line, _)
  )
  val+
  list_vt_cons(_, res1) = res
  val () = loop(inp, res1) // tail-call
  prval ((*folded*)) = fold@ (res)
in
  // nothing
end // end of [if]
//
end // end of [loop]
//
//
in
//
let
var res: lines
val ((*void*)) = loop(inp, res) in res end
//
end // end of [fileref_get_lines_stringlst]

(* ****** ****** *)

implement
{}(*tmp*)
fileref_get_file_string
  (inp) = let
//
fun loop
(
  inp: FILEref
, p0: ptr, n0: size_t
, p1: ptr, n1: size_t
) : Strptr1 = let
//
#define CNUL '\000'
//
val nw =
$extfcall
( size_t
, "atslib_libats_libc_fread", p1, 1, n1, inp)
//
in (* in-of-let *)
//
if
(nw > 0)
then let
  val n1 = n1 - nw
  val p1 = add_ptr_bsz(p1, nw)
in
  if n1 > 0 then
    loop(inp, p0, n0, p1, n1) else loop2(inp, p0, n0)
  // end of [if]
end // end of [then]
else let
  val () =
  $UN.ptr0_set<char>(p1, CNUL) in $UN.castvwtp0{Strptr1}(p0)
end // end of [else]
//
end // end of [loop]
//
and loop2
(
  inp: FILEref, p0: ptr, n0: size_t
) : Strptr1 = let
  val bsz = succ(n0)
  val bsz2 = g1ofg0(bsz + bsz)
  val (pf, pfgc | p0_) = malloc_gc (bsz2)
  val p0_ = $UN.castvwtp0{ptr}((pf, pfgc | p0_))
//
  val _ptr_ =
  $extfcall
  (ptr, "atslib_libats_libc_memcpy", p0_, p0, n0)
//
  val n0_ = pred(g0ofg1(bsz2))
  val p1_ = add_ptr_bsz(p0_, n0)
  val ((*freed*)) = strptr_free($UN.castvwtp0{Strptr1}(p0))
in
  loop(inp, p0_, n0_, p1_, bsz)
end // end of [loop2]
//
val bsz =
  fileref_get_file_string$bufsize<>()
val bsz = i2sz(bsz)
val (pf, pfgc | p0_) = malloc_gc (bsz)
val p0_ = $UN.castvwtp0{ptr}((pf, pfgc | p0_))
val n0_ = pred(bsz)
//
in
  loop(inp, p0_, n0_, p0_, n0_)
end // end of [fileref_get_file_string]

(* ****** ****** *)

%{
extern
atstype_ptr
atspre_fileref_get_line_string_main2
(
  atstype_int bsz0
, atstype_ptr filp0
, atstype_ref nlen0 // int *nlen
)
{
//
  int bsz = bsz0 ;
  int ofs1 = 0, ofs2 = 0;
  int *nlen = (int*)nlen0;
  FILE *filp = (FILE*)filp0 ;
  char *buf1, *buf2, *pres ;
//
  buf1 = atspre_malloc_gc(bsz) ;
//
  while (1) {
    buf2 = buf1+ofs1 ;
    pres = fgets(buf2, bsz-ofs1, filp) ;
    if (!pres)
    {
      if (feof(filp))
      {
        *buf2 = '\0' ;
        *nlen = ofs1 ; return buf1 ;
      } else {
        atspre_mfree_gc(buf1) ;
        *nlen = -1 ; return (char*)0 ;
      } // end of [if]
    }
//
    ofs2 = strlen(buf2) ;
//
    if
    (ofs2 > 0) ofs1 += ofs2 ; else return buf1;
//
// HX: ofs1 > 0 holds at this point
// HX: the newline symbol needs to be trimmed:
//
    if(
    buf1[ofs1-1]=='\n'
    ) {
    buf1[ofs1-1] = '\0'; *nlen = ofs1-1 ; return buf1 ;
    } // end of [if]
//
// HX: there is room // so there are no more chars:
//
    if (ofs1+1 < bsz) { ( *nlen = ofs1 ) ; return buf1 ; }
//
// HX: there is no room // another call to [fgets] is needed:
//
    bsz *= 2 ;
    buf2 = buf1 ;
    buf1 = atspre_malloc_gc(bsz) ;
    memcpy(buf1, buf2, ofs1) ; atspre_mfree_gc(buf2) ;
  } // end of [while]
//
  return buf1 ; // HX: this is really deadcode
//
} // end of [atspre_fileref_get_line_string_main2]
%}

(* ****** ****** *)

implement
{}(*tmp*)
fileref_get_word(inp) = let
//
vtypedef
res = List0_vt(charNZ)
//
fun
loop1
(
// argless
) : res = let
//
val c = $STDIO.fgetc0(inp)
//
in
//
if
(c > 0)
then let
  val c =
    $UN.cast{charNZ}(c)
  val test =
    fileref_get_word$isalpha<>(c)
  // end of [val]
in
  if test
    then loop2(c, list_vt_nil()) else loop1()
end // end of [then]
else list_vt_nil ((*void*))
//
end // end of [loop1]

and
loop2
(
  c: charNZ, cs: res
) : res = let
//
val c2 =
  $STDIO.fgetc0(inp)
val cs =
  list_vt_cons{charNZ}(c, cs)
//
in
//
if
(c2 > 0)
then let
//
val c2 =
  $UN.cast{charNZ}(c2)
val test =
  fileref_get_word$isalpha<>(c2)
//
in
  if test then loop2(c2, cs) else cs
end // end of [then]
else (cs) // end of [else]
//
end // end of [loop2]
//
val cs = loop1((*void*))
//
in
  case+ cs of
  | list_vt_cons _ => let
      val str =
        string_make_rlist
          ($UN.list_vt2t(cs))
        // string_make_rlist
      val () =
        list_vt_free<char>(cs)
      // end of [val]
    in
      strnptr2strptr(str)
    end // end of [list_vt_cons]
  | ~list_vt_nil() => strptr_null()
end // end of [fileref_get_word]

(* ****** ****** *)
//
implement
{}(*tmp*)
fileref_get_word$isalpha
  (charNZ) = isalpha(charNZ)
//
(* ****** ****** *)

implement
{}(*tmp*)
fileref_foreach
  (inp) = let
//
  var env: void = ()
//
in
  fileref_foreach_env(inp, env)
end // end of [fileref_foreach]

(* ****** ****** *)

local
//
staload
"libats/libc/SATS/stdio.sats"
//
extern
fun
fread
(
  ptr, size_t, size_t, FILEref
) : Size = "mac#atslib_libats_libc_fread"
//
in (* in of [local] *)

implement
{env}(*tmp*)
fileref_foreach_env
   (inp, env) = let
//
fun loop
  {l:addr}{n:int}
(
  pf: !b0ytes(n) @ l
| inp: FILEref, bufp: ptr(l), bsz: size_t(n), env: &env
) : void = let
//
val
bsz2 = fread(bufp, i2sz(1), bsz, inp)
//
prval
[n2:int] EQINT() = g1uint_get_index(bsz2)
//
in
//
if bsz2 > 0 then
{
  val A =
    $UN.cast{arrayref(char,n2)}(bufp)
  val () =
    fileref_foreach$fworkv<env>(A, bsz2, env)
  val ((*void*)) = loop (pf | inp, bufp, bsz, env)
} (* end of [if] *)
//
end // end of [loop]
//
val bsz = fileref_foreach$bufsize<>((*void*))
val (pf1, pf2 | bufp) = memory$alloc<>( bsz )
val ((*void*)) = loop(pf1 | inp, bufp, bsz, env)
val ((*void*)) = memory$free<>(pf1, pf2 | bufp)
//
in
  // nothing
end // end of [fileref_foreach_env]

end // end of [local]

(* ****** ****** *)

implement
{}(*tmp*)
fileref_foreach$bufsize() = i2sz(4*1024)

(* ****** ****** *)

implement
{env}(*tmp*)
fileref_foreach$fworkv
  (A, n, env) = let
//
implement
{a}{env}
array_foreach$cont(x, env) = true
implement
array_foreach$fwork<char><env>
  (x, env) = fileref_foreach$fwork<env> (x, env)
//
in
  ignoret(arrayref_foreach_env<char><env> (A, n, env))
end // end of [fileref_foreach$fworkv]

(* ****** ****** *)

implement
{}(*tmp*)
streamize_fileref_char
  (inp) = auxmain(inp) where
{
//
typedef elt = char
//
fun
auxmain
(
  inp
: FILEref
) : stream_vt(elt) = $ldelay
(
//
let
  val c0 = fileref_getc(inp)
in
  if
  (c0 >= 0)
  then
  (
    stream_vt_cons
    (int2char0(c0), auxmain(inp))
  ) else
  (
    stream_vt_nil((*void*)) where
    {
(*
      //
      // HX:
      // FILEref should be kept!
      //
      val () = fileref_close(inp)
      //
*)
    }
  ) (* end-of-else *) // end-of-if
end : stream_vt_con(elt) // end of [let]
//
(*
,
//
fileref_close(inp) // HX: [inp] should be kept!
//
*)
) (* end of [auxmain] *)
//
} (* end of [streamize_fileref_char] *)

(* ****** ****** *)

implement
{}(*tmp*)
streamize_fileptr_char
  (inp) = let
//
typedef elt = char
//
fun
auxmain
(
  inp
: FILEref
) : stream_vt(elt) = $ldelay
(
//
let
  val c0 = fileref_getc(inp)
in
  if
  (c0 >= 0)
  then
  (
    stream_vt_cons
    (int2char0(c0), auxmain(inp))
  ) else
  (
    stream_vt_nil((*void*)) where
    {
      //
      // HX:
      // [inp] should be freed!
      //
      val () = fileref_close(inp)
      //
    }
  ) (* end-of-else *) // end-of-if
end : stream_vt_con(elt) // end of [let]
//
,
//
fileref_close(inp) // HX: [inp] should be freed!
//
) (* end of [auxmain] *)
//
in
  auxmain($UN.castvwtp0{FILEref}(inp))
end (* end of [streamize_fileptr_char] *)

(* ****** ****** *)

implement
{}(*tmp*)
streamize_fileref_line
  (inp) = auxmain(inp) where
{
//
vtypedef elt = Strptr1
//
fun
auxmain
(inp: FILEref):
stream_vt(elt) = $ldelay
(
//
let
//
val
iseof = fileref_is_eof(inp)
//
in
  if iseof
    then let
(*
    //
    // HX: [inp] is kept!
    //
      val () =
        fileref_close(inp)
      // end of [val]
*)
    in
      stream_vt_nil((*void*))
    end // end of [then]
    else let
      val line =
        fileref_get_line_string(inp)
      // end of [val]
    in
      stream_vt_cons(line, auxmain(inp))
    end // end of [else]
end : stream_vt_con(elt) // end of [let]
//
(*
,
//
fileref_close(inp) // HX: [inp] should be kept!
//
*)
) (* end of [auxmain] *)
//
} (* end of [streamize_fileref_line] *)

(* ****** ****** *)

implement
{}(*tmp*)
streamize_fileptr_line
  (inp) = auxmain(inp) where
{
//
vtypedef elt = Strptr1
//
fun
auxmain
(inp: FILEref):
stream_vt(elt) = $ldelay
(
//
let
//
val
iseof = fileref_is_eof(inp)
//
in
  if iseof
    then let
    //
    // HX: [inp] is freed!
    //
      val () =
        fileref_close(inp)
      // end of [val]
    in
      stream_vt_nil((*void*))
    end // end of [then]
    else let
      val line =
        fileref_get_line_string(inp)
      // end of [val]
    in
      stream_vt_cons(line, auxmain(inp))
    end // end of [else]
end : stream_vt_con(elt) // end of [let]
//
,
//
fileref_close(inp) // HX: [inp] should be freed!
//
) (* end of [auxmain] *)
//
val inp = $UN.castvwtp0{FILEref}(inp)
//
} (* end of [streamize_fileptr_line] *)

(* ****** ****** *)

(* end of [filebas.dats] *)

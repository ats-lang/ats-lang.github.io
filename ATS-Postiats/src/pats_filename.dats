(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2013 Hongwei Xi, ATS Trustful Software, Inc.
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
//
// Author: Hongwei Xi
// Authoremail: gmhwxi AT gmail DOT com
// Start Time: March, 2011
//
(* ****** ****** *)
//
staload
ATSPRE = "./pats_atspre.dats"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"
staload
_(*UN*) = "prelude/DATS/unsafe.dats"

(* ****** ****** *)
//
staload
UTL = "./pats_utils.sats"
staload
_(*UTL*) = "./pats_utils.dats"
//
symintr
print_stropt
overload
print_stropt with $UTL.print_stropt
//
(* ****** ****** *)
//
staload
LOC = "./pats_location.sats"
//
(* ****** ****** *)
//
staload SYM = "./pats_symbol.sats"
//
typedef symbol = $SYM.symbol
overload = with $SYM.eq_symbol_symbol
//
(* ****** ****** *)

staload "./pats_filename.sats"

(* ****** ****** *)
//
fun
ptr_succ_char
  (p: ptr): ptr =
  add_ptr_size(p, sizeof<char>)
//
(* ****** ****** *)

local
//
#include
"prelude/params_system.hats"
//
#if SYSTEM_IS_UNIX_LIKE #then
//
val theDirSep: char = '/'
val theCurDir: string = "./"
val theParDir: string = "../"
//
#endif

in (* in of [local] *)

implement theDirSep_get () = theDirSep
implement theCurDir_get () = theCurDir
implement theParDir_get () = theParDir

end // end of [local]

(* ****** ****** *)

local
//
staload
STR = "libc/SATS/string.sats"
//
macdef strncmp = $STR.strncmp
//
in (* in of [local] *)

implement
givename_srchknd
  (given) = let
//
val dir = theCurDir_get()
val len = string_length(dir)
//
in
//
if
strncmp
(given, dir, len) = 0
then 0(*loc*)
else
(
(
if
0 =
strncmp
(
given, "$PATSHOMELOCS/", 14
)
then 1
else 2(*ext*)
) (* end of [else] *)
) (* end of [else] *)
//
end // end of [givename_srchknd]

(* ****** ****** *)
//
// HX-2013-09:
// a gurled name looks like this:
// {}prelude/SATS/string.sats
// {$ATSCNTRB}/libgmp/SATS/string.sats
// {http://ats-lang.org/LIBRARY}prelude/SATS/string.sats
// {git@github.com:githwxi/ATS-Postiats.git}prelude/SATS/string.sats
//
implement
givename_get_ngurl
  (given) = let
//
fun loop
(
  p: ptr, n: int
, c0: char, c1: char
) : ptr = let
//
val c =
  $UN.ptr0_get<char>(p)
//
val p1 = ptr_succ_char(p)
//
in
//
case+ 0 of
| _ when c = c0 =>
    loop(p1, n+1, c0, c1)
| _ when c = c1 =>
    if n > 1 then loop(p1, n-1, c0, c1) else p1
| _ (* !=c0,c1 *) =>
    if c != '\000' then loop(p1, n, c0, c1) else null
//
end (* end of [loop] *)
//
val p0 = $UN.cast2ptr (given)
val c0 = $UN.ptr0_get<char> (p0)
//
val p1 = (
case+ 0 of
(*
| _ when
    c0 = '\(' => let
    val p = ptr_succ_char(p0, 1) in loop(p, 1, c0, ')')
  end // end of [_ when ...]
*)
| _ when
    c0 = '\{' => let
    val p = ptr_succ_char(p0) in loop (p, 1, c0, '}')
  end // end of [_ when ...]
| _ (*rest-of-chars*) => null
) : ptr // end of [val]
//
val p0 = $UN.cast2Ptr1(p0)
val p1 = $UN.cast2Ptr1(p1)
//
in
  if p1 > p0 then $UN.cast2int(pdiff(p1, p0)) else ~1
end // end of [givename_get_ngurl]

end // end of [local]

(* ****** ****** *)

assume
filename_type = '{
  filename_givename= string
, filename_partname= string
, filename_fullname= symbol
} (* end of [filename] *)

(* ****** ****** *)
//
implement
filename_get_givename
  (fil) = fil.filename_givename
//
implement
filename_get_partname
  (fil) = fil.filename_partname
//
implement
filename_get_fullname
  (fil) = fil.filename_fullname
//
(* ****** ****** *)
(*
//
implement
print_filename
  (fil) = fprint_filename (stdout_ref, fil)
implement
prerr_filename
  (fil) = fprint_filename (stderr_ref, fil)
//
implement
fprint_filename (out, fil) =
  fprint_string (out, fil.filename_partname)
//
*)
(* ****** ****** *)

implement
print_filename_full
  (fil) =
  fprint_filename_full(stdout_ref, fil)
implement
prerr_filename_full
  (fil) =
  fprint_filename_full(stderr_ref, fil)
implement
fprint_filename_full
  (out, fil) = let
  val fname =
  $SYM.symbol_get_name(fil.filename_fullname)
in
  fprint_string(out, fname)
end // end of [fprint_filename_full]

(* ****** ****** *)

implement
fprint2_filename_full
  (out, fil) = let
//
val given =
  fil.filename_givename
val ngurl =
  givename_get_ngurl(given)
val fname =
  $SYM.symbol_get_name(fil.filename_fullname)
//
in
//
if ngurl < 0
  then fprint_string(out, fname)
  else fprintf(out, "%s(%s)", @(fname, given))
// end of [if]
//
end // end of [fprint2_filename_full]

(* ****** ****** *)

implement
eq_filename_filename
  (x1, x2) =
  x1.filename_fullname = x2.filename_fullname
// end of [eq_filename_filename]

(* ****** ****** *)

implement
compare_filename_filename
  (x1, x2) = let
//
val f1 =
$SYM.symbol_get_name(x1.filename_fullname)
//
val f2 =
$SYM.symbol_get_name(x2.filename_fullname)
//
in
  compare_string_string (f1, f2)
end // end of [compare_filename_filename]

(* ****** ****** *)
//
local
//
// HX: implemented in [pats_utils.dats]
//
extern
fun
string_test_suffix
(
  str: string, sffx: string
) : bool =
  "ext#patsopt_string_test_suffix"

in (* in of [local] *)
//
implement
filename_is_sats (fil) =
string_test_suffix
  (fil.filename_partname, ".sats")
//
implement
filename_is_dats (fil) =
string_test_suffix
  (fil.filename_partname, ".dats")
//
end // end of [local]
//
(* ****** ****** *)
//
extern
fun
givename_is_relative
  (given: string): bool
//
implement
givename_is_relative
  (given) = let
//
fun
aux
{n:int}
{i:nat | i <= n}
(
  given: string(n)
, i: size_t(i), dirsep: char
) : bool = let
//
val isnot =
  string_isnot_atend(given, i)
//
in
  if isnot
    then (given[i] != dirsep) else false
  // end of [if]
end // end of [aux]
//
val given = 
  string1_of_string (given)
//
val dirsep = theDirSep_get ()
//
in
  aux (given, 0, dirsep)
end // [givename_is_relative]
//
(* ****** ****** *)

implement
filename_dummy = '{
  filename_givename= ""
, filename_partname= ""
, filename_fullname= $SYM.symbol_empty
} // end of [filename_dummy]

implement
filename_stdin = '{
  filename_givename= "__STDIN__"
, filename_partname= "__STDIN__"
, filename_fullname= $SYM.symbol__STDIN__
} // end of [filename_stdin]

implement
filename_string = '{
  filename_givename= "__STRING__"
, filename_partname= "__STRING__"
, filename_fullname= $SYM.symbol__STRING__
} // end of [filename_string]

(* ****** ****** *)
//
implement
filename_is_dummy(fil) =
if
(
  fil.filename_fullname = $SYM.symbol_empty
) then true else false
//
implement
filename_isnot_dummy(fil) =
if
(
  fil.filename_fullname = $SYM.symbol_empty
) then false else true
//
(* ****** ****** *)
//
implement
print_pathlst(xs) =
fprint_pathlst(stdout_ref, xs)
implement
prerr_pathlst(xs) =
fprint_pathlst(stderr_ref, xs)
//
implement
fprint_pathlst(out, xs) =
$UTL.fprintlst(out, xs, ":", lam(out, x) => fprint_string(out, x))
//
(* ****** ****** *)
//
staload
UNISTD = "libc/SATS/unistd.sats"
//
(* ****** ****** *)

implement
path_normalize_vt
  (s0) = let
//
fun
loop1
{n0,i0:nat | i0 <= n0}
(
  dirsep: char
, s0: string n0, n0: size_t n0, i0: size_t i0
, dirs: &List_vt strptr1
) : void =
(
if i0 < n0
  then loop2(dirsep, s0, n0, i0, i0, dirs) else ()
)
//
and
loop2
{n0,i0,i:nat | i0 < n0; i0 <= i; i <= n0}
(
  dirsep: char
, s0: string n0, n0: size_t n0, i0: size_t i0, i: size_t i
, dirs: &List_vt strptr1
) : void =
(
if
(i < n0)
then let
(*
  // empty
*)
in
//
if
(s0[i] <> dirsep)
then
(
  loop2 (dirsep, s0, n0, i0, i+1, dirs)
) (* end of [then] *)
else let
  val sbp =
  string_make_substring(s0, i0, i - i0 + 1)
  val dir = strptr_of_strbuf(sbp) // this is a no-op cast
(*
  val () =
  (
    print "path_normalize_vt: loop2: dir = "; print dir; print_newline ()
  ) (* end of [val] *)
*)
in
  dirs := list_vt_cons (dir, dirs); loop1 (dirsep, s0, n0, i + 1, dirs)
end // end of [else]
//
end // end of [then]
else let
  val sbp =
  string_make_substring (s0, i0, i - i0)
  val dir = strptr_of_strbuf (sbp) // this is a no-op cast
(*
  val () =
  (
    print "path_normalize_vt: loop2: dir = "; print dir; print_newline ()
  ) (* end of [val] *)
*)
in
  dirs := list_vt_cons (dir, dirs)
end // end of [else]
//
) (* end of [loop1] and [loop2] *)
//
extern
castfn
p2s{l:agz}(x: !strptr(l)):<> string
//
vtypedef strptrlst = List_vt (strptr1)
//
fun
dirs_process{n:nat}
(
  curdir: string, pardir: string
, npar: int n, dirs: strptrlst, res: strptrlst
) : strptrlst = let
(*
// nothing
*)
in
  case+ dirs of
  | ~list_vt_nil
      () => let
      fun
      loop{i,j:nat}
      (
        pardir: string
      , npar: int(i), res: list_vt(strptr1, j)
      ) : list_vt (strptr1, i+j) =
        if npar > 0 then let
          val dir =
            string1_of_string (pardir)
          // end of [val]
          val n = string1_length(dir)
          val dir = string_make_substring(dir, 0, n)
          val dir = strptr_of_strbuf(dir)
        in
          loop(pardir, npar - 1, list_vt_cons(dir, res))
        end else res // end of [if]
      // end of [loop]
    in
      loop(pardir, npar, res)
    end (* end of [list_vt_nil] *)
  | ~list_vt_cons
      (dir, dirs) => (
      if (p2s)dir = curdir then let
        val () = strptr_free(dir) in
        dirs_process(curdir, pardir, npar, dirs, res)
      end else if (p2s)dir = pardir then let
        val () = strptr_free(dir) in
        dirs_process(curdir, pardir, npar + 1, dirs, res)
      end else (
        if npar > 0 then let
          val () = strptr_free(dir)
        in
          dirs_process(curdir, pardir, npar - 1, dirs, res)
        end else begin
          dirs_process(curdir, pardir, 0, dirs, list_vt_cons(dir, res))
        end (* end of [if] *)
      ) // end of [if]
    ) (* end of [list_vt_cons] *)
end // end of [dirs_process]
//
val dirsep = theDirSep_get()
val curdir = theCurDir_get()
and pardir = theParDir_get()
//
var dirs
  : strptrlst = list_vt_nil()
//
val s0 =
  string1_of_string(s0)
//
val n0 = string_length(s0)
//
val () =
  loop1 (dirsep, s0, n0, 0, dirs)
//
val () =
dirs :=
dirs_process(curdir, pardir, 0, dirs, list_vt_nil)
//
val path =
stringlst_concat
(
  __cast (dirs)
) where
{
  extern castfn __cast(x: !strptrlst): List0(string)
} (* end of [where] *) // end of [val]
//
val ((*freed*)) =
list_vt_free_fun<strptr1> (dirs, lam x => strptr_free(x))
//
in
  path(*strptr*)
end // end of [path_normalize_vt]

implement
path_normalize (s0) =
  string_of_strptr (path_normalize_vt (s0))
// end of [path_normalize]

(* ****** ****** *)

local
//
extern
castfn
p2s{l:agz}
  (x: !strptr(l)):<> string
//
in (* in of [local] *)

fun
partname_fullize
(
  pname: string
) : string = let
//
val isrel =
  givename_is_relative(pname)
//
in
//
if
isrel
then let
  val cwd = $UNISTD.getcwd0()
  val fname =
    filename_dirbase((p2s)cwd, pname)
  // end of [val]
  val _freed_ = strptr_free(cwd)
  val fname_nf = path_normalize((p2s)fname)
  val _freed_ = strptr_free(fname)
in
  fname_nf
end // end of [then]
else pname // HX: [pname] is absolute
//
end // end of [partname_fullize]

end (* end of [local] *)

(* ****** ****** *)

local
//
assume
the_filenamelst_push_v = unit_v
//
vtypedef filenamelst = List_vt(filename)
//
val
the_filename =
  ref_make_elt<filename> (filename_dummy)
val
the_filenamelst =
  ref_make_elt<filenamelst> (list_vt_nil)
//
fun
filename_occurs
  (f0: filename): bool = let
//
fun
loop {n:nat} .<n>.
(
  fs: !list_vt (filename, n), f0: filename
) :<> bool = (
//
case+ fs of
| list_vt_cons
    (f, !p_fs) => let
    val eqfil =
      eq_filename_filename(f0, f)
    // end of [val]
  in
    if eqfil
      then (fold@ fs; true)
      else let
        val ans = loop (!p_fs, f0)
        prval ((*folded*)) = fold@ (fs)
      in
        ans
      end (* end of [else] *)
    // end of [if]
  end // end of [list_vt_cons]
//
| list_vt_nil((*void*)) => (fold@ fs; false)
//
) (* end of [loop] *)
//
val
(
  vbox pf | p
) = ref_get_view_ptr (the_filenamelst)
//
in
  loop (!p, f0)
end // end of [filename_occurs]

in (* in of [local] *)
//
implement
filename_get_current((*void*)) = !the_filename
//
(* ****** ****** *)

implement
the_filenamelst_pop
(
  pf | (*none*)
) = let
//
prval unit_v() = pf
//
in
  the_filenamelst_ppop((*void*))
end // end of [the_filenamelst_pop]

implement
the_filenamelst_ppop
  ((*none*)) = let
//
val f0 = x0 where {
//
  val
  (vbox pf | p) =
  ref_get_view_ptr(the_filenamelst)
//
  val-
  ~list_vt_cons(x0, xs) = !p
  val ((*void*)) = (!p := xs)
//
} (* end of [val] *)
//
val () = !the_filename := f0
//
in
  // nothing
end // end of [the_filenamelst_ppop]

(* ****** ****** *)
//
implement
the_filenamelst_push(f0) = let
//
val () =
  the_filenamelst_ppush(f0) in (unit_v() | ())
//
end // end of [the_filenamelst_push]
//
implement
the_filenamelst_ppush(f0) = let
  val x0 = !the_filename
  val () = !the_filename := f0
  val (vbox pf | p) = ref_get_view_ptr(the_filenamelst)
  val () = !p := list_vt_cons(x0, !p)
in
  // nothing
end // end of [the_filenamelst_ppush]
//
(* ****** ****** *)
(*
//
// HX-2017-01-31: push from the back
//
implement
the_filenamelst_ppushb(f0) = let
  val x0 = !the_filename
  val () = !the_filename := f0
  val (vbox pf | p) = ref_get_view_ptr(the_filenamelst)
  val () = !p := list_vt_extend(!p, x0)
in
  // nothing
end // end of [the_filenamelst_ppushb]
//
*)
(* ****** ****** *)

implement
the_filenamelst_push_check
  (f0) = let
(*
val () =
println
(
  "the_filenamelst_push_check:the_filenamelst(bef)="
) (* end of [val] *)
val ((*void*)) = fprint_the_filenamelst (stdout_ref)
*)
//
val (pf | ()) = the_filenamelst_push (f0)
//
(*
val () =
println
(
  "the_filenamelst_push_check:the_filenamelst(aft)="
) (* end of [val] *)
val ((*void*)) = fprint_the_filenamelst (stdout_ref)
//
*)
val
isexi =
(
  if filename_isnot_dummy(f0) then filename_occurs(f0) else false
) : bool // end of [val]
//
in
  (pf | isexi)
end // end of [the_filenamelst_push_check]

(* ****** ****** *)

implement
fprint_the_filenamelst
  (out) = let
//
fun
loop (
  out: FILEref, fs: !filenamelst
) : void = (
//
case+ fs of
| list_vt_cons
    (f, !p_fs) => let
//
    val () =
    fprint_filename_full(out, f)
    val () = fprint_newline (out)
//
    val () = loop (out, !p_fs)
    prval ((*folded*)) = fold@ (fs)
//
  in
    // nothing
  end // end of [list_vt_cons]
//
| list_vt_nil((*void*)) => fold@ (fs)
) (* end of[ loop] *)
//
val
(
  vbox pf | p
) =
  ref_get_view_ptr (the_filenamelst)
//
in
  $effmask_ref (loop (out, !p))
end // end of [fprint_the_filenamelst]

end // end of [local]

(* ****** ****** *)

typedef pathlst = List (path)
vtypedef pathlst_vt = List_vt (path)

local
//
assume
the_pathlst_push_v = unit_v
//
val the_pathlst = ref_make_elt<pathlst_vt>(list_vt_nil)
val the_prepathlst = ref_make_elt<pathlst_vt>(list_vt_nil)
//
in (* in of [local] *)

(* ****** ****** *)

fun
the_pathlst_get
  (): pathlst_vt = xs where
{
//
val
(
  vbox pf | p
) =
  ref_get_view_ptr(the_pathlst)
//
val xs = !p
val () = !p := list_vt_nil()
//
} (* end of [the_pathlst_get] *)

fun
the_pathlst_set
  (xs: pathlst_vt): void =
{
//
val
(
  vbox pf | p
) =
  ref_get_view_ptr(the_pathlst)
//
val-
~list_vt_nil() = !p
val () = (!p := xs)
//
} (* end of [the_pathlst_set] *)

(* ****** ****** *)

implement
the_pathlst_pop
  (pf | (*none*)) =
{
//
prval unit_v() = pf
//
val
(
  vbox pf | p
) =
  ref_get_view_ptr(the_pathlst)
//
val-
~list_vt_cons(_, xs) = !p
val ((*void*)) = !p := xs
//
} (* end of [the_pathlst_pop] *)

implement
the_pathlst_push(x0) = let
//
val () =
  the_pathlst_ppush(x0) in (unit_v() | ())
//
end // end of [the_pathlst_push]

implement
the_pathlst_ppush(x0) = let
//
val
(
  vbox pf | p
) = ref_get_view_ptr(the_pathlst)
//
in
  !p := list_vt_cons(x0, !p)
end // end of [the_pathlst_ppush]

(* ****** ****** *)

(*
//
// HX-2017-02-01: reverted
//
implement
the_pathlst_ppushb(x0) = let
//
val
(
  vbox pf | p
) = ref_get_view_ptr(the_pathlst)
//
in
  !p := list_vt_extend(!p, x0)
end // end of [the_pathlst_ppushb]
*)

(* ****** ****** *)

fun
the_prepathlst_get
(
  // argless
) : pathlst_vt = xs where {
//
val
(
  vbox pf | p
) =
  ref_get_view_ptr(the_prepathlst)
//
val xs = !p
val () = !p := list_vt_nil((*void*))
//
} (* end of [the_prepathlst_get] *)

fun
the_prepathlst_set
  (xs: pathlst_vt): void =
{
//
val
(
  vbox pf | p
) = ref_get_view_ptr(the_prepathlst)
//
val-~list_vt_nil () = !p
val ((*void*)) = !p := xs
//
} // end of [the_prepathlst_set]

(* ****** ****** *)

implement
the_prepathlst_push(x) = let
//
val
(
  vbox pf | p
) = ref_get_view_ptr(the_prepathlst)
//
in
  !p := list_vt_cons(x, !p)
end // end of [the_prepathlst_push]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
filename_make
(
  given, pname, fname
) = let
//
val fname = $SYM.symbol_make_string (fname)
//
in '{
  filename_givename= given
, filename_partname= pname, filename_fullname= fname
} end // end of [filename_make]

(* ****** ****** *)

local

(* ****** ****** *)

extern castfn s2s (x: string):<> String
extern castfn p2s {l:agz} (x: !strptr l):<> String

(* ****** ****** *)

fun
aux_try
  {n:nat} .<n,0>.
(
  paths: list(path, n), given: string
) : Stropt = let
in
//
case+ paths of
| list_cons
  (
    path, paths
  ) => aux2_try(path, paths, given)
| list_nil((*void*)) => stropt_none(*void*)
//
end // end of [aux_try]

and
aux2_try
  {n:nat} .<n,1>.
(
  path: path
, paths: list(path, n), given: string
) : Stropt = let
//
  val
  partname =
  filename_dirbase(path, given)
//
(*
  val () =
  printf("aux2_try: partname = %s\n", @(partname))
*)
//
  val isexi = test_file_exists((p2s)partname)
//
in
//
if
isexi
then
(
  stropt_of_strptr(partname)
) else let
  val () = strptr_free(partname) in aux_try(paths, given)
end // end of [if]
//
end // end of [aux2_try]

(* ****** ****** *)

fun
aux_local
(
  given: string
) : Stropt = let
  val fil = filename_get_current()
  val pname = filename_get_partname(fil)
(*
  val () = println!("aux_local: pname = ", pname)
*)
  val pname2 =
    filename_merge(pname, given)
  val pname2_nf =
    path_normalize_vt((p2s)pname2)
  val ((*freed*)) = strptr_free(pname2)
(*
  val () = println! ("aux_local: pname2_nf = ", pname2_nf)
*)
  val isexi = test_file_exists((p2s)pname2_nf)
in
  if isexi then
    stropt_of_strptr(pname2_nf)
  else let
    val () = strptr_free(pname2_nf) in stropt_none(*void*)
  end // end of [if]
end // end of [aux_local]

(* ****** ****** *)

fun
aux_try_pathlst
(
  given: string
) : Stropt = ans where
{
//
val path = theCurDir_get()
val paths = the_pathlst_get()
//
val (ans) =
//
// HX:
// search the current directory first
//
(
aux2_try
( path
, $UN.castvwtp1{pathlst}(paths), given
) (* aux2_try *)
)
// end of [val]
//
// HX-2018-01-11:
// calling the_pathlst_set is
// needed for the_pathlst being linear
//
(*
//
val () =
println!
("aux_try_pathlst: given = ", given)
val () =
(
print("aux_try_pathlst: ans = "); print_stropt(ans); println!()
)
//
*)
//
val ((*void*)) = the_pathlst_set(paths)
//
} (* end of [aux_try_pathlst] *)

fun
aux_try_prepathlst
(
  given: string
) : Stropt = ans where
{
//
val
paths = the_prepathlst_get()
//
val
(ans) =
aux_try
($UN.castvwtp1{pathlst}(paths), given)
// end of [val]
//
(*
//
val () =
println!
("aux_try_prepathlst: given = ", given)
val () =
(
print("aux_try_prepathlst: ans = "); print_stropt(ans); println!()
)
//
*)
//
val () = the_prepathlst_set(paths) // HX: linearity
//
} (* end of [aux_try_prepathlst] *)

(* ****** ****** *)

fun
aux_tryloc
  {n:nat} .<n,0>.
(
  paths: list(path, n), given: string
) : Stropt = let
in
//
case+ paths of
| list_cons
  (
    path, paths
  ) => aux2_tryloc(path, paths, given)
| list_nil((*void*)) => stropt_none(*void*)
//
end // end of [aux_tryloc]

and
aux2_tryloc
  {n:nat} .<n,1>.
(
  path: path
, paths: list(path, n), given: string
) : Stropt = let
//
val
partname =
filename_dirbase(path, given)
//
(*
val () =
printf("aux2_tryloc: partname = %s\n", @(partname))
*)
//
val stropt = aux_local((p2s)partname)
//
val ((*freed*)) = strptr_free(partname)
//
in
//
if
(
stropt_is_some(stropt)
) then stropt(*path/given*) else aux_tryloc(paths, given)
// end of [if]
//
end // end of [aux2_tryloc]

(* ****** ****** *)

fun
aux_homelocs
(
  given: string
) : Stropt = let
//
(*
val () =
println!
(
  "aux_homelocs: given = ", given
) (* end of [val] *)
*)
//
fun
given_get_partname
(
  given
: string
) : string = let
//
#define NUL '\0'
//
val
sep = theDirSep_get()
//
fun
loop
(
  p: ptr
) :<cloref1> string = let
//
val c = $UN.ptr0_get<char>(p)
//
in
//
// [given] should contain '/'!
//
if
(c = NUL)
then ""
else
(
if c != sep
  then loop(ptr_succ_char(p))
  else $UN.cast{string}(ptr_succ_char(p)) 
// end of [if]
)
//
end // end of [given_get_partname]
//
in
  loop($UN.cast2ptr(given))
end // end of [given_get_partname]
//
val homelocs =
  the_PATSHOMELOCS_get_pathlst()
//
(*
val () =
(
print!
(
"aux_homelocs: homelocs = "
); print_pathlst(homelocs); println!()
)
*)
//
in
  aux_tryloc(homelocs, given_get_partname(given))
end // end of [aux_homelocs]

(* ****** ****** *)

fun
aux_relative
(
  given: string
) : Stropt = let
//
val
given = (s2s)given
val
(knd) = givename_srchknd(given)
//
in
//
case+ knd of
//
| 0 (*local*) => 
  (
    //
    // given = "./<path>
    //
    aux_local(given)
  )
| 1 (* homelocs *) =>
  (
    //
    // given =
    // $PATSHOMELOCS/<path>
    //
    aux_homelocs(given)
  )
//
| _ (*external*) => let
(*
    val
    opt = stropt_none(*void*)
*)
    val
    opt = aux_try_pathlst(given)
  in
    if stropt_is_some(opt) then opt else aux_try_prepathlst(given)
  end // end of [_]
//
end // end of [aux_relative]

(* ****** ****** *)

in (* in of [local] *)

(* ****** ****** *)

implement
filenameopt_make_local
  (given) = let
//
val opt = aux_local(given)
val issome = stropt_is_some(opt)
//
in
//
if
issome
then let
  val partname = stropt_unsome(opt)
  val fullname = partname_fullize(partname)
in
  Some_vt(filename_make(given, partname, fullname))
end else None_vt() // end of [if]
//
end // end of [filenameopt_make_local]

(* ****** ****** *)

implement
filenameopt_make_relative
  (given, given2_ref) = let
//
val ngurl = givename_get_ngurl(given)
val given2 = pkgsrcname_relocatize(given, ngurl)
val ((*void*)) = (given2_ref := given2)
//
(*
val () = 
  println! ("filenameopt_make_relative: ngurl = ", ngurl)
val () = 
  println! ("filenameopt_make_relative: given = ", given)
val () = 
  println! ("filenameopt_make_relative: given2 = ", given2)
*)
//
val opt =
(
case+ 0 of
| _ when
    givename_is_relative
    (
      given2
    ) => aux_relative(given2)
  // end of [_ when ...]
| _ (* given2 is absolute *) => let
    val
    isexi = test_file_exists(given2)
  in
    if isexi then stropt_some(given2) else stropt_none(*void*)
  end // end of [_]
) : Stropt // end of [val]
//
val issome = stropt_is_some(opt)
//
in
//
if
issome
then let
//
val partname = stropt_unsome(opt)
val fullname = partname_fullize(partname)
//
in
  Some_vt(filename_make(given, partname, fullname))
end // end of [then]
else None_vt() // end of [else]
//
end // end of [filenameopt_make_relative]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local
//
extern
fun
my_make_substring
(
  src: string, beg: size_t, len: size_t
) : strptr1
  = "mac#atspre_string_make_substring"
//
fun
my_make_substring_range
(
  src: string, beg: size_t, fin: size_t
) : string  = let
  val
  len =
  (
    if fin >= beg then (fin - beg) else 0
  ) : size_t // end of [val]
in
  string_of_strptr(my_make_substring(src, beg, len))
end // end of [my_make_substring_range]
//
(* ****** ****** *)
//
fun
pathlst_test
  {n:int}
(
  xs: !list_vt(path, n), x0: path
) : bool =
(
case+ xs of
| list_vt_nil
    ((*void*)) =>
  (fold@(xs); false)
| list_vt_cons
    (x_hd, !p_xs_tl) =>
  if x0 = x_hd
    then (fold@(xs); true)
    else test where
    {
      val test =
        pathlst_test(!p_xs_tl, x0)
      // end of [test]
      prval ((*folded*)) = fold@(xs)
    }
) (* end of [pathlst_test] *)
//
fun
pathlst_insert
(
  xs: pathlst_vt,  x0: path
) : pathlst_vt =
  if pathlst_test(xs, x0) then xs else list_vt_cons(x0, xs)
//
(* ****** ****** *)
//
val
the_PATSHOMELOCS =
ref<Option(pathlst)>(None())
//
fun
the_PATSHOMELOCS_split
(
  paths: string
) : pathlst = let
//
#define NUL '\0'
#define COLON ':'
//
val
dirsep = theDirSep_get()
//
fun
loop2
(
  p: ptr
, i: size_t
, res: pathlst_vt
) :<cloref1> pathlst_vt = let
//
val c = $UN.ptr0_get<char>(p)
//
in
//
if
(c = NUL)
then res
else
(
if c = COLON
  then loop2(ptr_succ_char(p), i+1, res)
  else loop3(ptr_succ_char(p), i, i+1, res)
)
//
end (* end of [loop2] *)
//
and
loop3
(
  p: ptr
, i: size_t
, j: size_t
, res: pathlst_vt
) :<cloref1> pathlst_vt = let
//
val c = $UN.ptr0_get<char>(p)
//
in
//
if
(c = NUL)
then let
//
val path =
  my_make_substring_range(paths, i, j)
//
in
  pathlst_insert(res, path)
end // end of [then]
else
(
if
(c = COLON)
then let
//
val path =
  my_make_substring_range(paths, i, j)
//
in
//
loop2
(
ptr_succ_char(p), j+1, pathlst_insert(res, path)
)
//
end // end of [then]
else
(
  loop3(ptr_succ_char(p), i, j+1, res)
) (* end of [else] *)
) (* end of [else] *)
//
end (* end of [loop3] *)
//
in
//
list_of_list_vt
(
list_vt_reverse(loop2($UN.cast2ptr(paths), 0, list_vt_nil()))
) (* list_of_list_vt *)
//
end // end of [the_PATSHOMELOCS_split]
//
fun
the_PATSHOMELOCS_initize
  (): pathlst = let
//
val
paths = get() where
{
  extern
  fun
  get(
  // argless
  ) : Stropt =
    "ext#patsopt_PATSHOMELOCS_get"
} (* end of [val] *)
//
(*
val () =
(
print!
(
"the_PATSHOMELOCS_initize: paths = "
); print_stropt(paths); print_newline()
)
*)
//
val issome = stropt_is_some(paths)
//
in
//
if
issome
then paths where
{
  val paths = stropt_unsome(paths)
  val paths = the_PATSHOMELOCS_split(paths)
  val ((*void*)) =
    !the_PATSHOMELOCS := Some(paths)
  // end of [val]
}
else paths where
{
  val paths = list_nil()
  val ((*void*)) =
    !the_PATSHOMELOCS := Some(paths)
  // end of [val]
}
end // end of [ else]
//
in (* in-of-local *)

implement
the_PATSHOMELOCS_get_pathlst
  () = let
//
val
opt = !the_PATSHOMELOCS
//
in
//
case+ opt of
| Some(paths) => paths
| None((*void*)) => the_PATSHOMELOCS_initize()
//
end // end of [the_PATSHOMELOCS_get_pathlst]

end // end of [local]

(* ****** ****** *)

%{$

ats_ptr_type
patsopt_filename_merge
(
  ats_ptr_type ful, ats_ptr_type bas
) {
  char c, dirsep ;
  char *p0, *p1, *p ;
  int n, n1, n2, found = 0 ;
  char *fulbas ;
  p0 = p = (char*)ful ;
  dirsep =
    patsopt_filename_theDirSep_get () ;
//
  while (1) {
    c = *p++ ;
    if (c == 0) break ;
    if (c == dirsep) { found = 1 ; p1 = p ; }
  }
//
  n1 = 0 ;
  if (found) n1 = (p1-p0) ;
  n2 = strlen ((char*)bas) ;
  n = n1 + n2 ;
  fulbas = ATS_MALLOC (n+1) ;
  memcpy (fulbas, ful, n1) ;
  memcpy (fulbas + n1, bas, n2) ;
  fulbas[n] = '\000' ;
//
  return fulbas ;
//
} // end of [patsopt_filename_merge]

ats_ptr_type
patsopt_filename_dirbase
(
  ats_ptr_type dir, ats_ptr_type bas
) {
  int n1, n2, n ;
  char dirsep, *dirbas ;
//
  dirsep = patsopt_filename_theDirSep_get () ;
//
  n1 = strlen ((char*)dir) ;
  n2 = strlen ((char*)bas) ;
  n = n1 + n2 ;
//
  if (n1 > 0 && ((char*)dir)[n1-1] != dirsep) n += 1 ;
  dirbas = ATS_MALLOC (n + 1) ;
  memcpy (dirbas, dir, n1) ;
  if (n > n1 + n2) { dirbas[n1] = dirsep ; n1 += 1 ; }
  memcpy (dirbas + n1, bas, n2) ;
  dirbas[n] = '\000' ;
//
  return dirbas ;
} /* end of [patsopt_filename_dirbase] */

%} // end of [%{$]

(* ****** ****** *)

(* end of [pats_filename.dats] *)

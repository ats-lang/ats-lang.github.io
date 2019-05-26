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
// Authoremail: gmhwxiATgmailDOTcom
// Start Time: March, 2013
//
(* ****** ****** *)
//
#define
ATS_PACKNAME "ATSLIB.libats.libc"
#define
ATS_DYNLOADFLAG 0 // no dynloading at run-time
#define
ATS_EXTERN_PREFIX
"atslib_libats_libc_" // prefix for external names
//
(* ****** ****** *)
//
staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload
"libats/libc/SATS/dirent.sats"
//
(* ****** ****** *)
//
implement
{}(*tmp*)
dirent$PC_NAME_MAX((*void*)) = 256
//
(* ****** ****** *)

implement
{}(*tmp*)
dirent_get_d_name_gc
  (ent) = let
//
val (
  fpf | str
) = dirent_get_d_name (ent)
val str2 = strptr1_copy (str)
//
prval ((*returned*)) = fpf(str)
//
in
  str2
end // end of [dirent_get_d_name_gc]

implement
{}(*tmp*)
direntp_get_d_name_gc
  (entp) = let
//
val (
  pf, fpf | p
) = direntp_get_viewptr (entp)
val str2 = dirent_get_d_name_gc<> (!p)
prval () = minus_addback (fpf, pf | entp)
//
in
  str2
end // end of [direntp_get_d_name_gc]

(* ****** ****** *)

implement
{}(*tmp*)
compare_dirent_string
  (ent1, str2) = sgn where
{
//
val
(
  fpf1 | str1
) = dirent_get_d_name (ent1)
val sgn = compare_string_string ($UN.strptr2string(str1), str2)
prval () = fpf1 (str1)
//
} (* end of [compare_dirent_string] *)

(* ****** ****** *)

%{
extern
atstype_ptr
atslib_libats_libc_opendir_exn
(
  atstype_string dname
) {
  DIR *dirp ;
  dirp = opendir((char*)dname) ;
  if (!dirp) ATSLIBfailexit("opendir") ;
  return dirp ; // [opendir] succeeded
} // end of [atslib_libats_libc_opendir_exn]
%}

(* ****** ****** *)

%{
extern
atsvoid_t0ype
atslib_libats_libc_closedir_exn
(
  atstype_ptr dirp
) {
  int err = closedir((DIR*)dirp) ;
  if (err < 0) ATSLIBfailexit("closedir") ;
  return ; // [closedir] succeeded
} // end of [atslib_libats_libc_closedir_exn]
%}

(* ****** ****** *)

implement
{}(*tmp*)
readdir_r_gc
  (dirp) = let
//
val ofs = $extfcall
(
  Size_t
, "offsetof"
, $extval (int, "atslib_libats_libc_dirent_type")
, $extval (int, "d_name")
)
//
val bsz =
  ofs + i2sz(dirent$PC_NAME_MAX()+1)
//
val
[l:addr](pf, pfgc | p) = malloc_gc(bsz)
//
prval(pf) =
  $UN.castview0{(dirent?)@l}(pf)
var res: ptr
val err = readdir_r (dirp, !p, res)
//
in
//
if
res > 0
then (
//
$UN.castvwtp0{Direntp1}@(pf, pfgc | p)
//
) (* end of [then] *)
else let
  prval() = opt_clear{dirent}(!p)
  val ((*freed*)) = ptr_free{dirent?}(pfgc, pf | p)
in
  $UN.castvwtp0{Direntp0}(the_null_ptr)
end (* end of [else] *)
//
end // end of [readdir_r_gc]

(* ****** ****** *)
//
// HX-2016-07-17: Extension
//
(* ****** ****** *)

implement
{}(*tmp*)
streamize_DIRptr_dirent
  (dirp) = auxmain(dirp) where
{
//
fun
auxmain
(
  dirp: DIRptr1
) : stream_vt(dirent) = $ldelay
(
let
//
val x0_con =
  stream_vt_cons{dirent}(_, _)
//
val+stream_vt_cons(ent, xs) = x0_con
//
var res: ptr
val err = readdir_r (dirp, ent, res)
//
in
//
if
res > 0
then let
  prval() = opt_unsome(ent)
in
  xs := auxmain(dirp); fold@(x0_con); x0_con
end // end of [then]
else let
  prval() = opt_unnone(ent)
in
  free@(x0_con);
  closedir_exn(dirp); stream_vt_nil((*void*))
end // end of [else]
//
end : stream_vt_con(dirent) // end of [let]
//
,
//
let val () = closedir_exn(dirp) in (*closing*) end
//
) (* end of [auxmain] *)
//
} (* end of [streamize_DIRptr_dirent] *)

(* ****** ****** *)

(* end of [dirent.dats] *)

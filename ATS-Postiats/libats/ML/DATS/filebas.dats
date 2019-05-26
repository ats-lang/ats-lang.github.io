(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2013 Hongwei Xi, ATS Trustful Software, Inc.
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
(* Start time: January, 2013 *)
(* Authoremail: gmhwxiATgmailDOTcom *)

(* ****** ****** *)
//
#define
ATS_DYNLOADFLAG 0
//
// no dynloading at run-time
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload
_(*anon*) = "prelude/DATS/integer.dats"
staload
_(*anon*) = "prelude/DATS/integer_size.dats"

(* ****** ****** *)

staload
_(*anon*) = "prelude/DATS/filebas.dats"

(* ****** ****** *)
//
macdef
prelude_fileref_get_line_charlst =
  fileref_get_line_charlst
//
macdef
prelude_fileref_get_lines_charlstlst =
  fileref_get_lines_charlstlst
//
(* ****** ****** *)

macdef
prelude_fileref_get_line_string = fileref_get_line_string
macdef
prelude_fileref_get_lines_stringlst = fileref_get_lines_stringlst

(* ****** ****** *)
//
macdef
prelude_streamize_fileref_char = streamize_fileref_char
macdef
prelude_streamize_fileptr_char = streamize_fileptr_char
//
macdef
prelude_streamize_fileref_line = streamize_fileref_line
macdef
prelude_streamize_fileptr_line = streamize_fileptr_line
//
(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/SATS/option0.sats"

(* ****** ****** *)

staload "libats/ML/SATS/filebas.sats"

(* ****** ****** *)

(*
implement
fileref_open_opt
  (path, mode) = let
//
val
opt =
prelude_fileref_open_opt
  (path, mode)
//
in
  option0_of_option_vt{FILEref}(opt)
end // end of [fileref_open_opt]
*)

(* ****** ****** *)

implement
fileref_get_line_charlst
  (filr) =
(
list0_of_list_vt
  (prelude_fileref_get_line_charlst(filr))
) // end of [fileref_get_line_charlst]

implement
fileref_get_lines_charlstlst
  (filr) =
(
$UN.castvwtp0{list0(charlst0)}
  (prelude_fileref_get_lines_charlstlst(filr))
) // end of [fileref_get_lines_charlstlst]

(* ****** ****** *)

local
//
staload
_(*anon*) = "prelude/DATS/strptr.dats"
//
in (* in of [local] *)

implement
fileref_get_line_string
  (filr) =
(
strptr2string
  (prelude_fileref_get_line_string(filr))
) // end of [fileref_get_line_string]

implement
fileref_get_lines_stringlst
  (filr) =
(
$UN.castvwtp0{list0(string)}
  (prelude_fileref_get_lines_stringlst(filr))
) // end of [fileref_get_lines_stringlst]

end // end of [local]

(* ****** ****** *)

implement
{}(*tmp*)
filename_get_lines_stringlst_opt
  (path) = let
//
val opt =
  fileref_open_opt(path, file_mode_r)
//
in
//
case+ opt of
| ~None_vt() =>
   None_vt()
| ~Some_vt(inp) =>
   Some_vt(lines) where
 {
    val lines =
      fileref_get_lines_stringlst(inp)
    // end of [val]
    val ((*void*)) = fileref_close(inp)
 } (* end of [Some_vt] *) 
//
end // end of [filename_get_lines_stringlst_opt]

(* ****** ****** *)
//
implement
{}(*tmp*)
streamize_fileref_char
  (filr) =
  prelude_streamize_fileref_char(filr)
implement
{}(*tmp*)
streamize_fileptr_char
  (filp) =
  prelude_streamize_fileptr_char(filp)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
streamize_fileref_line
  (filr) =
(
$UN.castvwtp0{stream_vt(string)}
  (prelude_streamize_fileref_line(filr))
) // end of [streamize_fileref_line]
implement
{}(*tmp*)
streamize_fileptr_line
  (filp) =
(
$UN.castvwtp0{stream_vt(string)}
  (prelude_streamize_fileptr_line(filp))
) // end of [streamize_fileptr_line]
//
(* ****** ****** *)

implement
{}(*tmp*)
streamize_fileref_word
  (filr) =
  auxmain(filr) where
{
//
fun
auxmain
(
  filr: FILEref
) :
stream_vt(string) =
$ldelay (
//
let
//
  val
  word =
  fileref_get_word<>(filr)
  val test = strptr_is_null(word)
//
  prval () = lemma_strptr_param(word)
//
in
  if test
    then let
    prval () =
      strptr_free_null(word) in stream_vt_nil()
    // end of [prval]
    end // end of [then]
    else stream_vt_cons(strptr2string(word), auxmain(filr))
  // end of [if]
end // end of [let]
//
) (* end of [auxmain] *)
//
} (* end of [streamize_fileref_word] *)

(* ****** ****** *)

implement
{}(*tmp*)
streamize_fileptr_word
  (filp) = let
//
fun
auxmain
(
  filr: FILEref
) :
stream_vt(string) =
$ldelay (
//
let
//
  val
  word =
  fileref_get_word<>(filr)
  val test = strptr_is_null(word)
//
  prval () = lemma_strptr_param(word)
//
in
  if test
    then stream_vt_nil() where
    {
      val () = fileref_close(filr)
      prval () = strptr_free_null(word)
    } (* end of [then] *)
    else stream_vt_cons(strptr2string(word), auxmain(filr))
  // end of [if]
end // end of [let]
//
) (* end of [auxmain] *)
//
in
  auxmain($UN.castvwtp0{FILEref}(filp))
end (* end of [streamize_fileptr_word] *)

(* ****** ****** *)

implement
{}(*tmp*)
streamize_filename_char
  (fname) = let
//
val
opt =
fileref_open_opt(fname, file_mode_r)
//
in
//
case+ opt of
| ~None_vt() =>
   None_vt()
| ~Some_vt(filr) =>
   Some_vt(streamize_fileptr_char($UN.castvwtp0{FILEptr1}(filr)))
//
end // end of [streamize_filename_char]

(* ****** ****** *)

implement
{}(*tmp*)
streamize_filename_line
  (fname) = let
//
val
opt =
fileref_open_opt(fname, file_mode_r)
//
in
//
case+ opt of
| ~None_vt() =>
   None_vt()
| ~Some_vt(filr) =>
   Some_vt(streamize_fileptr_line($UN.castvwtp0{FILEptr1}(filr)))
//
end // end of [streamize_filename_line]

(* ****** ****** *)

implement
{}(*tmp*)
streamize_filename_word
  (fname) = let
//
val
opt =
fileref_open_opt(fname, file_mode_r)
//
in
//
case+ opt of
| ~None_vt() =>
   None_vt()
| ~Some_vt(filr) =>
   Some_vt(streamize_fileptr_word($UN.castvwtp0{FILEptr1}(filr)))
//
end // end of [streamize_filename_word]

(* ****** ****** *)

(* end of [filebas.dats] *)

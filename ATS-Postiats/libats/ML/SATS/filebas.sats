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
(* Authoremail: gmhwxiATgmailDOTcom *)
(* Start time: January, 2013 *)

(* ****** ****** *)

#define ATS_PACKNAME "ATSLIB.libats.ML"
#define ATS_EXTERN_PREFIX "atslib_ML_" // prefix for external names

(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"

(* ****** ****** *)

typedef SHR(a:type) = a // for commenting purpose
typedef NSH(a:type) = a // for commenting purpose

(* ****** ****** *)

typedef charlst0 = list0 (char)
typedef stringlst0 = list0 (string)

(* ****** ****** *)

(*
fun fileref_open_opt
  (path: NSH(string), fm: file_mode): option0 (FILEref)
// end of [fileref_open_opt]
*)

(* ****** ****** *)
//
fun
fileref_get_line_charlst(filr: FILEref): charlst0
//
(*
** HX: for handling files of "tiny" size
*)
fun
fileref_get_lines_charlstlst(filr: FILEref): list0(charlst0)
//
(* ****** ****** *)
//
fun
fileref_get_line_string(filr: FILEref): string
//
(*
** HX: for handling files of "tiny" size
*)
fun
fileref_get_lines_stringlst(filr: FILEref): stringlst0
//
fun{}
filename_get_lines_stringlst_opt(path: string): Option_vt(stringlst0)
//
(* ****** ****** *)
//
fun{}
streamize_fileref_char
  (inp: FILEref): stream_vt(char)
fun{}
streamize_fileptr_char
  (inp: FILEptr1): stream_vt(char)
//
(* ****** ****** *)
//
fun{}
streamize_fileref_line
  (inp: FILEref): stream_vt(string)
fun{}
streamize_fileptr_line
  (inp: FILEptr1): stream_vt(string)
//
(* ****** ****** *)
//
(*
//
// HX: this one is in prelude/filebas
//
fun{}
fileref_get_word$isalpha(c0: charNZ): bool
*)
fun{}
streamize_fileref_word
  (inp: FILEref): stream_vt(string)
fun{}
streamize_fileptr_word
  (inp: FILEptr1): stream_vt(string)
//
(* ****** ****** *)
//
fun{}
streamize_filename_char
  (fname: string): streamopt_vt(char)
fun{}
streamize_filename_line
  (fname: string): streamopt_vt(string)
fun{}
streamize_filename_word
  (fname: string): streamopt_vt(string)
//
(* ****** ****** *)
//
fun
dirname_get_fnamelst(dirname: string): list0(string)
//
(* ****** ****** *)
//
fun{}
streamize_dirname_fname(dirname: string): stream_vt(string)
//
(* ****** ****** *)

(* end of [filebas.sats] *)

(* ****** ****** *)
(*
** For writing ATS code
** that translates into Perl
*)
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-11:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2plpre_"
#define
ATS_STATIC_PREFIX "_ats2plpre_list_"
//
(* ****** ****** *)
//
#define
LIBATSCC_targetloc
"$PATSHOME\
/contrib/libatscc/ATS2-0.3.2"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./../SATS/integer.sats"
//
(* ****** ****** *)
//
staload "./../SATS/print.sats"
staload "./../SATS/filebas.sats"
//
(* ****** ****** *)
//
staload "./../SATS/list.sats"
//
staload "./../SATS/stream_vt.sats"
staload _ = "./../DATS/stream.dats"
//
staload "./../SATS/stream_vt.sats"
staload _ = "./../DATS/stream_vt.dats"
//
(* ****** ****** *)
//
#define ATSCC_STREAM 1
#define ATSCC_STREAM_VT 1
//
(* ****** ****** *)
//
#include "{$LIBATSCC}/DATS/list.dats"
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
print_list (xs) = fprint_list<a> (STDOUT, xs)
implement
{a}(*tmp*)
print_list_sep
  (xs, sep) = fprint_list_sep<a> (STDOUT, xs, sep)
//
(* ****** ****** *)

%{$
######
1; #note that it is needed by 'use' or 'require'
######
%} // end of [%{$]

(* ****** ****** *)

(* end of [list.dats] *)

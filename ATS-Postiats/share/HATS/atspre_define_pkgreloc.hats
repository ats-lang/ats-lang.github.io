(*
** For package reloc
*)
(* ****** ****** *)
//
// HX-2014-08:
// PATSHOME is pre-defined
// PATSCONTRIB is pre-defined
//
#define
PATSHOME_targetloc "$PATSHOME"
#define
PATSCONTRIB_targetloc "$PATSCONTRIB"
//
// HX-2016-01-05:
// PATSHOMERELOCS is *SPECIALLY* treated!
//
#define
PATSHOMERELOCS_targetloc "$PATSHOMERELOCS"
//
(* ****** ****** *)
//
#define
PATSPRE_targetloc "$PATSHOME/prelude"
#define
PATSLIBATS_targetloc "$PATSHOME/libats"
#define
PATSLIBATSML_targetloc "$PATSHOME/libats/ML"
#define
PATSLIBATSLIBC_targetloc "$PATSHOME/libats/libc"
//
(* ****** ****** *)
//
(*
#define
ATSLANGWEB "http://www.ats-lang.org"
#define
ATSLANGORG "http://www.ats-lang.org"
#define
ATSLANGCOM "http://www.ats-lang.com"
*)
//
(* ****** ****** *)
//
#define
LIBGMP_targetloc
"$PATSHOME/contrib/atscntrb/atscntrb-hx-libgmp"
//
(* ****** ****** *)
(*
//
#define
LIBPCRE_targetloc
"$PATSHOME/contrib/atscntrb/atscntrb-hx-libpcre"
//
#define
LIBCURL_targetloc
"$PATSHOME/contrib/atscntrb/atscntrb-hx-libcurl"
//
#define
LIBJSONC_targetloc
"$PATSHOME/contrib/atscntrb/atscntrb-hx-libjson-c"
#define
LIBJSON_C_targetloc
"$PATSHOME/contrib/atscntrb/atscntrb-hx-libjson-c"
//
*)
(* ****** ****** *)
(*
//
#define
HX_INTINF_targetloc
"$PATSHOME/contrib/atscntrb/atscntrb-hx-intinf"
//
#define
HX_CSTREAM_targetloc
"$PATSHOME/contrib/atscntrb/atscntrb-hx-cstream"
//
#define
HX_GLOBALS_targetloc
"$PATSHOME/contrib/atscntrb/atscntrb-hx-globals"
//
#define
HX_MYTESTING_targetloc
"$PATSHOME/contrib/atscntrb/atscntrb-hx-mytesting"
//
*)
(* ****** ****** *)
//
(*
#define
LIBATSCC_targetloc
"$PATSHOME/contrib/libatscc"
//
(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME/contrib/libatscc2js"
*)
//
(* ****** ****** *)
(*
//
#define
LIBATSCC2JS_targetloc
"$PATSCONTRIB/contrib/libatscc2js/ATS2-0.3.2"
//
#define
LIBATSCC2PL_targetloc
"$PATSCONTRIB/contrib/libatscc2pl/ATS2-0.3.2"
//
#define
LIBATSCC2PY3_targetloc
"$PATSCONTRIB/contrib/libatscc2py3/ATS2-0.3.2"
//
#define
LIBATSCC2PHP_targetloc
"$PATSCONTRIB/contrib/libatscc2php/ATS2-0.3.2"
//
#define
LIBATSCC2ERL_targetloc
"$PATSCONTRIB/contrib/libatscc2erl/ATS2-0.3.2"
//
#define
LIBATSCC2SCM_targetloc
"$PATSCONTRIB/contrib/libatscc2scm/ATS2-0.3.2"
#define
LIBATSCC2CLJ_targetloc
"$PATSCONTRIB/contrib/libatscc2clj/ATS2-0.3.2"
//
*)
(* ****** ****** *)
(*
//
// HX-2014-05-12:
// This is for backward compatibility
//
#define
LIBATSHWXI_targetloc "$PATSCONTRIB/contrib/libats-/hwxi"
#define
LIBATS_HWXI_targetloc "$PATSCONTRIB/contrib/libats-/hwxi"
//
*)
(* ****** ****** *)
//
// For applying ATS to Linux kernel programming
//
#define LINUX_targetloc "$PATSCONTRIB/contrib/linux"
//
(* ****** ****** *)
//
// For exporting constraints for solving externally
//
#define EXTSOLVE_targetloc "$PATSCONTRIB/contrib/extsolve"
//
(* ****** ****** *)
//
#define LIBATSEXT_LIBC_targetloc "$PATSCONTRIB/libatsext/libc"
//
(* ****** ****** *)

(* end of [atspre_define_pkgreloc.hats] *)

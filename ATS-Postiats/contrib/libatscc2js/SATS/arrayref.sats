(*
** For writing ATS code
** that translates into JavaScript
*)

(* ****** ****** *)
//
// HX-2014-10:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2jspre_"
//
(* ****** ****** *)
//
#define
LIBATSCC_targetloc
"$PATSHOME/contrib/libatscc"
//
#staload "./../basics_js.sats"
//
#include "{$LIBATSCC}/SATS/arrayref.sats"
//
(* ****** ****** *)
//
fun
arrayref_uninitized
{a:vt0p}{n:nat}
  (asz: int(n)): arrayref(a?, n) = "mac#%"
//
(* ****** ****** *)

(* end of [arrayref.sats] *)

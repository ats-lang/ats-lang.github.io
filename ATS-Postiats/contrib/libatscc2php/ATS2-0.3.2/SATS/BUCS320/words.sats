(*
** For writing ATS code
** that translates into PHP
*)

(* ****** ****** *)
//
// HX-2016-11:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX
"ats2phppre_BUCS320_"
//
(* ****** ****** *)
//
#define
LIBATSCC_targetloc
"$PATSHOME\
/contrib/libatscc/ATS2-0.3.2"
//
(* ****** ****** *)

staload "./../../basics_php.sats"

(* ****** ****** *)
//
#include "{$LIBATSCC}/SATS/BUCS320/words.sats"
//
(* ****** ****** *)

(* end of [words.sats] *)

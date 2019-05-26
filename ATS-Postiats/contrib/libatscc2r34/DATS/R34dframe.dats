(* ****** ****** *)
(*
** For writing ATS code
** that translates into R(stat)
*)
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2r34pre_"
#define
ATS_STATIC_PREFIX "_ats2r34pre_R34dframe_"
//
(* ****** ****** *)
//
#define
LIBATSCC_targetloc
"$PATSHOME/contrib/libatscc"
//
(* ****** ****** *)
//
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../basics_r34.sats"
//
#staload "./../SATS/integer.sats"
//
#staload "./../SATS/R34vector.sats"
#staload "./../SATS/R34dframe.sats"
//
(* ****** ****** *)

implement
R34dfram_dimgt
  (df, i, j) =
(
$UN.cast(nrow(df) > i andalso ncol(df) > j)
) (* end of [R34dfram_dimgt] *)

implement
R34dfram_dimgte
  (df, i, j) =
(
$UN.cast(nrow(df) >= i andalso ncol(df) >= j)
) (* end of [R34dfram_dimgte] *)

(* ****** ****** *)

(* end of [R34dframe.dats] *)

(*
** For processing English words
*)

(* ****** ****** *)
//
#define
ATS_PACKNAME "BUCS320.words"
#define
ATS_EXTERN_PREFIX "ats2jspre_BUCS320_"
//
(* ****** ****** *)
//
fun
theWords_size(): intGte(0) = "mac#%"
//
(* ****** ****** *)
//
fun
theWords_get_at
  (intGte(0)): Option_vt(string) = "mac#%"
//
(* ****** ****** *)
//
fun
theWords_streamize
  ((*void*)): stream_vt(string) = "mac#%"
//
(* ****** ****** *)
//
fun
theWords_foreach_cloref
  ((string) -<cloref1> void): void = "mac#%"
//
(* ****** ****** *)

(* end of [words.sats] *)

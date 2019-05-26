(* ****** ****** *)
(*
** Testing code for [json]
*)
(* ****** ****** *)

(*
** Author: Hongwei Xi
** Start Time: May, 2013
** Authoremail: gmhwxiATgmailDOTedu
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "./../SATS/printbuf.sats"

(* ****** ****** *)

implement
main0 () =
{
//
val pb =
printbuf_new()
val () =
assertloc(ptrcast(pb) > 0)
//
val cnt =
$extfcall
( int
, "sprintbuf"
, ptrcast(pb)
, "Hello from [sprintbuf]!"
)(*$extfcall*)
//
val () =
println!
("cnt = ", cnt)
val
(fpf | buf) =
printbuf_get_buf(pb)
val () =
println!("buf = ", buf)
prval
((*returned*)) = fpf(buf)
val ((*freed*)) = printbuf_free(pb)
//
} // end of [main0]

(* ****** ****** *)

(* end of [test03.dats] *)

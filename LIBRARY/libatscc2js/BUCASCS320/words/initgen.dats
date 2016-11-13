(* ****** ****** *)
//
// HX-2016-11-12:
// For generating
// code for dictionary initialization
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
implement
main0() = () where
{
//
val
opt =
fileref_open_opt
(
  "/usr/share/dict/words", file_mode_r
)
//
val-~Some_vt(filr) = opt
//
val lines = streamize_fileref_line(filr)
//
val lines =
  $UNSAFE.castvwtp0{stream_vt(string)}(lines)
val lines =
  (lines).filter()(lam x => ~string_is_suffix(x, "'s"))
//
(*
val ((*void*)) = println! ("nline = ", length(lines))
*)
//
val () = lines.foreach()(lam x => println! ("val () = myins(\"", x, "\")"))
//
} (* end of [main0] *)
//
(* ****** ****** *)

(* end of [initgen.dats] *)
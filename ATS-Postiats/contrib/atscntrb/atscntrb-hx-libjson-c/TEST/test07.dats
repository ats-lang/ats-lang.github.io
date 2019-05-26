(* ****** ****** *)
(*
** Testing code for [json_ML]
*)
(* ****** ****** *)

(*
** Author: Hongwei Xi
** Start Time: July, 2013
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

staload "./../SATS/json.sats"
staload "./../SATS/json_ML.sats"

(* ****** ****** *)

staload _(*anon*) = "./../DATS/json.dats"
staload _(*anon*) = "./../DATS/json_ML.dats"

(* ****** ****** *)

fun
json_object2val0_list
(
xs:
List_vt(json_object0)
) : List0_vt(jsonval) = let
in
//
case+ xs of
| ~list_vt_cons
    (x, xs) => let
    val v =
      json_object2val0(x)
    val vs =
      json_object2val0_list(xs)
  in
    list_vt_cons{jsonval}(v, vs)
  end // end of [list_vt_cons]
| ~list_vt_nil() => list_vt_nil()
//
end // end of [json_object2val0_list]

(* ****** ****** *)

val () =
{
//
val x = jsonval_ofstring "1"
val () = fprintln! (stdout_ref, "x = ", x)
//
val x = jsonval_ofstring "1.0"
val () = fprintln! (stdout_ref, "x = ", x)
//
val x = jsonval_ofstring "'foo'"
val () = fprintln! (stdout_ref, "x = ", x)
//
val x = jsonval_ofstring "[1, 2, 3]"
val () = fprintln! (stdout_ref, "x = ", x)
//
val x = jsonval_ofstring "{'a':1, 'b':2, 'c':3}"
val () = fprintln! (stdout_ref, "x = ", x)
//
} (* end of [val] *)

(* ****** ****** *)

val () =
{
//
val out = stdout_ref
//
val xs =
json_tokener_parse_list ("\
{'relation':'self', 'name':'Hongwei'}\n\
{'relation':'wife', 'name':'Jinning'}\n\
{'relation':'daughter', 'name':'Zoe'}\n\
{'relation':'daughter', 'name':'Chloe'}\n\
")
//
val vs = json_object2val0_list (xs)
//
val () =
fprint_list_vt_sep<jsonval>(out, vs, "\n")
val () = list_vt_free(vs)
val () = fprint_newline(out)
//
} // end of [val]

(* ****** ****** *)

implement main0((*void*)) = ()

(* ****** ****** *)

(* end of [test07.dats] *)

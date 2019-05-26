(*
** For writing ATS code
** that translates into JavaScript
*)

(* ****** ****** *)
//
// HX-2014-09-09
//
(* ****** ****** *)
//
#staload "./basics_js.sats"
#staload _ = "./DATS/basics.dats"
//
(* ****** ****** *)
//
#staload "./SATS/integer.sats"
//
(* ****** ****** *)
//
#staload "./SATS/bool.sats"
#staload "./SATS/char.sats"
#staload "./SATS/float.sats"
#staload "./SATS/string.sats"
//
#staload "./SATS/gvalue.sats"
//
(* ****** ****** *)
//
#staload "./SATS/gprint.sats"
#staload _ = "./DATS/gprint.dats"
//
(* ****** ****** *)
//
#staload "./SATS/list.sats"
#staload "./SATS/list_vt.sats"
//
#staload
_(*anon*) = "./DATS/list.dats"
#staload
_(*anon*) = "./DATS/list_vt.dats"
//
(* ****** ****** *)
//
#staload "./SATS/option.sats"
#staload _ = "./DATS/option.dats"
//
(* ****** ****** *)
//
#staload "./SATS/stream.sats"
#staload "./SATS/stream_vt.sats"
//
#staload
_(*anon*) = "./DATS/stream.dats"
#staload
_(*anon*) = "./DATS/stream_vt.dats"
//
(* ****** ****** *)
//
#staload "./SATS/JSarray.sats"
//
(* ****** ****** *)
//
#staload "./SATS/intrange.sats"
#staload "./SATS/arrayref.sats"
#staload "./SATS/matrixref.sats"
#staload "./SATS/reference.sats"
//
(* ****** ****** *)
//
// HX-2017-11-26
//
#staload // for xmldocs
"./SATS/xmldoc.sats" // used by Ajax
//
(* ****** ****** *)
//
#staload
"./SATS/JSLIBC/JSmisc.sats" // JS library
//
#staload
"./SATS/JSLIBC/JSmath.sats" // JS library
#staload
_(*anon*) =
"./DATS/JSLIBC/JSmath.dats" // JS library
//
#staload
"./SATS/JSLIBC/JSdate.sats" // JS library
//
(* ****** ****** *)
//
#staload "./SATS/slistref.sats" // list-based stack
#staload "./SATS/qlistref.sats" // list-based queue
//
(* ****** ****** *)
//
#staload
"./SATS/ML/list0.sats" // un-indexed list
#staload
_(*anon*) = "./DATS/ML/list0.dats" // un-indexed list
//
#staload
"./SATS/ML/array0.sats" // un-indexed array
#staload
_(*anon*) = "./DATS/ML/array0.dats" // un-indexed array
//
(* ****** ****** *)

(* end of [mylibies.hats] *)

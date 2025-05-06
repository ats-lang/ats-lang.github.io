(*
** For ATS2TUTORIAL
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

local
//
typedef elt = int
//
staload
FS = "libats/ML/SATS/funset.sats"
implement
$FS.compare_elt_elt<elt>(x, y) = compare(x, y)
//
in (* in-of-local *)

#include "libats/ML/HATS/myfunset.hats"

end // end of [local]

(* ****** ****** *)
//
val myset = myfunset_nil()
//
(* ****** ****** *)
//
var myset = myset
//
val-false = myset.insert(0)
val-(true) = myset.insert(0)
val-false = myset.insert(1)
val-(true) = myset.insert(1)
//  
(* ****** ****** *)
//
val-true = myset.remove(0)
val-false = myset.remove(0)
val-true = myset.remove(1)
val-false = myset.remove(1)
//
(* ****** ****** *)
//
val-false = myset.insert(0)
val-(true) = myset.insert(0)
val-false = myset.insert(1)
val-(true) = myset.insert(1)
val-false = myset.insert(2)
val-(true) = myset.insert(2)
//
val () =
fprintln!(stdout_ref, "myset = ", myset)
//
(* ****** ****** *)
//
val
myset1 =
myfunset_make_list($list{int}(0, 1, 1, 2, 2, 2))
//
val () = fprintln!(stdout_ref, "myset1 = ", myset1)
val () = fprintln!(stdout_ref, "myset1.size = ", myset1.size())
//
val
myset2 =
myfunset_make_list($list{int}(0, 1, 2, 3, 4, 5))
//
val () = fprintln!(stdout_ref, "myset2 = ", myset2)
val () = fprintln!(stdout_ref, "myset2.size = ", myset2.size())
//
(* ****** ****** *)

val () = assertloc(myset = myset1)
val () = assertloc(myset1.is_subset(myset2))
val () = assertloc(myset2.is_supset(myset1))

(* ****** ****** *)

val MYSET = myfunset_make_module()

(* ****** ****** *)
//
var myset = (MYSET.nil)()
//
val-false = (MYSET.insert)(myset, 0) // inserted
val-false = (MYSET.insert)(myset, 1) // inserted
//
val ((*void*)) = assertloc((MYSET.size)(myset) = 2)
//
val-(true) = (MYSET.remove)(myset, 0) // removed
//
val ((*void*)) = assertloc((MYSET.size)(myset) = 1)
//
val-(true) = (MYSET.remove)(myset, 1) // removed
//
val ((*void*)) = assertloc((MYSET.size)(myset) = 0)
//
(* ****** ****** *)

implement main0 ((*void*)) = {(*void*)}

(* ****** ****** *)

(* end of [chap_funsetmap_set.dats] *)

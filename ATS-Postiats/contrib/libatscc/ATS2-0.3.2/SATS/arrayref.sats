(*
** libatscc-common
*)

(* ****** ****** *)

(*
staload "./../basics.sats"
*)

(* ****** ****** *)
//
fun
arrayref_make_elt
  {a:t0p}{n:nat}
  (int(n), a): arrayref(a, n) = "mac#%"
//
(* ****** ****** *)
//
fun
arrayref_get_at
  {a:t0p}{n:int}
  (arrayref(a, n), natLt(n)): a = "mac#%"
//
fun
arrayref_set_at
  {a:t0p}{n:int}
  (arrayref(a, n), natLt(n), a): void = "mac#%"
//
fun
arrayref_exch_at
  {a:vt0p}{n:int}
  (arrayref(a, n), natLt(n), x0: a): (a) = "mac#%"
//
(* ****** ****** *)

overload [] with arrayref_get_at of 100
overload [] with arrayref_set_at of 100

(* ****** ****** *)
//
fun
arrayref_exists_cloref
  {a:vt0p}{n:int}
( A0: arrayref(a, n)
, asz: int(n), ftest: natLt(n) -<cloref1> bool
) : bool = "mac#%" // end-of-fun
//
fun
arrayref_forall_cloref
  {a:vt0p}{n:int}
( A0: arrayref(a, n)
, asz: int(n), ftest: natLt(n) -<cloref1> bool
) : bool = "mac#%" // end-of-fun
//
(* ****** ****** *)

fun
arrayref_foreach_cloref
  {a:vt0p}{n:int}
( A0: arrayref(a, n)
, asz: int(n), fwork: natLt(n) -<cloref1> void
) : void = "mac#%" // end-of-fun

(* ****** ****** *)
//
fun
arrayref_tabulate_cloref
  {a:vt0p}{n:int}
(
  asz: int(n), fopr: (natLt(n)) -<cloref1> (a)
) : arrayref(a, n) = "mac#%" // end-of-fun
//
(* ****** ****** *)
//
// HX: array-with-size
//
(* ****** ****** *)
//
fun
arrszref_size
  {a:vt0p}
  (A: arrszref(a)): intGte(0) = "mac#%"
fun
arrszref_get_size
  {a:vt0p}
  (A: arrszref(a)): intGte(0) = "mac#%"
//
overload size with arrszref_size
overload .size with arrszref_get_size
//
(* ****** ****** *)
//
fun
arrszref_make_elt
  {a:t0p}{n:nat}
  (int(n), a): arrszref(a) = "mac#%"
//
(* ****** ****** *)
//
fun
arrszref_get_arrayref
  {a:t0p}
  (arrszref(a)): [n:nat] arrayref(a,n) = "mac#%"
//
fun
arrszref_make_arrayref
  {a:t0p}{n:int}
  (arrayref(a, n), int(n)): arrszref(a) = "mac#%"
// end of [arrszref_make_arrayref]
//
(* ****** ****** *)
//
fun
arrszref_get_at
  {a:t0p}(A: arrszref(a), i: int): a = "mac#%"
//
fun
arrszref_set_at
  {a:t0p}(A: arrszref(a), i: int, x0: a): void = "mac#%"
//
fun
arrszref_exch_at
  {a:vt0p}(A: arrszref(a), i: int, x0: a): (a) = "mac#%"
//
(* ****** ****** *)

overload [] with arrszref_get_at of 100
overload [] with arrszref_set_at of 100

(* ****** ****** *)
//
fun
arrszref_exists_cloref
  {a:vt0p}
( A0: arrszref(a)
, pred: intGte(0) -<cloref1> bool
) : bool = "mac#%" // arrszref_exists_cloref
fun
arrszref_exists_method
  {a:vt0p}
(
  A0: arrszref(a)
)
(
  pred: intGte(0) -<cloref1> bool
) : bool = "mac#%" // arrszref_exists_method
//
overload
.exists with arrszref_exists_method of 100
//
(* ****** ****** *)
//
fun
arrszref_forall_cloref
  {a:vt0p}
( A0: arrszref(a)
, pred: intGte(0) -<cloref1> bool
) : bool = "mac#%" // arrszref_forall_cloref
fun
arrszref_forall_method
  {a:vt0p}
(
  A0: arrszref(a)
)
(
  pred: intGte(0) -<cloref1> bool
) : bool = "mac#%" // arrszref_forall_method
//
overload
.forall with arrszref_forall_method of 100
//
(* ****** ****** *)
//
fun
arrszref_foreach_cloref
  {a:vt0p}
( A0: arrszref(a)
, fwork: intGte(0) -<cloref1> void
) : void = "mac#%" // arrszref_foreach_cloref
//
fun
arrszref_foreach_method
  {a:vt0p}
(
  A: arrszref(a)
)
(
  fwork: intGte(0) -<cloref1> void
) : void = "mac#%" // arrszref_foreach_method
//
overload
.foreach with arrszref_foreach_method of 100
//
(* ****** ****** *)
//
fun
arrszref_tabulate_cloref
  {a:vt0p}{n:int}
( asz: int(n)
, fopr: (natLt(n)) -<cloref1> (a)): arrszref(a) = "mac#%"
//
(* ****** ****** *)

(* end of [arrayref.sats] *)

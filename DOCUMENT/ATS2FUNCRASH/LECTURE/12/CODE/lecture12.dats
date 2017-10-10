(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

#define :: list0_cons

(* ****** ****** *)

#include "./../../MYLIB/mylib.dats"

(* ****** ****** *)

implement
fprint_val<int> = fprint_int
implement
fprint_val<bool> = fprint_bool
implement
fprint_val<string> = fprint_string

(* ****** ****** *)
//
typedef
cont0() = cfun(void)
typedef
cont1(inp:t@ype) = cfun(inp, void)
//
(* ****** ****** *)

extern
fun do_async1(): void
extern
fun do_async2(): void

(* ****** ****** *)

(*
fun
do_async12(): void =
{
//
val () = do_async1(); val () = do_async2()
//
} (* end of [do_async_12] *)
*)

(* ****** ****** *)
//
extern
fun
do_async1_cont(k: cont0()): void
//
(* ****** ****** *)

(*
fun
do_async12(): void =
do_async1_cont(lam() => do_async2())
*)

(* ****** ****** *)
//
extern
fun
do_async2_cont(k: cont0()): void
//
(* ****** ****** *)

(*
fun
do_async12_cont(k): void =
do_async1_cont(lam() => do_async2_cont(k))
*)

(* ****** ****** *)
//
fun
fact
(
n : int
) : int =
if n > 0 then n * fact(n-1) else 1
//
(* ****** ****** *)
//
fun
k_fact
(
n : int
,
k : cont1(int)
) : void =
(
if
(n > 0)
then k_fact(n-1, lam(res) => k(n*res))
else k(1)
// end of [if]
) (* end of [k_fact] *)
//
(* ****** ****** *)
//
fun
fibo
(
n : int
) : int =
if n >= 2 then fibo(n-1)+fibo(n-2) else n
//
(* ****** ****** *)
//
fun
k_fibo
(
n : int
,
k : cont1(int)
) : void =
(
if
(n >= 2)
then
k_fibo
( n-1
, lam(r1) => k_fibo(n-2, lam(r2) => k(r1+r2))
) (* end of [then] *)
else k(n) // end of [else]
// end of [if]
) (* end of [[k_fibo] *)
//
(* ****** ****** *)
//
fun
fact2
(
n : int, res: int
) : int =
if n > 0 then fact2(n-1, n*res) else res
//
(* ****** ****** *)
//
fun
k_fact2
(n: int, res: int, k: cont1(int)): void  =
if n > 0 then k_fact2(n-1, n*res, k) else k(res)
//
(* ****** ****** *)
//
val () =
k_fact(10, lam(res) => println! ("fact(10) = ", res))
//
val () =
k_fibo(20, lam(res) => println! ("fibo(20) = ", res))
//
(* ****** ****** *)

implement main0() = () // a dummy for [main]

(* ****** ****** *)

(* end of [lecture12.dats] *)

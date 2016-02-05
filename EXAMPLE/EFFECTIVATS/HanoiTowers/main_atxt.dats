(*
main.atxt: 1(line=1, offs=1) -- 42(line=3, offs=3)
*)

#include "./../ATEXT/atextfun.hats"

(*
main.atxt: 188(line=13, offs=2) -- 204(line=13, offs=18)
*)
val __tok1 = patscode_style()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
main.atxt: 306(line=23, offs=2) -- 713(line=31, offs=3)
*)
val __tok2 = para("\
Types are an extremely powerful notion in programming
as what is behind types is logic itself. However, making
effective use of types in programming is a very difficult
task for many programmers (ranging from novices to experts).
In this article, I will present several solutions to a simple problem,
gradually illustrating certain typical uses of dependent types
and linear types in programming.
")
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
main.atxt: 826(line=39, offs=2) -- 1317(line=49, offs=3)
*)
val __tok3 = para("\

Given three poles: Pole 1, Pole 2 and Pole 3, there are 64 disks of
distinct sizes stacked on Pole 1 such that no disk is stacked on one
of a lesser size, and both Pole 2 and Pole 3 are empty.  The player is
asked to the task of moving all the disks from Pole 1 to Pole 2 (while
using Pole 3 as a spare): Only one disk can be moved from one pole to
another one each time and no disk is ever allowed to be stacked on
another one of less size during the entire process of moving.\

")
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
main.atxt: 1320(line=51, offs=2) -- 1439(line=54, offs=3)
*)
val __tok4 = para("\
It will soon be clear that 2<sup>64</sup>-1 moves are needed in order to
accomplish the aforementioned task.
")
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
main.atxt: 1599(line=63, offs=38) -- 1614(line=63, offs=53)
*)
val __tok6 = stacode("pole")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
main.atxt: 1688(line=68, offs=2) -- 1800(line=74, offs=3)
*)
val __tok7 = pats2xhtml_dats("\
datatype
pole = Pole of
(
  string(*name*), ref(list0(int))(*disks*)
) (* end of [Pole] *)
")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
main.atxt: 1485(line=60, offs=2) -- 2121(line=82, offs=3)
*)
val __tok5 = para("\

First, let us see a straightforward solution of imperative style to
the Hanoi Towers puzzle. A datatype #__tok6$ is declared as
follows for representing poles:

<pre
class=\"patsyntax\">
#__tok7$</pre>

Note that the disks stacked on a pole is represented as a list of
integers. As a disk may be moved from one pole to another one, a
reference to a list of integers is contained in the representation of
a pole so that the content of the reference can be updated to reflect
the actual disks stacked on the pole.\

")
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
main.atxt: 2170(line=87, offs=2) -- 2187(line=87, offs=19)
*)
val __tok9 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
main.atxt: 2276(line=92, offs=2) -- 2608(line=112, offs=3)
*)
val __tok10 = pats2xhtml_dats("\
//
extern
fun
move_1(P1: pole, P2: pole): void
//
implement
move_1(P1, P2) = let
//
val Pole(n1, r1) = P1
val-cons0(x, xs) = !r1
val ((*void*)) = !r1 := xs
//
val Pole(n2, r2) = P2
val ((*void*)) = !r2 := cons0(x, !r2)
//
in
  println! (\"Move [\", x, \"] from [\", n1, \"] to [\", n2, \"]\")
end // end of [move_1]
//
")
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
main.atxt: 2630(line=114, offs=15) -- 2647(line=114, offs=32)
*)
val __tok11 = dyncode("move_n")
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
main.atxt: 2771(line=116, offs=23) -- 2788(line=116, offs=40)
*)
val __tok12 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
main.atxt: 2827(line=120, offs=2) -- 3126(line=146, offs=3)
*)
val __tok13 = pats2xhtml_dats("\
//
extern
fun
move_n
(
  n: int
, P1: pole, P2: pole, P3: pole
) : void
//
implement
move_n
(
  n, P1, P2, P3
) = (
//
if n > 0 then
{
  val n1 = n - 1
  val () = move_n(n1, P1, P3, P2)
  val () = move_1(P1, P2)
  val () = move_n(n1, P3, P2, P1)
}
//
) (* end of [move_n] *)
//
")
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
main.atxt: 2124(line=84, offs=2) -- 3136(line=148, offs=3)
*)
val __tok8 = para("\

In the following code, the function
#__tok9$ is called to move a single disk from
one pole to another one:

<pre
class=\"patsyntax\">
#__tok10$</pre>

The function #__tok11$ for moving multiple disks from one
pole to another one (while using the third one as a spare) can be
implemented based on #__tok12$ as follows:

<pre
class=\"patsyntax\">
#__tok13$</pre>

")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
main.atxt: 3172(line=152, offs=25) -- 3189(line=152, offs=42)
*)
val __tok15 = dyncode("move_n")
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
main.atxt: 3277(line=154, offs=5) -- 3294(line=154, offs=22)
*)
val __tok16 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
main.atxt: 3139(line=150, offs=2) -- 3317(line=156, offs=3)
*)
val __tok14 = para("\

It is easy to see that #__tok15$, when applied
a natural number N and 3 distinct poles, makes 2<sup>N</sup>-1 calls
to #__tok16$ before it returns.

")
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
main.atxt: 3532(line=166, offs=21) -- 3549(line=166, offs=38)
*)
val __tok18 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
main.atxt: 3638(line=171, offs=2) -- 3682(line=173, offs=3)
*)
val __tok19 = pats2xhtml_dats("\
val-cons0(x, xs) = !r1
")
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
main.atxt: 3732(line=175, offs=43) -- 3747(line=175, offs=58)
*)
val __tok20 = stacode("pole")
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
main.atxt: 3787(line=176, offs=31) -- 3804(line=176, offs=48)
*)
val __tok21 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
main.atxt: 3845(line=177, offs=20) -- 3862(line=177, offs=37)
*)
val __tok22 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
main.atxt: 3363(line=162, offs=2) -- 3941(line=180, offs=3)
*)
val __tok17 = para("\

A serious issue with the above solution (of imperative style) is that
pattern matching involved in the following val-declaration (appearing
inside the body of #__tok18$) is not guaranteed (solely based
on typechecking) to succeed:

<pre
class=\"patsyntax\">
#__tok19$</pre>

While the use of a reference in the type #__tok20$ makes it
straightforward to implement #__tok21$, reasoning about the
implementation of #__tok22$ is greatly complicated (largely
due to the involvement of a global state).

")
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
main.atxt: 3942(line=180, offs=4) -- 3957(line=180, offs=19)
*)
val __tok23 = comment("para")
val () = theAtextMap_insert_str ("__tok23", __tok23)

(*
main.atxt: 3960(line=182, offs=2) -- 4154(line=188, offs=3)
*)
val __tok24 = para("\

Let us see as follows a solution of functional style to the Hanoi
Towers puzzle that rules out (solely based on typechecking) the
possiblity of pattern matching failure at run-time.

")
val () = theAtextMap_insert_str ("__tok24", __tok24)

(*
main.atxt: 4155(line=188, offs=4) -- 4170(line=188, offs=19)
*)
val __tok25 = comment("para")
val () = theAtextMap_insert_str ("__tok25", __tok25)

(*
main.atxt: 4212(line=192, offs=31) -- 4230(line=192, offs=49)
*)
val __tok27 = stacode("pole(N)")
val () = theAtextMap_insert_str ("__tok27", __tok27)

(*
main.atxt: 4301(line=197, offs=2) -- 4354(line=201, offs=3)
*)
val __tok28 = pats2xhtml_dats("\
//
abstype pole(n:int) = ptr
//
")
val () = theAtextMap_insert_str ("__tok28", __tok28)

(*
main.atxt: 4173(line=190, offs=2) -- 4364(line=203, offs=3)
*)
val __tok26 = para("\

Given an integer N, the type #__tok27$ is for a pole on
which N disks are stacked:

<pre
class=\"patsyntax\">
#__tok28$</pre>

")
val () = theAtextMap_insert_str ("__tok26", __tok26)

(*
main.atxt: 4365(line=203, offs=4) -- 4380(line=203, offs=19)
*)
val __tok29 = comment("para")
val () = theAtextMap_insert_str ("__tok29", __tok29)

(*
main.atxt: 4407(line=207, offs=16) -- 4424(line=207, offs=33)
*)
val __tok31 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok31", __tok31)

(*
main.atxt: 4430(line=207, offs=39) -- 4447(line=207, offs=56)
*)
val __tok32 = dyncode("move_n")
val () = theAtextMap_insert_str ("__tok32", __tok32)

(*
main.atxt: 4540(line=212, offs=2) -- 4811(line=231, offs=3)
*)
val __tok33 = pats2xhtml_dats("\
//
extern
fun
move_1
{p1,p2:nat|p1 > 0}
(
  P1: pole(p1), P2: pole(p2)
) : (pole(p1-1), pole(p2+1))
//
extern
fun
move_n{n:nat}
{p1,p2,p3:nat|p1 >= n}
(
  n: int(n)
, P1: pole(p1), P2: pole(p2), P3: pole(p3)
) : (pole(p1-n), pole(p2+n), pole(p3))
//
")
val () = theAtextMap_insert_str ("__tok33", __tok33)

(*
main.atxt: 4851(line=233, offs=33) -- 4868(line=233, offs=50)
*)
val __tok34 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok34", __tok34)

(*
main.atxt: 4885(line=234, offs=2) -- 4902(line=234, offs=19)
*)
val __tok35 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok35", __tok35)

(*
main.atxt: 4994(line=235, offs=44) -- 5011(line=235, offs=61)
*)
val __tok36 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok36", __tok36)

(*
main.atxt: 5077(line=236, offs=58) -- 5094(line=236, offs=75)
*)
val __tok37 = dyncode("move_n")
val () = theAtextMap_insert_str ("__tok37", __tok37)

(*
main.atxt: 4383(line=205, offs=2) -- 5127(line=239, offs=3)
*)
val __tok30 = para("\

The functions #__tok31$ and #__tok32$ are given the
following types to reflect their functional nature:

<pre
class=\"patsyntax\">
#__tok33$</pre>

Note that the type assigned to #__tok34$ indicates that
#__tok35$ is of functional style: Given two poles holding
P1 and P2 disks such that P1 is positive, #__tok36$ returns
two (new) poles holding P1-1 and P2+1 disks. Similarly, #__tok37$
is also of functional style.

")
val () = theAtextMap_insert_str ("__tok30", __tok30)

(*
main.atxt: 5154(line=243, offs=16) -- 5171(line=243, offs=33)
*)
val __tok39 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok39", __tok39)

(*
main.atxt: 5177(line=243, offs=39) -- 5194(line=243, offs=56)
*)
val __tok40 = dyncode("move_n")
val () = theAtextMap_insert_str ("__tok40", __tok40)

(*
main.atxt: 5269(line=248, offs=2) -- 6044(line=301, offs=3)
*)
val __tok41 = pats2xhtml_dats("\
local

datatype
pole_(n:int) =
Pole of
(
  string, list(int, n)
) (* end of [pole_] *)

assume pole(n:int) = pole_(n)

in (* in-of-local *)

implement
move_1(P1, P2) = let
//
  val Pole(n1, r1) = P1
  val+list_cons(x, xs) = r1 // no failure!
  val Pole(n2, r2) = P2
//
  val () =
  println!
  (
    \"Move [\", x, \"] from [\", n1, \"] to [\", n2, \"]\"
  ) (* end of [val] *)
//
in
  (Pole(n1, xs), Pole(n2, list_cons(x, r2)))
end // end of [move_1]

end // end of [local]

(* ****** ****** *)

implement
move_n(n, P1, P2, P3) = (
//
if
n > 0
then
(
  P1, P2, P3
) where
{
  val n1 = n - 1
  val (P1, P3, P2) = move_n(n1, P1, P3, P2)
  val (P1, P2)     = move_1(P1, P2)
  val (P3, P2, P1) = move_n(n1, P3, P2, P1)
}
else (P1, P2, P3)
//
) (* end of [move_n] *)
")
val () = theAtextMap_insert_str ("__tok41", __tok41)

(*
main.atxt: 6075(line=303, offs=24) -- 6090(line=303, offs=39)
*)
val __tok42 = dyncode("val+")
val () = theAtextMap_insert_str ("__tok42", __tok42)

(*
main.atxt: 5130(line=241, offs=2) -- 6233(line=307, offs=3)
*)
val __tok38 = para("\

The functions #__tok39$ and #__tok40$ of functional
style are implemented as follows:

<pre
class=\"patsyntax\">
#__tok41$</pre>

Note that the keyword #__tok42$ indicates the need to verify
(based on typechecking) the exhaustiveness of pattern matching
involved in the val-declaration it introduces.

")
val () = theAtextMap_insert_str ("__tok38", __tok38)

(*
main.atxt: 6327(line=312, offs=13) -- 6344(line=312, offs=30)
*)
val __tok44 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok44", __tok44)

(*
main.atxt: 6350(line=312, offs=36) -- 6367(line=312, offs=53)
*)
val __tok45 = dyncode("move_n")
val () = theAtextMap_insert_str ("__tok45", __tok45)

(*
main.atxt: 6236(line=309, offs=2) -- 6474(line=316, offs=3)
*)
val __tok43 = para("\

With no involvement of a global state, reasoning about the functional
version of #__tok44$ and #__tok45$ is greatly
simplified. And this is often claimed as a strong selling point for
functional programming.

")
val () = theAtextMap_insert_str ("__tok43", __tok43)

(*
main.atxt: 6475(line=316, offs=4) -- 6490(line=316, offs=19)
*)
val __tok46 = comment("para")
val () = theAtextMap_insert_str ("__tok46", __tok46)

(*
main.atxt: 6720(line=326, offs=34) -- 6737(line=326, offs=51)
*)
val __tok48 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok48", __tok48)

(*
main.atxt: 6543(line=322, offs=2) -- 6973(line=332, offs=3)
*)
val __tok47 = para("\

While functional programming can greatly simplify reasoning, it is
often wasteful in terms of memory usage. For instance, each call to
the above functional version of #__tok48$ builds two new
poles; the two poles passed as arguments are of no more use after the
call returns. Fortunately, one can turn to what I refer to as linear
functional programming in ATS to reduce or even eliminate this kind of
waste.

")
val () = theAtextMap_insert_str ("__tok47", __tok47)

(*
main.atxt: 6974(line=332, offs=4) -- 6989(line=332, offs=19)
*)
val __tok49 = comment("para")
val () = theAtextMap_insert_str ("__tok49", __tok49)

(*
main.atxt: 7023(line=336, offs=23) -- 7038(line=336, offs=38)
*)
val __tok51 = stacode("pole")
val () = theAtextMap_insert_str ("__tok51", __tok51)

(*
main.atxt: 7094(line=340, offs=2) -- 7148(line=344, offs=3)
*)
val __tok52 = pats2xhtml_dats("\
//
absvtype pole(n:int) = ptr
//
")
val () = theAtextMap_insert_str ("__tok52", __tok52)

(*
main.atxt: 7272(line=347, offs=49) -- 7289(line=347, offs=66)
*)
val __tok53 = stacode("move_1")
val () = theAtextMap_insert_str ("__tok53", __tok53)

(*
main.atxt: 7295(line=348, offs=2) -- 7312(line=348, offs=19)
*)
val __tok54 = stacode("move_n")
val () = theAtextMap_insert_str ("__tok54", __tok54)

(*
main.atxt: 7364(line=352, offs=2) -- 7682(line=371, offs=3)
*)
val __tok55 = pats2xhtml_dats("\
extern
fun
move_1
{p1,p2:nat|p1 > 0}
(
  P1: !pole(p1) >> pole(p1-1)
, P2: !pole(p2) >> pole(p2+1)
) : void // end-of-function
//
extern
fun
move_n{n:nat}
{p1,p2,p3:nat|p1 >= n}
(
  n: int(n)
, P1: !pole(p1) >> pole(p1-n), P2: !pole(p2) >> pole(p2+n), P3: !pole(p3)
) : void // end-of-function
//
")
val () = theAtextMap_insert_str ("__tok55", __tok55)

(*
main.atxt: 7712(line=373, offs=23) -- 7729(line=373, offs=40)
*)
val __tok56 = stacode("move_1")
val () = theAtextMap_insert_str ("__tok56", __tok56)

(*
main.atxt: 7789(line=374, offs=30) -- 7802(line=374, offs=43)
*)
val __tok57 = dyncode("P1")
val () = theAtextMap_insert_str ("__tok57", __tok57)

(*
main.atxt: 7808(line=374, offs=49) -- 7821(line=374, offs=62)
*)
val __tok58 = dyncode("P2")
val () = theAtextMap_insert_str ("__tok58", __tok58)

(*
main.atxt: 7886(line=375, offs=57) -- 7899(line=375, offs=70)
*)
val __tok59 = dyncode("P1")
val () = theAtextMap_insert_str ("__tok59", __tok59)

(*
main.atxt: 7944(line=376, offs=45) -- 7957(line=376, offs=58)
*)
val __tok60 = dyncode("P2")
val () = theAtextMap_insert_str ("__tok60", __tok60)

(*
main.atxt: 7995(line=377, offs=29) -- 8012(line=377, offs=46)
*)
val __tok61 = dyncode("move_n")
val () = theAtextMap_insert_str ("__tok61", __tok61)

(*
main.atxt: 6992(line=334, offs=2) -- 8047(line=379, offs=3)
*)
val __tok50 = para("\

Let us first declare #__tok51$ is decared as a linear type:

<pre
class=\"patsyntax\">
#__tok52$</pre>

Unlike a non-linear type, a value of a linear type can be modified.
The types for the linear functional version of #__tok53$ and
#__tok54$ are declared as follows:

<pre
class=\"patsyntax\">
#__tok55$</pre>

Based on the type of #__tok56$, it is clear that calling the
function on two given poles #__tok57$ and #__tok58$ changes
the types of these two poles to reflect that fact that #__tok59$
contains one fewer disk after the call and #__tok60$ one more
disk. The type assigned to #__tok61$ can be interpreted similarly.\

")
val () = theAtextMap_insert_str ("__tok50", __tok50)

(*
main.atxt: 8048(line=379, offs=4) -- 8063(line=379, offs=19)
*)
val __tok62 = comment("para")
val () = theAtextMap_insert_str ("__tok62", __tok62)

(*
main.atxt: 8090(line=383, offs=16) -- 8107(line=383, offs=33)
*)
val __tok64 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok64", __tok64)

(*
main.atxt: 8113(line=383, offs=39) -- 8130(line=383, offs=56)
*)
val __tok65 = dyncode("move_n")
val () = theAtextMap_insert_str ("__tok65", __tok65)

(*
main.atxt: 8212(line=388, offs=2) -- 9042(line=441, offs=3)
*)
val __tok66 = pats2xhtml_dats("\
local
//
datavtype
pole_(n:int) =
Pole(n) of
(
  string, list_vt(int, n)
) (* end of [pole_] *)
//
assume pole(n:int) = pole_(n)
//
in (* in-of-local *)

implement
move_1(P1, P2) = let
//
val+@Pole(n1, rxs) = P1
val n1 = n1
val+~list_vt_cons(x, xs) = rxs
val ((*void*)) = rxs := xs
prval ((*folded*)) = fold@(P1)
//
val+@Pole(n2, rxs) = P2
val n2 = n2
val ((*void*)) = rxs := list_vt_cons(x, rxs)
prval ((*folded*)) = fold@(P2)
//
in
  println! (\"Move [\", x, \"] from [\", n1, \"] to [\", n2, \"]\")
end // end of [move_1]

end // end of [local]

(* ****** ****** *)

implement
move_n(n, P1, P2, P3) = (
//
if
n > 0
then () where
{
//
val n1 = n - 1
val () = move_n(n1, P1, P3, P2)
val () = move_1(P1, P2)
val () = move_n(n1, P3, P2, P1)
//
} (* end of [then] *)
else () // end of [else]
//
) (* end of [move_n] *)
")
val () = theAtextMap_insert_str ("__tok66", __tok66)

(*
main.atxt: 9150(line=444, offs=56) -- 9167(line=444, offs=73)
*)
val __tok67 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok67", __tok67)

(*
main.atxt: 9203(line=445, offs=35) -- 9220(line=445, offs=52)
*)
val __tok68 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok68", __tok68)

(*
main.atxt: 9405(line=448, offs=14) -- 9422(line=448, offs=31)
*)
val __tok69 = dyncode("move_1")
val () = theAtextMap_insert_str ("__tok69", __tok69)

(*
main.atxt: 8066(line=381, offs=2) -- 9439(line=450, offs=3)
*)
val __tok63 = para("\

The functions #__tok64$ and #__tok65$ of linear functional
style are implemented as follows:

<pre
class=\"patsyntax\">
#__tok66$</pre>

Note that a pole now contains a linear list.
In contrast to the (non-linear) functional version of #__tok67$,
the linear functional version of #__tok68$ returns two new poles
that are built by modifying the two poles passed as arguments: There is no
waste in this case as the original poles are no longer in existence after
the call to #__tok69$ is returned.

")
val () = theAtextMap_insert_str ("__tok63", __tok63)

(*
main.atxt: 9440(line=450, offs=4) -- 9455(line=450, offs=19)
*)
val __tok70 = comment("para")
val () = theAtextMap_insert_str ("__tok70", __tok70)

(*
main.atxt: 9590(line=458, offs=6) -- 9620(line=458, offs=36)
*)
val __tok72 = filename("HanoiTowers-1.dats")
val () = theAtextMap_insert_str ("__tok72", __tok72)

(*
main.atxt: 9626(line=459, offs=6) -- 9656(line=459, offs=36)
*)
val __tok73 = filename("HanoiTowers-2.dats")
val () = theAtextMap_insert_str ("__tok73", __tok73)

(*
main.atxt: 9662(line=460, offs=6) -- 9692(line=460, offs=36)
*)
val __tok74 = filename("HanoiTowers-3.dats")
val () = theAtextMap_insert_str ("__tok74", __tok74)

(*
main.atxt: 9458(line=452, offs=2) -- 10026(line=469, offs=3)
*)
val __tok71 = para("\

For the entirety of the three presented solutions to the Hanoi Towers puzzle,
please visit the following files:

<ul>
<li>#__tok72$
<li>#__tok73$
<li>#__tok74$
</ul>

There is also a Makefile available for testing.
By comparing the solution of linear functional style with the one of
imperative style, I hope that one can readily see the progress being made:
the former is not only simpler and cleaner to reason about than the latter
but also more efficient both time-wise and memory-wise.

")
val () = theAtextMap_insert_str ("__tok71", __tok71)

(*
main.atxt: 10027(line=469, offs=4) -- 10042(line=469, offs=19)
*)
val __tok75 = comment("para")
val () = theAtextMap_insert_str ("__tok75", __tok75)

(*
main.atxt: 10158(line=478, offs=1) -- 10227(line=480, offs=3)
*)

implement main () = fprint_filsub (stdout_ref, "main_atxt.txt")


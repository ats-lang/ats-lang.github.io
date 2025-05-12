(* ****** ****** *)
(*
** Tic-Tac-Toe
*)
(* ****** ****** *)
(*
##myatsccdef=\
patsopt -d $1 | \
atscc2js -o $fname($1)_dats.js -i -
*)
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
//
#define
ATS_DYNLOADNAME
"TicTacToe__dynload"
//
#define
ATS_PACKNAME "TicTacToe"
#define
ATS_EXTERN_PREFIX "TicTacToe__"
#define
ATS_STATIC_PREFIX "_TicTacToe__"
//
(* ****** ****** *)
//
// HX: for accessing LIBATSCC2JS 
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME/contrib\
/libatscc2js/ATS2-0.3.2" // latest stable release
//
#include
"{$LIBATSCC2JS}/staloadall.hats" // for prelude stuff
#staload
"{$LIBATSCC2JS}/SATS/print.sats" // for print into a store
//
(* ****** ****** *)
//
datatype
move = MOVE of (int, int)
//
(* ****** ****** *)

#define X 1
#define O 2

(* ****** ****** *)
//
fun
player_next
  (p: int): int =
  if p = X then O else X
//
(* ****** ****** *)
//
val
thePlayer = ref{int}(X)
val
theWinner = ref{int}(0)
val
theNMoves = ref{int}(0)
val
theSquares =
matrix0_make_elt{int}(3, 3, 0)
//
(* ****** ****** *)
//
fun
player2string(p: int) =
case+ p of X => "X" | O => "O" | _ => ""
//
(* ****** ****** *)
//
extern
fun
theSquares_get
  (i: int, j: int): int = "mac#"
extern
fun
theSquares_get_text
  (i: int, j: int): string = "mac#"
implement
theSquares_get
  (i, j) = theSquares[i, j]
implement
theSquares_get_text
  (i, j) =
  player2string(theSquares_get(i, j))
//
(* ****** ****** *)
//
extern
fun
thePlayer_get(): int = "mac#"
implement
thePlayer_get() = thePlayer[]
//
extern
fun
theWinner_get(): int = "mac#"
implement
theWinner_get() = theWinner[]
//
extern
fun
theStatus_get(): string = "mac#"
implement
theStatus_get() =
if
(
theWinner[] != 0
)
then
(
  "The Winner: " + player2string(theWinner[])
)
else
(
if
(
theNMoves[] >= 9
)
then
(
  "Game Over: No Winner!!!"
)
else
(
  "Next Player: " + player2string(thePlayer[])
)
)
//
(* ****** ****** *)

fun
theState_winner
  (): int = let
//
fun
check
(
i1: int, j1: int
,
i2: int, j2: int
,
i3: int, j3: int
) : bool =
(
theSquares[i1,j1] =
theSquares[i2,j2]
&&
theSquares[i1,j1] =
theSquares[i3,j3]
)
//
in
//
(
if
check
(0, 0, 0, 1, 0, 2)
then theSquares[0, 0]
else
(
if
check
(1, 0, 1, 1, 1, 2)
then theSquares[1, 0]
else
(
if
check
(2, 0, 2, 1, 2, 2)
then theSquares[2, 0]
else
(
(
if
check
(0, 0, 1, 0, 2, 0)
then theSquares[0, 0]
else
(
if
check
(0, 1, 1, 1, 2, 1)
then theSquares[0, 1]
else
(
if
check
(0, 2, 1, 2, 2, 2)
then theSquares[0, 2]
else
(
if
check
(0, 0, 1, 1, 2, 2)
then theSquares[1, 1]
else
(
if
check
(0, 2, 1, 1, 2, 0)
then theSquares[1, 1]
else (0) // no winner
)
)
)
)
)
)
)
)
)
//
end // end of [theState_winner]

(* ****** ****** *)
//
extern
fun
theState_update
  : (move) -> void
//
implement
theState_update
  (MOVE(i, j)) = let
  val p1 = thePlayer[]
  val p2 = player_next(p1)
  val () = thePlayer[] := p2
  val () = theSquares[i, j] := p1
  val () = theWinner[] := theState_winner()
  val () = theNMoves[] := theNMoves[] + 1
in
  // nothing
end // end of [theState_update]
//
(* ****** ****** *)
//
extern
fun
Square_handle_click
  (i: int, j: int): void = "mac#"
//
(*
implement
Square_handle_click
  (i, j) =
(
  alert(String(i) + String(j))
)
*)
implement
Square_handle_click
  (i, j) = let
//
val x = theSquares_get(i, j)
//
in
//
if
(
theWinner[] != 0
)
then
(
alert
("The game is over!!!")
)
else
(
if
(
theNMoves[] >= 9
)
then
(
alert
("The game is over!!!")
)
else
(
if
(x <= 0)
then
theState_update(MOVE(i, j))
else
(
//
alert
("The square is already filled!!!")
//
)
)
)
end // end of [Square_handle_click]
//
(* ****** ****** *)

%{$
//
jQuery(document).ready(function(){TicTacToe__dynload();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [Tic-Tac-Toe.dats] *)

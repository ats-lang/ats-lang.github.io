(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2015 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
**
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
**
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/DATS/CODEGEN/arith_prf.atxt
** Time of generation: Wed Oct 10 21:08:45 2018
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: Feburary, 2012 *)

(* ****** ****** *)

primplmnt eqint_make () = EQINT ()

(* ****** ****** *)

primplmnt
mul_gte_gte_gte {m,n} () = let
  prfun loop
    {m:nat}{p:int} .<m>.
    (pf: MUL (m, n, p)):<> [p >= 0] void =
    sif m > 0 then let
      prval MULind (pf1) = pf in loop (pf1)
    end else let
      prval MULbas () = pf in (*nothing*)
    end // end of [sif]
  // end of [loop]
  prval pf = mul_make {m,n} ()
in
  loop {m} (pf)
end // end of [mul_gte_gte_gte]

primplmnt
mul_gte_lte_lte {m,n} () = let
  prfun loop
    {m:nat}{p:int} .<m>.
    (pf: MUL (m, n, p)):<> [p <= 0] void =
    sif m > 0 then let
      prval MULind (pf1) = pf in loop (pf1)
    end else let
      prval MULbas () = pf in (*nothing*)
    end // end of [sif]
  // end of [loop]
  prval pf = mul_make {m,n} ()
in
  loop {m} (pf)
end // end of [mul_gte_lte_lte]

primplmnt
mul_lte_gte_lte {m,n} () = mul_gte_lte_lte {n,m} ()

primplmnt
mul_lte_lte_gte {m,n} () = mul_gte_gte_gte {~m,~n} ()

(* ****** ****** *)

primplmnt
mul_nat_nat_nat
  {m,n} (pf) = let
  prval () = mul_elim (pf)
  prval () = mul_gte_gte_gte {m,n} ()
in
  (*nothing*)
end // end of [mul_nat_nat_nat]

primplmnt
mul_pos_pos_pos
  {m,n} (pf) = let
  prval () = mul_elim (pf)
  prval () = mul_gte_gte_gte {m-1,n-1} ()
in
  (*nothing*)
end // end of [mul_pos_pos_pos]

(* ****** ****** *)

primplmnt
mul_negate {m,n} (pf) = let
  prval () = mul_elim (pf) in mul_make {~m,n} ()
end // end of [mul_negate]

primplmnt
mul_negate2 {m,n} (pf) = let
  prval () = mul_elim (pf) in mul_make {m,~n} ()
end // end of [mul_negate2]

(* ****** ****** *)

primplmnt
mul_commute {m,n} (pf) = let
  prval () = mul_elim (pf) in mul_make {n,m} ()
end // end of [mul_commute]

primplmnt
mul_is_commutative
  (pf1, pf2) = let
  prval () = mul_elim (pf1) and () = mul_elim (pf2)
in
  (*nothing*)
end // end of [mul_commute]

(* ****** ****** *)

primplmnt
mul_distribute
  {m}{n1,n2} (pf1, pf2) = let
  prval () = mul_elim (pf1) and () = mul_elim (pf2)
in
  mul_make {m,n1+n2} ()
end // end of [mul_distribute]

primplmnt
mul_distribute2
  {m1,m2}{n} (pf1, pf2) = let
  prval () = mul_elim (pf1) and () = mul_elim (pf2)
in
  mul_make {m1+m2,n} ()
end // end of [mul_distribute]

(* ****** ****** *)

primplmnt
mul_is_associative
  {x,y,z}{xy,yz}
  (pf1, pf2, pf3, pf4) = {
  prval pf1_alt = mul_make {x,y} ()
  prval EQINT () = mul_isfun2 (pf1, pf1_alt)
  prval pf2_alt = mul_make {y,z} ()
  prval EQINT () = mul_isfun2 (pf2, pf2_alt)
  prval pf3_alt = mul_make {xy,z} ()
  prval EQINT () = mul_isfun2 (pf3, pf3_alt)
  prval pf4_alt = mul_make {x,yz} ()
  prval EQINT () = mul_isfun2 (pf4, pf4_alt)
//
} // end of [mul_is_associative]

(* ****** ****** *)

primplmnt
lemma_exp2_param (pf) = let
  prfun aux
    {n:int}
    {p:int}
    .<max(n,0)>. (
    pf: EXP2 (n, p)
  ) : [n>=0;p>=1] void = case+ pf of
    | EXP2ind (pf1) => aux (pf1) | EXP2bas () => ()
  // end of [aux]
in
  aux (pf)
end // end of [lemma_exp2_param]  

(* ****** ****** *)

primplmnt
exp2_istot {n}
  () = istot {n} () where {
  prfun istot
    {n:nat} .<n>. (): [p:nat] EXP2 (n, p) =
    sif n > 0 then EXP2ind (istot {n-1} ()) else EXP2bas ()
} // end of [exp2_istot]

(* ****** ****** *)

primplmnt
exp2_isfun
  (pf1, pf2) =
  isfun (pf1, pf2) where {
  prfun isfun
    {n:nat} {p1,p2:int} .<n>. (
    pf1: EXP2 (n, p1), pf2: EXP2 (n, p2)
  ) : [p1==p2] void =
    case+ pf1 of
    | EXP2ind pf1 => let
        prval EXP2ind pf2 = pf2 in isfun (pf1, pf2)
      end // end of [EXP2ind]
    | EXP2bas () => let
        prval EXP2bas () = pf2 in (* nothing *)
      end // end of [EXP2bas]
  // end of [isfun]
} // end of [exp2_isfun]

(* ****** ****** *)

primplmnt
exp2_is_mono
  (pf1, pf2) =
  aux (pf1, pf2) where {
  prfun aux
    {n1:nat;n2:int | n1 <= n2}
    {p1,p2:int} .<n2>. (
    pf1: EXP2 (n1, p1), pf2: EXP2 (n2, p2)
  ) : [p1 <= p2] void =
    case+ pf2 of
    | EXP2ind (pf2) => (case+ pf1 of
      | EXP2ind (pf1) => aux (pf1, pf2) | EXP2bas () => aux (pf1, pf2)
      ) // end of [EXP2ind]
    | EXP2bas () => let prval EXP2bas () = pf1 in () end
  // end of [aux]
} // end of [exp2_is_mono]

(* ****** ****** *)

primplmnt
exp2_muladd
  (pf1, pf2, pf3) = let
  prfun aux
    {n1,n2:nat}
    {p1,p2:int}
    {p:int} .<n2>. (
    pf1: EXP2 (n1, p1)
  , pf2: EXP2 (n2, p2)
  , pf3: MUL (p1, p2, p)
  ) : [p>=0] EXP2 (n1+n2, p) = case+ pf2 of
    | EXP2ind {n21} {p21} (pf21) => let // n2 = n21+1; p2 = p21 + p21
        prval pf31 = mul_istot {p1,p21} ()
        prval pf32 = mul_distribute (pf31, pf31)
        prval () = mul_isfun (pf3, pf32)
        prval pf1_res = aux (pf1, pf21, pf31)
      in
        EXP2ind pf1_res
      end // end of [EXP2ind]
    | EXP2bas () => let
        prval () =
          lemma_exp2_param (pf1)
        prval () = mul_elim (pf3) in pf1
      end // end of [EXP2bas]
  // end of [aux]
in
  aux (pf1, pf2, pf3)
end // end of [exp2_muladd]

(* ****** ****** *)

(* end of [arith_prf.dats] *)

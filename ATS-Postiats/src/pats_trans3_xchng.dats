(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2013 Hongwei Xi, ATS Trustful Software, Inc.
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
//
// Author: Hongwei Xi
// Authoremail: gmhwxi AT gmail DOT com
// Start Time: April, 2012
//
(* ****** ****** *)
//
staload
ATSPRE = "./pats_atspre.dats"
//
(* ****** ****** *)

staload
LOC = "./pats_location.sats"

(* ****** ****** *)

staload "./pats_errmsg.sats"
staload _(*anon*) = "./pats_errmsg.dats"
implement prerr_FILENAME<> () = prerr "pats_trans3_xchng"

(* ****** ****** *)

staload "./pats_staexp2.sats"
staload "./pats_staexp2_util.sats"
staload "./pats_staexp2_error.sats"

(* ****** ****** *)

staload "./pats_stacst2.sats"

(* ****** ****** *)

staload "./pats_dynexp2.sats"

(* ****** ****** *)

staload "./pats_dynexp3.sats"

(* ****** ****** *)

staload SOL = "./pats_staexp2_solve.sats"

(* ****** ****** *)

staload "./pats_trans3.sats"
staload "./pats_trans3_env.sats"

(* ****** ****** *)

local

fun auxerr_pfobj
(
  loc0: loc_t, loc1: loc_t, s2l: s2exp
) : void = let
  val () = prerr_error3_loc (loc1)
  val () = prerr ": exchange cannot be performed"
  val () = prerr ": the proof search for view located at ["
  val () = prerr_s2exp (s2l)
  val () = prerr "] failed to turn up a result."
  val () = prerr_newline ()
in
  the_trans3errlst_add (T3E_pfobj_search_none (loc1, s2l))
end // end of [auxerr_pfobj]

fun
auxmain .<>.
(
  loc0: loc_t // all
, loc1: loc_t // right
, pfobj: pfobj
, d3ls: d3lablst
, s2f0_sel: s2hnf // left
, s2rt: &s2exp? >> s2exp
) : s2exp = let
//
val+~PFOBJ (
  d2vw, s2e_ctx, s2e_elt, s2l
) = pfobj
val () = s2rt := s2e_elt
//
var ctxtopt: s2ctxtopt = None ()
val s2e_sel =
  s2exp_get_dlablst_context (loc1, s2e_elt, d3ls, ctxtopt)
// end of [val]
val s2e0_sel = s2hnf2exp (s2f0_sel)
in
//
case+ ctxtopt of
| Some (ctxt) => let
    val () = d2var_inc_linval (d2vw)
    val s2e_elt = s2ctxt_hrepl (ctxt, s2e0_sel)
    val s2e = s2exp_hrepl (s2e_ctx, s2e_elt)
    val () = d2var_set_type (d2vw, Some (s2e))
  in
    s2e_sel
  end // end of [Some]
| None () => let
    var linrest: int = 0 and sharing: int = 0
    val (s2e_sel, s2ps) =
      s2exp_get_dlablst_linrest_sharing (loc1, s2e_elt, d3ls, linrest, sharing)
    val s2f_sel = s2exp2hnf (s2e_sel)
    val () = trans3_env_add_proplst_vt (loc1, s2ps)
    val err = $SOL.s2hnf_tyleq_solve (loc1, s2f0_sel, s2f_sel)
    val () = if err > 0 then let
      val () = prerr_error3_loc (loc1)
      val () = prerr ": the LHS of exchange cannot be given its RHS type."
      val () = prerr_newline ()
      val () = prerr_the_staerrlst ()
    in
      the_trans3errlst_add (T3E_s2addr_xchng_check_RHS (loc1, s2e0_sel, s2e_sel))
    end // end of [if] // end of [val]
  in
    s2e_sel
  end // end of [None]
//
end // end of [auxmain]

in (* in of [local] *)

implement
s2addr_xchng_check (
  loc0(*all*), loc1(*right*)
, s2l, d3ls, s2f0(*left*), s2rt
) = let
  val opt = pfobj_search_atview (s2l)
in
  case+ opt of
  | ~Some_vt (pfobj) =>
      auxmain (loc0, loc1, pfobj, d3ls, s2f0, s2rt)
  | ~None_vt () => let
      val s2e_sel =
        s2exp_t0ype_err ()
      val () = s2rt := s2e_sel
      val () = auxerr_pfobj (loc0, loc1, s2l)
    in
      s2e_sel
    end // end of [None_vt]
end // end of [s2addr_xchng_check]

end // end of [local]

(* ****** ****** *)

local

(*
fun
auxck_tszeq
(
  loc0: loc_t
, s2f1: s2hnf, s2f2: s2hnf
) : void = let
//
val s2e1 = s2hnf2exp(s2f1)
val s2e2 = s2hnf2exp(s2f2)
//
val
tszeq = s2exp_tszeq(s2e1, s2e2)
//
in
//
if ~tszeq then let
//
  val () =
  prerr_error3_loc (loc0)
//
  val () = prerr ": assignment cannot be performed"
  val () = prerr ": mismatch of bef/aft type-sizes:\n"
  val () = (prerr "bef: ["; prerr_s2exp (s2e1); prerr "]")
  val () = prerr_newline ((*void*))
  val () = (prerr "aft: ["; prerr_s2exp (s2e2); prerr "]")
  val () = prerr_newline ((*void*))
//
in
  the_trans3errlst_add(T3E_s2exp_assgn_tszeq(loc0, s2e1, s2e2))
end // end of [if] // end of [val]
//
end // end of [auxck_tszeq]
*)

fun
auxerr_nonderef
(
  d3e: d3exp
) : void = let
  val
  loc = d3e.d3exp_loc
  val () =
  prerr_error3_loc (loc)
  val () =
  prerrln! ": the dynamic expression cannot be dereferenced."
in
  the_trans3errlst_add(T3E_d3exp_nonderef(d3e))
end // end of [auxerr_nonderef]

fun
auxerr1
(
  loc0: loc_t // all
, loc1: loc_t // right
, s2f0_sel: s2hnf // left
, s2f1_sel: s2hnf // right
) : void = let
  val () =
  prerr_error3_loc(loc0)
  val () =
  prerrln!
  (": the RHS of exchange cannot be given its LHS type.")
  val () = prerr_the_staerrlst()
  val s2e0_sel = s2hnf2exp(s2f0_sel)
  val s2e1_sel = s2hnf2exp(s2f1_sel)
in
  the_trans3errlst_add
    (T3E_s2addr_xchng_check_LHS(loc1, s2e0_sel, s2e1_sel))
  // the_trans3errlst_add
end // end of [auxerr1]

(*
fun auxerr2
(
  loc0: loc_t // all
, loc1: loc_t // right
, s2f0_sel: s2hnf // left
, s2f1_sel: s2hnf // right
) : void = let
  val () =
  prerr_error3_loc(loc0)
  val () =
  prerrln!
  (": the LHS of exchange cannot be given its RHS type.")
  val () = prerr_the_staerrlst()
  val s2e0_sel = s2hnf2exp(s2f0_sel)
  val s2e1_sel = s2hnf2exp(s2f1_sel)
in
  the_trans3errlst_add
    (T3E_s2addr_xchng_check_RHS (loc0, s2e0_sel, s2e1_sel))
  // the_trans3errlst_add
end // end of [auxerr2]
*)

fun aux1
(
  loc0: loc_t // all
, loc1: loc_t // right
, s2f0: s2hnf // right
, d3e: d3exp
, d3ls: d3lablst
, s2f0_sel: s2hnf // left
) : d3exp = let
  val opt = un_s2exp_ptr_addr_type(s2f0)
in
//
case+ opt of
| ~Some_vt(s2l) => let
    var s2rt: s2exp
    val s2e_sel =
    s2addr_xchng_check
      (loc0, loc1, s2l, d3ls, s2f0_sel, s2rt)
    // end of [val]
    val s2f_sel = s2exp2hnf(s2e_sel)
//
    val err =
    $SOL.s2hnf_tyleq_solve
      (loc0, s2f_sel, s2f0_sel)
    // end of [val]
    val () =
    if err > 0
    then auxerr1(loc0, loc1, s2f0_sel, s2f_sel)
    // end of [if]
//
(*
    val () = auxck_tszeq(loc0, s2f_sel, s2f0_sel)
*)
//
  in
    d3exp_sel_ptr( loc1, s2e_sel, d3e, s2rt, d3ls )
  end // end of [Some_vt]
| ~None_vt () => aux2(loc0, loc1, s2f0, d3e, d3ls, s2f0_sel)
//
end // end of [aux1]

and aux2
(
  loc0: loc_t // all
, loc1: loc_t // right
, s2f0: s2hnf // right
, d3e: d3exp, d3ls: d3lablst
, s2f0_sel: s2hnf // left
) : d3exp = let
  val opt = un_s2exp_ref_vt0ype_type(s2f0)
in
//
case+ opt of
| ~Some_vt(s2e) => let
    val s2rt = s2e
    var linrest: int = 0
    and sharing: int = 0
    val
    (s2e_sel, s2ps) =
    s2exp_get_dlablst_linrest_sharing
      (loc1, s2e, d3ls, linrest, sharing)
    // end of [val]
    val s2f_sel = s2exp2hnf(s2e_sel)
    val () =
    trans3_env_add_proplst_vt(loc1, s2ps)
//
    val err =
    $SOL.s2hnf_tyleq_solve
      (loc1, s2f0_sel, s2f_sel)
    // end of [val]
    val () =
    if err > 0
    then auxerr1(loc0, loc1, s2f0_sel, s2f_sel)
    // end of [if]
//
(*
    val () = auxck_tszeq(loc0, s2f_sel, s2f0_sel)
*)
//
    val _(*error*) = the_effenv_check_ref( loc0 )
  in
    d3exp_sel_ref( loc1, s2e_sel, d3e, s2rt, d3ls )
  end // end of [Some_vt]
| ~None_vt () => aux3(loc0, loc1, s2f0, d3e, d3ls, s2f0_sel)
//
end // end of [aux2]

and aux3
(
  loc0: loc_t // all
, loc1: loc_t // right
, s2f0: s2hnf // right
, d3e: d3exp, d3ls: d3lablst
, s2f0_sel: s2hnf // left
) : d3exp = let
  val () = auxerr_nonderef (d3e) in d3exp_errexp (loc0)
end // end of [aux3]

in (* in of [local] *)

implement
d2exp_trdn_xchng_deref
(loc0, loc1, d2e, d2ls, s2f0_sel) = let
//
val d3e = d2exp_trup (d2e)
val () = d3exp_open_and_add (d3e)
val d3ls = d2lablst_trup (d2ls)
val s2e0 = d3exp_get_type (d3e)
val s2f0 = s2exp2hnf_cast (s2e0)
//
in
  aux1(loc0, loc1, s2f0, d3e, d3ls, s2f0_sel)
end // end of [d2exp_trdn_xchng_deref]

implement
d2exp_trdn_xchng
  (loc0, d2e, s2f0_sel) = let
//
val loc1 = d2e.d2exp_loc
val d2lv = d2exp_lvalize(d2e)
//
in
//
case+ d2lv of
| D2LVALvar_mut
    (d2v, d2ls) => let
    val d3ls = d2lablst_trup (d2ls)
    val-Some (s2l) = d2var_get_addr (d2v)
    var s2rt: s2exp
    val s2e_sel =
    s2addr_xchng_check
      (loc0, loc1, s2l, d3ls, s2f0_sel, s2rt)
    // end of [val]
    val s2f_sel = s2exp2hnf (s2e_sel)
    val s2e_sel = s2hnf2exp (s2f_sel)
//
    val err =
    $SOL.s2hnf_tyleq_solve
      (loc0, s2f_sel, s2f0_sel)
    // end of [val]
    val ((*void*)) =
    if err > 0
    then auxerr1(loc0, loc1, s2f0_sel, s2f_sel)
    // end of [if]
//
(*
    val () = auxck_tszeq(loc0, s2f_sel, s2f0_sel)
*)
//
  in
    d3exp_sel_var(loc1, s2e_sel, d2v, s2rt, d3ls)
  end // end of [D2LVALvar_mut]
| D2LVALderef
    (d2e, d2ls) =>
    d2exp_trdn_xchng_deref(loc0, loc1, d2e, d2ls, s2f0_sel)
| _ (* error *) => let
    val () =
    prerr_error3_loc (loc1)
    val () =
    prerrln!
    (": a left-value is required but a non-left-value is given.")
    val () = the_trans3errlst_add (T3E_d2exp_nonlval (d2e) )
  in
    d3exp_errexp (loc1)
  end // end of [_]
//
end // end of [d2exp_trdn_xchng]

end // end of [local]

(* ****** ****** *)

local

fun
auxerr_pfobj
(
  loc0: loc_t, s2l: s2exp
) : void = let
  val () = prerr_error3_loc (loc0)
  val () = prerr ": exchange cannot be performed"
  val () = prerr ": the proof search for view located at ["
  val () = prerr_s2exp (s2l)
  val () = prerr "] failed to turn up a result."
  val () = prerr_newline ()
in
  the_trans3errlst_add (T3E_pfobj_search_none (loc0, s2l))
end // end of [auxerr_pfobj]

fun
auxmain .<>.
(
  loc0: loc_t
, pfobj: pfobj, d3ls: d3lablst
, d2e_r: d2exp
, s2rt: &s2exp? >> s2exp
) : d3exp = let
  val+~PFOBJ (
    d2vw, s2e_ctx, s2e_elt, s2l
  ) = pfobj
  val () = s2rt := s2e_elt
  var linrest: int = 0 and sharing: int = 0
  val (s2e_sel, s2ps) =
    s2exp_get_dlablst_linrest_sharing (loc0, s2e_elt, d3ls, linrest, sharing)
  val s2f_sel = s2exp2hnf (s2e_sel)
  val () = trans3_env_add_proplst_vt (loc0, s2ps)
in
  d2exp_trdn_xchng (loc0, d2e_r, s2f_sel)
end // end of [auxmain]

in (* in of [local] *)

implement
s2addr_xchng_deref (
  loc0, s2l, d3ls, d2e_r, s2rt
) = let
  val opt = pfobj_search_atview (s2l)
in
  case+ opt of
  | ~Some_vt (pfobj) =>
      auxmain (loc0, pfobj, d3ls, d2e_r, s2rt)
  | ~None_vt () => let
      val () =
        s2rt := s2exp_t0ype_err ()
      // end of [val]
      val () = auxerr_pfobj (loc0, s2l) in d2exp_trup (d2e_r)
    end // end of [None_vt]
end // end of [s2addr_xchng_deref]

end // end of [local]

(* ****** ****** *)

local

fun aux1
(
  loc0: loc_t
, s2f0: s2hnf // left
, d3e_l: d3exp
, d3ls: d3lablst
, d2e_r: d2exp
) : d3exp = let
  val opt = un_s2exp_ptr_addr_type (s2f0)
in
//
case+ opt of
| ~Some_vt (s2l) => let
    var s2rt: s2exp
    val d3e_r = 
      s2addr_xchng_deref (loc0, s2l, d3ls, d2e_r, s2rt)
    // end of [val]
   in
     d3exp_xchng_ptr (loc0, d3e_l, s2rt, d3ls, d3e_r)
   end // end of [Some_vt]
| ~None_vt () => aux2 (loc0, s2f0, d3e_l, d3ls, d2e_r)
//
end // end of [aux1]

and aux2
(
  loc0: loc_t
, s2f0: s2hnf // left
, d3e_l: d3exp
, d3ls: d3lablst
, d2e_r: d2exp
) : d3exp = let
  val opt = un_s2exp_ref_vt0ype_type (s2f0)
in
//
case+ opt of
| ~Some_vt (s2e) => let
    val s2rt = s2e
    var linrest: int = 0 and sharing: int = 0
    val (s2e_sel, s2ps) =
      s2exp_get_dlablst_linrest_sharing (loc0, s2e, d3ls, linrest, sharing)
    // end of [val]
    val s2f_sel = s2exp2hnf (s2e_sel)
    val () = trans3_env_add_proplst_vt (loc0, s2ps)
    val d3e_r = d2exp_trdn_xchng (loc0, d2e_r, s2f_sel)
    val _(*err*) = the_effenv_check_ref (d2e_r.d2exp_loc)
  in
    d3exp_xchng_ref (loc0, d3e_l, s2rt, d3ls, d3e_r)
  end // end of [Some_vt]
| ~None_vt () => aux3 (loc0, s2f0, d3e_l, d3ls, d2e_r)
//
end // end of [aux2]

and aux3
(
  loc0: loc_t
, s2f0: s2hnf // left
, d3e_l: d3exp
, d3ls: d3lablst
, d2e_r: d2exp
) : d3exp = let
in
  d3exp_errexp_void (loc0)
end // end of [aux3]

in (* in of [local] *)

implement
d2exp_trup_xchng_deref
  (loc0, d2e_l, d2ls, d2e_r) = let
(*
val () = (
  print "d2exp_trup_deref: d2e_l = "; print_d2exp (d2e_l); print_newline ();
  print "d2exp_trup_deref: d2e_r = "; print_d2exp (d2e_r); print_newline ();
) // end of [val]
*)
val d3e_l = d2exp_trup (d2e_l)
val () = d3exp_open_and_add (d3e_l)
val d3ls = d2lablst_trup (d2ls)
val s2e0 = d3exp_get_type (d3e_l)
val s2f0 = s2exp2hnf_cast (s2e0)
//
in
  aux1 (loc0, s2f0, d3e_l, d3ls, d2e_r)
end // end of [d2exp_trup_xchng_deref]

end // end of [local]

(* ****** ****** *)

local

fn auxerr_wrt_if
  (loc0: loc_t): void = let
  val err = the_effenv_check_wrt (loc0)
in
  if (err > 0) then (
    the_trans3errlst_add (T3E_d2exp_trup_wrt (loc0))
  ) // end of [if]
end // end of [auxerr_wrt]

fun auxerr_lproof
  (d2e: d2exp): void = let
  val () = prerr_error3_loc (d2e.d2exp_loc)
  val () = prerr ": a non-proof left-value is expected."
  val () = prerr_newline ()
in
  the_trans3errlst_add (T3E_d2exp_nonlval (d2e))
end // end of [auxerr_lproof]

fun auxerr_nonlval
  (d2e: d2exp): void = let
  val () = prerr_error3_loc (d2e.d2exp_loc)
  val () = prerr ": a left-value is required but a non-left-value is given."
  val () = prerr_newline ()
in
  the_trans3errlst_add (T3E_d2exp_nonlval (d2e))
end // end of [auxerr_nonlval]

in (* in of [local] *)

(*
** HX-2012-05-04:
** evaluation of [d2e_r] should not involve proofs of views!
*)
implement
d2exp_trup_xchng
  (d2e0) = let
  val loc0 = d2e0.d2exp_loc
  val-D2Exchng (d2e_l, d2e_r) = d2e0.d2exp_node
  val d2lv_l = d2exp_lvalize (d2e_l)
//
in
//
case+ d2lv_l of
| D2LVALvar_mut
    (d2v_l, d2ls) => let
    val d3ls = d2lablst_trup(d2ls)
    val-Some(s2l) = d2var_get_addr(d2v_l)
    var s2rt: s2exp
    val d3e_r =
    s2addr_xchng_deref(loc0, s2l, d3ls, d2e_r, s2rt)
    val ((*if-error*)) = auxerr_wrt_if(loc0)
  in
    d3exp_xchng_var(loc0, d2v_l, s2rt, d3ls, d3e_r)
  end // end of [D2LVALvar_mut]
| D2LVALderef
    (d2e_l, d2ls) => let
    val ((*if-error*)) = auxerr_wrt_if(loc0)
  in
    d2exp_trup_xchng_deref(loc0, d2e_l, d2ls, d2e_r)
  end // end of [D2LVALderef]
//
| D2LVALvar_lin _ => let
    val () = auxerr_lproof(d2e_l) in d3exp_errexp_void(loc0)
  end // end of [_]
| D2LVALviewat _ => let
    val () = auxerr_lproof(d2e_l) in d3exp_errexp_void(loc0)
  end // end of [_]
//
| _ => let
    val () = auxerr_nonlval(d2e_l) in d3exp_errexp_void(loc0)
  end // end of [_]
//
end // end of [d2exp_trup_xchng]

end // end of [local]

(* ****** ****** *)

(* end of [pats_trans3_xchng.dats] *)

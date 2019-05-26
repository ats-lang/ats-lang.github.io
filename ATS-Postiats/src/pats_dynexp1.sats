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
// Start Time: April, 2011
//
(* ****** ****** *)

staload "./pats_basics.sats"
staload "./pats_syntax.sats"
staload "./pats_staexp1.sats"

(* ****** ****** *)
//
staload
LOC = "./pats_location.sats"
typedef loc_t = $LOC.location
//
(* ****** ****** *)

datatype p1at_node =
//
  | P1Tany of () // wildcard: (_) // expandable
  | P1Tany2 of () // wildcard: (_) // non-expandable
//
  | P1Tide of symbol // variable
    // qua: constructor // unqua: variable
  | P1Tdqid of (d0ynq, symbol) // constructor/variable
//
  | P1Tint of (int) // int constant
  | P1Tintrep of string(*rep*) // int constant
  | P1Tchar of char // char constant
  | P1Tfloat of string (*rep*)// floating point constant
  | P1Tstring of string // string constant
//
  | P1Ti0nt of i0nt
  | P1Tf0loat of f0loat
//
  | P1Tempty of () // empty pattern
//
  | P1Tapp_sta of
      (p1at, s1vararglst) // static app
    // end of [P1Tapp_sta]
  | P1Tapp_dyn of // dynamic constructor
      (p1at, loc_t(*arg*), int(*npf*), p1atlst)
    // end of [P1Tapp_dyn]
//
  | P1Tlist of
      (int(*pfarity*), p1atlst) // pattern list
    // end of [P1Tlist]
//
  | P1Ttup of (* boxed/unboxed tuples *)
      (int (*tupknd*), int (*pfarity*), p1atlst)
  | P1Trec of (* boxed/unboxed records *)
      (int (*recknd*), int (*pfarity*), labp1atlst)
  | P1Tlst of (int(*lin*), p1atlst) // list pattern
//
  | P1Tfree of p1at (* freed constructor *)
  | P1Tunfold of p1at (* unfolded constructor *)
//
  | P1Trefas of (symbol, loc_t, p1at) // refvar [as] pattern
//
  | P1Texist of (s1arglst, p1at) // existentially qualified
  | P1Tsvararg of s1vararg (* static argument *)
//
  | P1Tann of (p1at, s1exp(*ann*)) // ascribed pattern
//
  | P1Terrpat of () // HX: for indicating an error
// end of [p1at_node]

and
labp1at_node =
  | LABP1ATomit of ()
  | LABP1ATnorm of (l0ab, p1at)
// end of [labp1at_node]

where p1at = '{
  p1at_loc= loc_t, p1at_node= p1at_node
} (* end of [p1at] *)

and p1atlst = List(p1at)
and p1atopt = Option(p1at)

and labp1at = '{
  labp1at_loc= loc_t, labp1at_node= labp1at_node
} (* end of [labp1at] *)

and labp1atlst = List (labp1at)

(* ****** ****** *)

fun p1at_make
  (loc: loc_t, node: p1at_node): p1at
// end of [p1at_make]

(* ****** ****** *)

fun p1at_any (loc: loc_t): p1at
fun p1at_any2 (loc: loc_t): p1at
//
fun
p1at_ide (_: loc_t, id: symbol): p1at
fun
p1at_dqid
  (loc: loc_t, dq: d0ynq, id: symbol): p1at
//
fun p1at_int (loc: loc_t, int: int): p1at
fun p1at_intrep (loc: loc_t, rep: string): p1at
fun p1at_char (loc: loc_t, c: char): p1at
fun p1at_float (loc: loc_t, rep: string): p1at
fun p1at_string (loc: loc_t, s: string): p1at
//
fun p1at_i0nt (loc: loc_t, x: i0nt): p1at
fun p1at_c0har (loc: loc_t, x: c0har): p1at
fun p1at_f0loat (loc: loc_t, x: f0loat): p1at
fun p1at_s0tring (loc: loc_t, x: s0tring): p1at
//
fun p1at_empty (loc: loc_t): p1at

fun
p1at_app_dyn
(
  loc: loc_t
, p1t: p1at, loc_arg: loc_t, npf: int, p1ts: p1atlst
) : p1at // end of [p1at_app_dyn]
fun
p1at_app_sta
  (loc: loc_t, p1t: p1at, s1as: s1vararglst): p1at
// end of [p1at_app_sta]

fun
p1at_list (loc: loc_t, npf: int, xs: p1atlst): p1at

fun p1at_tup
  (loc: loc_t, knd: int, npf: int, xs: p1atlst): p1at
fun p1at_rec
  (loc: loc_t, knd: int, npf: int, xs: labp1atlst): p1at
fun p1at_lst (loc: loc_t, lin: int, xs: p1atlst): p1at

fun p1at_free (loc: loc_t, p1t: p1at): p1at
fun p1at_unfold (loc: loc_t, p1t: p1at): p1at

fun p1at_refas
  (loc: loc_t, id: symbol, loc_id: loc_t, p1t: p1at): p1at

fun p1at_exist
  (loc: loc_t, arg: s1arglst, p1t: p1at): p1at
fun p1at_svararg (loc: loc_t, arg: s1vararg): p1at

fun p1at_ann (loc: loc_t, p1t: p1at, s1e: s1exp): p1at

fun p1at_errpat (loc: loc_t): p1at

(* ****** ****** *)

fun labp1at_norm
  (loc: loc_t, l: l0ab, p1t: p1at): labp1at
fun labp1at_omit (loc: loc_t): labp1at

(* ****** ****** *)

fun print_p1at (p1t: p1at): void
overload print with print_p1at
fun prerr_p1at (p1t: p1at): void
overload prerr with prerr_p1at
fun fprint_p1at : fprint_type (p1at)
fun fprint_p1atlst : fprint_type (p1atlst)

fun fprint_labp1at : fprint_type (labp1at)
fun fprint_labp1atlst : fprint_type (labp1atlst)

(* ****** ****** *)
//
fun p1at_make_v1al (loc: loc_t, v: v1al): p1at
fun p1at_make_e1xp (loc: loc_t, e: e1xp): p1at
//
fun e1xp_make_p1at (loc: loc_t, p1t: p1at): e1xp
//
(* ****** ****** *)

typedef
i1nvarg = '{
  i1nvarg_loc= loc_t
, i1nvarg_sym= symbol
, i1nvarg_type= s1expopt
} // end of [i1nvarg]

typedef i1nvarglst = List i1nvarg

typedef i1nvresstate = '{
 i1nvresstate_qua= s1qualst, i1nvresstate_arg= i1nvarglst
} // end of [i1nvresstate]

typedef
loopi1nv = '{
  loopi1nv_loc= loc_t
, loopi1nv_qua= s1qualst (* quantifier *)
, loopi1nv_met= s1explstopt (* metric *)
, loopi1nv_arg= i1nvarglst (* argument *)
, loopi1nv_res= i1nvresstate (* result *)
} (* end of [loopi1nv] *)

(* ****** ****** *)
//
fun
i1nvarg_make
  (loc: loc_t, id: symbol, opt: s1expopt): i1nvarg
// end of [i1nvarg_make]
//
fun
i1nvresstate_make
  (s1qs: s1qualst, arg: i1nvarglst): i1nvresstate
//
val i1nvresstate_nil: i1nvresstate
//
(* ****** ****** *)
//
fun
loopi1nv_make
( loc: loc_t
, qua: s1qualst
, met: s1explstopt, arg: i1nvarglst, res: i1nvresstate
) : loopi1nv // end of [loopi1nv_make]
//
fun loopi1nv_nil (loc0: loc_t): loopi1nv // end-of-fun
//
(* ****** ****** *)

typedef intlst = List(int)

(* ****** ****** *)

datatype
d1ecl_node =
  | D1Cnone of ()
  | D1Clist of d1eclist
//
  | D1Cpackname of (Stropt) // HX: #define ATS_PACKNAME ...
//
  | D1Csymintr of (* overloaded symbol intr *)
      i0delst
  | D1Csymelim of (* overloaded symbol elim *)
      i0delst
  | D1Coverload of (i0de, dqi0de, int(*pval*)) // overloading
//
  | D1Ce1xpdef of (symbol, e1xp) // HX: #define
  | D1Ce1xpundef of (symbol, e1xp) // HX: #undef
//
  | D1Cpragma of (e1xplst) // HX: meta-programming
  | D1Ccodegen of (int(*kind*), e1xplst) // HX: meta-programming
//
  | D1Cdatsrts of d1atsrtdeclst // datasorts
  | D1Csrtdefs of s1rtdeflst // sort definitions
//
  | D1Cstacsts of s1tacstlst // static constants
  | D1Cstacons of (int(*knd*), s1taconlst) // static constructors
(*
  | D1Cstavars of s1tavarlst // static variables // HX: removed
*)
  | D1Ctkindef of t1kindef // primitive tkind
  | D1Csexpdefs of (int(*knd*), s1expdeflst) // static definitions
//
  | D1Csaspdec of s1aspdec // static assumption
  | D1Creassume of sqi0de(*abstype*) // static re-assumption
//
  | D1Cexndecs of e1xndeclst // exception constructor declarations
  | D1Cdatdecs of
      (int(*knd*), d1atdeclst, s1expdeflst) // datatype declarations
    // end of [D1Cdatdecs]
//
  | D1Cclassdec of (i0de, s1expopt)
//
  | D1Cextype of (* external type *)
      (string (*name*), s1exp (*definition*))
  | D1Cextype of (* external type *)
      (int(*knd*), string (*name*), s1exp (*definition*))
  | D1Cextvar of (* external variable *)
      (string (*name*), d1exp (*definition*))
//
  | D1Cextcode of (
      int(*knd: 0/1*), int(*pos: 0/1/2: top/?/end*), string(*code*)
    ) // end of [D1Cextcode]
//
  | D1Cdcstdecs of (
      int(*0/1:sta/ext*), dcstkind, q1marglst, d1cstdeclst // dyncst
    ) // end of [D2Cdcstdecs]
//
  | D1Cmacdefs of (int(*knd*), bool(*isrec*), m1acdeflst)
//
  | D1Cimpdec of
      (int(*knd*), i1mparg, i1mpdec) // knd=0/1: implement/primplement
    // end of [D1Cimpdec]
//
  | D1Cfundecs of (funkind, q1marglst, f1undeclst) // function declaration
  | D1Cvaldecs of (valkind, bool(*isrec*), v1aldeclst) // val declarations
  | D1Cvardecs of
      (int(*knd*), v1ardeclst) (* variable declaration *) // knd=0/1:var/prvar
    // end of [D1Cvardecs]
//
  | D1Cinclude of (int(*sta/dyn*), d1eclist) (* file inclusion *)
//
  | D1Cstaload of (* staloading a file *)
      (symbolopt, filename, int(*loadflag*), d1eclist)
  | D1Cstaloadnm of (symbolopt(*alias*), symbol(*nspace*))
  | D1Cstaloadloc of (filename(*pfil*), symbol(*nspace*), d1eclist)
//
  | D1Cdynload of filename (* dynloading a file *)
//
  | D1Clocal of (d1eclist(*head*), d1eclist(*body*)) // local declaration
// end of [d1ecl_node]

and d1exp_node =
//
  | D1Eide of (symbol) // identifiers
  | D1Edqid of (d0ynq, symbol) // qualified identifiers
//
  | D1Eidextapp of (symbol(*id*), d1explst) // id: external
//
  | D1Eint of int // dynamic integers
  | D1Eintrep of string(*rep*) // dynamic integers
  | D1Ebool of bool // boolean constants
  | D1Echar of char // dynamic characters
  | D1Efloat of string(*rep*) (* dynamic floats *)
  | D1Estring of string (* dynamic strings *)
//
  | D1Ei0nt of i0nt // dynamic integers
  | D1Ec0har of c0har // dynamic characters
  | D1Ef0loat of f0loat (* dynamic floats *)
  | D1Es0tring of s0tring (* dynamic strings *)
//
  | D1Etop of () (* uninitialized exp *)
  | D1Eempty of () (* empty expression *)
//
  | D1Ecstsp of cstsp // special constants
//
  | D1Etyrep of s1exp // $tyrep(...)
  | D1Eliteral of d1exp // $literal: int, float, string
//
  | D1Eextval of (s1exp (*type*), string (*name*))
  | D1Eextfcall of // externally named fcall
      (s1exp(*res*), string(*fun*), d1explst(*arg*))
    // end of [D1Eextfcall]
  | D1Eextmcall of // externally named fcall
      (s1exp(*res*), d1exp(*obj*), string(*method*), d1explst(*arg*))
    // end of [D1Eextmcall]
//
  | D1Efoldat of (* fold at a given address *)
      (s1exparglst, d1exp)
  | D1Efreeat of (* free at a given address *)
      (s1exparglst, d1exp)
//
  | D1Etmpid of (dqi0de, t1mpmarglst) (* template instantiation *)
//
  | D1Elet of (d1eclist, d1exp(*body*))
  | D1Ewhere of (d1exp(*body*), d1eclist)
  | D1Edecseq of // = let decs in (*none*) end
      d1eclist (* HX: note that there is no [D2Edecseq] *)
//
  | D1Eapp_dyn of (* dynamic application *)
      (d1exp, loc_t(*arg*), int (*pfarity*), d1explst)
  | D1Eapp_sta of (* static application *)
      (d1exp, s1exparglst)
//
  | D1Esing of (d1exp) // singleton
  | D1Elist of (int(*pfarity*), d1explst) // temporary
//
  | D1Eifhead of
      (i1nvresstate, d1exp, d1exp, d1expopt)
  | D1Esifhead of
      (i1nvresstate, s1exp, d1exp, d1exp(*else*))
//
  | D1Eifcasehd of (i1nvresstate, i1fclist) // for ifcase-expressions
//
  | D1Ecasehead of (* case-expression *)
      (caskind, i1nvresstate, d1explst, c1laulst)
  | D1Escasehead of (i1nvresstate, s1exp, sc1laulst)
//
  | D1Elst of (* dynamic list-expression *)
      (int (*lin*), s1expopt, d1explst)
  | D1Etup of (* dynamic tuple-expression *)
      (int (*tupknd*), int (*pfarity*), d1explst)
  | D1Erec of (* dynamic record-expression *)
      (int (*recknd*), int (*pfarity*), labd1explst) // HX: 0/1: flat/boxed
  | D1Eseq of d1explst // dynamic sequence-expression
//
  | D1Earrsub of (* array subscription *)
      (d1exp, loc_t(*ind*), d1explst(*ind*))
  | D1Earrinit of (* array initialization *)
      (s1exp (*eltyp*), d1expopt (*asz*), d1explst (*elt*))
  | D1Earrpsz of (* arraysize expression *)
      (s1expopt (*element type*), d1explst (*elements*))
//
  | D1Eptrof of d1exp // taking the address of
  | D1Eviewat of d1exp // taking view at a given address
  | D1Eselab of (int(*knd*), d1exp, d1lab)
//
  | D1Eraise of (d1exp) // raised exception
  | D1Eeffmask of (effcst(*eff*), d1exp(*body*)) // $effmask(...)
//
  | D1Evararg of (d1explst) // $vararg for variadicity
//
  | D1Evcopyenv of
      (int(*knd=0/1*), d1exp) // $vcopyenv_v/$vcopyenv_vt
//
  | D1Eshowtype of (d1exp) // $showtype: for debugging
//
  | D1Etempenver of (d1exp) // $tempenver: for environvar
//
  | D1Esexparg of s1exparg (* for temporary use *)
//
  | D1Eexist of (s1exparg, d1exp) // witness-carrying expression
//
  | D1Elam_dyn of (* dynamic abstraction: alloc/init *)
      (int (*lin*), p1at, d1exp)
  | D1Elaminit_dyn of (* dynamic abstraction initialization *)
      (int (*lin*), p1at, d1exp)
  | D1Elam_met of (* metric abstraction *)
      (loc_t (*loc_arg*), s1explst, d1exp)
  | D1Elam_sta_ana of (* static abstraction: analysis *)
      (loc_t (*loc_arg*), s1vararg, d1exp)
  | D1Elam_sta_syn of (* static abstraction: synthesis *)
      (loc_t (*loc_arg*), s1qualst, d1exp)
//
  | D1Efix of // dynamic fixed-point expression
      (int(*knd: 0/1: flat/boxed*), i0de, d1exp)
//
  | D1Edelay of (int(*knd*), d1exp(*body*)) // $delay and $ldelay
//
  | D1Efor of ( // for-loop
      loopi1nv
    , d1exp(*ini*)
    , d1exp(*test*)
    , d1exp(*post*)
    , d1exp(*body*)
    ) // end of [D1Efor]
  | D1Ewhile of (loopi1nv, d1exp, d1exp) // while-loop
//
  | D1Eloopexn of int(*knd*)
//
  | D1Etrywith of (i1nvresstate, d1exp, c1laulst)
//
  | D1Eann_type of (d1exp, s1exp) // ascribed dynexp
  | D1Eann_effc of (d1exp, effcst) // ascribed with effects
  | D1Eann_funclo of (d1exp, funclo) // ascribed with funtype
//
  | D1Emacsyn of (macsynkind, d1exp) // macro syntax
  | D1Emacfun of (symbol(*name*), d1explst) // built-in macfun
//
  | D1Esolassert of (d1exp) // $solver_assert(d1e_prf)
  | D1Esolverify of (s1exp) // $solver_verify(s1e_prop)
//
  | D1Eerrexp of () // HX: placeholder for indicating an error
// end of [d1exp_node]

and d1lab_node =
  | D1LABlab of (label) | D1LABind of (d1explst)
// end of [d1lab_node]

(* ****** ****** *)

where
d1ecl = '{
  d1ecl_loc= loc_t
, d1ecl_node= d1ecl_node
} (* end of [d1ec] *)

and d1eclist = List (d1ecl)

(* ****** ****** *)

and
d1exp = '{
  d1exp_loc= loc_t
, d1exp_node= d1exp_node
}
and d1explst = List (d1exp)
and d1expopt = Option (d1exp)

and labd1exp = dl0abeled (d1exp)
and labd1explst = List (labd1exp)

(* ****** ****** *)

and
d1lab = '{
  d1lab_loc= loc_t
, d1lab_node= d1lab_node
}
and d1lablst = List (d1lab)

(* ****** ****** *)

and
i1fcl = '{
//
  i1fcl_loc= loc_t
//
, i1fcl_test= d1exp, i1fcl_body= d1exp
//
} (* end of [i1fcl] *)

and i1fclist = List(i1fcl)

(* ****** ****** *)

and
gm1at = '{
  gm1at_loc= loc_t
, gm1at_exp= d1exp, gm1at_pat= p1atopt
} // end of [gm1at]

and gm1atlst = List(gm1at)

(* ****** ****** *)

and
c1lau = '{
  c1lau_loc= loc_t
, c1lau_pat= p1at
, c1lau_gua= gm1atlst
, c1lau_seq= int
, c1lau_neg= int
, c1lau_body= d1exp
} // end of [c1lau]

and c1laulst = List(c1lau)

(* ****** ****** *)

and
sc1lau = '{
  sc1lau_loc= loc_t
, sc1lau_pat= sp1at
, sc1lau_body= d1exp
} // end of [sc1lau]

and sc1laulst = List sc1lau

(* ****** ****** *)

and
m1acdef = '{
  m1acdef_loc= loc_t
, m1acdef_sym= symbol
, m1acdef_arg= m1acarglst
, m1acdef_def= d1exp
} // end of [m1acdef]

and m1acdeflst = List m1acdef

(* ****** ****** *)

and
f1undec = '{
  f1undec_loc= loc_t
, f1undec_sym= symbol
, f1undec_sym_loc= loc_t
, f1undec_def= d1exp
, f1undec_ann= witht1ype
} // end of [f1undec]

and f1undeclst = List f1undec

(* ****** ****** *)

and
v1aldec = '{
  v1aldec_loc= loc_t
, v1aldec_pat= p1at
, v1aldec_def= d1exp
, v1aldec_ann= witht1ype
} // end of [v1aldec]

and v1aldeclst = List (v1aldec)

(* ****** ****** *)

and
v1ardec = '{
  v1ardec_loc= loc_t
, v1ardec_knd= int (* knd=0/1:var/ptr *)
, v1ardec_sym= symbol
, v1ardec_sym_loc= loc_t
, v1ardec_pfat= i0deopt // proof of at-view
, v1ardec_type= s1expopt (* type annotation *)
, v1ardec_init= d1expopt // value for initialization
} // end of [v1ardec]

and v1ardeclst = List v1ardec

(* ****** ****** *)

and
i1mpdec = '{
  i1mpdec_loc= loc_t
, i1mpdec_qid= impqi0de
, i1mpdec_tmparg= t1mpmarglst
, i1mpdec_def= d1exp
} // end of [i1mpdec]

(* ****** ****** *)
//
// HX: dynamic expressions
//
(* ****** ****** *)

fun
d1exp_make
  (loc: loc_t, node: d1exp_node): d1exp
// end of [d1exp_make]

(* ****** ****** *)
//
fun
d1exp_ide (loc: loc_t, id: symbol): d1exp
fun
d1exp_opid (loc: loc_t, id: symbol): d1exp
//
fun d1exp_dqid
  (loc: loc_t, dq: d0ynq, id: symbol): d1exp
//
fun d1exp_idext (loc: loc_t, id: symbol): d1exp
fun d1exp_idextapp
  (loc: loc_t, id: symbol, arg: d1explst): d1exp
//
fun d1exp_int (loc: loc_t, i: int): d1exp
fun d1exp_intrep (loc: loc_t, rep: string): d1exp
fun d1exp_char (loc: loc_t, c: char): d1exp
fun d1exp_float (loc: loc_t, rep: string): d1exp
fun d1exp_string (loc: loc_t, str: string): d1exp
//
fun d1exp_i0nt (loc: loc_t, x: i0nt): d1exp
fun d1exp_c0har (loc: loc_t, x: c0har): d1exp
fun d1exp_f0loat (loc: loc_t, x: f0loat): d1exp
fun d1exp_s0tring (loc: loc_t, x: s0tring): d1exp
//
fun d1exp_top (loc: loc_t): d1exp
fun d1exp_empty (loc: loc_t): d1exp
//
(* ****** ****** *)
//
fun
d1exp_cstsp
  (loc: loc_t, x: cstsp): d1exp
//
(* ****** ****** *)
//
fun
d1exp_tyrep
  (loc: loc_t, s1e: s1exp): d1exp
//
(* ****** ****** *)
//
fun
d1exp_literal
  (loc: loc_t, lit: d1exp): d1exp
//
(* ****** ****** *)
//
fun
d1exp_extval
(
  loc: loc_t, _type: s1exp, name: string
) : d1exp // end of [d1exp_extval]
//
fun
d1exp_extfcall
(
  loc: loc_t
, _type: s1exp, _fun: string, _arg: d1explst
) : d1exp // end of [d1exp_extfcall]
fun
d1exp_extmcall
(
  loc: loc_t
, _type: s1exp, _obj: d1exp, _mtd: string, _arg: d1explst
) : d1exp // end of [d1exp_extmcall]
//
(* ****** ****** *)
//
fun
d1exp_foldat
  (loc: loc_t, arg: s1exparglst, d1e: d1exp): d1exp
fun
d1exp_freeat
  (loc: loc_t, arg: s1exparglst, d1e: d1exp): d1exp
//
fun
d1exp_tmpid
  (loc: loc_t, qid: dqi0de, decarg: t1mpmarglst): d1exp
// end of [d1exp_tmpid]

(* ****** ****** *)

fun
d1exp_let
(
  loc: loc_t, d1cs: d1eclist, body: d1exp
) : d1exp // end of [d1exp_let]

fun
d1exp_where
(
  loc: loc_t, body: d1exp, d1cs: d1eclist
) : d1exp // end of [d1exp_where]

(* ****** ****** *)

fun
d1exp_app_sta
(
  loc: loc_t, d1e: d1exp, s1as: s1exparglst
) : d1exp // end of [d1exp_app_sta]

fun
d1exp_app_dyn
(
  loc: loc_t
, d1e: d1exp, loc_arg: loc_t, npf: int, d1es: d1explst
) : d1exp // end of [d1exp_app_dyn]

(* ****** ****** *)
//
fun d1exp_sing
  (loc: loc_t, d1e: d1exp): d1exp
//
fun d1exp_list
  (loc: loc_t, npf: int, d1es: d1explst): d1exp
//
(* ****** ****** *)

fun
d1exp_ifhead
( loc: loc_t
, inv: i1nvresstate
, _cond: d1exp
, _then: d1exp, _else: d1expopt
) : d1exp // end of [d1exp_if]

fun
d1exp_sifhead
( loc: loc_t
, inv: i1nvresstate
, _cond: s1exp, _then: d1exp, _else: d1exp
) : d1exp // end of [d1exp_if]

(* ****** ****** *)

fun
d1exp_ifcasehd
(
  loc: loc_t, inv: i1nvresstate, ifcls: i1fclist
) : d1exp // end of [d1exp_ifcasehd]

(* ****** ****** *)

fun
d1exp_casehead
(
  loc: loc_t
, knd: caskind
, inv: i1nvresstate
, d1es: d1explst, c1las: c1laulst
) : d1exp // end of [d1exp_casehead]

fun
d1exp_scasehead
(
  loc: loc_t
, inv: i1nvresstate
, s1e: s1exp, c1las: sc1laulst
) : d1exp // end of [d1exp_scasehead]

(* ****** ****** *)

fun d1exp_lst (
  loc: loc_t, knd: int, elt: s1expopt, d1es: d1explst
) : d1exp // end of [d1exp_lst]
fun d1exp_tup (
  loc: loc_t, knd: int, npf: int, d1es: d1explst
) : d1exp // end of [d1exp_tup]
fun d1exp_rec (
  loc: loc_t, knd: int, npf: int, ld1es: labd1explst
) : d1exp // end of [d1exp_rec]
fun d1exp_seq (loc: loc_t, d1es: d1explst): d1exp

(* ****** ****** *)

fun d1exp_arrsub
(
  loc: loc_t, arr: d1exp, ind: loc_t, ind: d1explst
) : d1exp // end of [d1exp_arrsub]

fun d1exp_arrpsz
  (loc: loc_t, elt: s1expopt, d1es: d1explst): d1exp
// end of [d1exp_arrpsz]

fun d1exp_arrinit (
  loc: loc_t, elt: s1exp, asz: d1expopt, d1es: d1explst
) : d1exp // end of [d1exp_arrinit]

(* ****** ****** *)
//
fun
d1exp_sexparg
  (loc: loc_t, s1a: s1exparg): d1exp
//
fun
d1exp_exist
  (loc: loc_t, s1a: s1exparg, d1e: d1exp): d1exp
//
(* ****** ****** *)
//
fun
d1exp_selab
  (loc: loc_t, kind: int, root: d1exp, lab: d1lab): d1exp
// end of [d1exp_selab]
//
(* ****** ****** *)

fun d1exp_ptrof (loc: loc_t, d1e: d1exp): d1exp
fun d1exp_viewat (loc: loc_t, d1e: d1exp): d1exp

(* ****** ****** *)
//
fun d1exp_raise (loc: loc_t, d1e: d1exp): d1exp
//
(* ****** ****** *)
//
fun
d1exp_effmask
  (loc: loc_t, eff: effcst, d1e: d1exp): d1exp
//
fun
d1exp_effmask_arg
( loc: loc_t
, knd(*ntm,exn,wrt,ref*): int, d1e: d1exp): d1exp
//
(* ****** ****** *)
//
fun
d1exp_vararg(loc: loc_t, d1es: d1explst): d1exp
//
(* ****** ****** *)
//
fun d1exp_vcopyenv
  (loc: loc_t, knd(*0/1*): int, d1e: d1exp): d1exp
//
(* ****** ****** *)

fun d1exp_showtype(loc: loc_t, d1e: d1exp): d1exp

(* ****** ****** *)

fun d1exp_tempenver (loc: loc_t, d1e: d1exp): d1exp

(* ****** ****** *)
//
fun
d1exp_lam_dyn
  (loc: loc_t, lin: int, arg: p1at, body: d1exp): d1exp
//
fun
d1exp_laminit_dyn
  (loc: loc_t, lin: int, arg: p1at, body: d1exp): d1exp
//
(* ****** ****** *)

fun
d1exp_lam_met
(
  loc: loc_t, loc_arg: loc_t, met: s1explst, body: d1exp
) : d1exp // end of [d1exp_lam_met]

fun
d1exp_lam_sta_ana
(
  loc: loc_t, loc_arg: loc_t, arg: s1vararg, body: d1exp
) : d1exp // end of [d1exp_lam_sta_ana]

fun
d1exp_lam_sta_syn
(
  loc: loc_t, loc_arg: loc_t, arg: s1qualst, body: d1exp
) : d1exp // end of [d1exp_lam_sta_syn]

fun d1exp_fix
  (loc: loc_t, knd: int, id: i0de, d1e: d1exp): d1exp
// end of [d1exp_fix]

(* ****** ****** *)

fun d1exp_delay (loc: loc_t, knd: int, d1e: d1exp): d1exp

(* ****** ****** *)

fun
d1exp_trywith
(
  loc: loc_t, inv: i1nvresstate, d1e: d1exp, handler: c1laulst
) : d1exp // end of [d1exp_trywith]

(* ****** ****** *)

fun d1exp_for (
  loc: loc_t
, inv: loopi1nv
, init: d1exp, test: d1exp, post: d1exp, body: d1exp
) : d1exp // end of [d1exp_for]

fun d1exp_while (
  loc: loc_t, inv: loopi1nv, test: d1exp, body: d1exp
) : d1exp // end of [d1exp_while]

fun d1exp_loopexn (loc: loc_t, knd: int): d1exp

(* ****** ****** *)
//
fun
d1exp_ann_type
  (loc: loc_t, d1e: d1exp, s1e: s1exp): d1exp
fun
d1exp_ann_effc
  (loc: loc_t, d1e: d1exp, efc: effcst): d1exp
fun
d1exp_ann_funclo
  (loc: loc_t, d1e: d1exp, fc0: funclo): d1exp
fun
d1exp_ann_funclo_opt
  (loc: loc_t, d1e: d1exp, fc0: funclo): d1exp
//
(* ****** ****** *)
//
fun
d1exp_macsyn
  (loc: loc_t, knd: macsynkind, d1e: d1exp): d1exp
//
fun
d1exp_macfun
  (loc: loc_t, name: symbol, d1es: d1explst): d1exp
//
(* ****** ****** *)
//
fun
d1exp_solassert
  (loc: loc_t, d1e_prf: d1exp): d1exp
fun
d1exp_solverify
  (loc: loc_t, s1e_prop: s1exp): d1exp
//
(* ****** ****** *)
//
fun
d1exp_errexp (loc: loc_t): d1exp // indicating error
//
(* ****** ****** *)

fun print_d1exp (x: d1exp): void
overload print with print_d1exp
fun prerr_d1exp (x: d1exp): void
overload prerr with prerr_d1exp
fun fprint_d1exp : fprint_type (d1exp)
overload fprint with fprint_d1exp

fun fprint_d1explst : fprint_type (d1explst)
overload fprint with fprint_d1explst

fun fprint_d1expopt : fprint_type (d1expopt)

(* ****** ****** *)

fun labd1exp_make (l: l0ab, d1e: d1exp): labd1exp

fun fprint_labd1exp : fprint_type (labd1exp)
fun fprint_labd1explst : fprint_type (labd1explst)

(* ****** ****** *)

fun d1exp_is_metric (d1e: d1exp): bool

(* ****** ****** *)
//
fun d1exp_make_v1al (loc: loc_t, v: v1al): d1exp
fun d1exp_make_e1xp (loc: loc_t, e: e1xp): d1exp
//
fun e1xp_make_d1exp (loc: loc_t, d1e: d1exp): e1xp
//
(* ****** ****** *)

fun d1lab_lab (loc: loc_t, lab: label): d1lab
fun d1lab_ind (loc: loc_t, ind: d1explst): d1lab

fun fprint_d1lab : fprint_type (d1lab)

(* ****** ****** *)
//
fun
i1fcl_make
(
  loc: loc_t, test: d1exp, body: d1exp
) : i1fcl // end of [i1fcl_make]
//
(* ****** ****** *)
//
fun gm1at_make
  (loc: loc_t, d1e: d1exp, opt: p1atopt): gm1at
// end of [gm1at_make]
//
fun
c1lau_make
(
  loc: loc_t
, pat: p1at
, gua: gm1atlst, seq: int, neg: int, body: d1exp
) : c1lau // end of [c1lau_make]
//
fun sc1lau_make
  (loc: loc_t, pat: sp1at, body: d1exp): sc1lau
// end of [sc1lau_make]
//
(* ****** ****** *)
//
// HX: for various itemized declarations
//
(* ****** ****** *)

fun
m1acdef_make
(
  loc: loc_t
, ide: symbol, arg: m1acarglst, def: d1exp
) : m1acdef // end of [m1acdef_make]

(* ****** ****** *)
//
fun
v1aldec_make
( loc: loc_t
, pat: p1at, def: d1exp, typ: witht1ype): v1aldec
// end of [v1aldec_make]
//
(* ****** ****** *)
//
fun
f1undec_make
( loc: loc_t
, ide: symbol, loc_id: loc_t, def: d1exp, typ: witht1ype
) : f1undec // end of [f1undec_make]
//
(* ****** ****** *)

fun v1ardec_make
( loc: loc_t
, knd: int (*BANG: knd = 1*)
, id: symbol, loc_id: loc_t
, pfat: i0deopt, type: s1expopt, init: d1expopt
) : v1ardec // end of [v1ardec_make]

(* ****** ****** *)

fun
i1mpdec_make
( loc: loc_t
, qid: impqi0de, tmparg: t1mpmarglst, def: d1exp
) : i1mpdec // end of [i1mpdec_make]

(* ****** ****** *)
//
// HX: declarations
//
(* ****** ****** *)

fun d1ecl_none (loc: loc_t): d1ecl
fun d1ecl_list (loc: loc_t, ds: d1eclist): d1ecl

(* ****** ****** *)

fun d1ecl_packname (opt: Stropt): d1ecl

(* ****** ****** *)

fun d1ecl_symintr (loc: loc_t, ids: i0delst): d1ecl
fun d1ecl_symelim (loc: loc_t, ids: i0delst): d1ecl

(* ****** ****** *)

fun d1ecl_overload
  (loc: loc_t, id: i0de, qid: dqi0de, pval: int): d1ecl
// end of [d1ecl_overload]

(* ****** ****** *)
//
fun
d1ecl_e1xpdef(loc: loc_t, id: symbol, def: e1xp): d1ecl
fun
d1ecl_e1xpundef(loc: loc_t, id: symbol, def: e1xp): d1ecl
//
(* ****** ****** *)
//
fun
d1ecl_pragma(loc: loc_t, e1xps: e1xplst): d1ecl
fun
d1ecl_codegen(loc: loc_t, knd: int, xs: e1xplst): d1ecl
//
(* ****** ****** *)
//
fun
d1ecl_datsrts
  (loc: loc_t, ds: d1atsrtdeclst): d1ecl
//
fun
d1ecl_srtdefs(loc: loc_t, ds: s1rtdeflst): d1ecl
//
(* ****** ****** *)
//
fun
d1ecl_stacsts(loc: loc_t, ds: s1tacstlst): d1ecl
fun
d1ecl_stacons(loc: loc_t, knd: int, ds: s1taconlst): d1ecl
//
(*
fun
d1ecl_stavars (loc: loc_t, ds: s1tavarlst): d1ecl
*)
//
(* ****** ****** *)
//
fun
d1ecl_tkindef
  (loc: loc_t, d0: t1kindef): d1ecl
//
fun
d1ecl_sexpdefs
  (loc: loc_t, knd: int, ds: s1expdeflst): d1ecl
// end of [d1ecl_sexpdefs]
//
(* ****** ****** *)
//
fun
d1ecl_saspdec(loc: loc_t, d0: s1aspdec): d1ecl
//
fun
d1ecl_reassume(loc: loc_t, qid: sqi0de): d1ecl
//
(* ****** ****** *)
//
fun
d1ecl_exndecs
  (loc: loc_t, ds: e1xndeclst): d1ecl
//
fun
d1ecl_datdecs
(
  loc: loc_t
, knd: int, ds1: d1atdeclst, ds2: s1expdeflst
) : d1ecl // end of [d1ecl_datdecs]
//
fun
d1ecl_classdec
  (loc: loc_t, id: i0de, sup: s1expopt): d1ecl
//
(* ****** ****** *)

fun
d1ecl_dcstdecs
(
  loc: loc_t
, knd: int(*0/1:sta/ext*)
, dck: dcstkind, qarg: q1marglst, d1cs: d1cstdeclst
) : d1ecl // end of [d1ecl_dcstdecs]

fun d1ecl_extype (
  loc: loc_t, name: string, def: s1exp
) : d1ecl // end of [d1ecl_extype]
fun d1ecl_extype2 (
  loc: loc_t, knd: int, name: string, def: s1exp
) : d1ecl // end of [d1ecl_extype]
fun d1ecl_extvar (
  loc: loc_t, name: string, def: d1exp
) : d1ecl // end of [d1ecl_extvar]
fun d1ecl_extcode (
  loc: loc_t, knd: int, pos: int, code: string
) : d1ecl // end of [d1ecl_extcode]

(* ****** ****** *)

fun
d1ecl_macdefs
(
  loc: loc_t, knd: int, isrec: bool, m1ds: m1acdeflst
) : d1ecl // end of [d1ecl_macdefs]

(* ****** ****** *)

fun
d1ecl_impdec
(
  loc: loc_t, knd: int, imparg: i1mparg, d1c: i1mpdec
) : d1ecl // end of [d1ecl_impdec]

(* ****** ****** *)

fun
d1ecl_fundecs
(
  loc: loc_t
, knd: funkind, qarg: q1marglst, f1ds: f1undeclst
) : d1ecl // end of [d1ecl_fundecs]

fun d1ecl_valdecs
(
  loc: loc_t, knd: valkind, isrec: bool, v1ds: v1aldeclst
) : d1ecl // end of [d1ecl_valdecs]

fun d1ecl_vardecs
  (loc: loc_t, knd: int, v1ds: v1ardeclst): d1ecl

(* ****** ****** *)

fun d1ecl_include
  (loc: loc_t, stadyn: int, ds: d1eclist): d1ecl
// end of [d1ecl_include]

(* ****** ****** *)
//
fun
d1ecl_staload
(
  loc: loc_t
, idopt: symbolopt
, cfil: filename, ldflag: int, d1cs: d1eclist
) : d1ecl // end of [d1ecl_staload]
//
fun d1ecl_staloadnm
  (loc: loc_t, alias: symbolopt, nspace: symbol): d1ecl
fun d1ecl_staloadloc
  (loc: loc_t, pfil: filename, nspace: symbol, d1cs: d1eclist): d1ecl
//
(* ****** ****** *)
//
fun
d1ecl_dynload(loc: loc_t, fil: filename): d1ecl
//
(* ****** ****** *)
//
fun d1ecl_local
  (loc: loc_t, ds1: d1eclist, ds2: d1eclist): d1ecl
//
(* ****** ****** *)

fun print_d1ecl (x: d1ecl): void
fun prerr_d1ecl (x: d1ecl): void
fun fprint_d1ecl : fprint_type (d1ecl)

fun fprint_d1eclist : fprint_type (d1eclist)

(* ****** ****** *)

(* end of [pats_dynexp1.sats] *)

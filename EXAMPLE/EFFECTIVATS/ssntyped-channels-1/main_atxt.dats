(*
main.atxt: 1(line=1, offs=1) -- 42(line=3, offs=3)
*)

#include "./../ATEXT/atextfun.hats"

(*
main.atxt: 206(line=13, offs=2) -- 222(line=13, offs=18)
*)
val __tok1 = patscode_style()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
main.atxt: 870(line=42, offs=2) -- 950(line=44, offs=3)
*)
val __tok2 = pats2xhtml_sats("\
typedef P_ssn = chsnd(int)::chsnd(int)::chrcv(bool)::chnil
")
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
main.atxt: 1238(line=55, offs=2) -- 1318(line=57, offs=3)
*)
val __tok3 = pats2xhtml_sats("\
typedef Q_ssn = chrcv(int)::chrcv(int)::chsnd(bool)::chnil
")
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
main.atxt: 1797(line=69, offs=44) -- 1815(line=69, offs=62)
*)
val __tok4 = stacode("chanpos")
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
main.atxt: 1821(line=70, offs=2) -- 1839(line=70, offs=20)
*)
val __tok5 = stacode("channeg")
val () = theAtextMap_insert_str ("__tok5", __tok5)

(*
main.atxt: 2018(line=77, offs=2) -- 2173(line=80, offs=3)
*)
val __tok6 = pats2xhtml_sats("\
absvtype chanpos(ssn:type) // absvtype means linear abstype in ATS
absvtype channeg(ssn:type) // absvtype means linear abstype in ATS
")
val () = theAtextMap_insert_str ("__tok6", __tok6)

(*
main.atxt: 2254(line=84, offs=7) -- 2279(line=84, offs=32)
*)
val __tok7 = stacode("channeg(Q_ssn)")
val () = theAtextMap_insert_str ("__tok7", __tok7)

(*
main.atxt: 2286(line=84, offs=39) -- 2311(line=84, offs=64)
*)
val __tok8 = stacode("channeg(P_ssn)")
val () = theAtextMap_insert_str ("__tok8", __tok8)

(*
main.atxt: 2372(line=85, offs=56) -- 2397(line=85, offs=81)
*)
val __tok9 = stacode("chanpos(Q_ssn)")
val () = theAtextMap_insert_str ("__tok9", __tok9)

(*
main.atxt: 2624(line=96, offs=2) -- 2973(line=115, offs=3)
*)
val __tok10 = pats2xhtml_sats("\
//
fun
chanpos_send
  {a:vt0p}{ss:type}
(
  chp: !chanpos(chsnd(a)::ss) >> chanpos(ss), x: a
) : void // end-of-function
//
fun
channeg_recv
  {a:vt0p}{ss:type}
(
  chn: !channeg(chrcv(a)::ss) >> channeg(ss), x: a
) : void // end-of-function
//
overload channel_send with chanpos_send
overload channel_send with channeg_recv
//
")
val () = theAtextMap_insert_str ("__tok10", __tok10)

(*
main.atxt: 2996(line=118, offs=12) -- 3019(line=118, offs=35)
*)
val __tok11 = dyncode("chanpos_send")
val () = theAtextMap_insert_str ("__tok11", __tok11)

(*
main.atxt: 3072(line=119, offs=16) -- 3095(line=119, offs=39)
*)
val __tok12 = dyncode("channeg_recv")
val () = theAtextMap_insert_str ("__tok12", __tok12)

(*
main.atxt: 3171(line=120, offs=48) -- 3194(line=120, offs=71)
*)
val __tok13 = dyncode("channel_send")
val () = theAtextMap_insert_str ("__tok13", __tok13)

(*
main.atxt: 3361(line=130, offs=2) -- 3638(line=145, offs=3)
*)
val __tok14 = pats2xhtml_sats("\
//
fun
chanpos_recv
  {a:vt0p}{ss:type}
  (!chanpos(chrcv(a)::ss) >> chanpos(ss)): a
//
fun
channeg_send
  {a:vt0p}{ss:type}
  (!channeg(chsnd(a)::ss) >> channeg(ss)): a
//
overload channel_recv with chanpos_recv
overload channel_recv with channeg_send
//
")
val () = theAtextMap_insert_str ("__tok14", __tok14)

(*
main.atxt: 3661(line=148, offs=12) -- 3684(line=148, offs=35)
*)
val __tok15 = dyncode("chanpos_recv")
val () = theAtextMap_insert_str ("__tok15", __tok15)

(*
main.atxt: 3739(line=149, offs=16) -- 3762(line=149, offs=39)
*)
val __tok16 = dyncode("channeg_send")
val () = theAtextMap_insert_str ("__tok16", __tok16)

(*
main.atxt: 3840(line=150, offs=48) -- 3863(line=150, offs=71)
*)
val __tok17 = dyncode("channel_recv")
val () = theAtextMap_insert_str ("__tok17", __tok17)

(*
main.atxt: 4015(line=160, offs=2) -- 4235(line=170, offs=3)
*)
val __tok18 = pats2xhtml_sats("\
//
fun
chanpos_nil_wait (chp: chanpos(chnil)): void
fun
channeg_nil_close (chn: channeg(chnil)): void
//
overload channel_close with chanpos_nil_wait
overload channel_close with channeg_nil_close
//
")
val () = theAtextMap_insert_str ("__tok18", __tok18)

(*
main.atxt: 4258(line=173, offs=12) -- 4285(line=173, offs=39)
*)
val __tok19 = dyncode("chanpos_nil_wait")
val () = theAtextMap_insert_str ("__tok19", __tok19)

(*
main.atxt: 4327(line=174, offs=16) -- 4355(line=174, offs=44)
*)
val __tok20 = dyncode("channeg_nil_close")
val () = theAtextMap_insert_str ("__tok20", __tok20)

(*
main.atxt: 4421(line=175, offs=40) -- 4448(line=175, offs=67)
*)
val __tok21 = dyncode("chanpos_nil_wait")
val () = theAtextMap_insert_str ("__tok21", __tok21)

(*
main.atxt: 4525(line=177, offs=5) -- 4553(line=177, offs=33)
*)
val __tok22 = dyncode("channeg_nil_close")
val () = theAtextMap_insert_str ("__tok22", __tok22)

(*
main.atxt: 4635(line=178, offs=48) -- 4659(line=178, offs=72)
*)
val __tok23 = dyncode("channel_close")
val () = theAtextMap_insert_str ("__tok23", __tok23)

(*
main.atxt: 4907(line=186, offs=10) -- 4931(line=186, offs=34)
*)
val __tok24 = dyncode("channpos_recv")
val () = theAtextMap_insert_str ("__tok24", __tok24)

(*
main.atxt: 5046(line=188, offs=10) -- 5070(line=188, offs=34)
*)
val __tok25 = dyncode("channpos_send")
val () = theAtextMap_insert_str ("__tok25", __tok25)

(*
main.atxt: 5253(line=198, offs=2) -- 5707(line=227, offs=3)
*)
val __tok26 = pats2xhtml_dats("\
(* ****** ****** *)

fun
P (
  i1: int, i2: int
, chn: channeg(Q_ssn)
) : bool = lt where
{
  val () = channel_send(chn, i1)
  val () = channel_send(chn, i2)
  val lt = channel_recv(chn)
  val () = channel_close(chn)
}

(* ****** ****** *)

fun
Q (
  chp: chanpos(Q_ssn)
) : void =
{
  val i1 = channel_recv(chp)
  val i2 = channel_recv(chp)
  val () = channel_send(chp, i1 < i2)
  val () = channel_close(chp)
}

(* ****** ****** *)
")
val () = theAtextMap_insert_str ("__tok26", __tok26)

(*
main.atxt: 5929(line=233, offs=11) -- 5954(line=233, offs=36)
*)
val __tok27 = dyncode("channel_create")
val () = theAtextMap_insert_str ("__tok27", __tok27)

(*
main.atxt: 6005(line=237, offs=2) -- 6109(line=241, offs=3)
*)
val __tok28 = pats2xhtml_sats("\
fun
channeg_create{ss:type}
  (fserv: chanpos(ss) -<lincloptr1> void): channeg(ss)
")
val () = theAtextMap_insert_str ("__tok28", __tok28)

(*
main.atxt: 6201(line=244, offs=19) -- 6217(line=244, offs=35)
*)
val __tok29 = dyncode("fserv")
val () = theAtextMap_insert_str ("__tok29", __tok29)

(*
main.atxt: 7079(line=264, offs=2) -- 7102(line=264, offs=25)
*)
val __tok30 = dyncode("chanpos_recv")
val () = theAtextMap_insert_str ("__tok30", __tok30)

(*
main.atxt: 7413(line=276, offs=2) -- 7595(line=286, offs=3)
*)
val __tok31 = pats2xhtml_sats("\
//
vtypedef
chanpos_nil = chanpos(chnil)
vtypedef
channeg_nil = channeg(chnil)
//
fun chanpos1_close(chanpos_nil): void
fun channeg1_close(channeg_nil): void
//
")
val () = theAtextMap_insert_str ("__tok31", __tok31)

(*
main.atxt: 7810(line=299, offs=2) -- 8635(line=342, offs=3)
*)
val __tok32 = pats2xhtml_sats("\
//
typedef
chpcont0(ss:type) = (chanpos(ss)) -<cloref1> void
typedef
chncont0(ss:type) = (channeg(ss)) -<cloref1> void
//
typedef
chpcont1(ss:type, a:t0p) = (chanpos(ss), a) -<cloref1> void
typedef
chncont1(ss:type, a:t0p) = (channeg(ss), a) -<cloref1> void
//
typedef chpcont0_nil = chpcont0(chnil)
typedef chncont0_nil = chncont0(chnil)
//
fun
chanpos1_send
  {a:t0p}{ss:type}
(
  chanpos(chsnd(a)::ss), x0: a, k0: chpcont0(ss)
) : void // end-of-fun
//
fun
chanpos1_recv
  {a:t0p}{ss:type}
(
  chanpos(chrcv(a)::ss), k0: chpcont1(ss, chmsg(a))
) : void // end-of-fun
//
fun
channeg1_recv
  {a:t0p}{ss:type}
(
  channeg(chrcv(a)::ss), x0: a, k0: chncont0(ss)
) : void // end-of-fun
//
fun
channeg1_send
  {a:t0p}{ss:type}
(
  channeg(chsnd(a)::ss), k0: chncont1(ss, chmsg(a))
) : void // end-of-fun
//
")
val () = theAtextMap_insert_str ("__tok32", __tok32)

(*
main.atxt: 8669(line=344, offs=27) -- 8688(line=344, offs=46)
*)
val __tok33 = stacode("chmsg(T)")
val () = theAtextMap_insert_str ("__tok33", __tok33)

(*
main.atxt: 8787(line=346, offs=11) -- 8811(line=346, offs=35)
*)
val __tok34 = dyncode("chanpos1_send")
val () = theAtextMap_insert_str ("__tok34", __tok34)

(*
main.atxt: 9050(line=350, offs=11) -- 9074(line=350, offs=35)
*)
val __tok35 = dyncode("chanpos1_recv")
val () = theAtextMap_insert_str ("__tok35", __tok35)

(*
main.atxt: 9327(line=354, offs=19) -- 9351(line=354, offs=43)
*)
val __tok36 = dyncode("channeg1_send")
val () = theAtextMap_insert_str ("__tok36", __tok36)

(*
main.atxt: 9357(line=355, offs=2) -- 9381(line=355, offs=26)
*)
val __tok37 = dyncode("channeg1_recv")
val () = theAtextMap_insert_str ("__tok37", __tok37)

(*
main.atxt: 9443(line=361, offs=22) -- 9455(line=361, offs=34)
*)
val __tok38 = dyncode("P")
val () = theAtextMap_insert_str ("__tok38", __tok38)

(*
main.atxt: 9461(line=361, offs=40) -- 9473(line=361, offs=52)
*)
val __tok39 = dyncode("Q")
val () = theAtextMap_insert_str ("__tok39", __tok39)

(*
main.atxt: 9535(line=366, offs=2) -- 10384(line=424, offs=3)
*)
val __tok40 = pats2xhtml_dats("\
(* ****** ****** *)

fun
P (
  i1: int, i2: int
, chn: channeg(Q_ssn)
) : void = (
//
channeg1_recv
( chn, i1
, lam(chn) =>
  channeg1_recv
  ( chn, i2
  , lam(chn) =>
    channeg1_send
    ( chn
    , lam(chn, lt) => let
      val lt = chmsg_parse<bool>(lt)
      (*
      // Some code for processing [lt]
      *)
      in
        channeg1_close(chn)
      end
    )
  ) 
)
//
) (* end of [P] *)

(* ****** ****** *)

fun
Q (
  chp: chanpos(Q_ssn)
) : void = (
//
chanpos1_recv
( chp
, lam(chp, i1) => let
  val i1 = chmsg_parse<int>(i1) in
  chanpos1_recv
  ( chp
  , lam(chp, i2) => let
    val i2 = chmsg_parse<int>(i2) in
    chanpos1_send
    ( chp, i1 < i2
    , lam(chp) => chanpos1_close(chp)
    )
    end // end-of-let // end-of-lam
  )
  end // end-of-let // end-of-lam
)
//
) (* end of [Q] *)

(* ****** ****** *)
")
val () = theAtextMap_insert_str ("__tok40", __tok40)

(*
main.atxt: 10403(line=426, offs=12) -- 10425(line=426, offs=34)
*)
val __tok41 = dyncode("chmsg_parse")
val () = theAtextMap_insert_str ("__tok41", __tok41)

(*
main.atxt: 10601(line=433, offs=38) -- 10613(line=433, offs=50)
*)
val __tok42 = dyncode("P")
val () = theAtextMap_insert_str ("__tok42", __tok42)

(*
main.atxt: 10619(line=433, offs=56) -- 10631(line=433, offs=68)
*)
val __tok43 = dyncode("Q")
val () = theAtextMap_insert_str ("__tok43", __tok43)

(*
main.atxt: 10898(line=445, offs=14) -- 10931(line=445, offs=47)
*)
val __tok44 = filename("introxmpl1_prctl.sats")
val () = theAtextMap_insert_str ("__tok44", __tok44)

(*
main.atxt: 11126(line=449, offs=2) -- 11160(line=449, offs=36)
*)
val __tok45 = filename("introxmpl1_client.dats")
val () = theAtextMap_insert_str ("__tok45", __tok45)

(*
main.atxt: 11166(line=450, offs=2) -- 11200(line=450, offs=36)
*)
val __tok46 = filename("introxmpl1_server.dats")
val () = theAtextMap_insert_str ("__tok46", __tok46)

(*
main.atxt: 11224(line=451, offs=2) -- 11258(line=451, offs=36)
*)
val __tok47 = filename("introxmpl1_client.dats")
val () = theAtextMap_insert_str ("__tok47", __tok47)

(*
main.atxt: 11286(line=452, offs=2) -- 11298(line=452, offs=14)
*)
val __tok48 = dyncode("P")
val () = theAtextMap_insert_str ("__tok48", __tok48)

(*
main.atxt: 11444(line=454, offs=22) -- 11478(line=454, offs=56)
*)
val __tok49 = filename("introxmpl1_client.dats")
val () = theAtextMap_insert_str ("__tok49", __tok49)

(*
main.atxt: 11515(line=455, offs=24) -- 11527(line=455, offs=36)
*)
val __tok50 = dyncode("Q")
val () = theAtextMap_insert_str ("__tok50", __tok50)

(*
main.atxt: 11777(line=468, offs=1) -- 11846(line=470, offs=3)
*)

implement main () = fprint_filsub (stdout_ref, "main_atxt.txt")


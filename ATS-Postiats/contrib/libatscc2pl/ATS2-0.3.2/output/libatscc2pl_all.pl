######
#
# Time of Generation:
# Sat Mar 25 11:24:24 EDT 2017
#
######

######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [basics_cats.pl]
######

############################################

sub
ATSCKiseqz($) { return ($_[0] == 0); }
sub
ATSCKisneqz($) { return ($_[0] != 0); }

############################################

sub
ATSCKptrisnull($) { return ($_[0] == 0); }
sub
ATSCKptriscons($) { return ($_[0] != 0); }

############################################

sub
ATSCKpat_int($$) { return ($_[0] == $_[1]); }
sub
ATSCKpat_bool($$) { return ($_[0] == $_[1]); }
sub
ATSCKpat_char($$) { return ($_[0] == $_[1]); }
sub
ATSCKpat_float($$) { return ($_[0] == $_[1]); }

############################################
#
sub
ATSCKpat_con0($$)
  { return ($_[0] == $_[1]); }
sub
ATSCKpat_con1($$)
  { my $con = $_[0]; return ($con->[0] == $_[1]); }
#
############################################
#
sub
ATSINScaseof_fail($)
{
STDERR->printflush("ATSINScaseof_fail:$_[0]"); exit(1); return;
}
#
sub
ATSINSdeadcode_fail()
  { STDERR->printflush("ATSINSdeadcode_fail"); exit(1); return; }
#
############################################
#
sub
ATSPMVempty(){ return; }
#
############################################

sub
ATSPMVlazyval($){ return [0, $_[0]]; }

############################################

sub
ATSPMVlazyval_eval($)
{
#
  my($lazyval) = @_;
  my($flag);
  my($mythunk);
#
  $flag = $lazyval->[0];
#
  if($flag==0)
  {
    $lazyval->[0] = 1;
    $mythunk = $lazyval->[1];
    $lazyval->[1] = &{$mythunk->[0]}($mythunk);
  } else {
    $lazyval->[0] = $flag + 1;
  } #end-of-[if]
  return ($lazyval->[1]);
#
} #end-of-[ATSPMVlazyval_eval]

############################################

sub
ATSPMVllazyval($){ return $_[0]; }

############################################
#
sub
ATSPMVllazyval_eval($)
{
  my($lazyval) = @_;
  return &{$lazyval->[0]}($lazyval, 1);
}
#
sub
atspre_lazy_vt_free($)
{
  my($lazyval) = @_;
  return &{$lazyval->[0]}($lazyval, 0);
}
#
############################################

sub
ats2plpre_lazy2cloref($) { return $_[0]->[1]; }

############################################
#
sub
ats2plpre_assert_bool0($)
{
  my($tfv) = @_;
  if (!$tfv) { exit(1); }
  return;
}
sub
ats2plpre_assert_bool1($$)
{
  ats2plpre_assert_bool0($_[0]); return;
}
#
sub
ats2plpre_assert_errmsg_bool0($$)
{
  my($tfv, $errmsg) = @_;
  if (!$tfv) { STDERR->printflush($errmsg); exit(1); }
  return;
}
sub
ats2plpre_assert_errmsg_bool1($$)
{
  ats2plpre_assert_errmsg_bool0($_[0], $_[1]); return;
}
#
############################################

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [basics_cats.js]
######
######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [integer_cats.pl]
######

############################################

sub
ats2plpre_abs_int0($) { return abs($_[0]); }
sub
ats2plpre_neg_int0($) { return ( -($_[0]) ); }

############################################

sub
ats2plpre_succ_int0($) { return ($_[0] + 1); }
sub
ats2plpre_pred_int0($) { return ($_[0] - 1); }

############################################

sub
ats2plpre_add_int0_int0($$) { return ($_[0] + $_[1]); }
sub
ats2plpre_sub_int0_int0($$) { return ($_[0] - $_[1]); }
sub
ats2plpre_mul_int0_int0($$) { return ($_[0] * $_[1]); }
sub
ats2plpre_div_int0_int0($$) { return int($_[0] / $_[1]); }
sub
ats2plpre_mod_int0_int0($$) { return ($_[0] % $_[1]); }

############################################
#
sub
ats2plpre_add_int1_int1($$) { return ($_[0] + $_[1]); }
sub
ats2plpre_sub_int1_int1($$) { return ($_[0] - $_[1]); }
sub
ats2plpre_mul_int1_int1($$) { return ($_[0] * $_[1]); }
sub
ats2plpre_div_int1_int1($$) { return int($_[0] / $_[1]); }
#
sub
ats2plpre_mod_int1_int1($$) { return ($_[0] % $_[1]); }
sub
ats2plpre_nmod_int1_int1($$) { return ($_[0] % $_[1]); }
#
############################################

sub
ats2plpre_lt_int0_int0($$) { return ($_[0] < $_[1]); }
sub
ats2plpre_lte_int0_int0($$) { return ($_[0] <= $_[1]); }
sub
ats2plpre_gt_int0_int0($$) { return ($_[0] > $_[1]); }
sub
ats2plpre_gte_int0_int0($$) { return ($_[0] >= $_[1]); }
sub
ats2plpre_eq_int0_int0($$) { return ($_[0] == $_[1]); }
sub
ats2plpre_neq_int0_int0($$) { return ($_[0] != $_[1]); }

############################################

sub
ats2plpre_lt_int1_int1($$) { return ($_[0] < $_[1]); }
sub
ats2plpre_lte_int1_int1($$) { return ($_[0] <= $_[1]); }
sub
ats2plpre_gt_int1_int1($$) { return ($_[0] > $_[1]); }
sub
ats2plpre_gte_int1_int1($$) { return ($_[0] >= $_[1]); }
sub
ats2plpre_eq_int1_int1($$) { return ($_[0] == $_[1]); }
sub
ats2plpre_neq_int1_int1($$) { return ($_[0] != $_[1]); }

############################################

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [integer_cats.pl]
######

######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [bool_cats.pl]
######

############################################

sub
ats2plpre_neg_bool0($) { return !($_[0]); }
sub
ats2plpre_neg_bool1($) { return !($_[0]); }

############################################

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [bool_cats.pl]
######

######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [float_cats.pl]
######

############################################
#
sub
ats2plpre_double2int($) { return int($_[0]); }
sub
ats2plpre_int_of_double($) { return int($_[0]); }
#
sub
ats2plpre_int2double($) { return ($_[0]) ; }
sub
ats2plpre_double_of_int($) { return ($_[0]) ; }
#
############################################
#
sub
ats2plpre_abs_double($) { return abs($_[0]); }
sub
ats2plpre_neg_double($) { return ( -$_[0] ); }
#
sub
ats2plpre_succ_double($) { return ($_[0] + 1); }
sub
ats2plpre_pred_double($) { return ($_[0] + 1); }
#
############################################
#
sub
ats2plpre_add_int_double($$) { return ($_[0] + $_[1]); }
sub
ats2plpre_sub_int_double($$) { return ($_[0] - $_[1]); }
sub
ats2plpre_mul_int_double($$) { return ($_[0] * $_[1]); }
sub
ats2plpre_div_int_double($$) { return ($_[0] / $_[1]); }
#
############################################
#
sub
ats2plpre_add_double_int($$) { return ($_[0] + $_[1]); }
sub
ats2plpre_sub_double_int($$) { return ($_[0] - $_[1]); }
sub
ats2plpre_mul_double_int($$) { return ($_[0] * $_[1]); }
sub
ats2plpre_div_double_int($$) { return ($_[0] / $_[1]); }
#
############################################
#
sub
ats2plpre_add_double_double($$) { return ($_[0] + $_[1]); }
sub
ats2plpre_sub_double_double($$) { return ($_[0] - $_[1]); }
sub
ats2plpre_mul_double_double($$) { return ($_[0] * $_[1]); }
sub
ats2plpre_div_double_double($$) { return ($_[0] / $_[1]); }
#
############################################
#
sub
ats2plpre_lt_double_double($$) { return ($_[0] < $_[1]); }
sub
ats2plpre_lte_double_double($$) { return ($_[0] <= $_[1]); }
sub
ats2plpre_gt_double_double($$) { return ($_[0] > $_[1]); }
sub
ats2plpre_gte_double_double($$) { return ($_[0] >= $_[1]); }
#
sub
ats2plpre_eq_double_double($$) { return ($_[0] == $_[1]); }
sub
ats2plpre_neq_double_double($$) { return ($_[0] != $_[1]); }
#
############################################

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [float_cats.pl]
######
######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [string_cats.pl]
######

############################################

sub
ats2plpre_lt_string_string($$) { return ($_[0] < $_[1]); }
sub
ats2plpre_lte_string_string($$) { return ($_[0] <= $_[1]); }
sub
ats2plpre_gt_string_string($$) { return ($_[0] > $_[1]); }
sub
ats2plpre_gte_string_string($$) { return ($_[0] >= $_[1]); }
sub
ats2plpre_eq_string_string($$) { return ($_[0] == $_[1]); }
sub
ats2plpre_neq_string_string($$) { return ($_[0] != $_[1]); }

############################################

######
1; #note that it is needed by 'use' or 'require'
######

###### end of [string_cats.pl] ######
######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [print_cats.pl]
######

############################################
#
sub
ats2plpre_print_int($)
{
  ats2plpre_fprint_int(STDOUT, $_[0]); return;
}
sub
ats2plpre_prerr_int($)
{
  ats2plpre_fprint_int(STDERR, $_[0]); return;
}
#
sub
ats2plpre_fprint_int($$) { print {$_[0]} $_[1]; return; }
#
############################################
#
sub
ats2plpre_print_bool($)
{
  ats2plpre_fprint_bool(STDOUT, $_[0]); return;
}
sub
ats2plpre_prerr_bool($)
{
  ats2plpre_fprint_bool(STDERR, $_[0]); return;
}
#
sub
ats2plpre_fprint_bool($$)
{
  if($_[1]) { print {$_[0]} "true"; } else { print {$_[0]} "false"; }; return;
}
#
############################################
#
sub
ats2plpre_print_double($)
{
  ats2plpre_fprint_double(STDOUT, $_[0]); return;
}
sub
ats2plpre_prerr_double($)
{
  ats2plpre_fprint_double(STDERR, $_[0]); return;
}
#
sub
ats2plpre_fprint_double($$) { print {$_[0]} $_[1]; return; }
#
############################################
#
sub
ats2plpre_print_string($)
{
  ats2plpre_fprint_string(STDOUT, $_[0]); return;
}
sub
ats2plpre_prerr_string($)
{
  ats2plpre_fprint_string(STDERR, $_[0]); return;
}
#
sub
ats2plpre_fprint_string($$) { print {$_[0]} "$_[1]"; return; }
#
############################################
#
sub
ats2plpre_print_obj($)
{
  ats2plpre_fprint_obj(STDOUT, $_[0]); return;
}
sub
ats2plpre_prerr_obj($)
{
  ats2plpre_fprint_obj(STDERR, $_[0]); return;
}
#
sub
ats2plpre_fprint_obj($$) { print {$_[0]} $_[1]; return;  }
#
############################################
#
sub
ats2plpre_print_newline()
{
  STDOUT->printflush("\n"); return;
}
sub
ats2plpre_prerr_newline()
{
  STDERR->printflush("\n"); return;
}
sub
ats2plpre_fprint_newline($)
{
  $_[0]->printflush("\n"); return;
}
#
############################################

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [print_cats.pl]
######
######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [PLarray_cats.pl]
######

sub
ats2plpre_PLarray_nil() { return []; }
sub
ats2plpre_PLarray_sing($) { return [$_[0]]; }
sub
ats2plpre_PLarray_pair($$) { return [$_[0], $_[1]]; }

######

sub
ats2plpre_PLarray_get_at($$)
{
  my($A, $i) = @_; return $A->[$i];
}
sub
ats2plpre_PLarray_set_at($$$)
{
  my($A, $i, $x) = @_; $A->[$i] = $x; return;
}

######

sub
ats2plpre_PLarray_length($)
{
  return scalar(@{$_[0]});
}

######

sub
ats2plpre_PLarray_pop_0($) { return pop(@{$_[0]}); }
sub
ats2plpre_PLarray_pop_1($$) { return splice(@{$_[0]}, $_[1], 1); }

######

sub
ats2plpre_PLarray_push($$) { return push(@{$_[0]}, $_[1]); }

######

sub
ats2plpre_PLarray_extend($$) { push(@{$_[0]}, $_[1]); return; }

######
#
sub
ats2plpre_PLarray_reverse($)
{
  my $A = @_;
  my $i = 0 ;
  my $j = scalar(@{$A}) - 1;
  while ($i < $j)
  {
    my $tmp = $A->[i]; $A->[i] = $A->[j]; $A->[j] = $tmp; $i++; $j--;
  }
  return;
} #ats2plpre_PLarray_reverse
#
######

sub
ats2plpre_PLarray_copy($)
{
  my @A2 = @{$_[0]}; return \@A2;
}
sub
ats2plpre_PLarray_revcopy($)
{
  my @A2 = reverse(@{$_[0]}); return \@A2;
}

######

sub
ats2plpre_PLarray_append_2($$)
{
  my @res = (@{$_[0]}, @{$_[1]}); return \@res;
}
sub
ats2plpre_PLarray_append_3($$$)
{
  my @res = (@{$_[0]}, @{$_[1]}, @{$_[2]}); return \@res;
}

######

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [PLarray_cats.pl]
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-3-25: 11h:24m
##
######
sub
_ats2plpre_list_patsfun_35__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_35($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_39__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_39($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_42__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_42($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_46__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_46($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_50__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_50($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_54__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_54($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_57__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_57($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_61__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_61($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_65__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_65($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_69__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_69($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_list_patsfun_73__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_73($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_list_patsfun_77__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_77($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_list_patsfun_81__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_81($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_list_patsfun_86__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_86($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_89__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_89($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_list_patsfun_92__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_92($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_list_patsfun_94__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_94($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}


sub
ats2plpre_list_make_elt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret2;
  my $tmp7;
##
  __patsflab_list_make_elt:
  $tmp7 = 0;
  $tmpret2 = _ats2plpre_list_loop_3($arg1, $arg0, $tmp7);
  return $tmpret2;
} #end-of-function


sub
_ats2plpre_list_loop_3($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret3;
  my $tmp4;
  my $tmp5;
  my $tmp6;
##
  __patsflab__ats2plpre_list_loop_3:
  $tmp4 = ats2plpre_gt_int1_int1($arg0, 0);
  if($tmp4) {
    $tmp5 = ats2plpre_sub_int1_int1($arg0, 1);
    $tmp6 = [$env0, $arg1];
    #ATStailcalseq_beg
    $apy0 = $tmp5;
    $apy1 = $tmp6;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_list_loop_3;
    #ATStailcalseq_end
  } else {
    $tmpret3 = $arg1;
  } #endif
  return $tmpret3;
} #end-of-function


sub
ats2plpre_list_make_intrange_2($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret8;
##
  __patsflab_list_make_intrange_2:
  $tmpret8 = ats2plpre_list_make_intrange_3($arg0, $arg1, 1);
  return $tmpret8;
} #end-of-function


sub
ats2plpre_list_make_intrange_3($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret9;
  my $tmp20;
  my $tmp21;
  my $tmp22;
  my $tmp23;
  my $tmp24;
  my $tmp25;
  my $tmp26;
  my $tmp27;
  my $tmp28;
  my $tmp29;
  my $tmp30;
  my $tmp31;
  my $tmp32;
  my $tmp33;
  my $tmp34;
  my $tmp35;
  my $tmp36;
  my $tmp37;
  my $tmp38;
  my $tmp39;
  my $tmp40;
##
  __patsflab_list_make_intrange_3:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab6:
    $tmp20 = ats2plpre_gt_int0_int0($arg2, 0);
    if(!ATSCKpat_bool($tmp20, 1)) { goto __atstmplab7; }
    $tmp21 = ats2plpre_lt_int0_int0($arg0, $arg1);
    if($tmp21) {
      $tmp25 = ats2plpre_sub_int0_int0($arg1, $arg0);
      $tmp24 = ats2plpre_add_int0_int0($tmp25, $arg2);
      $tmp23 = ats2plpre_sub_int0_int0($tmp24, 1);
      $tmp22 = ats2plpre_div_int0_int0($tmp23, $arg2);
      $tmp28 = ats2plpre_sub_int0_int0($tmp22, 1);
      $tmp27 = ats2plpre_mul_int0_int0($tmp28, $arg2);
      $tmp26 = ats2plpre_add_int0_int0($arg0, $tmp27);
      $tmp29 = 0;
      $tmpret9 = _ats2plpre_list_loop1_6($tmp22, $tmp26, $arg2, $tmp29);
    } else {
      $tmpret9 = 0;
    } #endif
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab7:
    $tmp30 = ats2plpre_lt_int0_int0($arg2, 0);
    if(!ATSCKpat_bool($tmp30, 1)) { goto __atstmplab8; }
    $tmp31 = ats2plpre_gt_int0_int0($arg0, $arg1);
    if($tmp31) {
      $tmp32 = ats2plpre_neg_int0($arg2);
      $tmp36 = ats2plpre_sub_int0_int0($arg0, $arg1);
      $tmp35 = ats2plpre_add_int0_int0($tmp36, $tmp32);
      $tmp34 = ats2plpre_sub_int0_int0($tmp35, 1);
      $tmp33 = ats2plpre_div_int0_int0($tmp34, $tmp32);
      $tmp39 = ats2plpre_sub_int0_int0($tmp33, 1);
      $tmp38 = ats2plpre_mul_int0_int0($tmp39, $tmp32);
      $tmp37 = ats2plpre_sub_int0_int0($arg0, $tmp38);
      $tmp40 = 0;
      $tmpret9 = _ats2plpre_list_loop2_7($tmp33, $tmp37, $tmp32, $tmp40);
    } else {
      $tmpret9 = 0;
    } #endif
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab8:
    $tmpret9 = 0;
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret9;
} #end-of-function


sub
_ats2plpre_list_loop1_6($$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $apy3;
  my $tmpret10;
  my $tmp11;
  my $tmp12;
  my $tmp13;
  my $tmp14;
##
  __patsflab__ats2plpre_list_loop1_6:
  $tmp11 = ats2plpre_gt_int0_int0($arg0, 0);
  if($tmp11) {
    $tmp12 = ats2plpre_sub_int0_int0($arg0, 1);
    $tmp13 = ats2plpre_sub_int0_int0($arg1, $arg2);
    $tmp14 = [$arg1, $arg3];
    #ATStailcalseq_beg
    $apy0 = $tmp12;
    $apy1 = $tmp13;
    $apy2 = $arg2;
    $apy3 = $tmp14;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    goto __patsflab__ats2plpre_list_loop1_6;
    #ATStailcalseq_end
  } else {
    $tmpret10 = $arg3;
  } #endif
  return $tmpret10;
} #end-of-function


sub
_ats2plpre_list_loop2_7($$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $apy3;
  my $tmpret15;
  my $tmp16;
  my $tmp17;
  my $tmp18;
  my $tmp19;
##
  __patsflab__ats2plpre_list_loop2_7:
  $tmp16 = ats2plpre_gt_int0_int0($arg0, 0);
  if($tmp16) {
    $tmp17 = ats2plpre_sub_int0_int0($arg0, 1);
    $tmp18 = ats2plpre_add_int0_int0($arg1, $arg2);
    $tmp19 = [$arg1, $arg3];
    #ATStailcalseq_beg
    $apy0 = $tmp17;
    $apy1 = $tmp18;
    $apy2 = $arg2;
    $apy3 = $tmp19;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    goto __patsflab__ats2plpre_list_loop2_7;
    #ATStailcalseq_end
  } else {
    $tmpret15 = $arg3;
  } #endif
  return $tmpret15;
} #end-of-function


sub
ats2plpre_list_length($)
{
##
  my($arg0) = @_;
##
  my $tmpret52;
##
  __patsflab_list_length:
  $tmpret52 = _ats2plpre_list_loop_14($arg0, 0);
  return $tmpret52;
} #end-of-function


sub
_ats2plpre_list_loop_14($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret53;
  my $tmp55;
  my $tmp56;
##
  __patsflab__ats2plpre_list_loop_14:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab13:
    if(ATSCKptriscons($arg0)) { goto __atstmplab16; }
    __atstmplab14:
    $tmpret53 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab15:
    __atstmplab16:
    $tmp55 = $arg0->[1];
    $tmp56 = ats2plpre_add_int1_int1($arg1, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp55;
    $apy1 = $tmp56;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_list_loop_14;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret53;
} #end-of-function


sub
ats2plpre_list_last($)
{
##
  my($arg0) = @_;
##
  my $apy0;
  my $tmpret57;
  my $tmp58;
  my $tmp59;
##
  __patsflab_list_last:
  $tmp58 = $arg0->[0];
  $tmp59 = $arg0->[1];
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab17:
    if(ATSCKptriscons($tmp59)) { goto __atstmplab20; }
    __atstmplab18:
    $tmpret57 = $tmp58;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab19:
    __atstmplab20:
    #ATStailcalseq_beg
    $apy0 = $tmp59;
    $arg0 = $apy0;
    goto __patsflab_list_last;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret57;
} #end-of-function


sub
ats2plpre_list_get_at($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret60;
  my $tmp61;
  my $tmp62;
  my $tmp63;
  my $tmp64;
##
  __patsflab_list_get_at:
  $tmp61 = ats2plpre_eq_int1_int1($arg1, 0);
  if($tmp61) {
    $tmp62 = $arg0->[0];
    $tmpret60 = $tmp62;
  } else {
    $tmp63 = $arg0->[1];
    $tmp64 = ats2plpre_sub_int1_int1($arg1, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp63;
    $apy1 = $tmp64;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab_list_get_at;
    #ATStailcalseq_end
  } #endif
  return $tmpret60;
} #end-of-function


sub
ats2plpre_list_snoc($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret65;
  my $tmp66;
  my $tmp67;
##
  __patsflab_list_snoc:
  $tmp67 = 0;
  $tmp66 = [$arg1, $tmp67];
  $tmpret65 = ats2plpre_list_append($arg0, $tmp66);
  return $tmpret65;
} #end-of-function


sub
ats2plpre_list_extend($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret68;
  my $tmp69;
  my $tmp70;
##
  __patsflab_list_extend:
  $tmp70 = 0;
  $tmp69 = [$arg1, $tmp70];
  $tmpret68 = ats2plpre_list_append($arg0, $tmp69);
  return $tmpret68;
} #end-of-function


sub
ats2plpre_list_append($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret71;
  my $tmp72;
  my $tmp73;
  my $tmp74;
##
  __patsflab_list_append:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab21:
    if(ATSCKptriscons($arg0)) { goto __atstmplab24; }
    __atstmplab22:
    $tmpret71 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab23:
    __atstmplab24:
    $tmp72 = $arg0->[0];
    $tmp73 = $arg0->[1];
    $tmp74 = ats2plpre_list_append($tmp73, $arg1);
    $tmpret71 = [$tmp72, $tmp74];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret71;
} #end-of-function


sub
ats2plpre_mul_int_list($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret75;
  my $tmp80;
##
  __patsflab_mul_int_list:
  $tmp80 = 0;
  $tmpret75 = _ats2plpre_list_loop_21($arg1, $arg0, $tmp80);
  return $tmpret75;
} #end-of-function


sub
_ats2plpre_list_loop_21($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret76;
  my $tmp77;
  my $tmp78;
  my $tmp79;
##
  __patsflab__ats2plpre_list_loop_21:
  $tmp77 = ats2plpre_gt_int1_int1($arg0, 0);
  if($tmp77) {
    $tmp78 = ats2plpre_sub_int1_int1($arg0, 1);
    $tmp79 = ats2plpre_list_append($env0, $arg1);
    #ATStailcalseq_beg
    $apy0 = $tmp78;
    $apy1 = $tmp79;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_list_loop_21;
    #ATStailcalseq_end
  } else {
    $tmpret76 = $arg1;
  } #endif
  return $tmpret76;
} #end-of-function


sub
ats2plpre_list_reverse($)
{
##
  my($arg0) = @_;
##
  my $tmpret81;
  my $tmp82;
##
  __patsflab_list_reverse:
  $tmp82 = 0;
  $tmpret81 = ats2plpre_list_reverse_append($arg0, $tmp82);
  return $tmpret81;
} #end-of-function


sub
ats2plpre_list_reverse_append($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret83;
##
  __patsflab_list_reverse_append:
  $tmpret83 = _ats2plpre_list_loop_24($arg0, $arg1);
  return $tmpret83;
} #end-of-function


sub
_ats2plpre_list_loop_24($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret84;
  my $tmp85;
  my $tmp86;
  my $tmp87;
##
  __patsflab__ats2plpre_list_loop_24:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab25:
    if(ATSCKptriscons($arg0)) { goto __atstmplab28; }
    __atstmplab26:
    $tmpret84 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab27:
    __atstmplab28:
    $tmp85 = $arg0->[0];
    $tmp86 = $arg0->[1];
    $tmp87 = [$tmp85, $arg1];
    #ATStailcalseq_beg
    $apy0 = $tmp86;
    $apy1 = $tmp87;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_list_loop_24;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret84;
} #end-of-function


sub
ats2plpre_list_concat($)
{
##
  my($arg0) = @_;
##
  my $tmpret88;
##
  __patsflab_list_concat:
  $tmpret88 = _ats2plpre_list_auxlst_26($arg0);
  return $tmpret88;
} #end-of-function


sub
_ats2plpre_list_auxlst_26($)
{
##
  my($arg0) = @_;
##
  my $tmpret89;
  my $tmp90;
  my $tmp91;
  my $tmp92;
##
  __patsflab__ats2plpre_list_auxlst_26:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab29:
    if(ATSCKptriscons($arg0)) { goto __atstmplab32; }
    __atstmplab30:
    $tmpret89 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab31:
    __atstmplab32:
    $tmp90 = $arg0->[0];
    $tmp91 = $arg0->[1];
    $tmp92 = _ats2plpre_list_auxlst_26($tmp91);
    $tmpret89 = ats2plpre_list_append($tmp90, $tmp92);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret89;
} #end-of-function


sub
ats2plpre_list_take($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret93;
  my $tmp94;
  my $tmp95;
  my $tmp96;
  my $tmp97;
  my $tmp98;
##
  __patsflab_list_take:
  $tmp94 = ats2plpre_gt_int1_int1($arg1, 0);
  if($tmp94) {
    $tmp95 = $arg0->[0];
    $tmp96 = $arg0->[1];
    $tmp98 = ats2plpre_sub_int1_int1($arg1, 1);
    $tmp97 = ats2plpre_list_take($tmp96, $tmp98);
    $tmpret93 = [$tmp95, $tmp97];
  } else {
    $tmpret93 = 0;
  } #endif
  return $tmpret93;
} #end-of-function


sub
ats2plpre_list_drop($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret99;
  my $tmp100;
  my $tmp101;
  my $tmp102;
##
  __patsflab_list_drop:
  $tmp100 = ats2plpre_gt_int1_int1($arg1, 0);
  if($tmp100) {
    $tmp101 = $arg0->[1];
    $tmp102 = ats2plpre_sub_int1_int1($arg1, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp101;
    $apy1 = $tmp102;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab_list_drop;
    #ATStailcalseq_end
  } else {
    $tmpret99 = $arg0;
  } #endif
  return $tmpret99;
} #end-of-function


sub
ats2plpre_list_split_at($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret103;
  my $tmp104;
  my $tmp105;
##
  __patsflab_list_split_at:
  $tmp104 = ats2plpre_list_take($arg0, $arg1);
  $tmp105 = ats2plpre_list_drop($arg0, $arg1);
  $tmpret103 = [$tmp104, $tmp105];
  return $tmpret103;
} #end-of-function


sub
ats2plpre_list_insert_at($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret106;
  my $tmp107;
  my $tmp108;
  my $tmp109;
  my $tmp110;
  my $tmp111;
##
  __patsflab_list_insert_at:
  $tmp107 = ats2plpre_gt_int1_int1($arg1, 0);
  if($tmp107) {
    $tmp108 = $arg0->[0];
    $tmp109 = $arg0->[1];
    $tmp111 = ats2plpre_sub_int1_int1($arg1, 1);
    $tmp110 = ats2plpre_list_insert_at($tmp109, $tmp111, $arg2);
    $tmpret106 = [$tmp108, $tmp110];
  } else {
    $tmpret106 = [$arg2, $arg0];
  } #endif
  return $tmpret106;
} #end-of-function


sub
ats2plpre_list_remove_at($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret112;
  my $tmp113;
  my $tmp114;
  my $tmp115;
  my $tmp116;
  my $tmp117;
##
  __patsflab_list_remove_at:
  $tmp113 = $arg0->[0];
  $tmp114 = $arg0->[1];
  $tmp115 = ats2plpre_gt_int1_int1($arg1, 0);
  if($tmp115) {
    $tmp117 = ats2plpre_sub_int1_int1($arg1, 1);
    $tmp116 = ats2plpre_list_remove_at($tmp114, $tmp117);
    $tmpret112 = [$tmp113, $tmp116];
  } else {
    $tmpret112 = $tmp114;
  } #endif
  return $tmpret112;
} #end-of-function


sub
ats2plpre_list_takeout_at($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret118;
  my $tmp119;
  my $tmp120;
  my $tmp121;
  my $tmp122;
  my $tmp123;
  my $tmp124;
  my $tmp125;
  my $tmp126;
##
  __patsflab_list_takeout_at:
  $tmp119 = $arg0->[0];
  $tmp120 = $arg0->[1];
  $tmp121 = ats2plpre_gt_int1_int1($arg1, 0);
  if($tmp121) {
    $tmp123 = ats2plpre_sub_int1_int1($arg1, 1);
    $tmp122 = ats2plpre_list_takeout_at($tmp120, $tmp123);
    $tmp124 = $tmp122->[0];
    $tmp125 = $tmp122->[1];
    $tmp126 = [$tmp119, $tmp125];
    $tmpret118 = [$tmp124, $tmp126];
  } else {
    $tmpret118 = [$tmp119, $tmp120];
  } #endif
  return $tmpret118;
} #end-of-function


sub
ats2plpre_list_exists($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret127;
  my $tmp128;
  my $tmp129;
  my $tmp130;
##
  __patsflab_list_exists:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab33:
    if(ATSCKptriscons($arg0)) { goto __atstmplab36; }
    __atstmplab34:
    $tmpret127 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab35:
    __atstmplab36:
    $tmp128 = $arg0->[0];
    $tmp129 = $arg0->[1];
    $tmp130 = &{$arg1->[0]}($arg1, $tmp128);
    if($tmp130) {
      $tmpret127 = 1;
    } else {
      #ATStailcalseq_beg
      $apy0 = $tmp129;
      $apy1 = $arg1;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab_list_exists;
      #ATStailcalseq_end
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret127;
} #end-of-function


sub
ats2plpre_list_exists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret131;
##
  __patsflab_list_exists_method:
  $tmpret131 = _ats2plpre_list_patsfun_35__closurerize($arg0);
  return $tmpret131;
} #end-of-function


sub
_ats2plpre_list_patsfun_35($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret132;
##
  __patsflab__ats2plpre_list_patsfun_35:
  $tmpret132 = ats2plpre_list_exists($env0, $arg0);
  return $tmpret132;
} #end-of-function


sub
ats2plpre_list_iexists($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret133;
##
  __patsflab_list_iexists:
  $tmpret133 = _ats2plpre_list_loop_37($arg1, 0, $arg0);
  return $tmpret133;
} #end-of-function


sub
_ats2plpre_list_loop_37($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret134;
  my $tmp135;
  my $tmp136;
  my $tmp137;
  my $tmp138;
##
  __patsflab__ats2plpre_list_loop_37:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab37:
    if(ATSCKptriscons($arg1)) { goto __atstmplab40; }
    __atstmplab38:
    $tmpret134 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab39:
    __atstmplab40:
    $tmp135 = $arg1->[0];
    $tmp136 = $arg1->[1];
    $tmp137 = &{$env0->[0]}($env0, $arg0, $tmp135);
    if($tmp137) {
      $tmpret134 = 1;
    } else {
      $tmp138 = ats2plpre_add_int1_int1($arg0, 1);
      #ATStailcalseq_beg
      $apy0 = $tmp138;
      $apy1 = $tmp136;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab__ats2plpre_list_loop_37;
      #ATStailcalseq_end
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret134;
} #end-of-function


sub
ats2plpre_list_iexists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret139;
##
  __patsflab_list_iexists_method:
  $tmpret139 = _ats2plpre_list_patsfun_39__closurerize($arg0);
  return $tmpret139;
} #end-of-function


sub
_ats2plpre_list_patsfun_39($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret140;
##
  __patsflab__ats2plpre_list_patsfun_39:
  $tmpret140 = ats2plpre_list_iexists($env0, $arg0);
  return $tmpret140;
} #end-of-function


sub
ats2plpre_list_forall($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret141;
  my $tmp142;
  my $tmp143;
  my $tmp144;
##
  __patsflab_list_forall:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab41:
    if(ATSCKptriscons($arg0)) { goto __atstmplab44; }
    __atstmplab42:
    $tmpret141 = 1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab43:
    __atstmplab44:
    $tmp142 = $arg0->[0];
    $tmp143 = $arg0->[1];
    $tmp144 = &{$arg1->[0]}($arg1, $tmp142);
    if($tmp144) {
      #ATStailcalseq_beg
      $apy0 = $tmp143;
      $apy1 = $arg1;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab_list_forall;
      #ATStailcalseq_end
    } else {
      $tmpret141 = 0;
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret141;
} #end-of-function


sub
ats2plpre_list_forall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret145;
##
  __patsflab_list_forall_method:
  $tmpret145 = _ats2plpre_list_patsfun_42__closurerize($arg0);
  return $tmpret145;
} #end-of-function


sub
_ats2plpre_list_patsfun_42($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret146;
##
  __patsflab__ats2plpre_list_patsfun_42:
  $tmpret146 = ats2plpre_list_forall($env0, $arg0);
  return $tmpret146;
} #end-of-function


sub
ats2plpre_list_iforall($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret147;
##
  __patsflab_list_iforall:
  $tmpret147 = _ats2plpre_list_loop_44($arg1, 0, $arg0);
  return $tmpret147;
} #end-of-function


sub
_ats2plpre_list_loop_44($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret148;
  my $tmp149;
  my $tmp150;
  my $tmp151;
  my $tmp152;
##
  __patsflab__ats2plpre_list_loop_44:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab45:
    if(ATSCKptriscons($arg1)) { goto __atstmplab48; }
    __atstmplab46:
    $tmpret148 = 1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab47:
    __atstmplab48:
    $tmp149 = $arg1->[0];
    $tmp150 = $arg1->[1];
    $tmp151 = &{$env0->[0]}($env0, $arg0, $tmp149);
    if($tmp151) {
      $tmp152 = ats2plpre_add_int1_int1($arg0, 1);
      #ATStailcalseq_beg
      $apy0 = $tmp152;
      $apy1 = $tmp150;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab__ats2plpre_list_loop_44;
      #ATStailcalseq_end
    } else {
      $tmpret148 = 0;
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret148;
} #end-of-function


sub
ats2plpre_list_iforall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret153;
##
  __patsflab_list_iforall_method:
  $tmpret153 = _ats2plpre_list_patsfun_46__closurerize($arg0);
  return $tmpret153;
} #end-of-function


sub
_ats2plpre_list_patsfun_46($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret154;
##
  __patsflab__ats2plpre_list_patsfun_46:
  $tmpret154 = ats2plpre_list_iforall($env0, $arg0);
  return $tmpret154;
} #end-of-function


sub
ats2plpre_list_app($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_list_app:
  ats2plpre_list_foreach($arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_list_foreach($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmp157;
  my $tmp158;
##
  __patsflab_list_foreach:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab49:
    if(ATSCKptriscons($arg0)) { goto __atstmplab52; }
    __atstmplab50:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab51:
    __atstmplab52:
    $tmp157 = $arg0->[0];
    $tmp158 = $arg0->[1];
    &{$arg1->[0]}($arg1, $tmp157);
    #ATStailcalseq_beg
    $apy0 = $tmp158;
    $apy1 = $arg1;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab_list_foreach;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_list_foreach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret160;
##
  __patsflab_list_foreach_method:
  $tmpret160 = _ats2plpre_list_patsfun_50__closurerize($arg0);
  return $tmpret160;
} #end-of-function


sub
_ats2plpre_list_patsfun_50($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_list_patsfun_50:
  ats2plpre_list_foreach($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_list_iforeach($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_list_iforeach:
  _ats2plpre_list_aux_52($arg1, 0, $arg0);
  return;#_void
} #end-of-function


sub
_ats2plpre_list_aux_52($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmp164;
  my $tmp165;
  my $tmp167;
##
  __patsflab__ats2plpre_list_aux_52:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab53:
    if(ATSCKptriscons($arg1)) { goto __atstmplab56; }
    __atstmplab54:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab55:
    __atstmplab56:
    $tmp164 = $arg1->[0];
    $tmp165 = $arg1->[1];
    &{$env0->[0]}($env0, $arg0, $tmp164);
    $tmp167 = ats2plpre_add_int1_int1($arg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp167;
    $apy1 = $tmp165;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_list_aux_52;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_list_iforeach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret168;
##
  __patsflab_list_iforeach_method:
  $tmpret168 = _ats2plpre_list_patsfun_54__closurerize($arg0);
  return $tmpret168;
} #end-of-function


sub
_ats2plpre_list_patsfun_54($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_list_patsfun_54:
  ats2plpre_list_iforeach($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_list_rforeach($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmp171;
  my $tmp172;
##
  __patsflab_list_rforeach:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab57:
    if(ATSCKptriscons($arg0)) { goto __atstmplab60; }
    __atstmplab58:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab59:
    __atstmplab60:
    $tmp171 = $arg0->[0];
    $tmp172 = $arg0->[1];
    ats2plpre_list_rforeach($tmp172, $arg1);
    &{$arg1->[0]}($arg1, $tmp171);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_list_rforeach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret174;
##
  __patsflab_list_rforeach_method:
  $tmpret174 = _ats2plpre_list_patsfun_57__closurerize($arg0);
  return $tmpret174;
} #end-of-function


sub
_ats2plpre_list_patsfun_57($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_list_patsfun_57:
  ats2plpre_list_rforeach($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_list_filter($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret176;
##
  __patsflab_list_filter:
  $tmpret176 = _ats2plpre_list_aux_59($arg1, $arg0);
  return $tmpret176;
} #end-of-function


sub
_ats2plpre_list_aux_59($$)
{
##
  my($env0, $arg0) = @_;
##
  my $apy0;
  my $tmpret177;
  my $tmp178;
  my $tmp179;
  my $tmp180;
  my $tmp181;
##
  __patsflab__ats2plpre_list_aux_59:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab61:
    if(ATSCKptriscons($arg0)) { goto __atstmplab64; }
    __atstmplab62:
    $tmpret177 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab63:
    __atstmplab64:
    $tmp178 = $arg0->[0];
    $tmp179 = $arg0->[1];
    $tmp180 = &{$env0->[0]}($env0, $tmp178);
    if($tmp180) {
      $tmp181 = _ats2plpre_list_aux_59($env0, $tmp179);
      $tmpret177 = [$tmp178, $tmp181];
    } else {
      #ATStailcalseq_beg
      $apy0 = $tmp179;
      $arg0 = $apy0;
      goto __patsflab__ats2plpre_list_aux_59;
      #ATStailcalseq_end
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret177;
} #end-of-function


sub
ats2plpre_list_filter_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret182;
##
  __patsflab_list_filter_method:
  $tmpret182 = _ats2plpre_list_patsfun_61__closurerize($arg0);
  return $tmpret182;
} #end-of-function


sub
_ats2plpre_list_patsfun_61($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret183;
##
  __patsflab__ats2plpre_list_patsfun_61:
  $tmpret183 = ats2plpre_list_filter($env0, $arg0);
  return $tmpret183;
} #end-of-function


sub
ats2plpre_list_map($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret184;
##
  __patsflab_list_map:
  $tmpret184 = _ats2plpre_list_aux_63($arg1, $arg0);
  return $tmpret184;
} #end-of-function


sub
_ats2plpre_list_aux_63($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret185;
  my $tmp186;
  my $tmp187;
  my $tmp188;
  my $tmp189;
##
  __patsflab__ats2plpre_list_aux_63:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab65:
    if(ATSCKptriscons($arg0)) { goto __atstmplab68; }
    __atstmplab66:
    $tmpret185 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab67:
    __atstmplab68:
    $tmp186 = $arg0->[0];
    $tmp187 = $arg0->[1];
    $tmp188 = &{$env0->[0]}($env0, $tmp186);
    $tmp189 = _ats2plpre_list_aux_63($env0, $tmp187);
    $tmpret185 = [$tmp188, $tmp189];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret185;
} #end-of-function


sub
ats2plpre_list_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret190;
##
  __patsflab_list_map_method:
  $tmpret190 = _ats2plpre_list_patsfun_65__closurerize($arg0);
  return $tmpret190;
} #end-of-function


sub
_ats2plpre_list_patsfun_65($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret191;
##
  __patsflab__ats2plpre_list_patsfun_65:
  $tmpret191 = ats2plpre_list_map($env0, $arg0);
  return $tmpret191;
} #end-of-function


sub
ats2plpre_list_foldleft($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret192;
##
  __patsflab_list_foldleft:
  $tmpret192 = _ats2plpre_list_loop_67($arg2, $arg1, $arg0);
  return $tmpret192;
} #end-of-function


sub
_ats2plpre_list_loop_67($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret193;
  my $tmp194;
  my $tmp195;
  my $tmp196;
##
  __patsflab__ats2plpre_list_loop_67:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab69:
    if(ATSCKptriscons($arg1)) { goto __atstmplab72; }
    __atstmplab70:
    $tmpret193 = $arg0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab71:
    __atstmplab72:
    $tmp194 = $arg1->[0];
    $tmp195 = $arg1->[1];
    $tmp196 = &{$env0->[0]}($env0, $arg0, $tmp194);
    #ATStailcalseq_beg
    $apy0 = $tmp196;
    $apy1 = $tmp195;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_list_loop_67;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret193;
} #end-of-function


sub
ats2plpre_list_foldleft_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret197;
##
  __patsflab_list_foldleft_method:
  $tmpret197 = _ats2plpre_list_patsfun_69__closurerize($arg0, $arg1);
  return $tmpret197;
} #end-of-function


sub
_ats2plpre_list_patsfun_69($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret198;
##
  __patsflab__ats2plpre_list_patsfun_69:
  $tmpret198 = ats2plpre_list_foldleft($env0, $env1, $arg0);
  return $tmpret198;
} #end-of-function


sub
ats2plpre_list_ifoldleft($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret199;
##
  __patsflab_list_ifoldleft:
  $tmpret199 = _ats2plpre_list_loop_71($arg2, 0, $arg1, $arg0);
  return $tmpret199;
} #end-of-function


sub
_ats2plpre_list_loop_71($$$$)
{
##
  my($env0, $arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmpret200;
  my $tmp201;
  my $tmp202;
  my $tmp203;
  my $tmp204;
##
  __patsflab__ats2plpre_list_loop_71:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab73:
    if(ATSCKptriscons($arg2)) { goto __atstmplab76; }
    __atstmplab74:
    $tmpret200 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab75:
    __atstmplab76:
    $tmp201 = $arg2->[0];
    $tmp202 = $arg2->[1];
    $tmp203 = ats2plpre_add_int1_int1($arg0, 1);
    $tmp204 = &{$env0->[0]}($env0, $arg0, $arg1, $tmp201);
    #ATStailcalseq_beg
    $apy0 = $tmp203;
    $apy1 = $tmp204;
    $apy2 = $tmp202;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    goto __patsflab__ats2plpre_list_loop_71;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret200;
} #end-of-function


sub
ats2plpre_list_ifoldleft_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret205;
##
  __patsflab_list_ifoldleft_method:
  $tmpret205 = _ats2plpre_list_patsfun_73__closurerize($arg0, $arg1);
  return $tmpret205;
} #end-of-function


sub
_ats2plpre_list_patsfun_73($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret206;
##
  __patsflab__ats2plpre_list_patsfun_73:
  $tmpret206 = ats2plpre_list_ifoldleft($env0, $env1, $arg0);
  return $tmpret206;
} #end-of-function


sub
ats2plpre_list_foldright($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret207;
##
  __patsflab_list_foldright:
  $tmpret207 = _ats2plpre_list_aux_75($arg1, $arg0, $arg2);
  return $tmpret207;
} #end-of-function


sub
_ats2plpre_list_aux_75($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $tmpret208;
  my $tmp209;
  my $tmp210;
  my $tmp211;
##
  __patsflab__ats2plpre_list_aux_75:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab77:
    if(ATSCKptriscons($arg0)) { goto __atstmplab80; }
    __atstmplab78:
    $tmpret208 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab79:
    __atstmplab80:
    $tmp209 = $arg0->[0];
    $tmp210 = $arg0->[1];
    $tmp211 = _ats2plpre_list_aux_75($env0, $tmp210, $arg1);
    $tmpret208 = &{$env0->[0]}($env0, $tmp209, $tmp211);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret208;
} #end-of-function


sub
ats2plpre_list_foldright_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret212;
##
  __patsflab_list_foldright_method:
  $tmpret212 = _ats2plpre_list_patsfun_77__closurerize($arg0, $arg1);
  return $tmpret212;
} #end-of-function


sub
_ats2plpre_list_patsfun_77($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret213;
##
  __patsflab__ats2plpre_list_patsfun_77:
  $tmpret213 = ats2plpre_list_foldright($env0, $arg0, $env1);
  return $tmpret213;
} #end-of-function


sub
ats2plpre_list_ifoldright($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret214;
##
  __patsflab_list_ifoldright:
  $tmpret214 = _ats2plpre_list_aux_79($arg1, 0, $arg0, $arg2);
  return $tmpret214;
} #end-of-function


sub
_ats2plpre_list_aux_79($$$$)
{
##
  my($env0, $arg0, $arg1, $arg2) = @_;
##
  my $tmpret215;
  my $tmp216;
  my $tmp217;
  my $tmp218;
  my $tmp219;
##
  __patsflab__ats2plpre_list_aux_79:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab81:
    if(ATSCKptriscons($arg1)) { goto __atstmplab84; }
    __atstmplab82:
    $tmpret215 = $arg2;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab83:
    __atstmplab84:
    $tmp216 = $arg1->[0];
    $tmp217 = $arg1->[1];
    $tmp219 = ats2plpre_add_int1_int1($arg0, 1);
    $tmp218 = _ats2plpre_list_aux_79($env0, $tmp219, $tmp217, $arg2);
    $tmpret215 = &{$env0->[0]}($env0, $arg0, $tmp216, $tmp218);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret215;
} #end-of-function


sub
ats2plpre_list_ifoldright_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret220;
##
  __patsflab_list_ifoldright_method:
  $tmpret220 = _ats2plpre_list_patsfun_81__closurerize($arg0, $arg1);
  return $tmpret220;
} #end-of-function


sub
_ats2plpre_list_patsfun_81($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret221;
##
  __patsflab__ats2plpre_list_patsfun_81:
  $tmpret221 = ats2plpre_list_ifoldright($env0, $arg0, $env1);
  return $tmpret221;
} #end-of-function


sub
ats2plpre_streamize_list_elt($)
{
##
  my($arg0) = @_;
##
  my $tmpret224;
##
  __patsflab_streamize_list_elt:
  $tmpret224 = _ats2plpre_list_auxmain_85($arg0);
  return $tmpret224;
} #end-of-function


sub
_ats2plpre_list_auxmain_85($)
{
##
  my($arg0) = @_;
##
  my $tmpret225;
##
  __patsflab__ats2plpre_list_auxmain_85:
  $tmpret225 = ATSPMVllazyval(_ats2plpre_list_patsfun_86__closurerize($arg0));
  return $tmpret225;
} #end-of-function


sub
_ats2plpre_list_patsfun_86($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret226;
  my $tmp227;
  my $tmp228;
  my $tmp229;
##
  __patsflab__ats2plpre_list_patsfun_86:
  if($arg0) {
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab85:
      if(ATSCKptriscons($env0)) { goto __atstmplab88; }
      __atstmplab86:
      $tmpret226 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab87:
      __atstmplab88:
      $tmp227 = $env0->[0];
      $tmp228 = $env0->[1];
      $tmp229 = _ats2plpre_list_auxmain_85($tmp228);
      $tmpret226 = [$tmp227, $tmp229];
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
  } #endif
  return $tmpret226;
} #end-of-function


sub
ats2plpre_streamize_list_zip($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret230;
##
  __patsflab_streamize_list_zip:
  $tmpret230 = _ats2plpre_list_auxmain_88($arg0, $arg1);
  return $tmpret230;
} #end-of-function


sub
_ats2plpre_list_auxmain_88($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret231;
##
  __patsflab__ats2plpre_list_auxmain_88:
  $tmpret231 = ATSPMVllazyval(_ats2plpre_list_patsfun_89__closurerize($arg0, $arg1));
  return $tmpret231;
} #end-of-function


sub
_ats2plpre_list_patsfun_89($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret232;
  my $tmp233;
  my $tmp234;
  my $tmp235;
  my $tmp236;
  my $tmp237;
  my $tmp238;
##
  __patsflab__ats2plpre_list_patsfun_89:
  if($arg0) {
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab89:
      if(ATSCKptriscons($env0)) { goto __atstmplab92; }
      __atstmplab90:
      $tmpret232 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab91:
      __atstmplab92:
      $tmp233 = $env0->[0];
      $tmp234 = $env0->[1];
      #ATScaseofseq_beg
      while(1)
      {
        #ATSbranchseq_beg
        __atstmplab93:
        if(ATSCKptriscons($env1)) { goto __atstmplab96; }
        __atstmplab94:
        $tmpret232 = 0;
        last;
        #ATSbranchseq_end
        #ATSbranchseq_beg
        __atstmplab95:
        __atstmplab96:
        $tmp235 = $env1->[0];
        $tmp236 = $env1->[1];
        $tmp237 = [$tmp233, $tmp235];
        $tmp238 = _ats2plpre_list_auxmain_88($tmp234, $tmp236);
        $tmpret232 = [$tmp237, $tmp238];
        last;
        #ATSbranchseq_end
      } #end-of-while-loop;
      #ATScaseofseq_end
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
  } #endif
  return $tmpret232;
} #end-of-function


sub
ats2plpre_streamize_list_cross($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret239;
##
  __patsflab_streamize_list_cross:
  $tmpret239 = _ats2plpre_list_auxmain_93($arg0, $arg1);
  return $tmpret239;
} #end-of-function


sub
_ats2plpre_list_auxone_91($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret240;
##
  __patsflab__ats2plpre_list_auxone_91:
  $tmpret240 = ATSPMVllazyval(_ats2plpre_list_patsfun_92__closurerize($arg0, $arg1));
  return $tmpret240;
} #end-of-function


sub
_ats2plpre_list_patsfun_92($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret241;
  my $tmp242;
  my $tmp243;
  my $tmp244;
  my $tmp245;
##
  __patsflab__ats2plpre_list_patsfun_92:
  if($arg0) {
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab97:
      if(ATSCKptriscons($env1)) { goto __atstmplab100; }
      __atstmplab98:
      $tmpret241 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab99:
      __atstmplab100:
      $tmp242 = $env1->[0];
      $tmp243 = $env1->[1];
      $tmp244 = [$env0, $tmp242];
      $tmp245 = _ats2plpre_list_auxone_91($env0, $tmp243);
      $tmpret241 = [$tmp244, $tmp245];
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
  } #endif
  return $tmpret241;
} #end-of-function


sub
_ats2plpre_list_auxmain_93($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret246;
##
  __patsflab__ats2plpre_list_auxmain_93:
  $tmpret246 = ATSPMVllazyval(_ats2plpre_list_patsfun_94__closurerize($arg0, $arg1));
  return $tmpret246;
} #end-of-function


sub
_ats2plpre_list_patsfun_94($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret247;
  my $tmp248;
  my $tmp249;
  my $tmp250;
  my $tmp251;
  my $tmp252;
##
  __patsflab__ats2plpre_list_patsfun_94:
  if($arg0) {
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab101:
      if(ATSCKptriscons($env0)) { goto __atstmplab104; }
      __atstmplab102:
      $tmpret247 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab103:
      __atstmplab104:
      $tmp248 = $env0->[0];
      $tmp249 = $env0->[1];
      $tmp251 = _ats2plpre_list_auxone_91($tmp248, $env1);
      $tmp252 = _ats2plpre_list_auxmain_93($tmp249, $env1);
      $tmp250 = ats2plpre_stream_vt_append($tmp251, $tmp252);
      $tmpret247 = ATSPMVllazyval_eval($tmp250);
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
  } #endif
  return $tmpret247;
} #end-of-function


######
#ATSextcode_beg()
######
######
1; ##note that it is needed by 'use' or 'require'
######
######
#ATSextcode_end()
######
######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-3-25: 11h:24m
##
######

sub
ats2plpre_option_some($)
{
##
  my($arg0) = @_;
##
  my $tmpret0;
##
  __patsflab_option_some:
  $tmpret0 = [$arg0];
  return $tmpret0;
} #end-of-function


sub
ats2plpre_option_none()
{
##
  #argless
##
  my $tmpret1;
##
  __patsflab_option_none:
  $tmpret1 = 0;
  return $tmpret1;
} #end-of-function


sub
ats2plpre_option_unsome($)
{
##
  my($arg0) = @_;
##
  my $tmpret2;
  my $tmp3;
##
  __patsflab_option_unsome:
  $tmp3 = $arg0->[0];
  $tmpret2 = $tmp3;
  return $tmpret2;
} #end-of-function


sub
ats2plpre_option_is_some($)
{
##
  my($arg0) = @_;
##
  my $tmpret4;
##
  __patsflab_option_is_some:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab0:
    if(ATSCKptrisnull($arg0)) { goto __atstmplab3; }
    __atstmplab1:
    $tmpret4 = 1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab2:
    __atstmplab3:
    $tmpret4 = 0;
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret4;
} #end-of-function


sub
ats2plpre_option_is_none($)
{
##
  my($arg0) = @_;
##
  my $tmpret5;
##
  __patsflab_option_is_none:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab4:
    if(ATSCKptriscons($arg0)) { goto __atstmplab7; }
    __atstmplab5:
    $tmpret5 = 1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab6:
    __atstmplab7:
    $tmpret5 = 0;
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret5;
} #end-of-function

######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-3-25: 11h:24m
##
######
sub
_ats2plpre_stream_patsfun_6__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_6($cenv->[1]); }, $env0];
}

sub
_ats2plpre_stream_patsfun_17__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_patsfun_17($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_23__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_23($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_25__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_25($cenv->[1]); }, $env0];
}

sub
_ats2plpre_stream_patsfun_27__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_27($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_29__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_patsfun_29($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_patsfun_31__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_31($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_33__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_patsfun_33($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_patsfun_36__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_patsfun_36($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_patsfun_39__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_patsfun_39($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_patsfun_42__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_patsfun_42($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_patsfun_46__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_patsfun_46($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_patsfun_49__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_49($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_52__closurerize($$$$)
{
  my($env0, $env1, $env2, $env3) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_52($cenv->[1], $cenv->[2], $cenv->[3], $cenv->[4]); }, $env0, $env1, $env2, $env3];
}

sub
_ats2plpre_stream_patsfun_53__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_53($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_56__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_56($cenv->[1]); }, $env0];
}

sub
_ats2plpre_stream_patsfun_58__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_58($cenv->[1]); }, $env0];
}

sub
_ats2plpre_stream_patsfun_60__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_60($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_65__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0, $arg1) = @_; return _ats2plpre_stream_patsfun_65($cenv->[1], $arg0, $arg1); }, $env0];
}

sub
_ats2plpre_stream_patsfun_67__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0, $arg1) = @_; return _ats2plpre_stream_patsfun_67($cenv->[1], $arg0, $arg1); }, $env0];
}

sub
_ats2plpre_stream_patsfun_70__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_70($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_72__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_72($cenv->[1], $cenv->[2]); }, $env0, $env1];
}


sub
ats2plpre_stream_make_list($)
{
##
  my($arg0) = @_;
##
  my $tmpret7;
##
  __patsflab_stream_make_list:
  $tmpret7 = ATSPMVlazyval(_ats2plpre_stream_patsfun_6__closurerize($arg0));
  return $tmpret7;
} #end-of-function


sub
_ats2plpre_stream_patsfun_6($)
{
##
  my($env0) = @_;
##
  my $tmpret8;
  my $tmp9;
  my $tmp10;
  my $tmp11;
##
  __patsflab__ats2plpre_stream_patsfun_6:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab0:
    if(ATSCKptriscons($env0)) { goto __atstmplab3; }
    __atstmplab1:
    $tmpret8 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab2:
    __atstmplab3:
    $tmp9 = $env0->[0];
    $tmp10 = $env0->[1];
    $tmp11 = ats2plpre_stream_make_list($tmp10);
    $tmpret8 = [$tmp9, $tmp11];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret8;
} #end-of-function


sub
ats2plpre_stream_make_list0($)
{
##
  my($arg0) = @_;
##
  my $tmpret12;
##
  __patsflab_stream_make_list0:
  $tmpret12 = ats2plpre_stream_make_list($arg0);
  return $tmpret12;
} #end-of-function


sub
ats2plpre_stream_nth_opt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret13;
##
  __patsflab_stream_nth_opt:
  $tmpret13 = _ats2plpre_stream_loop_9($arg0, $arg1);
  return $tmpret13;
} #end-of-function


sub
_ats2plpre_stream_loop_9($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret14;
  my $tmp15;
  my $tmp16;
  my $tmp17;
  my $tmp18;
  my $tmp19;
##
  __patsflab__ats2plpre_stream_loop_9:
  $tmp15 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab4:
    if(ATSCKptriscons($tmp15)) { goto __atstmplab7; }
    __atstmplab5:
    $tmpret14 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab6:
    __atstmplab7:
    $tmp16 = $tmp15->[0];
    $tmp17 = $tmp15->[1];
    $tmp18 = ats2plpre_gt_int1_int1($arg1, 0);
    if($tmp18) {
      $tmp19 = ats2plpre_pred_int1($arg1);
      #ATStailcalseq_beg
      $apy0 = $tmp17;
      $apy1 = $tmp19;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab__ats2plpre_stream_loop_9;
      #ATStailcalseq_end
    } else {
      $tmpret14 = [$tmp16];
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret14;
} #end-of-function


sub
ats2plpre_stream_length($)
{
##
  my($arg0) = @_;
##
  my $tmpret20;
##
  __patsflab_stream_length:
  $tmpret20 = _ats2plpre_stream_loop_11($arg0, 0);
  return $tmpret20;
} #end-of-function


sub
_ats2plpre_stream_loop_11($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret21;
  my $tmp22;
  my $tmp24;
  my $tmp25;
##
  __patsflab__ats2plpre_stream_loop_11:
  $tmp22 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab8:
    if(ATSCKptriscons($tmp22)) { goto __atstmplab11; }
    __atstmplab9:
    $tmpret21 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab10:
    __atstmplab11:
    $tmp24 = $tmp22->[1];
    $tmp25 = ats2plpre_add_int1_int1($arg1, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp24;
    $apy1 = $tmp25;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_stream_loop_11;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret21;
} #end-of-function


sub
ats2plpre_stream2list($)
{
##
  my($arg0) = @_;
##
  my $tmpret26;
##
  __patsflab_stream2list:
  $tmpret26 = _ats2plpre_stream_aux_13($arg0);
  return $tmpret26;
} #end-of-function


sub
_ats2plpre_stream_aux_13($)
{
##
  my($arg0) = @_;
##
  my $tmpret27;
  my $tmp28;
  my $tmp29;
  my $tmp30;
  my $tmp31;
##
  __patsflab__ats2plpre_stream_aux_13:
  $tmp28 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab12:
    if(ATSCKptriscons($tmp28)) { goto __atstmplab15; }
    __atstmplab13:
    $tmpret27 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab14:
    __atstmplab15:
    $tmp29 = $tmp28->[0];
    $tmp30 = $tmp28->[1];
    $tmp31 = _ats2plpre_stream_aux_13($tmp30);
    $tmpret27 = [$tmp29, $tmp31];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret27;
} #end-of-function


sub
ats2plpre_stream2list_rev($)
{
##
  my($arg0) = @_;
##
  my $tmpret32;
  my $tmp38;
##
  __patsflab_stream2list_rev:
  $tmp38 = 0;
  $tmpret32 = _ats2plpre_stream_loop_15($arg0, $tmp38);
  return $tmpret32;
} #end-of-function


sub
_ats2plpre_stream_loop_15($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret33;
  my $tmp34;
  my $tmp35;
  my $tmp36;
  my $tmp37;
##
  __patsflab__ats2plpre_stream_loop_15:
  $tmp34 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab16:
    if(ATSCKptriscons($tmp34)) { goto __atstmplab19; }
    __atstmplab17:
    $tmpret33 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab18:
    __atstmplab19:
    $tmp35 = $tmp34->[0];
    $tmp36 = $tmp34->[1];
    $tmp37 = [$tmp35, $arg1];
    #ATStailcalseq_beg
    $apy0 = $tmp36;
    $apy1 = $tmp37;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_stream_loop_15;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret33;
} #end-of-function


sub
ats2plpre_stream_takeLte($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret39;
##
  __patsflab_stream_takeLte:
  $tmpret39 = ATSPMVllazyval(_ats2plpre_stream_patsfun_17__closurerize($arg0, $arg1));
  return $tmpret39;
} #end-of-function


sub
_ats2plpre_stream_patsfun_17($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret40;
  my $tmp41;
  my $tmp42;
  my $tmp43;
  my $tmp44;
  my $tmp45;
  my $tmp46;
##
  __patsflab__ats2plpre_stream_patsfun_17:
  if($arg0) {
    $tmp41 = ats2plpre_gt_int1_int1($env1, 0);
    if($tmp41) {
      $tmp42 = ATSPMVlazyval_eval($env0); 
      #ATScaseofseq_beg
      while(1)
      {
        #ATSbranchseq_beg
        __atstmplab20:
        if(ATSCKptriscons($tmp42)) { goto __atstmplab23; }
        __atstmplab21:
        $tmpret40 = 0;
        last;
        #ATSbranchseq_end
        #ATSbranchseq_beg
        __atstmplab22:
        __atstmplab23:
        $tmp43 = $tmp42->[0];
        $tmp44 = $tmp42->[1];
        $tmp46 = ats2plpre_sub_int1_int1($env1, 1);
        $tmp45 = ats2plpre_stream_takeLte($tmp44, $tmp46);
        $tmpret40 = [$tmp43, $tmp45];
        last;
        #ATSbranchseq_end
      } #end-of-while-loop;
      #ATScaseofseq_end
    } else {
      $tmpret40 = 0;
    } #endif
  } else {
  } #endif
  return $tmpret40;
} #end-of-function


sub
ats2plpre_stream_take_opt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret47;
  my $tmp56;
##
  __patsflab_stream_take_opt:
  $tmp56 = 0;
  $tmpret47 = _ats2plpre_stream_auxmain_19($arg1, $arg0, 0, $tmp56);
  return $tmpret47;
} #end-of-function


sub
_ats2plpre_stream_auxmain_19($$$$)
{
##
  my($env0, $arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmpret48;
  my $tmp49;
  my $tmp50;
  my $tmp51;
  my $tmp52;
  my $tmp53;
  my $tmp54;
  my $tmp55;
##
  __patsflab__ats2plpre_stream_auxmain_19:
  $tmp49 = ats2plpre_lt_int1_int1($arg1, $env0);
  if($tmp49) {
    $tmp50 = ATSPMVlazyval_eval($arg0); 
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab24:
      if(ATSCKptriscons($tmp50)) { goto __atstmplab27; }
      __atstmplab25:
      $tmpret48 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab26:
      __atstmplab27:
      $tmp51 = $tmp50->[0];
      $tmp52 = $tmp50->[1];
      $tmp53 = ats2plpre_add_int1_int1($arg1, 1);
      $tmp54 = [$tmp51, $arg2];
      #ATStailcalseq_beg
      $apy0 = $tmp52;
      $apy1 = $tmp53;
      $apy2 = $tmp54;
      $arg0 = $apy0;
      $arg1 = $apy1;
      $arg2 = $apy2;
      goto __patsflab__ats2plpre_stream_auxmain_19;
      #ATStailcalseq_end
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
    $tmp55 = ats2plpre_list_reverse($arg2);
    $tmpret48 = [$tmp55];
  } #endif
  return $tmpret48;
} #end-of-function


sub
ats2plpre_stream_drop_opt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret57;
##
  __patsflab_stream_drop_opt:
  $tmpret57 = _ats2plpre_stream_auxmain_21($arg1, $arg0, 0);
  return $tmpret57;
} #end-of-function


sub
_ats2plpre_stream_auxmain_21($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret58;
  my $tmp59;
  my $tmp60;
  my $tmp62;
  my $tmp63;
##
  __patsflab__ats2plpre_stream_auxmain_21:
  $tmp59 = ats2plpre_lt_int1_int1($arg1, $env0);
  if($tmp59) {
    $tmp60 = ATSPMVlazyval_eval($arg0); 
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab28:
      if(ATSCKptriscons($tmp60)) { goto __atstmplab31; }
      __atstmplab29:
      $tmpret58 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab30:
      __atstmplab31:
      $tmp62 = $tmp60->[1];
      $tmp63 = ats2plpre_add_int1_int1($arg1, 1);
      #ATStailcalseq_beg
      $apy0 = $tmp62;
      $apy1 = $tmp63;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab__ats2plpre_stream_auxmain_21;
      #ATStailcalseq_end
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
    $tmpret58 = [$arg0];
  } #endif
  return $tmpret58;
} #end-of-function


sub
ats2plpre_stream_append($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret64;
##
  __patsflab_stream_append:
  $tmpret64 = ATSPMVlazyval(_ats2plpre_stream_patsfun_23__closurerize($arg0, $arg1));
  return $tmpret64;
} #end-of-function


sub
_ats2plpre_stream_patsfun_23($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret65;
  my $tmp66;
  my $tmp67;
  my $tmp68;
  my $tmp69;
##
  __patsflab__ats2plpre_stream_patsfun_23:
  $tmp66 = ATSPMVlazyval_eval($env0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab32:
    if(ATSCKptriscons($tmp66)) { goto __atstmplab35; }
    __atstmplab33:
    $tmpret65 = ATSPMVlazyval_eval($env1); 
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab34:
    __atstmplab35:
    $tmp67 = $tmp66->[0];
    $tmp68 = $tmp66->[1];
    $tmp69 = ats2plpre_stream_append($tmp68, $env1);
    $tmpret65 = [$tmp67, $tmp69];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret65;
} #end-of-function


sub
ats2plpre_stream_concat($)
{
##
  my($arg0) = @_;
##
  my $tmpret70;
##
  __patsflab_stream_concat:
  $tmpret70 = ATSPMVlazyval(_ats2plpre_stream_patsfun_25__closurerize($arg0));
  return $tmpret70;
} #end-of-function


sub
_ats2plpre_stream_patsfun_25($)
{
##
  my($env0) = @_;
##
  my $tmpret71;
  my $tmp72;
  my $tmp73;
  my $tmp74;
  my $tmp75;
  my $tmp76;
##
  __patsflab__ats2plpre_stream_patsfun_25:
  $tmp72 = ATSPMVlazyval_eval($env0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab36:
    if(ATSCKptriscons($tmp72)) { goto __atstmplab39; }
    __atstmplab37:
    $tmpret71 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab38:
    __atstmplab39:
    $tmp73 = $tmp72->[0];
    $tmp74 = $tmp72->[1];
    $tmp76 = ats2plpre_stream_concat($tmp74);
    $tmp75 = ats2plpre_stream_append($tmp73, $tmp76);
    $tmpret71 = ATSPMVlazyval_eval($tmp75); 
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret71;
} #end-of-function


sub
ats2plpre_stream_map_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret77;
##
  __patsflab_stream_map_cloref:
  $tmpret77 = ATSPMVlazyval(_ats2plpre_stream_patsfun_27__closurerize($arg0, $arg1));
  return $tmpret77;
} #end-of-function


sub
_ats2plpre_stream_patsfun_27($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret78;
  my $tmp79;
  my $tmp80;
  my $tmp81;
  my $tmp82;
  my $tmp83;
##
  __patsflab__ats2plpre_stream_patsfun_27:
  $tmp79 = ATSPMVlazyval_eval($env0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab40:
    if(ATSCKptriscons($tmp79)) { goto __atstmplab43; }
    __atstmplab41:
    $tmpret78 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab42:
    __atstmplab43:
    $tmp80 = $tmp79->[0];
    $tmp81 = $tmp79->[1];
    $tmp82 = &{$env1->[0]}($env1, $tmp80);
    $tmp83 = ats2plpre_stream_map_cloref($tmp81, $env1);
    $tmpret78 = [$tmp82, $tmp83];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret78;
} #end-of-function


sub
ats2plpre_stream_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret84;
##
  __patsflab_stream_map_method:
  $tmpret84 = _ats2plpre_stream_patsfun_29__closurerize($arg0);
  return $tmpret84;
} #end-of-function


sub
_ats2plpre_stream_patsfun_29($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret85;
##
  __patsflab__ats2plpre_stream_patsfun_29:
  $tmpret85 = ats2plpre_stream_map_cloref($env0, $arg0);
  return $tmpret85;
} #end-of-function


sub
ats2plpre_stream_filter_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret86;
##
  __patsflab_stream_filter_cloref:
  $tmpret86 = ATSPMVlazyval(_ats2plpre_stream_patsfun_31__closurerize($arg0, $arg1));
  return $tmpret86;
} #end-of-function


sub
_ats2plpre_stream_patsfun_31($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret87;
  my $tmp88;
  my $tmp89;
  my $tmp90;
  my $tmp91;
  my $tmp92;
  my $tmp93;
##
  __patsflab__ats2plpre_stream_patsfun_31:
  $tmp88 = ATSPMVlazyval_eval($env0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab44:
    if(ATSCKptriscons($tmp88)) { goto __atstmplab47; }
    __atstmplab45:
    $tmpret87 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab46:
    __atstmplab47:
    $tmp89 = $tmp88->[0];
    $tmp90 = $tmp88->[1];
    $tmp91 = &{$env1->[0]}($env1, $tmp89);
    if($tmp91) {
      $tmp92 = ats2plpre_stream_filter_cloref($tmp90, $env1);
      $tmpret87 = [$tmp89, $tmp92];
    } else {
      $tmp93 = ats2plpre_stream_filter_cloref($tmp90, $env1);
      $tmpret87 = ATSPMVlazyval_eval($tmp93); 
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret87;
} #end-of-function


sub
ats2plpre_stream_filter_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret94;
##
  __patsflab_stream_filter_method:
  $tmpret94 = _ats2plpre_stream_patsfun_33__closurerize($arg0);
  return $tmpret94;
} #end-of-function


sub
_ats2plpre_stream_patsfun_33($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret95;
##
  __patsflab__ats2plpre_stream_patsfun_33:
  $tmpret95 = ats2plpre_stream_filter_cloref($env0, $arg0);
  return $tmpret95;
} #end-of-function


sub
ats2plpre_stream_forall_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret96;
  my $tmp97;
  my $tmp98;
  my $tmp99;
  my $tmp100;
##
  __patsflab_stream_forall_cloref:
  $tmp97 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab48:
    if(ATSCKptriscons($tmp97)) { goto __atstmplab51; }
    __atstmplab49:
    $tmpret96 = 1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab50:
    __atstmplab51:
    $tmp98 = $tmp97->[0];
    $tmp99 = $tmp97->[1];
    $tmp100 = &{$arg1->[0]}($arg1, $tmp98);
    if($tmp100) {
      #ATStailcalseq_beg
      $apy0 = $tmp99;
      $apy1 = $arg1;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab_stream_forall_cloref;
      #ATStailcalseq_end
    } else {
      $tmpret96 = 0;
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret96;
} #end-of-function


sub
ats2plpre_stream_forall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret101;
##
  __patsflab_stream_forall_method:
  $tmpret101 = _ats2plpre_stream_patsfun_36__closurerize($arg0);
  return $tmpret101;
} #end-of-function


sub
_ats2plpre_stream_patsfun_36($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret102;
##
  __patsflab__ats2plpre_stream_patsfun_36:
  $tmpret102 = ats2plpre_stream_forall_cloref($env0, $arg0);
  return $tmpret102;
} #end-of-function


sub
ats2plpre_stream_exists_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret103;
  my $tmp104;
  my $tmp105;
  my $tmp106;
  my $tmp107;
##
  __patsflab_stream_exists_cloref:
  $tmp104 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab52:
    if(ATSCKptriscons($tmp104)) { goto __atstmplab55; }
    __atstmplab53:
    $tmpret103 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab54:
    __atstmplab55:
    $tmp105 = $tmp104->[0];
    $tmp106 = $tmp104->[1];
    $tmp107 = &{$arg1->[0]}($arg1, $tmp105);
    if($tmp107) {
      $tmpret103 = 1;
    } else {
      #ATStailcalseq_beg
      $apy0 = $tmp106;
      $apy1 = $arg1;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab_stream_exists_cloref;
      #ATStailcalseq_end
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret103;
} #end-of-function


sub
ats2plpre_stream_exists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret108;
##
  __patsflab_stream_exists_method:
  $tmpret108 = _ats2plpre_stream_patsfun_39__closurerize($arg0);
  return $tmpret108;
} #end-of-function


sub
_ats2plpre_stream_patsfun_39($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret109;
##
  __patsflab__ats2plpre_stream_patsfun_39:
  $tmpret109 = ats2plpre_stream_exists_cloref($env0, $arg0);
  return $tmpret109;
} #end-of-function


sub
ats2plpre_stream_foreach_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmp111;
  my $tmp112;
  my $tmp113;
##
  __patsflab_stream_foreach_cloref:
  $tmp111 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab56:
    if(ATSCKptriscons($tmp111)) { goto __atstmplab59; }
    __atstmplab57:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab58:
    __atstmplab59:
    $tmp112 = $tmp111->[0];
    $tmp113 = $tmp111->[1];
    &{$arg1->[0]}($arg1, $tmp112);
    #ATStailcalseq_beg
    $apy0 = $tmp113;
    $apy1 = $arg1;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab_stream_foreach_cloref;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_stream_foreach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret115;
##
  __patsflab_stream_foreach_method:
  $tmpret115 = _ats2plpre_stream_patsfun_42__closurerize($arg0);
  return $tmpret115;
} #end-of-function


sub
_ats2plpre_stream_patsfun_42($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_stream_patsfun_42:
  ats2plpre_stream_foreach_cloref($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_stream_iforeach_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_stream_iforeach_cloref:
  _ats2plpre_stream_loop_44($arg1, 0, $arg0);
  return;#_void
} #end-of-function


sub
_ats2plpre_stream_loop_44($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmp119;
  my $tmp120;
  my $tmp121;
  my $tmp123;
##
  __patsflab__ats2plpre_stream_loop_44:
  $tmp119 = ATSPMVlazyval_eval($arg1); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab60:
    if(ATSCKptriscons($tmp119)) { goto __atstmplab63; }
    __atstmplab61:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab62:
    __atstmplab63:
    $tmp120 = $tmp119->[0];
    $tmp121 = $tmp119->[1];
    &{$env0->[0]}($env0, $arg0, $tmp120);
    $tmp123 = ats2plpre_add_int1_int1($arg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp123;
    $apy1 = $tmp121;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_stream_loop_44;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_stream_iforeach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret124;
##
  __patsflab_stream_iforeach_method:
  $tmpret124 = _ats2plpre_stream_patsfun_46__closurerize($arg0);
  return $tmpret124;
} #end-of-function


sub
_ats2plpre_stream_patsfun_46($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_stream_patsfun_46:
  ats2plpre_stream_iforeach_cloref($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_stream_tabulate_cloref($)
{
##
  my($arg0) = @_;
##
  my $tmpret126;
##
  __patsflab_stream_tabulate_cloref:
  $tmpret126 = _ats2plpre_stream_auxmain_48($arg0, 0);
  return $tmpret126;
} #end-of-function


sub
_ats2plpre_stream_auxmain_48($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret127;
##
  __patsflab__ats2plpre_stream_auxmain_48:
  $tmpret127 = ATSPMVlazyval(_ats2plpre_stream_patsfun_49__closurerize($env0, $arg0));
  return $tmpret127;
} #end-of-function


sub
_ats2plpre_stream_patsfun_49($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret128;
  my $tmp129;
  my $tmp130;
  my $tmp131;
##
  __patsflab__ats2plpre_stream_patsfun_49:
  $tmp129 = &{$env0->[0]}($env0, $env1);
  $tmp131 = ats2plpre_add_int1_int1($env1, 1);
  $tmp130 = _ats2plpre_stream_auxmain_48($env0, $tmp131);
  $tmpret128 = [$tmp129, $tmp130];
  return $tmpret128;
} #end-of-function


sub
ats2plpre_cross_stream_list($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret132;
##
  __patsflab_cross_stream_list:
  $tmpret132 = ATSPMVlazyval(_ats2plpre_stream_patsfun_53__closurerize($arg0, $arg1));
  return $tmpret132;
} #end-of-function


sub
_ats2plpre_stream_auxmain_51($$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3) = @_;
##
  my $tmpret133;
##
  __patsflab__ats2plpre_stream_auxmain_51:
  $tmpret133 = ATSPMVlazyval(_ats2plpre_stream_patsfun_52__closurerize($arg0, $arg1, $arg2, $arg3));
  return $tmpret133;
} #end-of-function


sub
_ats2plpre_stream_patsfun_52($$$$)
{
##
  my($env0, $env1, $env2, $env3) = @_;
##
  my $tmpret134;
  my $tmp135;
  my $tmp136;
  my $tmp137;
  my $tmp138;
  my $tmp139;
##
  __patsflab__ats2plpre_stream_patsfun_52:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab64:
    if(ATSCKptriscons($env3)) { goto __atstmplab67; }
    __atstmplab65:
    $tmp137 = ats2plpre_cross_stream_list($env1, $env2);
    $tmpret134 = ATSPMVlazyval_eval($tmp137); 
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab66:
    __atstmplab67:
    $tmp135 = $env3->[0];
    $tmp136 = $env3->[1];
    $tmp138 = [$env0, $tmp135];
    $tmp139 = _ats2plpre_stream_auxmain_51($env0, $env1, $env2, $tmp136);
    $tmpret134 = [$tmp138, $tmp139];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret134;
} #end-of-function


sub
_ats2plpre_stream_patsfun_53($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret140;
  my $tmp141;
  my $tmp142;
  my $tmp143;
  my $tmp144;
##
  __patsflab__ats2plpre_stream_patsfun_53:
  $tmp141 = ATSPMVlazyval_eval($env0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab68:
    if(ATSCKptriscons($tmp141)) { goto __atstmplab71; }
    __atstmplab69:
    $tmpret140 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab70:
    if(ATSCKptrisnull($tmp141)) { ATSINScaseof_fail("/home/hwxi/Research/ATS-Postiats/contrib/libatscc/ATS2-0.3.2/DATS/stream.dats: 6907(line=451, offs=1) -- 6999(line=453, offs=50)"); }
    __atstmplab71:
    $tmp142 = $tmp141->[0];
    $tmp143 = $tmp141->[1];
    $tmp144 = _ats2plpre_stream_auxmain_51($tmp142, $tmp143, $env1, $env1);
    $tmpret140 = ATSPMVlazyval_eval($tmp144); 
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret140;
} #end-of-function


sub
ats2plpre_cross_stream_list0($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret145;
##
  __patsflab_cross_stream_list0:
  $tmpret145 = ats2plpre_cross_stream_list($arg0, $arg1);
  return $tmpret145;
} #end-of-function


sub
ats2plpre_stream2cloref_exn($)
{
##
  my($arg0) = @_;
##
  my $tmpret146;
  my $tmp147;
##
  __patsflab_stream2cloref_exn:
  $tmp147 = ats2plpre_ref($arg0);
  $tmpret146 = _ats2plpre_stream_patsfun_56__closurerize($tmp147);
  return $tmpret146;
} #end-of-function


sub
_ats2plpre_stream_patsfun_56($)
{
##
  my($env0) = @_;
##
  my $tmpret148;
  my $tmp149;
  my $tmp150;
  my $tmp151;
  my $tmp152;
##
  __patsflab__ats2plpre_stream_patsfun_56:
  $tmp149 = ats2plpre_ref_get_elt($env0);
  $tmp150 = ATSPMVlazyval_eval($tmp149); 
  if(ATSCKptrisnull($tmp150)) { ATSINScaseof_fail("/home/hwxi/Research/ATS-Postiats/contrib/libatscc/ATS2-0.3.2/DATS/stream.dats: 7300(line=479, offs=5) -- 7324(line=479, offs=29)"); }
  $tmp151 = $tmp150->[0];
  $tmp152 = $tmp150->[1];
  ats2plpre_ref_set_elt($env0, $tmp152);
  $tmpret148 = $tmp151;
  return $tmpret148;
} #end-of-function


sub
ats2plpre_stream2cloref_opt($)
{
##
  my($arg0) = @_;
##
  my $tmpret154;
  my $tmp155;
##
  __patsflab_stream2cloref_opt:
  $tmp155 = ats2plpre_ref($arg0);
  $tmpret154 = _ats2plpre_stream_patsfun_58__closurerize($tmp155);
  return $tmpret154;
} #end-of-function


sub
_ats2plpre_stream_patsfun_58($)
{
##
  my($env0) = @_;
##
  my $tmpret156;
  my $tmp157;
  my $tmp158;
  my $tmp159;
  my $tmp160;
##
  __patsflab__ats2plpre_stream_patsfun_58:
  $tmp157 = ats2plpre_ref_get_elt($env0);
  $tmp158 = ATSPMVlazyval_eval($tmp157); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab72:
    if(ATSCKptriscons($tmp158)) { goto __atstmplab75; }
    __atstmplab73:
    $tmpret156 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab74:
    __atstmplab75:
    $tmp159 = $tmp158->[0];
    $tmp160 = $tmp158->[1];
    ats2plpre_ref_set_elt($env0, $tmp160);
    $tmpret156 = [$tmp159];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret156;
} #end-of-function


sub
ats2plpre_stream2cloref_last($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret162;
  my $tmp163;
  my $tmp164;
##
  __patsflab_stream2cloref_last:
  $tmp163 = ats2plpre_ref($arg0);
  $tmp164 = ats2plpre_ref($arg1);
  $tmpret162 = _ats2plpre_stream_patsfun_60__closurerize($tmp163, $tmp164);
  return $tmpret162;
} #end-of-function


sub
_ats2plpre_stream_patsfun_60($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret165;
  my $tmp166;
  my $tmp167;
  my $tmp168;
  my $tmp169;
##
  __patsflab__ats2plpre_stream_patsfun_60:
  $tmp166 = ats2plpre_ref_get_elt($env0);
  $tmp167 = ATSPMVlazyval_eval($tmp166); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab76:
    if(ATSCKptriscons($tmp167)) { goto __atstmplab79; }
    __atstmplab77:
    $tmpret165 = ats2plpre_ref_get_elt($env1);
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab78:
    __atstmplab79:
    $tmp168 = $tmp167->[0];
    $tmp169 = $tmp167->[1];
    ats2plpre_ref_set_elt($env0, $tmp169);
    ats2plpre_ref_set_elt($env1, $tmp168);
    $tmpret165 = $tmp168;
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret165;
} #end-of-function


sub
ats2plpre_stream_take_while_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret172;
  my $tmp173;
  my $tmp174;
  my $tmp175;
  my $tmp176;
##
  __patsflab_stream_take_while_cloref:
  $tmp173 = ats2plpre_stream_rtake_while_cloref($arg0, $arg1);
  $tmp174 = $tmp173->[0];
  $tmp175 = $tmp173->[1];
  $tmp176 = ats2plpre_list_reverse($tmp175);
  $tmpret172 = [$tmp174, $tmp176];
  return $tmpret172;
} #end-of-function


sub
ats2plpre_stream_rtake_while_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret177;
  my $tmp185;
##
  __patsflab_stream_rtake_while_cloref:
  $tmp185 = 0;
  $tmpret177 = _ats2plpre_stream_loop_63($arg1, $arg0, 0, $tmp185);
  return $tmpret177;
} #end-of-function


sub
_ats2plpre_stream_loop_63($$$$)
{
##
  my($env0, $arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmpret178;
  my $tmp179;
  my $tmp180;
  my $tmp181;
  my $tmp182;
  my $tmp183;
  my $tmp184;
##
  __patsflab__ats2plpre_stream_loop_63:
  $tmp179 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab80:
    if(ATSCKptriscons($tmp179)) { goto __atstmplab83; }
    __atstmplab81:
    $tmpret178 = [$arg0, $arg2];
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab82:
    __atstmplab83:
    $tmp180 = $tmp179->[0];
    $tmp181 = $tmp179->[1];
    $tmp182 = &{$env0->[0]}($env0, $arg1, $tmp180);
    if($tmp182) {
      $tmp183 = ats2plpre_add_int1_int1($arg1, 1);
      $tmp184 = [$tmp180, $arg2];
      #ATStailcalseq_beg
      $apy0 = $tmp181;
      $apy1 = $tmp183;
      $apy2 = $tmp184;
      $arg0 = $apy0;
      $arg1 = $apy1;
      $arg2 = $apy2;
      goto __patsflab__ats2plpre_stream_loop_63;
      #ATStailcalseq_end
    } else {
      $tmpret178 = [$arg0, $arg2];
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret178;
} #end-of-function


sub
ats2plpre_stream_take_until_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret186;
##
  __patsflab_stream_take_until_cloref:
  $tmpret186 = ats2plpre_stream_take_while_cloref($arg0, _ats2plpre_stream_patsfun_65__closurerize($arg1));
  return $tmpret186;
} #end-of-function


sub
_ats2plpre_stream_patsfun_65($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $tmpret187;
  my $tmp188;
##
  __patsflab__ats2plpre_stream_patsfun_65:
  $tmp188 = &{$env0->[0]}($env0, $arg0, $arg1);
  $tmpret187 = atspre_neg_bool0($tmp188);
  return $tmpret187;
} #end-of-function


sub
ats2plpre_stream_rtake_until_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret189;
##
  __patsflab_stream_rtake_until_cloref:
  $tmpret189 = ats2plpre_stream_rtake_while_cloref($arg0, _ats2plpre_stream_patsfun_67__closurerize($arg1));
  return $tmpret189;
} #end-of-function


sub
_ats2plpre_stream_patsfun_67($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $tmpret190;
  my $tmp191;
##
  __patsflab__ats2plpre_stream_patsfun_67:
  $tmp191 = &{$env0->[0]}($env0, $arg0, $arg1);
  $tmpret190 = atspre_neg_bool0($tmp191);
  return $tmpret190;
} #end-of-function


sub
ats2plpre_stream_list_xprod2($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret192;
##
  __patsflab_stream_list_xprod2:
  $tmpret192 = _ats2plpre_stream_auxlst_71($arg0, $arg1);
  return $tmpret192;
} #end-of-function


sub
_ats2plpre_stream_aux_69($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret193;
##
  __patsflab__ats2plpre_stream_aux_69:
  $tmpret193 = ATSPMVlazyval(_ats2plpre_stream_patsfun_70__closurerize($arg0, $arg1));
  return $tmpret193;
} #end-of-function


sub
_ats2plpre_stream_patsfun_70($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret194;
  my $tmp195;
  my $tmp196;
  my $tmp197;
  my $tmp198;
##
  __patsflab__ats2plpre_stream_patsfun_70:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab84:
    if(ATSCKptriscons($env1)) { goto __atstmplab87; }
    __atstmplab85:
    $tmpret194 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab86:
    __atstmplab87:
    $tmp195 = $env1->[0];
    $tmp196 = $env1->[1];
    $tmp197 = [$env0, $tmp195];
    $tmp198 = _ats2plpre_stream_aux_69($env0, $tmp196);
    $tmpret194 = [$tmp197, $tmp198];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret194;
} #end-of-function


sub
_ats2plpre_stream_auxlst_71($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret199;
##
  __patsflab__ats2plpre_stream_auxlst_71:
  $tmpret199 = ATSPMVlazyval(_ats2plpre_stream_patsfun_72__closurerize($arg0, $arg1));
  return $tmpret199;
} #end-of-function


sub
_ats2plpre_stream_patsfun_72($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret200;
  my $tmp201;
  my $tmp202;
  my $tmp203;
  my $tmp204;
  my $tmp205;
##
  __patsflab__ats2plpre_stream_patsfun_72:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab88:
    if(ATSCKptriscons($env0)) { goto __atstmplab91; }
    __atstmplab89:
    $tmpret200 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab90:
    __atstmplab91:
    $tmp201 = $env0->[0];
    $tmp202 = $env0->[1];
    $tmp204 = _ats2plpre_stream_aux_69($tmp201, $env1);
    $tmp205 = _ats2plpre_stream_auxlst_71($tmp202, $env1);
    $tmp203 = ats2plpre_stream_append($tmp204, $tmp205);
    $tmpret200 = ATSPMVlazyval_eval($tmp203); 
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret200;
} #end-of-function


######
#ATSextcode_beg()
######
######
1; ##note that it is needed by 'use' or 'require'
######
######
#ATSextcode_end()
######
######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-3-25: 11h:24m
##
######
sub
_ats2plpre_stream_vt_patsfun_7__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_vt_patsfun_7($cenv->[1]); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_10__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_10($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_stream_vt_patsfun_19__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_19($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_stream_vt_patsfun_22__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_22($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_25__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_25($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_stream_vt_patsfun_27__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_27($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_30__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_30($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_stream_vt_patsfun_32__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_32($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_36__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_36($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_40__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_40($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_44__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_44($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_48__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_48($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_52__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_52($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_55__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_55($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}


sub
ats2plpre_stream_vt_free($)
{
##
  my($arg0) = @_;
##
##
  __patsflab_stream_vt_free:
  atspre_lazy_vt_free($arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_stream_vt2t($)
{
##
  my($arg0) = @_;
##
  my $tmpret6;
##
  __patsflab_stream_vt2t:
  $tmpret6 = _ats2plpre_stream_vt_aux_6($arg0);
  return $tmpret6;
} #end-of-function


sub
_ats2plpre_stream_vt_aux_6($)
{
##
  my($arg0) = @_;
##
  my $tmpret7;
##
  __patsflab__ats2plpre_stream_vt_aux_6:
  $tmpret7 = ATSPMVlazyval(_ats2plpre_stream_vt_patsfun_7__closurerize($arg0));
  return $tmpret7;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_7($)
{
##
  my($env0) = @_;
##
  my $tmpret8;
  my $tmp9;
  my $tmp10;
  my $tmp11;
  my $tmp12;
##
  __patsflab__ats2plpre_stream_vt_patsfun_7:
  $tmp9 = ATSPMVllazyval_eval($env0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab0:
    if(ATSCKptriscons($tmp9)) { goto __atstmplab3; }
    __atstmplab1:
    $tmpret8 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab2:
    __atstmplab3:
    $tmp10 = $tmp9->[0];
    $tmp11 = $tmp9->[1];
    #ATSINSfreecon($tmp9);
    $tmp12 = _ats2plpre_stream_vt_aux_6($tmp11);
    $tmpret8 = [$tmp10, $tmp12];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret8;
} #end-of-function


sub
ats2plpre_stream_vt_takeLte($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret13;
##
  __patsflab_stream_vt_takeLte:
  $tmpret13 = _ats2plpre_stream_vt_auxmain_9($arg0, $arg1);
  return $tmpret13;
} #end-of-function


sub
_ats2plpre_stream_vt_auxmain_9($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret14;
##
  __patsflab__ats2plpre_stream_vt_auxmain_9:
  $tmpret14 = ATSPMVllazyval(_ats2plpre_stream_vt_patsfun_10__closurerize($arg0, $arg1));
  return $tmpret14;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_10($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret15;
  my $tmp16;
  my $tmp17;
  my $tmp18;
  my $tmp19;
  my $tmp20;
  my $tmp21;
##
  __patsflab__ats2plpre_stream_vt_patsfun_10:
  if($arg0) {
    $tmp16 = ats2plpre_gt_int1_int1($env1, 0);
    if($tmp16) {
      $tmp17 = ATSPMVllazyval_eval($env0);
      #ATScaseofseq_beg
      while(1)
      {
        #ATSbranchseq_beg
        __atstmplab4:
        if(ATSCKptriscons($tmp17)) { goto __atstmplab7; }
        __atstmplab5:
        $tmpret15 = 0;
        last;
        #ATSbranchseq_end
        #ATSbranchseq_beg
        __atstmplab6:
        __atstmplab7:
        $tmp18 = $tmp17->[0];
        $tmp19 = $tmp17->[1];
        #ATSINSfreecon($tmp17);
        $tmp21 = ats2plpre_sub_int1_int1($env1, 1);
        $tmp20 = _ats2plpre_stream_vt_auxmain_9($tmp19, $tmp21);
        $tmpret15 = [$tmp18, $tmp20];
        last;
        #ATSbranchseq_end
      } #end-of-while-loop;
      #ATScaseofseq_end
    } else {
      atspre_lazy_vt_free($env0);
      $tmpret15 = 0;
    } #endif
  } else {
    atspre_lazy_vt_free($env0);
  } #endif
  return $tmpret15;
} #end-of-function


sub
ats2plpre_stream_vt_length($)
{
##
  my($arg0) = @_;
##
  my $tmpret24;
##
  __patsflab_stream_vt_length:
  $tmpret24 = _ats2plpre_stream_vt_loop_12($arg0, 0);
  return $tmpret24;
} #end-of-function


sub
_ats2plpre_stream_vt_loop_12($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret25;
  my $tmp26;
  my $tmp28;
  my $tmp29;
##
  __patsflab__ats2plpre_stream_vt_loop_12:
  $tmp26 = ATSPMVllazyval_eval($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab8:
    if(ATSCKptriscons($tmp26)) { goto __atstmplab11; }
    __atstmplab9:
    $tmpret25 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab10:
    __atstmplab11:
    $tmp28 = $tmp26->[1];
    #ATSINSfreecon($tmp26);
    $tmp29 = ats2plpre_add_int1_int1($arg1, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp28;
    $apy1 = $tmp29;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_stream_vt_loop_12;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret25;
} #end-of-function


sub
ats2plpre_stream2list_vt($)
{
##
  my($arg0) = @_;
##
  my $tmpret30;
##
  __patsflab_stream2list_vt:
  $tmpret30 = _ats2plpre_stream_vt_aux_14($arg0);
  return $tmpret30;
} #end-of-function


sub
_ats2plpre_stream_vt_aux_14($)
{
##
  my($arg0) = @_;
##
  my $tmpret31;
  my $tmp32;
  my $tmp33;
  my $tmp34;
  my $tmp35;
##
  __patsflab__ats2plpre_stream_vt_aux_14:
  $tmp32 = ATSPMVllazyval_eval($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab12:
    if(ATSCKptriscons($tmp32)) { goto __atstmplab15; }
    __atstmplab13:
    $tmpret31 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab14:
    __atstmplab15:
    $tmp33 = $tmp32->[0];
    $tmp34 = $tmp32->[1];
    #ATSINSfreecon($tmp32);
    $tmp35 = _ats2plpre_stream_vt_aux_14($tmp34);
    $tmpret31 = [$tmp33, $tmp35];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret31;
} #end-of-function


sub
ats2plpre_stream2list_vt_rev($)
{
##
  my($arg0) = @_;
##
  my $tmpret36;
  my $tmp42;
##
  __patsflab_stream2list_vt_rev:
  $tmp42 = 0;
  $tmpret36 = _ats2plpre_stream_vt_loop_16($arg0, $tmp42);
  return $tmpret36;
} #end-of-function


sub
_ats2plpre_stream_vt_loop_16($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret37;
  my $tmp38;
  my $tmp39;
  my $tmp40;
  my $tmp41;
##
  __patsflab__ats2plpre_stream_vt_loop_16:
  $tmp38 = ATSPMVllazyval_eval($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab16:
    if(ATSCKptriscons($tmp38)) { goto __atstmplab19; }
    __atstmplab17:
    $tmpret37 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab18:
    __atstmplab19:
    $tmp39 = $tmp38->[0];
    $tmp40 = $tmp38->[1];
    #ATSINSfreecon($tmp38);
    $tmp41 = [$tmp39, $arg1];
    #ATStailcalseq_beg
    $apy0 = $tmp40;
    $apy1 = $tmp41;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_stream_vt_loop_16;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret37;
} #end-of-function


sub
ats2plpre_stream_vt_append($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret43;
##
  __patsflab_stream_vt_append:
  $tmpret43 = _ats2plpre_stream_vt_auxmain_18($arg0, $arg1);
  return $tmpret43;
} #end-of-function


sub
_ats2plpre_stream_vt_auxmain_18($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret44;
##
  __patsflab__ats2plpre_stream_vt_auxmain_18:
  $tmpret44 = ATSPMVllazyval(_ats2plpre_stream_vt_patsfun_19__closurerize($arg0, $arg1));
  return $tmpret44;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_19($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret45;
  my $tmp46;
  my $tmp47;
  my $tmp48;
  my $tmp49;
##
  __patsflab__ats2plpre_stream_vt_patsfun_19:
  if($arg0) {
    $tmp46 = ATSPMVllazyval_eval($env0);
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab20:
      if(ATSCKptriscons($tmp46)) { goto __atstmplab23; }
      __atstmplab21:
      $tmpret45 = ATSPMVllazyval_eval($env1);
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab22:
      __atstmplab23:
      $tmp47 = $tmp46->[0];
      $tmp48 = $tmp46->[1];
      #ATSINSfreecon($tmp46);
      $tmp49 = _ats2plpre_stream_vt_auxmain_18($tmp48, $env1);
      $tmpret45 = [$tmp47, $tmp49];
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
    atspre_lazy_vt_free($env0);
    atspre_lazy_vt_free($env1);
  } #endif
  return $tmpret45;
} #end-of-function


sub
ats2plpre_stream_vt_concat($)
{
##
  my($arg0) = @_;
##
  my $tmpret52;
##
  __patsflab_stream_vt_concat:
  $tmpret52 = _ats2plpre_stream_vt_auxmain_21($arg0);
  return $tmpret52;
} #end-of-function


sub
_ats2plpre_stream_vt_auxmain_21($)
{
##
  my($arg0) = @_;
##
  my $tmpret53;
##
  __patsflab__ats2plpre_stream_vt_auxmain_21:
  $tmpret53 = ATSPMVllazyval(_ats2plpre_stream_vt_patsfun_22__closurerize($arg0));
  return $tmpret53;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_22($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret54;
  my $tmp55;
  my $tmp56;
  my $tmp57;
  my $tmp58;
  my $tmp59;
##
  __patsflab__ats2plpre_stream_vt_patsfun_22:
  if($arg0) {
    $tmp55 = ATSPMVllazyval_eval($env0);
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab24:
      if(ATSCKptriscons($tmp55)) { goto __atstmplab27; }
      __atstmplab25:
      $tmpret54 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab26:
      __atstmplab27:
      $tmp56 = $tmp55->[0];
      $tmp57 = $tmp55->[1];
      #ATSINSfreecon($tmp55);
      $tmp59 = _ats2plpre_stream_vt_auxmain_21($tmp57);
      $tmp58 = ats2plpre_stream_vt_append($tmp56, $tmp59);
      $tmpret54 = ATSPMVllazyval_eval($tmp58);
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
    atspre_lazy_vt_free($env0);
  } #endif
  return $tmpret54;
} #end-of-function


sub
ats2plpre_stream_vt_map_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret61;
##
  __patsflab_stream_vt_map_cloref:
  $tmpret61 = _ats2plpre_stream_vt_auxmain_24($arg1, $arg0);
  return $tmpret61;
} #end-of-function


sub
_ats2plpre_stream_vt_auxmain_24($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret62;
##
  __patsflab__ats2plpre_stream_vt_auxmain_24:
  $tmpret62 = ATSPMVllazyval(_ats2plpre_stream_vt_patsfun_25__closurerize($env0, $arg0));
  return $tmpret62;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_25($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret63;
  my $tmp64;
  my $tmp65;
  my $tmp66;
  my $tmp67;
  my $tmp68;
##
  __patsflab__ats2plpre_stream_vt_patsfun_25:
  if($arg0) {
    $tmp64 = ATSPMVllazyval_eval($env1);
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab28:
      if(ATSCKptriscons($tmp64)) { goto __atstmplab31; }
      __atstmplab29:
      $tmpret63 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab30:
      __atstmplab31:
      $tmp65 = $tmp64->[0];
      $tmp66 = $tmp64->[1];
      #ATSINSfreecon($tmp64);
      $tmp67 = &{$env0->[0]}($env0, $tmp65);
      $tmp68 = _ats2plpre_stream_vt_auxmain_24($env0, $tmp66);
      $tmpret63 = [$tmp67, $tmp68];
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
    atspre_lazy_vt_free($env1);
  } #endif
  return $tmpret63;
} #end-of-function


sub
ats2plpre_stream_vt_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret70;
##
  __patsflab_stream_vt_map_method:
  $tmpret70 = _ats2plpre_stream_vt_patsfun_27__closurerize($arg0);
  return $tmpret70;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_27($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret71;
##
  __patsflab__ats2plpre_stream_vt_patsfun_27:
  $tmpret71 = ats2plpre_stream_vt_map_cloref($env0, $arg0);
  return $tmpret71;
} #end-of-function


sub
ats2plpre_stream_vt_filter_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret72;
##
  __patsflab_stream_vt_filter_cloref:
  $tmpret72 = _ats2plpre_stream_vt_auxmain_29($arg1, $arg0);
  return $tmpret72;
} #end-of-function


sub
_ats2plpre_stream_vt_auxmain_29($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret73;
##
  __patsflab__ats2plpre_stream_vt_auxmain_29:
  $tmpret73 = ATSPMVllazyval(_ats2plpre_stream_vt_patsfun_30__closurerize($env0, $arg0));
  return $tmpret73;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_30($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret74;
  my $tmp75;
  my $tmp76;
  my $tmp77;
  my $tmp78;
  my $tmp79;
  my $tmp80;
##
  __patsflab__ats2plpre_stream_vt_patsfun_30:
  if($arg0) {
    $tmp75 = ATSPMVllazyval_eval($env1);
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab32:
      if(ATSCKptriscons($tmp75)) { goto __atstmplab35; }
      __atstmplab33:
      $tmpret74 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab34:
      __atstmplab35:
      $tmp76 = $tmp75->[0];
      $tmp77 = $tmp75->[1];
      #ATSINSfreecon($tmp75);
      $tmp78 = &{$env0->[0]}($env0, $tmp76);
      if($tmp78) {
        $tmp79 = _ats2plpre_stream_vt_auxmain_29($env0, $tmp77);
        $tmpret74 = [$tmp76, $tmp79];
      } else {
        $tmp80 = _ats2plpre_stream_vt_auxmain_29($env0, $tmp77);
        $tmpret74 = ATSPMVllazyval_eval($tmp80);
      } #endif
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
    atspre_lazy_vt_free($env1);
  } #endif
  return $tmpret74;
} #end-of-function


sub
ats2plpre_stream_vt_filter_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret82;
##
  __patsflab_stream_vt_filter_method:
  $tmpret82 = _ats2plpre_stream_vt_patsfun_32__closurerize($arg0);
  return $tmpret82;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_32($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret83;
##
  __patsflab__ats2plpre_stream_vt_patsfun_32:
  $tmpret83 = ats2plpre_stream_vt_filter_cloref($env0, $arg0);
  return $tmpret83;
} #end-of-function


sub
ats2plpre_stream_vt_exists_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret84;
##
  __patsflab_stream_vt_exists_cloref:
  $tmpret84 = _ats2plpre_stream_vt_loop_34($arg1, $arg0);
  return $tmpret84;
} #end-of-function


sub
_ats2plpre_stream_vt_loop_34($$)
{
##
  my($env0, $arg0) = @_;
##
  my $apy0;
  my $tmpret85;
  my $tmp86;
  my $tmp87;
  my $tmp88;
  my $tmp89;
##
  __patsflab__ats2plpre_stream_vt_loop_34:
  $tmp86 = ATSPMVllazyval_eval($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab36:
    if(ATSCKptriscons($tmp86)) { goto __atstmplab39; }
    __atstmplab37:
    $tmpret85 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab38:
    __atstmplab39:
    $tmp87 = $tmp86->[0];
    $tmp88 = $tmp86->[1];
    #ATSINSfreecon($tmp86);
    $tmp89 = &{$env0->[0]}($env0, $tmp87);
    if($tmp89) {
      atspre_lazy_vt_free($tmp88);
      $tmpret85 = 1;
    } else {
      #ATStailcalseq_beg
      $apy0 = $tmp88;
      $arg0 = $apy0;
      goto __patsflab__ats2plpre_stream_vt_loop_34;
      #ATStailcalseq_end
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret85;
} #end-of-function


sub
ats2plpre_stream_vt_exists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret91;
##
  __patsflab_stream_vt_exists_method:
  $tmpret91 = _ats2plpre_stream_vt_patsfun_36__closurerize($arg0);
  return $tmpret91;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_36($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret92;
##
  __patsflab__ats2plpre_stream_vt_patsfun_36:
  $tmpret92 = ats2plpre_stream_vt_exists_cloref($env0, $arg0);
  return $tmpret92;
} #end-of-function


sub
ats2plpre_stream_vt_forall_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret93;
##
  __patsflab_stream_vt_forall_cloref:
  $tmpret93 = _ats2plpre_stream_vt_loop_38($arg1, $arg0);
  return $tmpret93;
} #end-of-function


sub
_ats2plpre_stream_vt_loop_38($$)
{
##
  my($env0, $arg0) = @_;
##
  my $apy0;
  my $tmpret94;
  my $tmp95;
  my $tmp96;
  my $tmp97;
  my $tmp98;
##
  __patsflab__ats2plpre_stream_vt_loop_38:
  $tmp95 = ATSPMVllazyval_eval($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab40:
    if(ATSCKptriscons($tmp95)) { goto __atstmplab43; }
    __atstmplab41:
    $tmpret94 = 1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab42:
    __atstmplab43:
    $tmp96 = $tmp95->[0];
    $tmp97 = $tmp95->[1];
    #ATSINSfreecon($tmp95);
    $tmp98 = &{$env0->[0]}($env0, $tmp96);
    if($tmp98) {
      #ATStailcalseq_beg
      $apy0 = $tmp97;
      $arg0 = $apy0;
      goto __patsflab__ats2plpre_stream_vt_loop_38;
      #ATStailcalseq_end
    } else {
      atspre_lazy_vt_free($tmp97);
      $tmpret94 = 0;
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret94;
} #end-of-function


sub
ats2plpre_stream_vt_forall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret100;
##
  __patsflab_stream_vt_forall_method:
  $tmpret100 = _ats2plpre_stream_vt_patsfun_40__closurerize($arg0);
  return $tmpret100;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_40($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret101;
##
  __patsflab__ats2plpre_stream_vt_patsfun_40:
  $tmpret101 = ats2plpre_stream_vt_forall_cloref($env0, $arg0);
  return $tmpret101;
} #end-of-function


sub
ats2plpre_stream_vt_foreach_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_stream_vt_foreach_cloref:
  _ats2plpre_stream_vt_loop_42($arg1, $arg0);
  return;#_void
} #end-of-function


sub
_ats2plpre_stream_vt_loop_42($$)
{
##
  my($env0, $arg0) = @_;
##
  my $apy0;
  my $tmp104;
  my $tmp105;
  my $tmp106;
##
  __patsflab__ats2plpre_stream_vt_loop_42:
  $tmp104 = ATSPMVllazyval_eval($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab44:
    if(ATSCKptriscons($tmp104)) { goto __atstmplab47; }
    __atstmplab45:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab46:
    __atstmplab47:
    $tmp105 = $tmp104->[0];
    $tmp106 = $tmp104->[1];
    #ATSINSfreecon($tmp104);
    &{$env0->[0]}($env0, $tmp105);
    #ATStailcalseq_beg
    $apy0 = $tmp106;
    $arg0 = $apy0;
    goto __patsflab__ats2plpre_stream_vt_loop_42;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_stream_vt_foreach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret108;
##
  __patsflab_stream_vt_foreach_method:
  $tmpret108 = _ats2plpre_stream_vt_patsfun_44__closurerize($arg0);
  return $tmpret108;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_44($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_stream_vt_patsfun_44:
  ats2plpre_stream_vt_foreach_cloref($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_stream_vt_iforeach_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_stream_vt_iforeach_cloref:
  _ats2plpre_stream_vt_loop_46($arg1, 0, $arg0);
  return;#_void
} #end-of-function


sub
_ats2plpre_stream_vt_loop_46($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmp112;
  my $tmp113;
  my $tmp114;
  my $tmp116;
##
  __patsflab__ats2plpre_stream_vt_loop_46:
  $tmp112 = ATSPMVllazyval_eval($arg1);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab48:
    if(ATSCKptriscons($tmp112)) { goto __atstmplab51; }
    __atstmplab49:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab50:
    __atstmplab51:
    $tmp113 = $tmp112->[0];
    $tmp114 = $tmp112->[1];
    #ATSINSfreecon($tmp112);
    &{$env0->[0]}($env0, $arg0, $tmp113);
    $tmp116 = ats2plpre_add_int1_int1($arg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp116;
    $apy1 = $tmp114;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_stream_vt_loop_46;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_stream_vt_iforeach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret117;
##
  __patsflab_stream_vt_iforeach_method:
  $tmpret117 = _ats2plpre_stream_vt_patsfun_48__closurerize($arg0);
  return $tmpret117;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_48($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_stream_vt_patsfun_48:
  ats2plpre_stream_vt_iforeach_cloref($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_stream_vt_rforeach_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_stream_vt_rforeach_cloref:
  _ats2plpre_stream_vt_auxmain_50($arg1, $arg0);
  return;#_void
} #end-of-function


sub
_ats2plpre_stream_vt_auxmain_50($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmp121;
  my $tmp122;
  my $tmp123;
##
  __patsflab__ats2plpre_stream_vt_auxmain_50:
  $tmp121 = ATSPMVllazyval_eval($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab52:
    if(ATSCKptriscons($tmp121)) { goto __atstmplab55; }
    __atstmplab53:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab54:
    __atstmplab55:
    $tmp122 = $tmp121->[0];
    $tmp123 = $tmp121->[1];
    #ATSINSfreecon($tmp121);
    _ats2plpre_stream_vt_auxmain_50($env0, $tmp123);
    &{$env0->[0]}($env0, $tmp122);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_stream_vt_rforeach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret125;
##
  __patsflab_stream_vt_rforeach_method:
  $tmpret125 = _ats2plpre_stream_vt_patsfun_52__closurerize($arg0);
  return $tmpret125;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_52($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_stream_vt_patsfun_52:
  ats2plpre_stream_vt_rforeach_cloref($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_stream_vt_tabulate_cloref($)
{
##
  my($arg0) = @_;
##
  my $tmpret127;
##
  __patsflab_stream_vt_tabulate_cloref:
  $tmpret127 = _ats2plpre_stream_vt_auxmain_54($arg0, 0);
  return $tmpret127;
} #end-of-function


sub
_ats2plpre_stream_vt_auxmain_54($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret128;
##
  __patsflab__ats2plpre_stream_vt_auxmain_54:
  $tmpret128 = ATSPMVllazyval(_ats2plpre_stream_vt_patsfun_55__closurerize($env0, $arg0));
  return $tmpret128;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_55($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret129;
  my $tmp130;
  my $tmp131;
  my $tmp132;
##
  __patsflab__ats2plpre_stream_vt_patsfun_55:
  if($arg0) {
    $tmp130 = &{$env0->[0]}($env0, $env1);
    $tmp132 = ats2plpre_add_int1_int1($env1, 1);
    $tmp131 = _ats2plpre_stream_vt_auxmain_54($env0, $tmp132);
    $tmpret129 = [$tmp130, $tmp131];
  } else {
  } #endif
  return $tmpret129;
} #end-of-function


######
#ATSextcode_beg()
######
######
1; ##note that it is needed by 'use' or 'require'
######
######
#ATSextcode_end()
######
######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-3-25: 11h:24m
##
######
sub
_ats2plpre_intrange_patsfun_4__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_4($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_9__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_9($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_11__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_11($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_13__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_13($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_16__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_16($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_intrange_patsfun_20__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_20($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_23__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_23($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_26__closurerize($$$)
{
  my($env0, $env1, $env2) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_intrange_patsfun_26($cenv->[1], $cenv->[2], $cenv->[3]); }, $env0, $env1, $env2];
}

sub
_ats2plpre_intrange_patsfun_28__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_28($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_31__closurerize($$$)
{
  my($env0, $env1, $env2) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_31($cenv->[1], $cenv->[2], $cenv->[3], $arg0); }, $env0, $env1, $env2];
}

sub
_ats2plpre_intrange_patsfun_33__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_33($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_40__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_40($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_44__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_44($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_48__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_48($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_52__closurerize($$$)
{
  my($env0, $env1, $env2) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_52($cenv->[1], $cenv->[2], $cenv->[3], $arg0); }, $env0, $env1, $env2];
}


sub
ats2plpre_int_repeat_lazy($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmp1;
##
  __patsflab_int_repeat_lazy:
  $tmp1 = ats2plpre_lazy2cloref($arg1);
  ats2plpre_int_repeat_cloref($arg0, $tmp1);
  return;#_void
} #end-of-function


sub
ats2plpre_int_repeat_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_int_repeat_cloref:
  _ats2plpre_intrange_loop_2($arg0, $arg1);
  return;#_void
} #end-of-function


sub
_ats2plpre_intrange_loop_2($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmp4;
  my $tmp6;
##
  __patsflab__ats2plpre_intrange_loop_2:
  $tmp4 = ats2plpre_gt_int0_int0($arg0, 0);
  if($tmp4) {
    &{$arg1->[0]}($arg1);
    $tmp6 = ats2plpre_sub_int0_int0($arg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp6;
    $apy1 = $arg1;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_intrange_loop_2;
    #ATStailcalseq_end
  } else {
    #ATSINSmove_void;
  } #endif
  return;#_void
} #end-of-function


sub
ats2plpre_int_repeat_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret7;
##
  __patsflab_int_repeat_method:
  $tmpret7 = _ats2plpre_intrange_patsfun_4__closurerize($arg0);
  return $tmpret7;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_4($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_intrange_patsfun_4:
  ats2plpre_int_repeat_cloref($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_int_exists_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret9;
##
  __patsflab_int_exists_cloref:
  $tmpret9 = ats2plpre_intrange_exists_cloref(0, $arg0, $arg1);
  return $tmpret9;
} #end-of-function


sub
ats2plpre_int_forall_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret10;
##
  __patsflab_int_forall_cloref:
  $tmpret10 = ats2plpre_intrange_forall_cloref(0, $arg0, $arg1);
  return $tmpret10;
} #end-of-function


sub
ats2plpre_int_foreach_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_int_foreach_cloref:
  ats2plpre_intrange_foreach_cloref(0, $arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_int_exists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret12;
##
  __patsflab_int_exists_method:
  $tmpret12 = _ats2plpre_intrange_patsfun_9__closurerize($arg0);
  return $tmpret12;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_9($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret13;
##
  __patsflab__ats2plpre_intrange_patsfun_9:
  $tmpret13 = ats2plpre_int_exists_cloref($env0, $arg0);
  return $tmpret13;
} #end-of-function


sub
ats2plpre_int_forall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret14;
##
  __patsflab_int_forall_method:
  $tmpret14 = _ats2plpre_intrange_patsfun_11__closurerize($arg0);
  return $tmpret14;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_11($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret15;
##
  __patsflab__ats2plpre_intrange_patsfun_11:
  $tmpret15 = ats2plpre_int_forall_cloref($env0, $arg0);
  return $tmpret15;
} #end-of-function


sub
ats2plpre_int_foreach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret16;
##
  __patsflab_int_foreach_method:
  $tmpret16 = _ats2plpre_intrange_patsfun_13__closurerize($arg0);
  return $tmpret16;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_13($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_intrange_patsfun_13:
  ats2plpre_int_foreach_cloref($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_int_foldleft_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret18;
##
  __patsflab_int_foldleft_cloref:
  $tmpret18 = ats2plpre_intrange_foldleft_cloref(0, $arg0, $arg1, $arg2);
  return $tmpret18;
} #end-of-function


sub
ats2plpre_int_foldleft_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret19;
##
  __patsflab_int_foldleft_method:
  $tmpret19 = _ats2plpre_intrange_patsfun_16__closurerize($arg0, $arg1);
  return $tmpret19;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_16($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret20;
##
  __patsflab__ats2plpre_intrange_patsfun_16:
  $tmpret20 = ats2plpre_int_foldleft_cloref($env0, $env1, $arg0);
  return $tmpret20;
} #end-of-function


sub
ats2plpre_int_list_map_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret21;
##
  __patsflab_int_list_map_cloref:
  $tmpret21 = _ats2plpre_intrange_aux_18($arg0, $arg1, 0);
  return $tmpret21;
} #end-of-function


sub
_ats2plpre_intrange_aux_18($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret22;
  my $tmp23;
  my $tmp24;
  my $tmp25;
  my $tmp26;
##
  __patsflab__ats2plpre_intrange_aux_18:
  $tmp23 = ats2plpre_lt_int1_int1($arg0, $env0);
  if($tmp23) {
    $tmp24 = &{$env1->[0]}($env1, $arg0);
    $tmp26 = ats2plpre_add_int1_int1($arg0, 1);
    $tmp25 = _ats2plpre_intrange_aux_18($env0, $env1, $tmp26);
    $tmpret22 = [$tmp24, $tmp25];
  } else {
    $tmpret22 = 0;
  } #endif
  return $tmpret22;
} #end-of-function


sub
ats2plpre_int_list_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret27;
##
  __patsflab_int_list_map_method:
  $tmpret27 = _ats2plpre_intrange_patsfun_20__closurerize($arg0);
  return $tmpret27;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_20($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret28;
##
  __patsflab__ats2plpre_intrange_patsfun_20:
  $tmpret28 = ats2plpre_int_list_map_cloref($env0, $arg0);
  return $tmpret28;
} #end-of-function


sub
ats2plpre_int_list0_map_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret29;
  my $tmp30;
  my $tmp31;
##
  __patsflab_int_list0_map_cloref:
  $tmp30 = ats2plpre_gte_int1_int1($arg0, 0);
  if($tmp30) {
    $tmp31 = ats2plpre_int_list_map_cloref($arg0, $arg1);
    $tmpret29 = $tmp31;
  } else {
    $tmpret29 = 0;
  } #endif
  return $tmpret29;
} #end-of-function


sub
ats2plpre_int_list0_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret32;
##
  __patsflab_int_list0_map_method:
  $tmpret32 = _ats2plpre_intrange_patsfun_23__closurerize($arg0);
  return $tmpret32;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_23($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret33;
##
  __patsflab__ats2plpre_intrange_patsfun_23:
  $tmpret33 = ats2plpre_int_list0_map_cloref($env0, $arg0);
  return $tmpret33;
} #end-of-function


sub
ats2plpre_int_stream_map_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret34;
##
  __patsflab_int_stream_map_cloref:
  $tmpret34 = _ats2plpre_intrange_aux_25($arg0, $arg1, 0);
  return $tmpret34;
} #end-of-function


sub
_ats2plpre_intrange_aux_25($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret35;
##
  __patsflab__ats2plpre_intrange_aux_25:
  $tmpret35 = ATSPMVlazyval(_ats2plpre_intrange_patsfun_26__closurerize($env0, $env1, $arg0));
  return $tmpret35;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_26($$$)
{
##
  my($env0, $env1, $env2) = @_;
##
  my $tmpret36;
  my $tmp37;
  my $tmp38;
  my $tmp39;
  my $tmp40;
##
  __patsflab__ats2plpre_intrange_patsfun_26:
  $tmp37 = ats2plpre_lt_int1_int1($env2, $env0);
  if($tmp37) {
    $tmp38 = &{$env1->[0]}($env1, $env2);
    $tmp40 = ats2plpre_add_int1_int1($env2, 1);
    $tmp39 = _ats2plpre_intrange_aux_25($env0, $env1, $tmp40);
    $tmpret36 = [$tmp38, $tmp39];
  } else {
    $tmpret36 = 0;
  } #endif
  return $tmpret36;
} #end-of-function


sub
ats2plpre_int_stream_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret41;
##
  __patsflab_int_stream_map_method:
  $tmpret41 = _ats2plpre_intrange_patsfun_28__closurerize($arg0);
  return $tmpret41;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_28($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret42;
##
  __patsflab__ats2plpre_intrange_patsfun_28:
  $tmpret42 = ats2plpre_int_stream_map_cloref($env0, $arg0);
  return $tmpret42;
} #end-of-function


sub
ats2plpre_int_stream_vt_map_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret43;
##
  __patsflab_int_stream_vt_map_cloref:
  $tmpret43 = _ats2plpre_intrange_aux_30($arg0, $arg1, 0);
  return $tmpret43;
} #end-of-function


sub
_ats2plpre_intrange_aux_30($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret44;
##
  __patsflab__ats2plpre_intrange_aux_30:
  $tmpret44 = ATSPMVllazyval(_ats2plpre_intrange_patsfun_31__closurerize($env0, $env1, $arg0));
  return $tmpret44;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_31($$$$)
{
##
  my($env0, $env1, $env2, $arg0) = @_;
##
  my $tmpret45;
  my $tmp46;
  my $tmp47;
  my $tmp48;
  my $tmp49;
##
  __patsflab__ats2plpre_intrange_patsfun_31:
  if($arg0) {
    $tmp46 = ats2plpre_lt_int1_int1($env2, $env0);
    if($tmp46) {
      $tmp47 = &{$env1->[0]}($env1, $env2);
      $tmp49 = ats2plpre_add_int1_int1($env2, 1);
      $tmp48 = _ats2plpre_intrange_aux_30($env0, $env1, $tmp49);
      $tmpret45 = [$tmp47, $tmp48];
    } else {
      $tmpret45 = 0;
    } #endif
  } else {
  } #endif
  return $tmpret45;
} #end-of-function


sub
ats2plpre_int_stream_vt_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret50;
##
  __patsflab_int_stream_vt_map_method:
  $tmpret50 = _ats2plpre_intrange_patsfun_33__closurerize($arg0);
  return $tmpret50;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_33($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret51;
##
  __patsflab__ats2plpre_intrange_patsfun_33:
  $tmpret51 = ats2plpre_int_stream_vt_map_cloref($env0, $arg0);
  return $tmpret51;
} #end-of-function


sub
ats2plpre_int2_exists_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret52;
##
  __patsflab_int2_exists_cloref:
  $tmpret52 = ats2plpre_intrange2_exists_cloref(0, $arg0, 0, $arg1, $arg2);
  return $tmpret52;
} #end-of-function


sub
ats2plpre_int2_forall_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret53;
##
  __patsflab_int2_forall_cloref:
  $tmpret53 = ats2plpre_intrange2_forall_cloref(0, $arg0, 0, $arg1, $arg2);
  return $tmpret53;
} #end-of-function


sub
ats2plpre_int2_foreach_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
##
  __patsflab_int2_foreach_cloref:
  ats2plpre_intrange2_foreach_cloref(0, $arg0, 0, $arg1, $arg2);
  return;#_void
} #end-of-function


sub
ats2plpre_intrange_exists_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret55;
##
  __patsflab_intrange_exists_cloref:
  $tmpret55 = _ats2plpre_intrange_loop_38($arg0, $arg1, $arg2);
  return $tmpret55;
} #end-of-function


sub
_ats2plpre_intrange_loop_38($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmpret56;
  my $tmp57;
  my $tmp58;
  my $tmp59;
##
  __patsflab__ats2plpre_intrange_loop_38:
  $tmp57 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp57) {
    $tmp58 = &{$arg2->[0]}($arg2, $arg0);
    if($tmp58) {
      $tmpret56 = 1;
    } else {
      $tmp59 = ats2plpre_add_int0_int0($arg0, 1);
      #ATStailcalseq_beg
      $apy0 = $tmp59;
      $apy1 = $arg1;
      $apy2 = $arg2;
      $arg0 = $apy0;
      $arg1 = $apy1;
      $arg2 = $apy2;
      goto __patsflab__ats2plpre_intrange_loop_38;
      #ATStailcalseq_end
    } #endif
  } else {
    $tmpret56 = 0;
  } #endif
  return $tmpret56;
} #end-of-function


sub
ats2plpre_intrange_exists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret60;
##
  __patsflab_intrange_exists_method:
  $tmpret60 = _ats2plpre_intrange_patsfun_40__closurerize($arg0);
  return $tmpret60;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_40($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret61;
##
  __patsflab__ats2plpre_intrange_patsfun_40:
  $tmpret61 = ats2plpre_intrange_exists_cloref($env0->[0], $env0->[1], $arg0);
  return $tmpret61;
} #end-of-function


sub
ats2plpre_intrange_forall_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret62;
##
  __patsflab_intrange_forall_cloref:
  $tmpret62 = _ats2plpre_intrange_loop_42($arg0, $arg1, $arg2);
  return $tmpret62;
} #end-of-function


sub
_ats2plpre_intrange_loop_42($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmpret63;
  my $tmp64;
  my $tmp65;
  my $tmp66;
##
  __patsflab__ats2plpre_intrange_loop_42:
  $tmp64 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp64) {
    $tmp65 = &{$arg2->[0]}($arg2, $arg0);
    if($tmp65) {
      $tmp66 = ats2plpre_add_int0_int0($arg0, 1);
      #ATStailcalseq_beg
      $apy0 = $tmp66;
      $apy1 = $arg1;
      $apy2 = $arg2;
      $arg0 = $apy0;
      $arg1 = $apy1;
      $arg2 = $apy2;
      goto __patsflab__ats2plpre_intrange_loop_42;
      #ATStailcalseq_end
    } else {
      $tmpret63 = 0;
    } #endif
  } else {
    $tmpret63 = 1;
  } #endif
  return $tmpret63;
} #end-of-function


sub
ats2plpre_intrange_forall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret67;
##
  __patsflab_intrange_forall_method:
  $tmpret67 = _ats2plpre_intrange_patsfun_44__closurerize($arg0);
  return $tmpret67;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_44($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret68;
##
  __patsflab__ats2plpre_intrange_patsfun_44:
  $tmpret68 = ats2plpre_intrange_forall_cloref($env0->[0], $env0->[1], $arg0);
  return $tmpret68;
} #end-of-function


sub
ats2plpre_intrange_foreach_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
##
  __patsflab_intrange_foreach_cloref:
  _ats2plpre_intrange_loop_46($arg0, $arg1, $arg2);
  return;#_void
} #end-of-function


sub
_ats2plpre_intrange_loop_46($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmp71;
  my $tmp73;
##
  __patsflab__ats2plpre_intrange_loop_46:
  $tmp71 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp71) {
    &{$arg2->[0]}($arg2, $arg0);
    $tmp73 = ats2plpre_add_int0_int0($arg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp73;
    $apy1 = $arg1;
    $apy2 = $arg2;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    goto __patsflab__ats2plpre_intrange_loop_46;
    #ATStailcalseq_end
  } else {
    #ATSINSmove_void;
  } #endif
  return;#_void
} #end-of-function


sub
ats2plpre_intrange_foreach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret74;
##
  __patsflab_intrange_foreach_method:
  $tmpret74 = _ats2plpre_intrange_patsfun_48__closurerize($arg0);
  return $tmpret74;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_48($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_intrange_patsfun_48:
  ats2plpre_intrange_foreach_cloref($env0->[0], $env0->[1], $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_intrange_foldleft_cloref($$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3) = @_;
##
  my $tmpret76;
##
  __patsflab_intrange_foldleft_cloref:
  $tmpret76 = _ats2plpre_intrange_loop_50($arg3, $arg0, $arg1, $arg2, $arg3);
  return $tmpret76;
} #end-of-function


sub
_ats2plpre_intrange_loop_50($$$$$)
{
##
  my($env0, $arg0, $arg1, $arg2, $arg3) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $apy3;
  my $tmpret77;
  my $tmp78;
  my $tmp79;
  my $tmp80;
##
  __patsflab__ats2plpre_intrange_loop_50:
  $tmp78 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp78) {
    $tmp79 = ats2plpre_add_int0_int0($arg0, 1);
    $tmp80 = &{$arg3->[0]}($arg3, $arg2, $arg0);
    #ATStailcalseq_beg
    $apy0 = $tmp79;
    $apy1 = $arg1;
    $apy2 = $tmp80;
    $apy3 = $env0;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    goto __patsflab__ats2plpre_intrange_loop_50;
    #ATStailcalseq_end
  } else {
    $tmpret77 = $arg2;
  } #endif
  return $tmpret77;
} #end-of-function


sub
ats2plpre_intrange_foldleft_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmp81;
  my $tmp82;
  my $tmpret83;
##
  __patsflab_intrange_foldleft_method:
  $tmp81 = $arg0->[0];
  $tmp82 = $arg0->[1];
  $tmpret83 = _ats2plpre_intrange_patsfun_52__closurerize($tmp81, $tmp82, $arg1);
  return $tmpret83;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_52($$$$)
{
##
  my($env0, $env1, $env2, $arg0) = @_;
##
  my $tmpret84;
##
  __patsflab__ats2plpre_intrange_patsfun_52:
  $tmpret84 = ats2plpre_intrange_foldleft_cloref($env0, $env1, $env2, $arg0);
  return $tmpret84;
} #end-of-function


sub
ats2plpre_intrange2_exists_cloref($$$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3, $arg4) = @_;
##
  my $tmpret85;
##
  __patsflab_intrange2_exists_cloref:
  $tmpret85 = _ats2plpre_intrange_loop1_54($arg2, $arg3, $arg4, $arg0, $arg1, $arg2, $arg3, $arg4);
  return $tmpret85;
} #end-of-function


sub
_ats2plpre_intrange_loop1_54($$$$$$$$)
{
##
  my($env0, $env1, $env2, $arg0, $arg1, $arg2, $arg3, $arg4) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $apy3;
  my $apy4;
  my $tmpret86;
  my $tmp87;
  my $a2rg0;
  my $a2rg1;
  my $a2rg2;
  my $a2rg3;
  my $a2rg4;
  my $a2py0;
  my $a2py1;
  my $a2py2;
  my $a2py3;
  my $a2py4;
  my $tmpret88;
  my $tmp89;
  my $tmp90;
  my $tmp91;
  my $tmp92;
##
  __patsflab__ats2plpre_intrange_loop1_54:
  $tmp87 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp87) {
    #ATStailcalseq_beg
    $a2py0 = $arg0;
    $a2py1 = $arg1;
    $a2py2 = $arg2;
    $a2py3 = $arg3;
    $a2py4 = $env2;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2plpre_intrange_loop2_55;
    #ATStailcalseq_end
  } else {
    $tmpret86 = 0;
  } #endif
  return $tmpret86;
##
  __patsflab__ats2plpre_intrange_loop2_55:
  $tmp89 = ats2plpre_lt_int0_int0($a2rg2, $a2rg3);
  if($tmp89) {
    $tmp90 = &{$a2rg4->[0]}($a2rg4, $a2rg0, $a2rg2);
    if($tmp90) {
      $tmpret88 = 1;
    } else {
      $tmp91 = ats2plpre_add_int0_int0($a2rg2, 1);
      #ATStailcalseq_beg
      $a2py0 = $a2rg0;
      $a2py1 = $a2rg1;
      $a2py2 = $tmp91;
      $a2py3 = $a2rg3;
      $a2py4 = $a2rg4;
      $a2rg0 = $a2py0;
      $a2rg1 = $a2py1;
      $a2rg2 = $a2py2;
      $a2rg3 = $a2py3;
      $a2rg4 = $a2py4;
      goto __patsflab__ats2plpre_intrange_loop2_55;
      #ATStailcalseq_end
    } #endif
  } else {
    $tmp92 = ats2plpre_add_int0_int0($a2rg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp92;
    $apy1 = $a2rg1;
    $apy2 = $env0;
    $apy3 = $env1;
    $apy4 = $a2rg4;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    $arg4 = $apy4;
    goto __patsflab__ats2plpre_intrange_loop1_54;
    #ATStailcalseq_end
  } #endif
  return $tmpret88;
} #end-of-function


sub
ats2plpre_intrange2_forall_cloref($$$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3, $arg4) = @_;
##
  my $tmpret93;
##
  __patsflab_intrange2_forall_cloref:
  $tmpret93 = _ats2plpre_intrange_loop1_57($arg2, $arg3, $arg0, $arg1, $arg2, $arg3, $arg4);
  return $tmpret93;
} #end-of-function


sub
_ats2plpre_intrange_loop1_57($$$$$$$)
{
##
  my($env0, $env1, $arg0, $arg1, $arg2, $arg3, $arg4) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $apy3;
  my $apy4;
  my $tmpret94;
  my $tmp95;
  my $a2rg0;
  my $a2rg1;
  my $a2rg2;
  my $a2rg3;
  my $a2rg4;
  my $a2py0;
  my $a2py1;
  my $a2py2;
  my $a2py3;
  my $a2py4;
  my $tmpret96;
  my $tmp97;
  my $tmp98;
  my $tmp99;
  my $tmp100;
##
  __patsflab__ats2plpre_intrange_loop1_57:
  $tmp95 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp95) {
    #ATStailcalseq_beg
    $a2py0 = $arg0;
    $a2py1 = $arg1;
    $a2py2 = $arg2;
    $a2py3 = $arg3;
    $a2py4 = $arg4;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2plpre_intrange_loop2_58;
    #ATStailcalseq_end
  } else {
    $tmpret94 = 1;
  } #endif
  return $tmpret94;
##
  __patsflab__ats2plpre_intrange_loop2_58:
  $tmp97 = ats2plpre_lt_int0_int0($a2rg2, $a2rg3);
  if($tmp97) {
    $tmp98 = &{$a2rg4->[0]}($a2rg4, $a2rg0, $a2rg2);
    if($tmp98) {
      $tmp99 = ats2plpre_add_int0_int0($a2rg2, 1);
      #ATStailcalseq_beg
      $a2py0 = $a2rg0;
      $a2py1 = $a2rg1;
      $a2py2 = $tmp99;
      $a2py3 = $a2rg3;
      $a2py4 = $a2rg4;
      $a2rg0 = $a2py0;
      $a2rg1 = $a2py1;
      $a2rg2 = $a2py2;
      $a2rg3 = $a2py3;
      $a2rg4 = $a2py4;
      goto __patsflab__ats2plpre_intrange_loop2_58;
      #ATStailcalseq_end
    } else {
      $tmpret96 = 0;
    } #endif
  } else {
    $tmp100 = ats2plpre_add_int0_int0($a2rg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp100;
    $apy1 = $a2rg1;
    $apy2 = $env0;
    $apy3 = $env1;
    $apy4 = $a2rg4;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    $arg4 = $apy4;
    goto __patsflab__ats2plpre_intrange_loop1_57;
    #ATStailcalseq_end
  } #endif
  return $tmpret96;
} #end-of-function


sub
ats2plpre_intrange2_foreach_cloref($$$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3, $arg4) = @_;
##
##
  __patsflab_intrange2_foreach_cloref:
  _ats2plpre_intrange_loop1_60($arg2, $arg3, $arg0, $arg1, $arg2, $arg3, $arg4);
  return;#_void
} #end-of-function


sub
_ats2plpre_intrange_loop1_60($$$$$$$)
{
##
  my($env0, $env1, $arg0, $arg1, $arg2, $arg3, $arg4) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $apy3;
  my $apy4;
  my $tmp103;
  my $a2rg0;
  my $a2rg1;
  my $a2rg2;
  my $a2rg3;
  my $a2rg4;
  my $a2py0;
  my $a2py1;
  my $a2py2;
  my $a2py3;
  my $a2py4;
  my $tmp105;
  my $tmp107;
  my $tmp108;
##
  __patsflab__ats2plpre_intrange_loop1_60:
  $tmp103 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp103) {
    #ATStailcalseq_beg
    $a2py0 = $arg0;
    $a2py1 = $arg1;
    $a2py2 = $arg2;
    $a2py3 = $arg3;
    $a2py4 = $arg4;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2plpre_intrange_loop2_61;
    #ATStailcalseq_end
  } else {
    #ATSINSmove_void;
  } #endif
  return;#_void
##
  __patsflab__ats2plpre_intrange_loop2_61:
  $tmp105 = ats2plpre_lt_int0_int0($a2rg2, $a2rg3);
  if($tmp105) {
    &{$a2rg4->[0]}($a2rg4, $a2rg0, $a2rg2);
    $tmp107 = ats2plpre_add_int0_int0($a2rg2, 1);
    #ATStailcalseq_beg
    $a2py0 = $a2rg0;
    $a2py1 = $a2rg1;
    $a2py2 = $tmp107;
    $a2py3 = $a2rg3;
    $a2py4 = $a2rg4;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2plpre_intrange_loop2_61;
    #ATStailcalseq_end
  } else {
    $tmp108 = ats2plpre_succ_int0($a2rg0);
    #ATStailcalseq_beg
    $apy0 = $tmp108;
    $apy1 = $a2rg1;
    $apy2 = $env0;
    $apy3 = $env1;
    $apy4 = $a2rg4;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    $arg4 = $apy4;
    goto __patsflab__ats2plpre_intrange_loop1_60;
    #ATStailcalseq_end
  } #endif
  return;#_void
} #end-of-function


######
#ATSextcode_beg()
######
######
1; ##note that it is needed by 'use' or 'require'
######
######
#ATSextcode_end()
######
######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-3-25: 11h:24m
##
######

sub
ats2plpre_ref($)
{
##
  my($arg0) = @_;
##
  my $tmpret0;
##
  __patsflab_ref:
  $tmpret0 = ats2plpre_ref_make_elt($arg0);
  return $tmpret0;
} #end-of-function


sub
ats2plpre_ref_make_elt($)
{
##
  my($arg0) = @_;
##
  my $tmpret1;
  my $tmp2;
##
  __patsflab_ref_make_elt:
  $tmp2 = ats2plpre_PLarray_sing($arg0);
  $tmpret1 = $tmp2;
  return $tmpret1;
} #end-of-function


sub
ats2plpre_ref_get_elt($)
{
##
  my($arg0) = @_;
##
  my $tmpret3;
##
  __patsflab_ref_get_elt:
  $tmpret3 = ats2plpre_PLarray_get_at($arg0, 0);
  return $tmpret3;
} #end-of-function


sub
ats2plpre_ref_set_elt($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_ref_set_elt:
  ats2plpre_PLarray_set_at($arg0, 0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_ref_exch_elt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret5;
  my $tmp6;
##
  __patsflab_ref_exch_elt:
  $tmp6 = ats2plpre_PLarray_get_at($arg0, 0);
  ats2plpre_PLarray_set_at($arg0, 0, $arg1);
  $tmpret5 = $tmp6;
  return $tmpret5;
} #end-of-function

######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-3-25: 11h:24m
##
######

sub
slistref_make_nil()
{
##
  #argless
##
  my $tmpret0;
  my $tmp1;
##
  __patsflab_slistref_make_nil:
  $tmp1 = 0;
  $tmpret0 = ats2plpre_ref($tmp1);
  return $tmpret0;
} #end-of-function


sub
slistref_length($)
{
##
  my($arg0) = @_;
##
  my $tmpret2;
  my $tmp3;
##
  __patsflab_slistref_length:
  $tmp3 = ats2plpre_ref_get_elt($arg0);
  $tmpret2 = ats2plpre_list_length($tmp3);
  return $tmpret2;
} #end-of-function


sub
slistref_push($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmp5;
  my $tmp6;
##
  __patsflab_slistref_push:
  $tmp6 = ats2plpre_ref_get_elt($arg0);
  $tmp5 = [$arg1, $tmp6];
  ats2plpre_ref_set_elt($arg0, $tmp5);
  return;#_void
} #end-of-function


sub
slistref_pop_opt($)
{
##
  my($arg0) = @_;
##
  my $tmpret7;
  my $tmp8;
  my $tmp9;
  my $tmp10;
##
  __patsflab_slistref_pop_opt:
  $tmp8 = ats2plpre_ref_get_elt($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab0:
    if(ATSCKptriscons($tmp8)) { goto __atstmplab3; }
    __atstmplab1:
    $tmpret7 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab2:
    __atstmplab3:
    $tmp9 = $tmp8->[0];
    $tmp10 = $tmp8->[1];
    ats2plpre_ref_set_elt($arg0, $tmp10);
    $tmpret7 = [$tmp9];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret7;
} #end-of-function


sub
slistref_foldleft($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret12;
  my $tmp13;
##
  __patsflab_slistref_foldleft:
  $tmp13 = ats2plpre_ref_get_elt($arg0);
  $tmpret12 = ats2plpre_list_foldleft($tmp13, $arg1, $arg2);
  return $tmpret12;
} #end-of-function


sub
slistref_foldright($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret14;
  my $tmp15;
##
  __patsflab_slistref_foldright:
  $tmp15 = ats2plpre_ref_get_elt($arg0);
  $tmpret14 = ats2plpre_list_foldright($tmp15, $arg1, $arg2);
  return $tmpret14;
} #end-of-function

######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-3-25: 11h:24m
##
######

sub
ats2plpre_qlistref_make_nil()
{
##
  #argless
##
  my $tmpret0;
  my $tmp1;
  my $tmp2;
  my $tmp3;
  my $tmp4;
##
  __patsflab_qlistref_make_nil:
  $tmp2 = 0;
  $tmp1 = ats2plpre_ref($tmp2);
  $tmp4 = 0;
  $tmp3 = ats2plpre_ref($tmp4);
  $tmpret0 = [$tmp1, $tmp3];
  return $tmpret0;
} #end-of-function


sub
ats2plpre_qlistref_length($)
{
##
  my($arg0) = @_;
##
  my $tmpret5;
  my $tmp6;
  my $tmp7;
  my $tmp8;
  my $tmp9;
  my $tmp10;
  my $tmp11;
##
  __patsflab_qlistref_length:
  $tmp6 = $arg0->[0];
  $tmp7 = $arg0->[1];
  $tmp9 = ats2plpre_ref_get_elt($tmp6);
  $tmp8 = ats2plpre_list_length($tmp9);
  $tmp11 = ats2plpre_ref_get_elt($tmp7);
  $tmp10 = ats2plpre_list_length($tmp11);
  $tmpret5 = ats2plpre_add_int1_int1($tmp8, $tmp10);
  return $tmpret5;
} #end-of-function


sub
ats2plpre_qlistref_enqueue($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmp13;
  my $tmp14;
  my $tmp15;
  my $tmp16;
##
  __patsflab_qlistref_enqueue:
  $tmp13 = $arg0->[0];
  $tmp14 = $arg0->[1];
  $tmp16 = ats2plpre_ref_get_elt($tmp13);
  $tmp15 = [$arg1, $tmp16];
  ats2plpre_ref_set_elt($tmp13, $tmp15);
  return;#_void
} #end-of-function


sub
ats2plpre_qlistref_dequeue_opt($)
{
##
  my($arg0) = @_;
##
  my $tmpret17;
  my $tmp18;
  my $tmp19;
  my $tmp20;
  my $tmp21;
  my $tmp22;
  my $tmp23;
  my $tmp25;
  my $tmp26;
  my $tmp27;
##
  __patsflab_qlistref_dequeue_opt:
  $tmp18 = $arg0->[0];
  $tmp19 = $arg0->[1];
  $tmp20 = ats2plpre_ref_get_elt($tmp19);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab0:
    if(ATSCKptriscons($tmp20)) { goto __atstmplab3; }
    __atstmplab1:
    $tmp23 = ats2plpre_ref_get_elt($tmp18);
    $tmp25 = 0;
    ats2plpre_ref_set_elt($tmp18, $tmp25);
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab4:
      if(ATSCKptriscons($tmp23)) { goto __atstmplab7; }
      __atstmplab5:
      $tmpret17 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab6:
      __atstmplab7:
      $tmp26 = $tmp23->[0];
      $tmp27 = $tmp23->[1];
      ats2plpre_ref_set_elt($tmp19, $tmp27);
      $tmpret17 = [$tmp26];
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab2:
    __atstmplab3:
    $tmp21 = $tmp20->[0];
    $tmp22 = $tmp20->[1];
    ats2plpre_ref_set_elt($tmp19, $tmp22);
    $tmpret17 = [$tmp21];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret17;
} #end-of-function


sub
ats2plpre_qlistref_foldleft($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret30;
  my $tmp31;
  my $tmp32;
  my $tmp41;
  my $tmp42;
  my $tmp43;
##
  __patsflab_qlistref_foldleft:
  $tmp31 = $arg0->[0];
  $tmp32 = $arg0->[1];
  $tmp41 = ats2plpre_ref_get_elt($tmp31);
  $tmp43 = ats2plpre_ref_get_elt($tmp32);
  $tmp42 = _ats2plpre_qlistref_auxl_5($arg2, $arg1, $tmp43);
  $tmpret30 = _ats2plpre_qlistref_auxr_6($arg2, $tmp41, $tmp42);
  return $tmpret30;
} #end-of-function


sub
_ats2plpre_qlistref_auxl_5($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret33;
  my $tmp34;
  my $tmp35;
  my $tmp36;
##
  __patsflab__ats2plpre_qlistref_auxl_5:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab8:
    if(ATSCKptriscons($arg1)) { goto __atstmplab11; }
    __atstmplab9:
    $tmpret33 = $arg0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab10:
    __atstmplab11:
    $tmp34 = $arg1->[0];
    $tmp35 = $arg1->[1];
    $tmp36 = &{$env0->[0]}($env0, $arg0, $tmp34);
    #ATStailcalseq_beg
    $apy0 = $tmp36;
    $apy1 = $tmp35;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_qlistref_auxl_5;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret33;
} #end-of-function


sub
_ats2plpre_qlistref_auxr_6($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $tmpret37;
  my $tmp38;
  my $tmp39;
  my $tmp40;
##
  __patsflab__ats2plpre_qlistref_auxr_6:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab12:
    if(ATSCKptriscons($arg0)) { goto __atstmplab15; }
    __atstmplab13:
    $tmpret37 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab14:
    __atstmplab15:
    $tmp38 = $arg0->[0];
    $tmp39 = $arg0->[1];
    $tmp40 = _ats2plpre_qlistref_auxr_6($env0, $tmp39, $arg1);
    $tmpret37 = &{$env0->[0]}($env0, $tmp40, $tmp38);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret37;
} #end-of-function


sub
ats2plpre_qlistref_foldright($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret44;
  my $tmp45;
  my $tmp46;
  my $tmp55;
  my $tmp56;
  my $tmp57;
##
  __patsflab_qlistref_foldright:
  $tmp45 = $arg0->[0];
  $tmp46 = $arg0->[1];
  $tmp55 = ats2plpre_ref_get_elt($tmp46);
  $tmp57 = ats2plpre_ref_get_elt($tmp45);
  $tmp56 = _ats2plpre_qlistref_auxl_8($arg1, $arg2, $tmp57);
  $tmpret44 = _ats2plpre_qlistref_auxr_9($arg1, $tmp55, $tmp56);
  return $tmpret44;
} #end-of-function


sub
_ats2plpre_qlistref_auxl_8($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret47;
  my $tmp48;
  my $tmp49;
  my $tmp50;
##
  __patsflab__ats2plpre_qlistref_auxl_8:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab16:
    if(ATSCKptriscons($arg1)) { goto __atstmplab19; }
    __atstmplab17:
    $tmpret47 = $arg0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab18:
    __atstmplab19:
    $tmp48 = $arg1->[0];
    $tmp49 = $arg1->[1];
    $tmp50 = &{$env0->[0]}($env0, $tmp48, $arg0);
    #ATStailcalseq_beg
    $apy0 = $tmp50;
    $apy1 = $tmp49;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_qlistref_auxl_8;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret47;
} #end-of-function


sub
_ats2plpre_qlistref_auxr_9($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $tmpret51;
  my $tmp52;
  my $tmp53;
  my $tmp54;
##
  __patsflab__ats2plpre_qlistref_auxr_9:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab20:
    if(ATSCKptriscons($arg0)) { goto __atstmplab23; }
    __atstmplab21:
    $tmpret51 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab22:
    __atstmplab23:
    $tmp52 = $arg0->[0];
    $tmp53 = $arg0->[1];
    $tmp54 = _ats2plpre_qlistref_auxr_9($env0, $tmp53, $arg1);
    $tmpret51 = &{$env0->[0]}($env0, $tmp52, $tmp54);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret51;
} #end-of-function

######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-3-25: 11h:24m
##
######
sub
_ats2plpre_ML_list0_patsfun_29__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_29($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_32__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_32($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_35__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_35($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_38__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_38($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_42__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_42($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_45__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_45($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_48__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_48($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_51__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_51($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_54__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_54($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_58__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_58($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_64__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_64($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}


sub
ats2plpre_ML_list0_head_opt($)
{
##
  my($arg0) = @_;
##
  my $tmpret7;
  my $tmp8;
##
  __patsflab_list0_head_opt:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab6:
    if(ATSCKptriscons($arg0)) { goto __atstmplab9; }
    __atstmplab7:
    $tmpret7 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab8:
    __atstmplab9:
    $tmp8 = $arg0->[0];
    $tmpret7 = [$tmp8];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret7;
} #end-of-function


sub
ats2plpre_ML_list0_tail_opt($)
{
##
  my($arg0) = @_;
##
  my $tmpret10;
  my $tmp12;
##
  __patsflab_list0_tail_opt:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab10:
    if(ATSCKptriscons($arg0)) { goto __atstmplab13; }
    __atstmplab11:
    $tmpret10 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab12:
    __atstmplab13:
    $tmp12 = $arg0->[1];
    $tmpret10 = [$tmp12];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret10;
} #end-of-function


sub
ats2plpre_ML_list0_length($)
{
##
  my($arg0) = @_;
##
  my $tmpret13;
##
  __patsflab_list0_length:
  $tmpret13 = ats2plpre_list_length($arg0);
  return $tmpret13;
} #end-of-function


sub
ats2plpre_ML_list0_last_opt($)
{
##
  my($arg0) = @_;
##
  my $tmpret14;
  my $tmp18;
  my $tmp19;
  my $tmp20;
##
  __patsflab_list0_last_opt:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab18:
    if(ATSCKptriscons($arg0)) { goto __atstmplab21; }
    __atstmplab19:
    $tmpret14 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab20:
    __atstmplab21:
    $tmp18 = $arg0->[0];
    $tmp19 = $arg0->[1];
    $tmp20 = _ats2plpre_ML_list0_loop_8($tmp18, $tmp19);
    $tmpret14 = [$tmp20];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret14;
} #end-of-function


sub
_ats2plpre_ML_list0_loop_8($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret15;
  my $tmp16;
  my $tmp17;
##
  __patsflab__ats2plpre_ML_list0_loop_8:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab14:
    if(ATSCKptriscons($arg1)) { goto __atstmplab17; }
    __atstmplab15:
    $tmpret15 = $arg0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab16:
    __atstmplab17:
    $tmp16 = $arg1->[0];
    $tmp17 = $arg1->[1];
    #ATStailcalseq_beg
    $apy0 = $tmp16;
    $apy1 = $tmp17;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_ML_list0_loop_8;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret15;
} #end-of-function


sub
ats2plpre_ML_list0_get_at_opt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret21;
  my $tmp22;
  my $tmp23;
  my $tmp24;
  my $tmp25;
##
  __patsflab_list0_get_at_opt:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab22:
    if(ATSCKptriscons($arg0)) { goto __atstmplab25; }
    __atstmplab23:
    $tmpret21 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab24:
    __atstmplab25:
    $tmp22 = $arg0->[0];
    $tmp23 = $arg0->[1];
    $tmp24 = ats2plpre_gt_int1_int1($arg1, 0);
    if($tmp24) {
      $tmp25 = ats2plpre_sub_int1_int1($arg1, 1);
      #ATStailcalseq_beg
      $apy0 = $tmp23;
      $apy1 = $tmp25;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab_list0_get_at_opt;
      #ATStailcalseq_end
    } else {
      $tmpret21 = [$tmp22];
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret21;
} #end-of-function


sub
ats2plpre_ML_list0_make_elt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret26;
  my $tmp27;
  my $tmp28;
##
  __patsflab_list0_make_elt:
  $tmp27 = ats2plpre_gte_int1_int1($arg0, 0);
  if($tmp27) {
    $tmp28 = ats2plpre_list_make_elt($arg0, $arg1);
    $tmpret26 = $tmp28;
  } else {
    $tmpret26 = 0;
  } #endif
  return $tmpret26;
} #end-of-function


sub
ats2plpre_ML_list0_make_intrange_2($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret29;
  my $tmp30;
##
  __patsflab_list0_make_intrange_2:
  $tmp30 = ats2plpre_list_make_intrange_2($arg0, $arg1);
  $tmpret29 = $tmp30;
  return $tmpret29;
} #end-of-function


sub
ats2plpre_ML_list0_make_intrange_3($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret31;
  my $tmp32;
##
  __patsflab_list0_make_intrange_3:
  $tmp32 = ats2plpre_list_make_intrange_3($arg0, $arg1, $arg2);
  $tmpret31 = $tmp32;
  return $tmpret31;
} #end-of-function


sub
ats2plpre_ML_list0_snoc($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret44;
  my $tmp45;
##
  __patsflab_list0_snoc:
  $tmp45 = ats2plpre_list_snoc($arg0, $arg1);
  $tmpret44 = $tmp45;
  return $tmpret44;
} #end-of-function


sub
ats2plpre_ML_list0_extend($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret46;
  my $tmp47;
##
  __patsflab_list0_extend:
  $tmp47 = ats2plpre_list_extend($arg0, $arg1);
  $tmpret46 = $tmp47;
  return $tmpret46;
} #end-of-function


sub
ats2plpre_ML_list0_append($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret48;
  my $tmp49;
##
  __patsflab_list0_append:
  $tmp49 = ats2plpre_list_append($arg0, $arg1);
  $tmpret48 = $tmp49;
  return $tmpret48;
} #end-of-function


sub
ats2plpre_ML_mul_int_list0($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret50;
  my $tmp51;
##
  __patsflab_mul_int_list0:
  $tmp51 = ats2plpre_mul_int_list($arg0, $arg1);
  $tmpret50 = $tmp51;
  return $tmpret50;
} #end-of-function


sub
ats2plpre_ML_list0_reverse($)
{
##
  my($arg0) = @_;
##
  my $tmpret52;
  my $tmp53;
##
  __patsflab_list0_reverse:
  $tmp53 = ats2plpre_list_reverse($arg0);
  $tmpret52 = $tmp53;
  return $tmpret52;
} #end-of-function


sub
ats2plpre_ML_list0_reverse_append($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret54;
  my $tmp55;
##
  __patsflab_list0_reverse_append:
  $tmp55 = ats2plpre_list_reverse_append($arg0, $arg1);
  $tmpret54 = $tmp55;
  return $tmpret54;
} #end-of-function


sub
ats2plpre_ML_list0_concat($)
{
##
  my($arg0) = @_;
##
  my $tmpret56;
  my $tmp57;
##
  __patsflab_list0_concat:
  $tmp57 = ats2plpre_list_concat($arg0);
  $tmpret56 = $tmp57;
  return $tmpret56;
} #end-of-function


sub
ats2plpre_ML_list0_remove_at_opt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret58;
##
  __patsflab_list0_remove_at_opt:
  $tmpret58 = _ats2plpre_ML_list0_aux_26($arg0, 0);
  return $tmpret58;
} #end-of-function


sub
_ats2plpre_ML_list0_aux_26($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret59;
  my $tmp60;
  my $tmp61;
  my $tmp62;
  my $tmp63;
  my $tmp64;
  my $tmp65;
  my $tmp66;
##
  __patsflab__ats2plpre_ML_list0_aux_26:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab30:
    if(ATSCKptriscons($arg0)) { goto __atstmplab33; }
    __atstmplab31:
    $tmpret59 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab32:
    __atstmplab33:
    $tmp60 = $arg0->[0];
    $tmp61 = $arg0->[1];
    $tmp62 = ats2plpre_gt_int1_int1($arg1, 0);
    if($tmp62) {
      $tmp64 = ats2plpre_sub_int1_int1($arg1, 1);
      $tmp63 = _ats2plpre_ML_list0_aux_26($tmp61, $tmp64);
      #ATScaseofseq_beg
      while(1)
      {
        #ATSbranchseq_beg
        __atstmplab34:
        if(ATSCKptriscons($tmp63)) { goto __atstmplab37; }
        __atstmplab35:
        $tmpret59 = 0;
        last;
        #ATSbranchseq_end
        #ATSbranchseq_beg
        __atstmplab36:
        __atstmplab37:
        $tmp65 = $tmp63->[0];
        #ATSINSfreecon($tmp63);
        $tmp66 = [$tmp60, $tmp65];
        $tmpret59 = [$tmp66];
        last;
        #ATSbranchseq_end
      } #end-of-while-loop;
      #ATScaseofseq_end
    } else {
      $tmpret59 = [$tmp61];
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret59;
} #end-of-function


sub
ats2plpre_ML_list0_exists($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret67;
##
  __patsflab_list0_exists:
  $tmpret67 = ats2plpre_list_exists($arg0, $arg1);
  return $tmpret67;
} #end-of-function


sub
ats2plpre_ML_list0_exists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret68;
##
  __patsflab_list0_exists_method:
  $tmpret68 = _ats2plpre_ML_list0_patsfun_29__closurerize($arg0);
  return $tmpret68;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_29($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret69;
##
  __patsflab__ats2plpre_ML_list0_patsfun_29:
  $tmpret69 = ats2plpre_ML_list0_exists($env0, $arg0);
  return $tmpret69;
} #end-of-function


sub
ats2plpre_ML_list0_iexists($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret70;
##
  __patsflab_list0_iexists:
  $tmpret70 = ats2plpre_list_iexists($arg0, $arg1);
  return $tmpret70;
} #end-of-function


sub
ats2plpre_ML_list0_iexists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret71;
##
  __patsflab_list0_iexists_method:
  $tmpret71 = _ats2plpre_ML_list0_patsfun_32__closurerize($arg0);
  return $tmpret71;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_32($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret72;
##
  __patsflab__ats2plpre_ML_list0_patsfun_32:
  $tmpret72 = ats2plpre_ML_list0_iexists($env0, $arg0);
  return $tmpret72;
} #end-of-function


sub
ats2plpre_ML_list0_forall($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret73;
##
  __patsflab_list0_forall:
  $tmpret73 = ats2plpre_list_forall($arg0, $arg1);
  return $tmpret73;
} #end-of-function


sub
ats2plpre_ML_list0_forall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret74;
##
  __patsflab_list0_forall_method:
  $tmpret74 = _ats2plpre_ML_list0_patsfun_35__closurerize($arg0);
  return $tmpret74;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_35($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret75;
##
  __patsflab__ats2plpre_ML_list0_patsfun_35:
  $tmpret75 = ats2plpre_ML_list0_forall($env0, $arg0);
  return $tmpret75;
} #end-of-function


sub
ats2plpre_ML_list0_iforall($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret76;
##
  __patsflab_list0_iforall:
  $tmpret76 = ats2plpre_list_iforall($arg0, $arg1);
  return $tmpret76;
} #end-of-function


sub
ats2plpre_ML_list0_iforall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret77;
##
  __patsflab_list0_iforall_method:
  $tmpret77 = _ats2plpre_ML_list0_patsfun_38__closurerize($arg0);
  return $tmpret77;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_38($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret78;
##
  __patsflab__ats2plpre_ML_list0_patsfun_38:
  $tmpret78 = ats2plpre_ML_list0_iforall($env0, $arg0);
  return $tmpret78;
} #end-of-function


sub
ats2plpre_ML_list0_app($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_list0_app:
  ats2plpre_ML_list0_foreach($arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_list0_foreach($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_list0_foreach:
  ats2plpre_list_foreach($arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_list0_foreach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret81;
##
  __patsflab_list0_foreach_method:
  $tmpret81 = _ats2plpre_ML_list0_patsfun_42__closurerize($arg0);
  return $tmpret81;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_42($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_ML_list0_patsfun_42:
  ats2plpre_ML_list0_foreach($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_list0_iforeach($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_list0_iforeach:
  ats2plpre_list_iforeach($arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_list0_iforeach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret84;
##
  __patsflab_list0_iforeach_method:
  $tmpret84 = _ats2plpre_ML_list0_patsfun_45__closurerize($arg0);
  return $tmpret84;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_45($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_ML_list0_patsfun_45:
  ats2plpre_ML_list0_iforeach($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_list0_rforeach($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_list0_rforeach:
  ats2plpre_list_rforeach($arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_list0_rforeach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret87;
##
  __patsflab_list0_rforeach_method:
  $tmpret87 = _ats2plpre_ML_list0_patsfun_48__closurerize($arg0);
  return $tmpret87;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_48($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_ML_list0_patsfun_48:
  ats2plpre_ML_list0_rforeach($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_list0_filter($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret89;
  my $tmp90;
##
  __patsflab_list0_filter:
  $tmp90 = ats2plpre_list_filter($arg0, $arg1);
  $tmpret89 = $tmp90;
  return $tmpret89;
} #end-of-function


sub
ats2plpre_ML_list0_filter_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret91;
##
  __patsflab_list0_filter_method:
  $tmpret91 = _ats2plpre_ML_list0_patsfun_51__closurerize($arg0);
  return $tmpret91;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_51($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret92;
##
  __patsflab__ats2plpre_ML_list0_patsfun_51:
  $tmpret92 = ats2plpre_ML_list0_filter($env0, $arg0);
  return $tmpret92;
} #end-of-function


sub
ats2plpre_ML_list0_map($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret93;
  my $tmp94;
##
  __patsflab_list0_map:
  $tmp94 = ats2plpre_list_map($arg0, $arg1);
  $tmpret93 = $tmp94;
  return $tmpret93;
} #end-of-function


sub
ats2plpre_ML_list0_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret95;
##
  __patsflab_list0_map_method:
  $tmpret95 = _ats2plpre_ML_list0_patsfun_54__closurerize($arg0);
  return $tmpret95;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_54($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret96;
##
  __patsflab__ats2plpre_ML_list0_patsfun_54:
  $tmpret96 = ats2plpre_ML_list0_map($env0, $arg0);
  return $tmpret96;
} #end-of-function


sub
ats2plpre_ML_list0_mapcons($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret97;
  my $tmp98;
  my $tmp99;
  my $tmp100;
  my $tmp101;
##
  __patsflab_list0_mapcons:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab38:
    if(ATSCKptriscons($arg1)) { goto __atstmplab41; }
    __atstmplab39:
    $tmpret97 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab40:
    __atstmplab41:
    $tmp98 = $arg1->[0];
    $tmp99 = $arg1->[1];
    $tmp100 = [$arg0, $tmp98];
    $tmp101 = ats2plpre_ML_list0_mapcons($arg0, $tmp99);
    $tmpret97 = [$tmp100, $tmp101];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret97;
} #end-of-function


sub
ats2plpre_ML_list0_find_opt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret102;
  my $tmp103;
  my $tmp104;
  my $tmp105;
##
  __patsflab_list0_find_opt:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab42:
    if(ATSCKptriscons($arg0)) { goto __atstmplab45; }
    __atstmplab43:
    $tmpret102 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab44:
    __atstmplab45:
    $tmp103 = $arg0->[0];
    $tmp104 = $arg0->[1];
    $tmp105 = &{$arg1->[0]}($arg1, $tmp103);
    if($tmp105) {
      $tmpret102 = [$tmp103];
    } else {
      #ATStailcalseq_beg
      $apy0 = $tmp104;
      $apy1 = $arg1;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab_list0_find_opt;
      #ATStailcalseq_end
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret102;
} #end-of-function


sub
ats2plpre_ML_list0_find_opt_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret106;
##
  __patsflab_list0_find_opt_method:
  $tmpret106 = _ats2plpre_ML_list0_patsfun_58__closurerize($arg0);
  return $tmpret106;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_58($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret107;
##
  __patsflab__ats2plpre_ML_list0_patsfun_58:
  $tmpret107 = ats2plpre_ML_list0_find_opt($env0, $arg0);
  return $tmpret107;
} #end-of-function


sub
ats2plpre_ML_list0_zip($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret108;
##
  __patsflab_list0_zip:
  $tmpret108 = _ats2plpre_ML_list0_aux_60($arg0, $arg1);
  return $tmpret108;
} #end-of-function


sub
_ats2plpre_ML_list0_aux_60($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret109;
  my $tmp110;
  my $tmp111;
  my $tmp112;
  my $tmp113;
  my $tmp114;
  my $tmp115;
##
  __patsflab__ats2plpre_ML_list0_aux_60:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab46:
    if(ATSCKptriscons($arg0)) { goto __atstmplab49; }
    __atstmplab47:
    $tmpret109 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab48:
    __atstmplab49:
    $tmp110 = $arg0->[0];
    $tmp111 = $arg0->[1];
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab50:
      if(ATSCKptriscons($arg1)) { goto __atstmplab53; }
      __atstmplab51:
      $tmpret109 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab52:
      __atstmplab53:
      $tmp112 = $arg1->[0];
      $tmp113 = $arg1->[1];
      $tmp114 = [$tmp110, $tmp112];
      $tmp115 = _ats2plpre_ML_list0_aux_60($tmp111, $tmp113);
      $tmpret109 = [$tmp114, $tmp115];
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret109;
} #end-of-function


sub
ats2plpre_ML_list0_zipwith($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret116;
##
  __patsflab_list0_zipwith:
  $tmpret116 = _ats2plpre_ML_list0_aux_62($arg0, $arg1, $arg2);
  return $tmpret116;
} #end-of-function


sub
_ats2plpre_ML_list0_aux_62($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret117;
  my $tmp118;
  my $tmp119;
  my $tmp120;
  my $tmp121;
  my $tmp122;
  my $tmp123;
##
  __patsflab__ats2plpre_ML_list0_aux_62:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab54:
    if(ATSCKptriscons($arg0)) { goto __atstmplab57; }
    __atstmplab55:
    $tmpret117 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab56:
    __atstmplab57:
    $tmp118 = $arg0->[0];
    $tmp119 = $arg0->[1];
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab58:
      if(ATSCKptriscons($arg1)) { goto __atstmplab61; }
      __atstmplab59:
      $tmpret117 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab60:
      __atstmplab61:
      $tmp120 = $arg1->[0];
      $tmp121 = $arg1->[1];
      $tmp122 = &{$arg2->[0]}($arg2, $tmp118, $tmp120);
      $tmp123 = _ats2plpre_ML_list0_aux_62($tmp119, $tmp121, $arg2);
      $tmpret117 = [$tmp122, $tmp123];
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret117;
} #end-of-function


sub
ats2plpre_ML_list0_zipwith_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret124;
##
  __patsflab_list0_zipwith_method:
  $tmpret124 = _ats2plpre_ML_list0_patsfun_64__closurerize($arg0, $arg1);
  return $tmpret124;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_64($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret125;
##
  __patsflab__ats2plpre_ML_list0_patsfun_64:
  $tmpret125 = ats2plpre_ML_list0_zipwith($env0, $env1, $arg0);
  return $tmpret125;
} #end-of-function


sub
ats2plpre_ML_list0_foldleft($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret126;
##
  __patsflab_list0_foldleft:
  $tmpret126 = _ats2plpre_ML_list0_aux_66($arg2, $arg1, $arg0);
  return $tmpret126;
} #end-of-function


sub
_ats2plpre_ML_list0_aux_66($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret127;
  my $tmp128;
  my $tmp129;
  my $tmp130;
##
  __patsflab__ats2plpre_ML_list0_aux_66:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab62:
    if(ATSCKptriscons($arg1)) { goto __atstmplab65; }
    __atstmplab63:
    $tmpret127 = $arg0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab64:
    __atstmplab65:
    $tmp128 = $arg1->[0];
    $tmp129 = $arg1->[1];
    $tmp130 = &{$env0->[0]}($env0, $arg0, $tmp128);
    #ATStailcalseq_beg
    $apy0 = $tmp130;
    $apy1 = $tmp129;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_ML_list0_aux_66;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret127;
} #end-of-function


sub
ats2plpre_ML_list0_foldright($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret131;
##
  __patsflab_list0_foldright:
  $tmpret131 = _ats2plpre_ML_list0_aux_68($arg1, $arg2, $arg0, $arg2);
  return $tmpret131;
} #end-of-function


sub
_ats2plpre_ML_list0_aux_68($$$$)
{
##
  my($env0, $env1, $arg0, $arg1) = @_;
##
  my $tmpret132;
  my $tmp133;
  my $tmp134;
  my $tmp135;
##
  __patsflab__ats2plpre_ML_list0_aux_68:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab66:
    if(ATSCKptriscons($arg0)) { goto __atstmplab69; }
    __atstmplab67:
    $tmpret132 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab68:
    __atstmplab69:
    $tmp133 = $arg0->[0];
    $tmp134 = $arg0->[1];
    $tmp135 = _ats2plpre_ML_list0_aux_68($env0, $env1, $tmp134, $env1);
    $tmpret132 = &{$env0->[0]}($env0, $tmp133, $tmp135);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret132;
} #end-of-function


sub
ats2plpre_ML_list0_sort_2($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret138;
  my $tmp139;
##
  __patsflab_list0_sort_2:
  $tmp139 = ats2plpre_list_sort_2($arg0, $arg1);
  $tmpret138 = $tmp139;
  return $tmpret138;
} #end-of-function


sub
ats2plpre_ML_streamize_list0_zip($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret140;
##
  __patsflab_streamize_list0_zip:
  $tmpret140 = ats2plpre_streamize_list_zip($arg0, $arg1);
  return $tmpret140;
} #end-of-function


sub
ats2plpre_ML_streamize_list0_cross($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret141;
##
  __patsflab_streamize_list0_cross:
  $tmpret141 = ats2plpre_streamize_list_cross($arg0, $arg1);
  return $tmpret141;
} #end-of-function

######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-3-25: 11h:24m
##
######
sub
_ats2plpre_ML_array0_patsfun_7__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_array0_patsfun_7($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_array0_patsfun_10__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_array0_patsfun_10($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_array0_patsfun_14__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_array0_patsfun_14($cenv->[1], $arg0); }, $env0];
}


sub
ats2plpre_ML_array0_make_elt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret0;
##
  __patsflab_array0_make_elt:
  $tmpret0 = ats2plpre_arrszref_make_elt($arg0, $arg1);
  return $tmpret0;
} #end-of-function


sub
ats2plpre_ML_array0_size($)
{
##
  my($arg0) = @_;
##
  my $tmpret1;
##
  __patsflab_array0_size:
  $tmpret1 = ats2plpre_arrszref_size($arg0);
  return $tmpret1;
} #end-of-function


sub
ats2plpre_ML_array0_get_at($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret2;
##
  __patsflab_array0_get_at:
  $tmpret2 = ats2plpre_arrszref_get_at($arg0, $arg1);
  return $tmpret2;
} #end-of-function


sub
ats2plpre_ML_array0_set_at($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
##
  __patsflab_array0_set_at:
  ats2plpre_arrszref_set_at($arg0, $arg1, $arg2);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_array0_exch_at($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret4;
##
  __patsflab_array0_exch_at:
  $tmpret4 = ats2plpre_arrszref_exch_at($arg0, $arg1, $arg2);
  return $tmpret4;
} #end-of-function


sub
ats2plpre_ML_array0_exists_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret5;
##
  __patsflab_array0_exists_cloref:
  $tmpret5 = ats2plpre_arrszref_exists_cloref($arg0, $arg1);
  return $tmpret5;
} #end-of-function


sub
ats2plpre_ML_array0_exists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret6;
##
  __patsflab_array0_exists_method:
  $tmpret6 = _ats2plpre_ML_array0_patsfun_7__closurerize($arg0);
  return $tmpret6;
} #end-of-function


sub
_ats2plpre_ML_array0_patsfun_7($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret7;
##
  __patsflab__ats2plpre_ML_array0_patsfun_7:
  $tmpret7 = ats2plpre_ML_array0_exists_cloref($env0, $arg0);
  return $tmpret7;
} #end-of-function


sub
ats2plpre_ML_array0_forall_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret8;
##
  __patsflab_array0_forall_cloref:
  $tmpret8 = ats2plpre_arrszref_forall_cloref($arg0, $arg1);
  return $tmpret8;
} #end-of-function


sub
ats2plpre_ML_array0_forall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret9;
##
  __patsflab_array0_forall_method:
  $tmpret9 = _ats2plpre_ML_array0_patsfun_10__closurerize($arg0);
  return $tmpret9;
} #end-of-function


sub
_ats2plpre_ML_array0_patsfun_10($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret10;
##
  __patsflab__ats2plpre_ML_array0_patsfun_10:
  $tmpret10 = ats2plpre_ML_array0_forall_cloref($env0, $arg0);
  return $tmpret10;
} #end-of-function


sub
ats2plpre_ML_array0_app_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_array0_app_cloref:
  ats2plpre_ML_array0_foreach_cloref($arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_array0_foreach_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_array0_foreach_cloref:
  ats2plpre_arrszref_foreach_cloref($arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_array0_foreach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret13;
##
  __patsflab_array0_foreach_method:
  $tmpret13 = _ats2plpre_ML_array0_patsfun_14__closurerize($arg0);
  return $tmpret13;
} #end-of-function


sub
_ats2plpre_ML_array0_patsfun_14($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_ML_array0_patsfun_14:
  ats2plpre_ML_array0_foreach_cloref($env0, $arg0);
  return;#_void
} #end-of-function

######
##
## end-of-compilation-unit
##
######

## ###### ###### ##

## end of [libatscc2pl_all.pl] ##
######
#
# Time of Generation:
# Tue Apr 11 16:58:02 EDT 2017
#
######

######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [basics_cats.pl]
######

############################################

sub
ATSCKiseqz($) { return ($_[0] == 0); }
sub
ATSCKisneqz($) { return ($_[0] != 0); }

############################################

sub
ATSCKptrisnull($) { return ($_[0] == 0); }
sub
ATSCKptriscons($) { return ($_[0] != 0); }

############################################

sub
ATSCKpat_int($$) { return ($_[0] == $_[1]); }
sub
ATSCKpat_bool($$) { return ($_[0] == $_[1]); }
sub
ATSCKpat_char($$) { return ($_[0] == $_[1]); }
sub
ATSCKpat_float($$) { return ($_[0] == $_[1]); }

############################################
#
sub
ATSCKpat_con0($$)
  { return ($_[0] == $_[1]); }
sub
ATSCKpat_con1($$)
  { my $con = $_[0]; return ($con->[0] == $_[1]); }
#
############################################
#
sub
ATSINScaseof_fail($)
{
STDERR->printflush("ATSINScaseof_fail:$_[0]"); exit(1); return;
}
#
sub
ATSINSdeadcode_fail()
  { STDERR->printflush("ATSINSdeadcode_fail"); exit(1); return; }
#
############################################
#
sub
ATSPMVempty(){ return; }
#
############################################

sub
ATSPMVlazyval($){ return [0, $_[0]]; }

############################################

sub
ATSPMVlazyval_eval($)
{
#
  my($lazyval) = @_;
  my($flag);
  my($mythunk);
#
  $flag = $lazyval->[0];
#
  if($flag==0)
  {
    $lazyval->[0] = 1;
    $mythunk = $lazyval->[1];
    $lazyval->[1] = &{$mythunk->[0]}($mythunk);
  } else {
    $lazyval->[0] = $flag + 1;
  } #end-of-[if]
  return ($lazyval->[1]);
#
} #end-of-[ATSPMVlazyval_eval]

############################################

sub
ATSPMVllazyval($){ return $_[0]; }

############################################
#
sub
ATSPMVllazyval_eval($)
{
  my($lazyval) = @_;
  return &{$lazyval->[0]}($lazyval, 1);
}
#
sub
atspre_lazy_vt_free($)
{
  my($lazyval) = @_;
  return &{$lazyval->[0]}($lazyval, 0);
}
#
############################################

sub
ats2plpre_lazy2cloref($) { return $_[0]->[1]; }

############################################
#
sub
ats2plpre_assert_bool0($)
{
  my($tfv) = @_;
  if (!$tfv) { exit(1); }
  return;
}
sub
ats2plpre_assert_bool1($$)
{
  ats2plpre_assert_bool0($_[0]); return;
}
#
sub
ats2plpre_assert_errmsg_bool0($$)
{
  my($tfv, $errmsg) = @_;
  if (!$tfv) { STDERR->printflush($errmsg); exit(1); }
  return;
}
sub
ats2plpre_assert_errmsg_bool1($$)
{
  ats2plpre_assert_errmsg_bool0($_[0], $_[1]); return;
}
#
############################################

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [basics_cats.js]
######
######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [integer_cats.pl]
######

############################################

sub
ats2plpre_abs_int0($) { return abs($_[0]); }
sub
ats2plpre_neg_int0($) { return ( -($_[0]) ); }

############################################

sub
ats2plpre_succ_int0($) { return ($_[0] + 1); }
sub
ats2plpre_pred_int0($) { return ($_[0] - 1); }

############################################

sub
ats2plpre_add_int0_int0($$) { return ($_[0] + $_[1]); }
sub
ats2plpre_sub_int0_int0($$) { return ($_[0] - $_[1]); }
sub
ats2plpre_mul_int0_int0($$) { return ($_[0] * $_[1]); }
sub
ats2plpre_div_int0_int0($$) { return int($_[0] / $_[1]); }
sub
ats2plpre_mod_int0_int0($$) { return ($_[0] % $_[1]); }

############################################
#
sub
ats2plpre_add_int1_int1($$) { return ($_[0] + $_[1]); }
sub
ats2plpre_sub_int1_int1($$) { return ($_[0] - $_[1]); }
sub
ats2plpre_mul_int1_int1($$) { return ($_[0] * $_[1]); }
sub
ats2plpre_div_int1_int1($$) { return int($_[0] / $_[1]); }
#
sub
ats2plpre_mod_int1_int1($$) { return ($_[0] % $_[1]); }
sub
ats2plpre_nmod_int1_int1($$) { return ($_[0] % $_[1]); }
#
############################################

sub
ats2plpre_lt_int0_int0($$) { return ($_[0] < $_[1]); }
sub
ats2plpre_lte_int0_int0($$) { return ($_[0] <= $_[1]); }
sub
ats2plpre_gt_int0_int0($$) { return ($_[0] > $_[1]); }
sub
ats2plpre_gte_int0_int0($$) { return ($_[0] >= $_[1]); }
sub
ats2plpre_eq_int0_int0($$) { return ($_[0] == $_[1]); }
sub
ats2plpre_neq_int0_int0($$) { return ($_[0] != $_[1]); }

############################################

sub
ats2plpre_lt_int1_int1($$) { return ($_[0] < $_[1]); }
sub
ats2plpre_lte_int1_int1($$) { return ($_[0] <= $_[1]); }
sub
ats2plpre_gt_int1_int1($$) { return ($_[0] > $_[1]); }
sub
ats2plpre_gte_int1_int1($$) { return ($_[0] >= $_[1]); }
sub
ats2plpre_eq_int1_int1($$) { return ($_[0] == $_[1]); }
sub
ats2plpre_neq_int1_int1($$) { return ($_[0] != $_[1]); }

############################################

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [integer_cats.pl]
######

######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [bool_cats.pl]
######

############################################

sub
ats2plpre_neg_bool0($) { return !($_[0]); }
sub
ats2plpre_neg_bool1($) { return !($_[0]); }

############################################

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [bool_cats.pl]
######

######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [float_cats.pl]
######

############################################
#
sub
ats2plpre_double2int($) { return int($_[0]); }
sub
ats2plpre_int_of_double($) { return int($_[0]); }
#
sub
ats2plpre_int2double($) { return ($_[0]) ; }
sub
ats2plpre_double_of_int($) { return ($_[0]) ; }
#
############################################
#
sub
ats2plpre_abs_double($) { return abs($_[0]); }
sub
ats2plpre_neg_double($) { return ( -$_[0] ); }
#
sub
ats2plpre_succ_double($) { return ($_[0] + 1); }
sub
ats2plpre_pred_double($) { return ($_[0] + 1); }
#
############################################
#
sub
ats2plpre_add_int_double($$) { return ($_[0] + $_[1]); }
sub
ats2plpre_sub_int_double($$) { return ($_[0] - $_[1]); }
sub
ats2plpre_mul_int_double($$) { return ($_[0] * $_[1]); }
sub
ats2plpre_div_int_double($$) { return ($_[0] / $_[1]); }
#
############################################
#
sub
ats2plpre_add_double_int($$) { return ($_[0] + $_[1]); }
sub
ats2plpre_sub_double_int($$) { return ($_[0] - $_[1]); }
sub
ats2plpre_mul_double_int($$) { return ($_[0] * $_[1]); }
sub
ats2plpre_div_double_int($$) { return ($_[0] / $_[1]); }
#
############################################
#
sub
ats2plpre_add_double_double($$) { return ($_[0] + $_[1]); }
sub
ats2plpre_sub_double_double($$) { return ($_[0] - $_[1]); }
sub
ats2plpre_mul_double_double($$) { return ($_[0] * $_[1]); }
sub
ats2plpre_div_double_double($$) { return ($_[0] / $_[1]); }
#
############################################
#
sub
ats2plpre_lt_double_double($$) { return ($_[0] < $_[1]); }
sub
ats2plpre_lte_double_double($$) { return ($_[0] <= $_[1]); }
sub
ats2plpre_gt_double_double($$) { return ($_[0] > $_[1]); }
sub
ats2plpre_gte_double_double($$) { return ($_[0] >= $_[1]); }
#
sub
ats2plpre_eq_double_double($$) { return ($_[0] == $_[1]); }
sub
ats2plpre_neq_double_double($$) { return ($_[0] != $_[1]); }
#
############################################

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [float_cats.pl]
######
######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [string_cats.pl]
######

############################################

sub
ats2plpre_lt_string_string($$) { return ($_[0] < $_[1]); }
sub
ats2plpre_lte_string_string($$) { return ($_[0] <= $_[1]); }
sub
ats2plpre_gt_string_string($$) { return ($_[0] > $_[1]); }
sub
ats2plpre_gte_string_string($$) { return ($_[0] >= $_[1]); }
sub
ats2plpre_eq_string_string($$) { return ($_[0] == $_[1]); }
sub
ats2plpre_neq_string_string($$) { return ($_[0] != $_[1]); }

############################################

######
1; #note that it is needed by 'use' or 'require'
######

###### end of [string_cats.pl] ######
######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [print_cats.pl]
######

############################################
#
sub
ats2plpre_print_int($)
{
  ats2plpre_fprint_int(STDOUT, $_[0]); return;
}
sub
ats2plpre_prerr_int($)
{
  ats2plpre_fprint_int(STDERR, $_[0]); return;
}
#
sub
ats2plpre_fprint_int($$) { print {$_[0]} $_[1]; return; }
#
############################################
#
sub
ats2plpre_print_bool($)
{
  ats2plpre_fprint_bool(STDOUT, $_[0]); return;
}
sub
ats2plpre_prerr_bool($)
{
  ats2plpre_fprint_bool(STDERR, $_[0]); return;
}
#
sub
ats2plpre_fprint_bool($$)
{
  if($_[1]) { print {$_[0]} "true"; } else { print {$_[0]} "false"; }; return;
}
#
############################################
#
sub
ats2plpre_print_double($)
{
  ats2plpre_fprint_double(STDOUT, $_[0]); return;
}
sub
ats2plpre_prerr_double($)
{
  ats2plpre_fprint_double(STDERR, $_[0]); return;
}
#
sub
ats2plpre_fprint_double($$) { print {$_[0]} $_[1]; return; }
#
############################################
#
sub
ats2plpre_print_string($)
{
  ats2plpre_fprint_string(STDOUT, $_[0]); return;
}
sub
ats2plpre_prerr_string($)
{
  ats2plpre_fprint_string(STDERR, $_[0]); return;
}
#
sub
ats2plpre_fprint_string($$) { print {$_[0]} "$_[1]"; return; }
#
############################################
#
sub
ats2plpre_print_obj($)
{
  ats2plpre_fprint_obj(STDOUT, $_[0]); return;
}
sub
ats2plpre_prerr_obj($)
{
  ats2plpre_fprint_obj(STDERR, $_[0]); return;
}
#
sub
ats2plpre_fprint_obj($$) { print {$_[0]} $_[1]; return;  }
#
############################################
#
sub
ats2plpre_print_newline()
{
  STDOUT->printflush("\n"); return;
}
sub
ats2plpre_prerr_newline()
{
  STDERR->printflush("\n"); return;
}
sub
ats2plpre_fprint_newline($)
{
  $_[0]->printflush("\n"); return;
}
#
############################################

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [print_cats.pl]
######
######
#
# HX-2014-11:
# for Perl code translated from ATS
#
######

######
#beg of [PLarray_cats.pl]
######

sub
ats2plpre_PLarray_nil() { return []; }
sub
ats2plpre_PLarray_sing($) { return [$_[0]]; }
sub
ats2plpre_PLarray_pair($$) { return [$_[0], $_[1]]; }

######

sub
ats2plpre_PLarray_get_at($$)
{
  my($A, $i) = @_; return $A->[$i];
}
sub
ats2plpre_PLarray_set_at($$$)
{
  my($A, $i, $x) = @_; $A->[$i] = $x; return;
}

######

sub
ats2plpre_PLarray_length($)
{
  return scalar(@{$_[0]});
}

######

sub
ats2plpre_PLarray_pop_0($) { return pop(@{$_[0]}); }
sub
ats2plpre_PLarray_pop_1($$) { return splice(@{$_[0]}, $_[1], 1); }

######

sub
ats2plpre_PLarray_push($$) { return push(@{$_[0]}, $_[1]); }

######

sub
ats2plpre_PLarray_extend($$) { push(@{$_[0]}, $_[1]); return; }

######
#
sub
ats2plpre_PLarray_reverse($)
{
  my $A = @_;
  my $i = 0 ;
  my $j = scalar(@{$A}) - 1;
  while ($i < $j)
  {
    my $tmp = $A->[i]; $A->[i] = $A->[j]; $A->[j] = $tmp; $i++; $j--;
  }
  return;
} #ats2plpre_PLarray_reverse
#
######

sub
ats2plpre_PLarray_copy($)
{
  my @A2 = @{$_[0]}; return \@A2;
}
sub
ats2plpre_PLarray_revcopy($)
{
  my @A2 = reverse(@{$_[0]}); return \@A2;
}

######

sub
ats2plpre_PLarray_append_2($$)
{
  my @res = (@{$_[0]}, @{$_[1]}); return \@res;
}
sub
ats2plpre_PLarray_append_3($$$)
{
  my @res = (@{$_[0]}, @{$_[1]}, @{$_[2]}); return \@res;
}

######

######
1; #note that it is needed by 'use' or 'require'
######

######
#end of [PLarray_cats.pl]
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-4-11: 16h:58m
##
######
sub
_ats2plpre_list_patsfun_35__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_35($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_39__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_39($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_42__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_42($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_46__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_46($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_50__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_50($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_54__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_54($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_57__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_57($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_61__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_61($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_65__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_65($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_69__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_69($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_list_patsfun_73__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_73($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_list_patsfun_77__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_77($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_list_patsfun_81__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_81($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_list_patsfun_86__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_86($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_list_patsfun_89__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_89($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_list_patsfun_92__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_92($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_list_patsfun_94__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_list_patsfun_94($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}


sub
ats2plpre_list_make_elt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret2;
  my $tmp7;
##
  __patsflab_list_make_elt:
  $tmp7 = 0;
  $tmpret2 = _ats2plpre_list_loop_3($arg1, $arg0, $tmp7);
  return $tmpret2;
} #end-of-function


sub
_ats2plpre_list_loop_3($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret3;
  my $tmp4;
  my $tmp5;
  my $tmp6;
##
  __patsflab__ats2plpre_list_loop_3:
  $tmp4 = ats2plpre_gt_int1_int1($arg0, 0);
  if($tmp4) {
    $tmp5 = ats2plpre_sub_int1_int1($arg0, 1);
    $tmp6 = [$env0, $arg1];
    #ATStailcalseq_beg
    $apy0 = $tmp5;
    $apy1 = $tmp6;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_list_loop_3;
    #ATStailcalseq_end
  } else {
    $tmpret3 = $arg1;
  } #endif
  return $tmpret3;
} #end-of-function


sub
ats2plpre_list_make_intrange_2($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret8;
##
  __patsflab_list_make_intrange_2:
  $tmpret8 = ats2plpre_list_make_intrange_3($arg0, $arg1, 1);
  return $tmpret8;
} #end-of-function


sub
ats2plpre_list_make_intrange_3($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret9;
  my $tmp20;
  my $tmp21;
  my $tmp22;
  my $tmp23;
  my $tmp24;
  my $tmp25;
  my $tmp26;
  my $tmp27;
  my $tmp28;
  my $tmp29;
  my $tmp30;
  my $tmp31;
  my $tmp32;
  my $tmp33;
  my $tmp34;
  my $tmp35;
  my $tmp36;
  my $tmp37;
  my $tmp38;
  my $tmp39;
  my $tmp40;
##
  __patsflab_list_make_intrange_3:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab6:
    $tmp20 = ats2plpre_gt_int0_int0($arg2, 0);
    if(!ATSCKpat_bool($tmp20, 1)) { goto __atstmplab7; }
    $tmp21 = ats2plpre_lt_int0_int0($arg0, $arg1);
    if($tmp21) {
      $tmp25 = ats2plpre_sub_int0_int0($arg1, $arg0);
      $tmp24 = ats2plpre_add_int0_int0($tmp25, $arg2);
      $tmp23 = ats2plpre_sub_int0_int0($tmp24, 1);
      $tmp22 = ats2plpre_div_int0_int0($tmp23, $arg2);
      $tmp28 = ats2plpre_sub_int0_int0($tmp22, 1);
      $tmp27 = ats2plpre_mul_int0_int0($tmp28, $arg2);
      $tmp26 = ats2plpre_add_int0_int0($arg0, $tmp27);
      $tmp29 = 0;
      $tmpret9 = _ats2plpre_list_loop1_6($tmp22, $tmp26, $arg2, $tmp29);
    } else {
      $tmpret9 = 0;
    } #endif
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab7:
    $tmp30 = ats2plpre_lt_int0_int0($arg2, 0);
    if(!ATSCKpat_bool($tmp30, 1)) { goto __atstmplab8; }
    $tmp31 = ats2plpre_gt_int0_int0($arg0, $arg1);
    if($tmp31) {
      $tmp32 = ats2plpre_neg_int0($arg2);
      $tmp36 = ats2plpre_sub_int0_int0($arg0, $arg1);
      $tmp35 = ats2plpre_add_int0_int0($tmp36, $tmp32);
      $tmp34 = ats2plpre_sub_int0_int0($tmp35, 1);
      $tmp33 = ats2plpre_div_int0_int0($tmp34, $tmp32);
      $tmp39 = ats2plpre_sub_int0_int0($tmp33, 1);
      $tmp38 = ats2plpre_mul_int0_int0($tmp39, $tmp32);
      $tmp37 = ats2plpre_sub_int0_int0($arg0, $tmp38);
      $tmp40 = 0;
      $tmpret9 = _ats2plpre_list_loop2_7($tmp33, $tmp37, $tmp32, $tmp40);
    } else {
      $tmpret9 = 0;
    } #endif
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab8:
    $tmpret9 = 0;
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret9;
} #end-of-function


sub
_ats2plpre_list_loop1_6($$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $apy3;
  my $tmpret10;
  my $tmp11;
  my $tmp12;
  my $tmp13;
  my $tmp14;
##
  __patsflab__ats2plpre_list_loop1_6:
  $tmp11 = ats2plpre_gt_int0_int0($arg0, 0);
  if($tmp11) {
    $tmp12 = ats2plpre_sub_int0_int0($arg0, 1);
    $tmp13 = ats2plpre_sub_int0_int0($arg1, $arg2);
    $tmp14 = [$arg1, $arg3];
    #ATStailcalseq_beg
    $apy0 = $tmp12;
    $apy1 = $tmp13;
    $apy2 = $arg2;
    $apy3 = $tmp14;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    goto __patsflab__ats2plpre_list_loop1_6;
    #ATStailcalseq_end
  } else {
    $tmpret10 = $arg3;
  } #endif
  return $tmpret10;
} #end-of-function


sub
_ats2plpre_list_loop2_7($$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $apy3;
  my $tmpret15;
  my $tmp16;
  my $tmp17;
  my $tmp18;
  my $tmp19;
##
  __patsflab__ats2plpre_list_loop2_7:
  $tmp16 = ats2plpre_gt_int0_int0($arg0, 0);
  if($tmp16) {
    $tmp17 = ats2plpre_sub_int0_int0($arg0, 1);
    $tmp18 = ats2plpre_add_int0_int0($arg1, $arg2);
    $tmp19 = [$arg1, $arg3];
    #ATStailcalseq_beg
    $apy0 = $tmp17;
    $apy1 = $tmp18;
    $apy2 = $arg2;
    $apy3 = $tmp19;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    goto __patsflab__ats2plpre_list_loop2_7;
    #ATStailcalseq_end
  } else {
    $tmpret15 = $arg3;
  } #endif
  return $tmpret15;
} #end-of-function


sub
ats2plpre_list_length($)
{
##
  my($arg0) = @_;
##
  my $tmpret52;
##
  __patsflab_list_length:
  $tmpret52 = _ats2plpre_list_loop_14($arg0, 0);
  return $tmpret52;
} #end-of-function


sub
_ats2plpre_list_loop_14($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret53;
  my $tmp55;
  my $tmp56;
##
  __patsflab__ats2plpre_list_loop_14:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab13:
    if(ATSCKptriscons($arg0)) { goto __atstmplab16; }
    __atstmplab14:
    $tmpret53 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab15:
    __atstmplab16:
    $tmp55 = $arg0->[1];
    $tmp56 = ats2plpre_add_int1_int1($arg1, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp55;
    $apy1 = $tmp56;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_list_loop_14;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret53;
} #end-of-function


sub
ats2plpre_list_last($)
{
##
  my($arg0) = @_;
##
  my $apy0;
  my $tmpret57;
  my $tmp58;
  my $tmp59;
##
  __patsflab_list_last:
  $tmp58 = $arg0->[0];
  $tmp59 = $arg0->[1];
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab17:
    if(ATSCKptriscons($tmp59)) { goto __atstmplab20; }
    __atstmplab18:
    $tmpret57 = $tmp58;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab19:
    __atstmplab20:
    #ATStailcalseq_beg
    $apy0 = $tmp59;
    $arg0 = $apy0;
    goto __patsflab_list_last;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret57;
} #end-of-function


sub
ats2plpre_list_get_at($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret60;
  my $tmp61;
  my $tmp62;
  my $tmp63;
  my $tmp64;
##
  __patsflab_list_get_at:
  $tmp61 = ats2plpre_eq_int1_int1($arg1, 0);
  if($tmp61) {
    $tmp62 = $arg0->[0];
    $tmpret60 = $tmp62;
  } else {
    $tmp63 = $arg0->[1];
    $tmp64 = ats2plpre_sub_int1_int1($arg1, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp63;
    $apy1 = $tmp64;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab_list_get_at;
    #ATStailcalseq_end
  } #endif
  return $tmpret60;
} #end-of-function


sub
ats2plpre_list_snoc($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret65;
  my $tmp66;
  my $tmp67;
##
  __patsflab_list_snoc:
  $tmp67 = 0;
  $tmp66 = [$arg1, $tmp67];
  $tmpret65 = ats2plpre_list_append($arg0, $tmp66);
  return $tmpret65;
} #end-of-function


sub
ats2plpre_list_extend($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret68;
  my $tmp69;
  my $tmp70;
##
  __patsflab_list_extend:
  $tmp70 = 0;
  $tmp69 = [$arg1, $tmp70];
  $tmpret68 = ats2plpre_list_append($arg0, $tmp69);
  return $tmpret68;
} #end-of-function


sub
ats2plpre_list_append($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret71;
  my $tmp72;
  my $tmp73;
  my $tmp74;
##
  __patsflab_list_append:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab21:
    if(ATSCKptriscons($arg0)) { goto __atstmplab24; }
    __atstmplab22:
    $tmpret71 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab23:
    __atstmplab24:
    $tmp72 = $arg0->[0];
    $tmp73 = $arg0->[1];
    $tmp74 = ats2plpre_list_append($tmp73, $arg1);
    $tmpret71 = [$tmp72, $tmp74];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret71;
} #end-of-function


sub
ats2plpre_mul_int_list($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret75;
  my $tmp80;
##
  __patsflab_mul_int_list:
  $tmp80 = 0;
  $tmpret75 = _ats2plpre_list_loop_21($arg1, $arg0, $tmp80);
  return $tmpret75;
} #end-of-function


sub
_ats2plpre_list_loop_21($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret76;
  my $tmp77;
  my $tmp78;
  my $tmp79;
##
  __patsflab__ats2plpre_list_loop_21:
  $tmp77 = ats2plpre_gt_int1_int1($arg0, 0);
  if($tmp77) {
    $tmp78 = ats2plpre_sub_int1_int1($arg0, 1);
    $tmp79 = ats2plpre_list_append($env0, $arg1);
    #ATStailcalseq_beg
    $apy0 = $tmp78;
    $apy1 = $tmp79;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_list_loop_21;
    #ATStailcalseq_end
  } else {
    $tmpret76 = $arg1;
  } #endif
  return $tmpret76;
} #end-of-function


sub
ats2plpre_list_reverse($)
{
##
  my($arg0) = @_;
##
  my $tmpret81;
  my $tmp82;
##
  __patsflab_list_reverse:
  $tmp82 = 0;
  $tmpret81 = ats2plpre_list_reverse_append($arg0, $tmp82);
  return $tmpret81;
} #end-of-function


sub
ats2plpre_list_reverse_append($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret83;
##
  __patsflab_list_reverse_append:
  $tmpret83 = _ats2plpre_list_loop_24($arg0, $arg1);
  return $tmpret83;
} #end-of-function


sub
_ats2plpre_list_loop_24($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret84;
  my $tmp85;
  my $tmp86;
  my $tmp87;
##
  __patsflab__ats2plpre_list_loop_24:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab25:
    if(ATSCKptriscons($arg0)) { goto __atstmplab28; }
    __atstmplab26:
    $tmpret84 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab27:
    __atstmplab28:
    $tmp85 = $arg0->[0];
    $tmp86 = $arg0->[1];
    $tmp87 = [$tmp85, $arg1];
    #ATStailcalseq_beg
    $apy0 = $tmp86;
    $apy1 = $tmp87;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_list_loop_24;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret84;
} #end-of-function


sub
ats2plpre_list_concat($)
{
##
  my($arg0) = @_;
##
  my $tmpret88;
##
  __patsflab_list_concat:
  $tmpret88 = _ats2plpre_list_auxlst_26($arg0);
  return $tmpret88;
} #end-of-function


sub
_ats2plpre_list_auxlst_26($)
{
##
  my($arg0) = @_;
##
  my $tmpret89;
  my $tmp90;
  my $tmp91;
  my $tmp92;
##
  __patsflab__ats2plpre_list_auxlst_26:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab29:
    if(ATSCKptriscons($arg0)) { goto __atstmplab32; }
    __atstmplab30:
    $tmpret89 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab31:
    __atstmplab32:
    $tmp90 = $arg0->[0];
    $tmp91 = $arg0->[1];
    $tmp92 = _ats2plpre_list_auxlst_26($tmp91);
    $tmpret89 = ats2plpre_list_append($tmp90, $tmp92);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret89;
} #end-of-function


sub
ats2plpre_list_take($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret93;
  my $tmp94;
  my $tmp95;
  my $tmp96;
  my $tmp97;
  my $tmp98;
##
  __patsflab_list_take:
  $tmp94 = ats2plpre_gt_int1_int1($arg1, 0);
  if($tmp94) {
    $tmp95 = $arg0->[0];
    $tmp96 = $arg0->[1];
    $tmp98 = ats2plpre_sub_int1_int1($arg1, 1);
    $tmp97 = ats2plpre_list_take($tmp96, $tmp98);
    $tmpret93 = [$tmp95, $tmp97];
  } else {
    $tmpret93 = 0;
  } #endif
  return $tmpret93;
} #end-of-function


sub
ats2plpre_list_drop($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret99;
  my $tmp100;
  my $tmp101;
  my $tmp102;
##
  __patsflab_list_drop:
  $tmp100 = ats2plpre_gt_int1_int1($arg1, 0);
  if($tmp100) {
    $tmp101 = $arg0->[1];
    $tmp102 = ats2plpre_sub_int1_int1($arg1, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp101;
    $apy1 = $tmp102;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab_list_drop;
    #ATStailcalseq_end
  } else {
    $tmpret99 = $arg0;
  } #endif
  return $tmpret99;
} #end-of-function


sub
ats2plpre_list_split_at($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret103;
  my $tmp104;
  my $tmp105;
##
  __patsflab_list_split_at:
  $tmp104 = ats2plpre_list_take($arg0, $arg1);
  $tmp105 = ats2plpre_list_drop($arg0, $arg1);
  $tmpret103 = [$tmp104, $tmp105];
  return $tmpret103;
} #end-of-function


sub
ats2plpre_list_insert_at($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret106;
  my $tmp107;
  my $tmp108;
  my $tmp109;
  my $tmp110;
  my $tmp111;
##
  __patsflab_list_insert_at:
  $tmp107 = ats2plpre_gt_int1_int1($arg1, 0);
  if($tmp107) {
    $tmp108 = $arg0->[0];
    $tmp109 = $arg0->[1];
    $tmp111 = ats2plpre_sub_int1_int1($arg1, 1);
    $tmp110 = ats2plpre_list_insert_at($tmp109, $tmp111, $arg2);
    $tmpret106 = [$tmp108, $tmp110];
  } else {
    $tmpret106 = [$arg2, $arg0];
  } #endif
  return $tmpret106;
} #end-of-function


sub
ats2plpre_list_remove_at($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret112;
  my $tmp113;
  my $tmp114;
  my $tmp115;
  my $tmp116;
  my $tmp117;
##
  __patsflab_list_remove_at:
  $tmp113 = $arg0->[0];
  $tmp114 = $arg0->[1];
  $tmp115 = ats2plpre_gt_int1_int1($arg1, 0);
  if($tmp115) {
    $tmp117 = ats2plpre_sub_int1_int1($arg1, 1);
    $tmp116 = ats2plpre_list_remove_at($tmp114, $tmp117);
    $tmpret112 = [$tmp113, $tmp116];
  } else {
    $tmpret112 = $tmp114;
  } #endif
  return $tmpret112;
} #end-of-function


sub
ats2plpre_list_takeout_at($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret118;
  my $tmp119;
  my $tmp120;
  my $tmp121;
  my $tmp122;
  my $tmp123;
  my $tmp124;
  my $tmp125;
  my $tmp126;
##
  __patsflab_list_takeout_at:
  $tmp119 = $arg0->[0];
  $tmp120 = $arg0->[1];
  $tmp121 = ats2plpre_gt_int1_int1($arg1, 0);
  if($tmp121) {
    $tmp123 = ats2plpre_sub_int1_int1($arg1, 1);
    $tmp122 = ats2plpre_list_takeout_at($tmp120, $tmp123);
    $tmp124 = $tmp122->[0];
    $tmp125 = $tmp122->[1];
    $tmp126 = [$tmp119, $tmp125];
    $tmpret118 = [$tmp124, $tmp126];
  } else {
    $tmpret118 = [$tmp119, $tmp120];
  } #endif
  return $tmpret118;
} #end-of-function


sub
ats2plpre_list_exists($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret127;
  my $tmp128;
  my $tmp129;
  my $tmp130;
##
  __patsflab_list_exists:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab33:
    if(ATSCKptriscons($arg0)) { goto __atstmplab36; }
    __atstmplab34:
    $tmpret127 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab35:
    __atstmplab36:
    $tmp128 = $arg0->[0];
    $tmp129 = $arg0->[1];
    $tmp130 = &{$arg1->[0]}($arg1, $tmp128);
    if($tmp130) {
      $tmpret127 = 1;
    } else {
      #ATStailcalseq_beg
      $apy0 = $tmp129;
      $apy1 = $arg1;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab_list_exists;
      #ATStailcalseq_end
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret127;
} #end-of-function


sub
ats2plpre_list_exists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret131;
##
  __patsflab_list_exists_method:
  $tmpret131 = _ats2plpre_list_patsfun_35__closurerize($arg0);
  return $tmpret131;
} #end-of-function


sub
_ats2plpre_list_patsfun_35($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret132;
##
  __patsflab__ats2plpre_list_patsfun_35:
  $tmpret132 = ats2plpre_list_exists($env0, $arg0);
  return $tmpret132;
} #end-of-function


sub
ats2plpre_list_iexists($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret133;
##
  __patsflab_list_iexists:
  $tmpret133 = _ats2plpre_list_loop_37($arg1, 0, $arg0);
  return $tmpret133;
} #end-of-function


sub
_ats2plpre_list_loop_37($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret134;
  my $tmp135;
  my $tmp136;
  my $tmp137;
  my $tmp138;
##
  __patsflab__ats2plpre_list_loop_37:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab37:
    if(ATSCKptriscons($arg1)) { goto __atstmplab40; }
    __atstmplab38:
    $tmpret134 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab39:
    __atstmplab40:
    $tmp135 = $arg1->[0];
    $tmp136 = $arg1->[1];
    $tmp137 = &{$env0->[0]}($env0, $arg0, $tmp135);
    if($tmp137) {
      $tmpret134 = 1;
    } else {
      $tmp138 = ats2plpre_add_int1_int1($arg0, 1);
      #ATStailcalseq_beg
      $apy0 = $tmp138;
      $apy1 = $tmp136;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab__ats2plpre_list_loop_37;
      #ATStailcalseq_end
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret134;
} #end-of-function


sub
ats2plpre_list_iexists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret139;
##
  __patsflab_list_iexists_method:
  $tmpret139 = _ats2plpre_list_patsfun_39__closurerize($arg0);
  return $tmpret139;
} #end-of-function


sub
_ats2plpre_list_patsfun_39($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret140;
##
  __patsflab__ats2plpre_list_patsfun_39:
  $tmpret140 = ats2plpre_list_iexists($env0, $arg0);
  return $tmpret140;
} #end-of-function


sub
ats2plpre_list_forall($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret141;
  my $tmp142;
  my $tmp143;
  my $tmp144;
##
  __patsflab_list_forall:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab41:
    if(ATSCKptriscons($arg0)) { goto __atstmplab44; }
    __atstmplab42:
    $tmpret141 = 1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab43:
    __atstmplab44:
    $tmp142 = $arg0->[0];
    $tmp143 = $arg0->[1];
    $tmp144 = &{$arg1->[0]}($arg1, $tmp142);
    if($tmp144) {
      #ATStailcalseq_beg
      $apy0 = $tmp143;
      $apy1 = $arg1;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab_list_forall;
      #ATStailcalseq_end
    } else {
      $tmpret141 = 0;
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret141;
} #end-of-function


sub
ats2plpre_list_forall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret145;
##
  __patsflab_list_forall_method:
  $tmpret145 = _ats2plpre_list_patsfun_42__closurerize($arg0);
  return $tmpret145;
} #end-of-function


sub
_ats2plpre_list_patsfun_42($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret146;
##
  __patsflab__ats2plpre_list_patsfun_42:
  $tmpret146 = ats2plpre_list_forall($env0, $arg0);
  return $tmpret146;
} #end-of-function


sub
ats2plpre_list_iforall($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret147;
##
  __patsflab_list_iforall:
  $tmpret147 = _ats2plpre_list_loop_44($arg1, 0, $arg0);
  return $tmpret147;
} #end-of-function


sub
_ats2plpre_list_loop_44($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret148;
  my $tmp149;
  my $tmp150;
  my $tmp151;
  my $tmp152;
##
  __patsflab__ats2plpre_list_loop_44:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab45:
    if(ATSCKptriscons($arg1)) { goto __atstmplab48; }
    __atstmplab46:
    $tmpret148 = 1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab47:
    __atstmplab48:
    $tmp149 = $arg1->[0];
    $tmp150 = $arg1->[1];
    $tmp151 = &{$env0->[0]}($env0, $arg0, $tmp149);
    if($tmp151) {
      $tmp152 = ats2plpre_add_int1_int1($arg0, 1);
      #ATStailcalseq_beg
      $apy0 = $tmp152;
      $apy1 = $tmp150;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab__ats2plpre_list_loop_44;
      #ATStailcalseq_end
    } else {
      $tmpret148 = 0;
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret148;
} #end-of-function


sub
ats2plpre_list_iforall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret153;
##
  __patsflab_list_iforall_method:
  $tmpret153 = _ats2plpre_list_patsfun_46__closurerize($arg0);
  return $tmpret153;
} #end-of-function


sub
_ats2plpre_list_patsfun_46($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret154;
##
  __patsflab__ats2plpre_list_patsfun_46:
  $tmpret154 = ats2plpre_list_iforall($env0, $arg0);
  return $tmpret154;
} #end-of-function


sub
ats2plpre_list_app($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_list_app:
  ats2plpre_list_foreach($arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_list_foreach($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmp157;
  my $tmp158;
##
  __patsflab_list_foreach:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab49:
    if(ATSCKptriscons($arg0)) { goto __atstmplab52; }
    __atstmplab50:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab51:
    __atstmplab52:
    $tmp157 = $arg0->[0];
    $tmp158 = $arg0->[1];
    &{$arg1->[0]}($arg1, $tmp157);
    #ATStailcalseq_beg
    $apy0 = $tmp158;
    $apy1 = $arg1;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab_list_foreach;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_list_foreach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret160;
##
  __patsflab_list_foreach_method:
  $tmpret160 = _ats2plpre_list_patsfun_50__closurerize($arg0);
  return $tmpret160;
} #end-of-function


sub
_ats2plpre_list_patsfun_50($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_list_patsfun_50:
  ats2plpre_list_foreach($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_list_iforeach($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_list_iforeach:
  _ats2plpre_list_aux_52($arg1, 0, $arg0);
  return;#_void
} #end-of-function


sub
_ats2plpre_list_aux_52($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmp164;
  my $tmp165;
  my $tmp167;
##
  __patsflab__ats2plpre_list_aux_52:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab53:
    if(ATSCKptriscons($arg1)) { goto __atstmplab56; }
    __atstmplab54:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab55:
    __atstmplab56:
    $tmp164 = $arg1->[0];
    $tmp165 = $arg1->[1];
    &{$env0->[0]}($env0, $arg0, $tmp164);
    $tmp167 = ats2plpre_add_int1_int1($arg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp167;
    $apy1 = $tmp165;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_list_aux_52;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_list_iforeach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret168;
##
  __patsflab_list_iforeach_method:
  $tmpret168 = _ats2plpre_list_patsfun_54__closurerize($arg0);
  return $tmpret168;
} #end-of-function


sub
_ats2plpre_list_patsfun_54($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_list_patsfun_54:
  ats2plpre_list_iforeach($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_list_rforeach($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmp171;
  my $tmp172;
##
  __patsflab_list_rforeach:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab57:
    if(ATSCKptriscons($arg0)) { goto __atstmplab60; }
    __atstmplab58:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab59:
    __atstmplab60:
    $tmp171 = $arg0->[0];
    $tmp172 = $arg0->[1];
    ats2plpre_list_rforeach($tmp172, $arg1);
    &{$arg1->[0]}($arg1, $tmp171);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_list_rforeach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret174;
##
  __patsflab_list_rforeach_method:
  $tmpret174 = _ats2plpre_list_patsfun_57__closurerize($arg0);
  return $tmpret174;
} #end-of-function


sub
_ats2plpre_list_patsfun_57($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_list_patsfun_57:
  ats2plpre_list_rforeach($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_list_filter($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret176;
##
  __patsflab_list_filter:
  $tmpret176 = _ats2plpre_list_aux_59($arg1, $arg0);
  return $tmpret176;
} #end-of-function


sub
_ats2plpre_list_aux_59($$)
{
##
  my($env0, $arg0) = @_;
##
  my $apy0;
  my $tmpret177;
  my $tmp178;
  my $tmp179;
  my $tmp180;
  my $tmp181;
##
  __patsflab__ats2plpre_list_aux_59:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab61:
    if(ATSCKptriscons($arg0)) { goto __atstmplab64; }
    __atstmplab62:
    $tmpret177 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab63:
    __atstmplab64:
    $tmp178 = $arg0->[0];
    $tmp179 = $arg0->[1];
    $tmp180 = &{$env0->[0]}($env0, $tmp178);
    if($tmp180) {
      $tmp181 = _ats2plpre_list_aux_59($env0, $tmp179);
      $tmpret177 = [$tmp178, $tmp181];
    } else {
      #ATStailcalseq_beg
      $apy0 = $tmp179;
      $arg0 = $apy0;
      goto __patsflab__ats2plpre_list_aux_59;
      #ATStailcalseq_end
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret177;
} #end-of-function


sub
ats2plpre_list_filter_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret182;
##
  __patsflab_list_filter_method:
  $tmpret182 = _ats2plpre_list_patsfun_61__closurerize($arg0);
  return $tmpret182;
} #end-of-function


sub
_ats2plpre_list_patsfun_61($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret183;
##
  __patsflab__ats2plpre_list_patsfun_61:
  $tmpret183 = ats2plpre_list_filter($env0, $arg0);
  return $tmpret183;
} #end-of-function


sub
ats2plpre_list_map($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret184;
##
  __patsflab_list_map:
  $tmpret184 = _ats2plpre_list_aux_63($arg1, $arg0);
  return $tmpret184;
} #end-of-function


sub
_ats2plpre_list_aux_63($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret185;
  my $tmp186;
  my $tmp187;
  my $tmp188;
  my $tmp189;
##
  __patsflab__ats2plpre_list_aux_63:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab65:
    if(ATSCKptriscons($arg0)) { goto __atstmplab68; }
    __atstmplab66:
    $tmpret185 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab67:
    __atstmplab68:
    $tmp186 = $arg0->[0];
    $tmp187 = $arg0->[1];
    $tmp188 = &{$env0->[0]}($env0, $tmp186);
    $tmp189 = _ats2plpre_list_aux_63($env0, $tmp187);
    $tmpret185 = [$tmp188, $tmp189];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret185;
} #end-of-function


sub
ats2plpre_list_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret190;
##
  __patsflab_list_map_method:
  $tmpret190 = _ats2plpre_list_patsfun_65__closurerize($arg0);
  return $tmpret190;
} #end-of-function


sub
_ats2plpre_list_patsfun_65($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret191;
##
  __patsflab__ats2plpre_list_patsfun_65:
  $tmpret191 = ats2plpre_list_map($env0, $arg0);
  return $tmpret191;
} #end-of-function


sub
ats2plpre_list_foldleft($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret192;
##
  __patsflab_list_foldleft:
  $tmpret192 = _ats2plpre_list_loop_67($arg2, $arg1, $arg0);
  return $tmpret192;
} #end-of-function


sub
_ats2plpre_list_loop_67($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret193;
  my $tmp194;
  my $tmp195;
  my $tmp196;
##
  __patsflab__ats2plpre_list_loop_67:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab69:
    if(ATSCKptriscons($arg1)) { goto __atstmplab72; }
    __atstmplab70:
    $tmpret193 = $arg0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab71:
    __atstmplab72:
    $tmp194 = $arg1->[0];
    $tmp195 = $arg1->[1];
    $tmp196 = &{$env0->[0]}($env0, $arg0, $tmp194);
    #ATStailcalseq_beg
    $apy0 = $tmp196;
    $apy1 = $tmp195;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_list_loop_67;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret193;
} #end-of-function


sub
ats2plpre_list_foldleft_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret197;
##
  __patsflab_list_foldleft_method:
  $tmpret197 = _ats2plpre_list_patsfun_69__closurerize($arg0, $arg1);
  return $tmpret197;
} #end-of-function


sub
_ats2plpre_list_patsfun_69($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret198;
##
  __patsflab__ats2plpre_list_patsfun_69:
  $tmpret198 = ats2plpre_list_foldleft($env0, $env1, $arg0);
  return $tmpret198;
} #end-of-function


sub
ats2plpre_list_ifoldleft($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret199;
##
  __patsflab_list_ifoldleft:
  $tmpret199 = _ats2plpre_list_loop_71($arg2, 0, $arg1, $arg0);
  return $tmpret199;
} #end-of-function


sub
_ats2plpre_list_loop_71($$$$)
{
##
  my($env0, $arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmpret200;
  my $tmp201;
  my $tmp202;
  my $tmp203;
  my $tmp204;
##
  __patsflab__ats2plpre_list_loop_71:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab73:
    if(ATSCKptriscons($arg2)) { goto __atstmplab76; }
    __atstmplab74:
    $tmpret200 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab75:
    __atstmplab76:
    $tmp201 = $arg2->[0];
    $tmp202 = $arg2->[1];
    $tmp203 = ats2plpre_add_int1_int1($arg0, 1);
    $tmp204 = &{$env0->[0]}($env0, $arg0, $arg1, $tmp201);
    #ATStailcalseq_beg
    $apy0 = $tmp203;
    $apy1 = $tmp204;
    $apy2 = $tmp202;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    goto __patsflab__ats2plpre_list_loop_71;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret200;
} #end-of-function


sub
ats2plpre_list_ifoldleft_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret205;
##
  __patsflab_list_ifoldleft_method:
  $tmpret205 = _ats2plpre_list_patsfun_73__closurerize($arg0, $arg1);
  return $tmpret205;
} #end-of-function


sub
_ats2plpre_list_patsfun_73($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret206;
##
  __patsflab__ats2plpre_list_patsfun_73:
  $tmpret206 = ats2plpre_list_ifoldleft($env0, $env1, $arg0);
  return $tmpret206;
} #end-of-function


sub
ats2plpre_list_foldright($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret207;
##
  __patsflab_list_foldright:
  $tmpret207 = _ats2plpre_list_aux_75($arg1, $arg0, $arg2);
  return $tmpret207;
} #end-of-function


sub
_ats2plpre_list_aux_75($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $tmpret208;
  my $tmp209;
  my $tmp210;
  my $tmp211;
##
  __patsflab__ats2plpre_list_aux_75:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab77:
    if(ATSCKptriscons($arg0)) { goto __atstmplab80; }
    __atstmplab78:
    $tmpret208 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab79:
    __atstmplab80:
    $tmp209 = $arg0->[0];
    $tmp210 = $arg0->[1];
    $tmp211 = _ats2plpre_list_aux_75($env0, $tmp210, $arg1);
    $tmpret208 = &{$env0->[0]}($env0, $tmp209, $tmp211);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret208;
} #end-of-function


sub
ats2plpre_list_foldright_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret212;
##
  __patsflab_list_foldright_method:
  $tmpret212 = _ats2plpre_list_patsfun_77__closurerize($arg0, $arg1);
  return $tmpret212;
} #end-of-function


sub
_ats2plpre_list_patsfun_77($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret213;
##
  __patsflab__ats2plpre_list_patsfun_77:
  $tmpret213 = ats2plpre_list_foldright($env0, $arg0, $env1);
  return $tmpret213;
} #end-of-function


sub
ats2plpre_list_ifoldright($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret214;
##
  __patsflab_list_ifoldright:
  $tmpret214 = _ats2plpre_list_aux_79($arg1, 0, $arg0, $arg2);
  return $tmpret214;
} #end-of-function


sub
_ats2plpre_list_aux_79($$$$)
{
##
  my($env0, $arg0, $arg1, $arg2) = @_;
##
  my $tmpret215;
  my $tmp216;
  my $tmp217;
  my $tmp218;
  my $tmp219;
##
  __patsflab__ats2plpre_list_aux_79:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab81:
    if(ATSCKptriscons($arg1)) { goto __atstmplab84; }
    __atstmplab82:
    $tmpret215 = $arg2;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab83:
    __atstmplab84:
    $tmp216 = $arg1->[0];
    $tmp217 = $arg1->[1];
    $tmp219 = ats2plpre_add_int1_int1($arg0, 1);
    $tmp218 = _ats2plpre_list_aux_79($env0, $tmp219, $tmp217, $arg2);
    $tmpret215 = &{$env0->[0]}($env0, $arg0, $tmp216, $tmp218);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret215;
} #end-of-function


sub
ats2plpre_list_ifoldright_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret220;
##
  __patsflab_list_ifoldright_method:
  $tmpret220 = _ats2plpre_list_patsfun_81__closurerize($arg0, $arg1);
  return $tmpret220;
} #end-of-function


sub
_ats2plpre_list_patsfun_81($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret221;
##
  __patsflab__ats2plpre_list_patsfun_81:
  $tmpret221 = ats2plpre_list_ifoldright($env0, $arg0, $env1);
  return $tmpret221;
} #end-of-function


sub
ats2plpre_streamize_list_elt($)
{
##
  my($arg0) = @_;
##
  my $tmpret224;
##
  __patsflab_streamize_list_elt:
  $tmpret224 = _ats2plpre_list_auxmain_85($arg0);
  return $tmpret224;
} #end-of-function


sub
_ats2plpre_list_auxmain_85($)
{
##
  my($arg0) = @_;
##
  my $tmpret225;
##
  __patsflab__ats2plpre_list_auxmain_85:
  $tmpret225 = ATSPMVllazyval(_ats2plpre_list_patsfun_86__closurerize($arg0));
  return $tmpret225;
} #end-of-function


sub
_ats2plpre_list_patsfun_86($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret226;
  my $tmp227;
  my $tmp228;
  my $tmp229;
##
  __patsflab__ats2plpre_list_patsfun_86:
  if($arg0) {
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab85:
      if(ATSCKptriscons($env0)) { goto __atstmplab88; }
      __atstmplab86:
      $tmpret226 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab87:
      __atstmplab88:
      $tmp227 = $env0->[0];
      $tmp228 = $env0->[1];
      $tmp229 = _ats2plpre_list_auxmain_85($tmp228);
      $tmpret226 = [$tmp227, $tmp229];
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
  } #endif
  return $tmpret226;
} #end-of-function


sub
ats2plpre_streamize_list_zip($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret230;
##
  __patsflab_streamize_list_zip:
  $tmpret230 = _ats2plpre_list_auxmain_88($arg0, $arg1);
  return $tmpret230;
} #end-of-function


sub
_ats2plpre_list_auxmain_88($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret231;
##
  __patsflab__ats2plpre_list_auxmain_88:
  $tmpret231 = ATSPMVllazyval(_ats2plpre_list_patsfun_89__closurerize($arg0, $arg1));
  return $tmpret231;
} #end-of-function


sub
_ats2plpre_list_patsfun_89($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret232;
  my $tmp233;
  my $tmp234;
  my $tmp235;
  my $tmp236;
  my $tmp237;
  my $tmp238;
##
  __patsflab__ats2plpre_list_patsfun_89:
  if($arg0) {
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab89:
      if(ATSCKptriscons($env0)) { goto __atstmplab92; }
      __atstmplab90:
      $tmpret232 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab91:
      __atstmplab92:
      $tmp233 = $env0->[0];
      $tmp234 = $env0->[1];
      #ATScaseofseq_beg
      while(1)
      {
        #ATSbranchseq_beg
        __atstmplab93:
        if(ATSCKptriscons($env1)) { goto __atstmplab96; }
        __atstmplab94:
        $tmpret232 = 0;
        last;
        #ATSbranchseq_end
        #ATSbranchseq_beg
        __atstmplab95:
        __atstmplab96:
        $tmp235 = $env1->[0];
        $tmp236 = $env1->[1];
        $tmp237 = [$tmp233, $tmp235];
        $tmp238 = _ats2plpre_list_auxmain_88($tmp234, $tmp236);
        $tmpret232 = [$tmp237, $tmp238];
        last;
        #ATSbranchseq_end
      } #end-of-while-loop;
      #ATScaseofseq_end
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
  } #endif
  return $tmpret232;
} #end-of-function


sub
ats2plpre_streamize_list_cross($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret239;
##
  __patsflab_streamize_list_cross:
  $tmpret239 = _ats2plpre_list_auxmain_93($arg0, $arg1);
  return $tmpret239;
} #end-of-function


sub
_ats2plpre_list_auxone_91($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret240;
##
  __patsflab__ats2plpre_list_auxone_91:
  $tmpret240 = ATSPMVllazyval(_ats2plpre_list_patsfun_92__closurerize($arg0, $arg1));
  return $tmpret240;
} #end-of-function


sub
_ats2plpre_list_patsfun_92($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret241;
  my $tmp242;
  my $tmp243;
  my $tmp244;
  my $tmp245;
##
  __patsflab__ats2plpre_list_patsfun_92:
  if($arg0) {
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab97:
      if(ATSCKptriscons($env1)) { goto __atstmplab100; }
      __atstmplab98:
      $tmpret241 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab99:
      __atstmplab100:
      $tmp242 = $env1->[0];
      $tmp243 = $env1->[1];
      $tmp244 = [$env0, $tmp242];
      $tmp245 = _ats2plpre_list_auxone_91($env0, $tmp243);
      $tmpret241 = [$tmp244, $tmp245];
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
  } #endif
  return $tmpret241;
} #end-of-function


sub
_ats2plpre_list_auxmain_93($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret246;
##
  __patsflab__ats2plpre_list_auxmain_93:
  $tmpret246 = ATSPMVllazyval(_ats2plpre_list_patsfun_94__closurerize($arg0, $arg1));
  return $tmpret246;
} #end-of-function


sub
_ats2plpre_list_patsfun_94($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret247;
  my $tmp248;
  my $tmp249;
  my $tmp250;
  my $tmp251;
  my $tmp252;
##
  __patsflab__ats2plpre_list_patsfun_94:
  if($arg0) {
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab101:
      if(ATSCKptriscons($env0)) { goto __atstmplab104; }
      __atstmplab102:
      $tmpret247 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab103:
      __atstmplab104:
      $tmp248 = $env0->[0];
      $tmp249 = $env0->[1];
      $tmp251 = _ats2plpre_list_auxone_91($tmp248, $env1);
      $tmp252 = _ats2plpre_list_auxmain_93($tmp249, $env1);
      $tmp250 = ats2plpre_stream_vt_append($tmp251, $tmp252);
      $tmpret247 = ATSPMVllazyval_eval($tmp250);
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
  } #endif
  return $tmpret247;
} #end-of-function


######
#ATSextcode_beg()
######
######
1; ##note that it is needed by 'use' or 'require'
######
######
#ATSextcode_end()
######
######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-4-11: 16h:58m
##
######

sub
ats2plpre_option_some($)
{
##
  my($arg0) = @_;
##
  my $tmpret0;
##
  __patsflab_option_some:
  $tmpret0 = [$arg0];
  return $tmpret0;
} #end-of-function


sub
ats2plpre_option_none()
{
##
  #argless
##
  my $tmpret1;
##
  __patsflab_option_none:
  $tmpret1 = 0;
  return $tmpret1;
} #end-of-function


sub
ats2plpre_option_unsome($)
{
##
  my($arg0) = @_;
##
  my $tmpret2;
  my $tmp3;
##
  __patsflab_option_unsome:
  $tmp3 = $arg0->[0];
  $tmpret2 = $tmp3;
  return $tmpret2;
} #end-of-function


sub
ats2plpre_option_is_some($)
{
##
  my($arg0) = @_;
##
  my $tmpret4;
##
  __patsflab_option_is_some:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab0:
    if(ATSCKptrisnull($arg0)) { goto __atstmplab3; }
    __atstmplab1:
    $tmpret4 = 1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab2:
    __atstmplab3:
    $tmpret4 = 0;
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret4;
} #end-of-function


sub
ats2plpre_option_is_none($)
{
##
  my($arg0) = @_;
##
  my $tmpret5;
##
  __patsflab_option_is_none:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab4:
    if(ATSCKptriscons($arg0)) { goto __atstmplab7; }
    __atstmplab5:
    $tmpret5 = 1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab6:
    __atstmplab7:
    $tmpret5 = 0;
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret5;
} #end-of-function

######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-4-11: 16h:58m
##
######
sub
_ats2plpre_stream_patsfun_6__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_6($cenv->[1]); }, $env0];
}

sub
_ats2plpre_stream_patsfun_17__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_patsfun_17($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_23__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_23($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_25__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_25($cenv->[1]); }, $env0];
}

sub
_ats2plpre_stream_patsfun_27__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_27($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_29__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_patsfun_29($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_patsfun_31__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_31($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_33__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_patsfun_33($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_patsfun_36__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_patsfun_36($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_patsfun_39__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_patsfun_39($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_patsfun_42__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_patsfun_42($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_patsfun_46__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_patsfun_46($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_patsfun_49__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_49($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_52__closurerize($$$$)
{
  my($env0, $env1, $env2, $env3) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_52($cenv->[1], $cenv->[2], $cenv->[3], $cenv->[4]); }, $env0, $env1, $env2, $env3];
}

sub
_ats2plpre_stream_patsfun_53__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_53($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_56__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_56($cenv->[1]); }, $env0];
}

sub
_ats2plpre_stream_patsfun_58__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_58($cenv->[1]); }, $env0];
}

sub
_ats2plpre_stream_patsfun_60__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_60($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_65__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0, $arg1) = @_; return _ats2plpre_stream_patsfun_65($cenv->[1], $arg0, $arg1); }, $env0];
}

sub
_ats2plpre_stream_patsfun_67__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0, $arg1) = @_; return _ats2plpre_stream_patsfun_67($cenv->[1], $arg0, $arg1); }, $env0];
}

sub
_ats2plpre_stream_patsfun_70__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_70($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_72__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_72($cenv->[1], $cenv->[2]); }, $env0, $env1];
}


sub
ats2plpre_stream_make_list($)
{
##
  my($arg0) = @_;
##
  my $tmpret7;
##
  __patsflab_stream_make_list:
  $tmpret7 = ATSPMVlazyval(_ats2plpre_stream_patsfun_6__closurerize($arg0));
  return $tmpret7;
} #end-of-function


sub
_ats2plpre_stream_patsfun_6($)
{
##
  my($env0) = @_;
##
  my $tmpret8;
  my $tmp9;
  my $tmp10;
  my $tmp11;
##
  __patsflab__ats2plpre_stream_patsfun_6:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab0:
    if(ATSCKptriscons($env0)) { goto __atstmplab3; }
    __atstmplab1:
    $tmpret8 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab2:
    __atstmplab3:
    $tmp9 = $env0->[0];
    $tmp10 = $env0->[1];
    $tmp11 = ats2plpre_stream_make_list($tmp10);
    $tmpret8 = [$tmp9, $tmp11];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret8;
} #end-of-function


sub
ats2plpre_stream_make_list0($)
{
##
  my($arg0) = @_;
##
  my $tmpret12;
##
  __patsflab_stream_make_list0:
  $tmpret12 = ats2plpre_stream_make_list($arg0);
  return $tmpret12;
} #end-of-function


sub
ats2plpre_stream_nth_opt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret13;
##
  __patsflab_stream_nth_opt:
  $tmpret13 = _ats2plpre_stream_loop_9($arg0, $arg1);
  return $tmpret13;
} #end-of-function


sub
_ats2plpre_stream_loop_9($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret14;
  my $tmp15;
  my $tmp16;
  my $tmp17;
  my $tmp18;
  my $tmp19;
##
  __patsflab__ats2plpre_stream_loop_9:
  $tmp15 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab4:
    if(ATSCKptriscons($tmp15)) { goto __atstmplab7; }
    __atstmplab5:
    $tmpret14 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab6:
    __atstmplab7:
    $tmp16 = $tmp15->[0];
    $tmp17 = $tmp15->[1];
    $tmp18 = ats2plpre_gt_int1_int1($arg1, 0);
    if($tmp18) {
      $tmp19 = ats2plpre_pred_int1($arg1);
      #ATStailcalseq_beg
      $apy0 = $tmp17;
      $apy1 = $tmp19;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab__ats2plpre_stream_loop_9;
      #ATStailcalseq_end
    } else {
      $tmpret14 = [$tmp16];
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret14;
} #end-of-function


sub
ats2plpre_stream_length($)
{
##
  my($arg0) = @_;
##
  my $tmpret20;
##
  __patsflab_stream_length:
  $tmpret20 = _ats2plpre_stream_loop_11($arg0, 0);
  return $tmpret20;
} #end-of-function


sub
_ats2plpre_stream_loop_11($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret21;
  my $tmp22;
  my $tmp24;
  my $tmp25;
##
  __patsflab__ats2plpre_stream_loop_11:
  $tmp22 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab8:
    if(ATSCKptriscons($tmp22)) { goto __atstmplab11; }
    __atstmplab9:
    $tmpret21 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab10:
    __atstmplab11:
    $tmp24 = $tmp22->[1];
    $tmp25 = ats2plpre_add_int1_int1($arg1, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp24;
    $apy1 = $tmp25;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_stream_loop_11;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret21;
} #end-of-function


sub
ats2plpre_stream2list($)
{
##
  my($arg0) = @_;
##
  my $tmpret26;
##
  __patsflab_stream2list:
  $tmpret26 = _ats2plpre_stream_aux_13($arg0);
  return $tmpret26;
} #end-of-function


sub
_ats2plpre_stream_aux_13($)
{
##
  my($arg0) = @_;
##
  my $tmpret27;
  my $tmp28;
  my $tmp29;
  my $tmp30;
  my $tmp31;
##
  __patsflab__ats2plpre_stream_aux_13:
  $tmp28 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab12:
    if(ATSCKptriscons($tmp28)) { goto __atstmplab15; }
    __atstmplab13:
    $tmpret27 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab14:
    __atstmplab15:
    $tmp29 = $tmp28->[0];
    $tmp30 = $tmp28->[1];
    $tmp31 = _ats2plpre_stream_aux_13($tmp30);
    $tmpret27 = [$tmp29, $tmp31];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret27;
} #end-of-function


sub
ats2plpre_stream2list_rev($)
{
##
  my($arg0) = @_;
##
  my $tmpret32;
  my $tmp38;
##
  __patsflab_stream2list_rev:
  $tmp38 = 0;
  $tmpret32 = _ats2plpre_stream_loop_15($arg0, $tmp38);
  return $tmpret32;
} #end-of-function


sub
_ats2plpre_stream_loop_15($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret33;
  my $tmp34;
  my $tmp35;
  my $tmp36;
  my $tmp37;
##
  __patsflab__ats2plpre_stream_loop_15:
  $tmp34 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab16:
    if(ATSCKptriscons($tmp34)) { goto __atstmplab19; }
    __atstmplab17:
    $tmpret33 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab18:
    __atstmplab19:
    $tmp35 = $tmp34->[0];
    $tmp36 = $tmp34->[1];
    $tmp37 = [$tmp35, $arg1];
    #ATStailcalseq_beg
    $apy0 = $tmp36;
    $apy1 = $tmp37;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_stream_loop_15;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret33;
} #end-of-function


sub
ats2plpre_stream_takeLte($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret39;
##
  __patsflab_stream_takeLte:
  $tmpret39 = ATSPMVllazyval(_ats2plpre_stream_patsfun_17__closurerize($arg0, $arg1));
  return $tmpret39;
} #end-of-function


sub
_ats2plpre_stream_patsfun_17($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret40;
  my $tmp41;
  my $tmp42;
  my $tmp43;
  my $tmp44;
  my $tmp45;
  my $tmp46;
##
  __patsflab__ats2plpre_stream_patsfun_17:
  if($arg0) {
    $tmp41 = ats2plpre_gt_int1_int1($env1, 0);
    if($tmp41) {
      $tmp42 = ATSPMVlazyval_eval($env0); 
      #ATScaseofseq_beg
      while(1)
      {
        #ATSbranchseq_beg
        __atstmplab20:
        if(ATSCKptriscons($tmp42)) { goto __atstmplab23; }
        __atstmplab21:
        $tmpret40 = 0;
        last;
        #ATSbranchseq_end
        #ATSbranchseq_beg
        __atstmplab22:
        __atstmplab23:
        $tmp43 = $tmp42->[0];
        $tmp44 = $tmp42->[1];
        $tmp46 = ats2plpre_sub_int1_int1($env1, 1);
        $tmp45 = ats2plpre_stream_takeLte($tmp44, $tmp46);
        $tmpret40 = [$tmp43, $tmp45];
        last;
        #ATSbranchseq_end
      } #end-of-while-loop;
      #ATScaseofseq_end
    } else {
      $tmpret40 = 0;
    } #endif
  } else {
  } #endif
  return $tmpret40;
} #end-of-function


sub
ats2plpre_stream_take_opt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret47;
  my $tmp56;
##
  __patsflab_stream_take_opt:
  $tmp56 = 0;
  $tmpret47 = _ats2plpre_stream_auxmain_19($arg1, $arg0, 0, $tmp56);
  return $tmpret47;
} #end-of-function


sub
_ats2plpre_stream_auxmain_19($$$$)
{
##
  my($env0, $arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmpret48;
  my $tmp49;
  my $tmp50;
  my $tmp51;
  my $tmp52;
  my $tmp53;
  my $tmp54;
  my $tmp55;
##
  __patsflab__ats2plpre_stream_auxmain_19:
  $tmp49 = ats2plpre_lt_int1_int1($arg1, $env0);
  if($tmp49) {
    $tmp50 = ATSPMVlazyval_eval($arg0); 
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab24:
      if(ATSCKptriscons($tmp50)) { goto __atstmplab27; }
      __atstmplab25:
      $tmpret48 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab26:
      __atstmplab27:
      $tmp51 = $tmp50->[0];
      $tmp52 = $tmp50->[1];
      $tmp53 = ats2plpre_add_int1_int1($arg1, 1);
      $tmp54 = [$tmp51, $arg2];
      #ATStailcalseq_beg
      $apy0 = $tmp52;
      $apy1 = $tmp53;
      $apy2 = $tmp54;
      $arg0 = $apy0;
      $arg1 = $apy1;
      $arg2 = $apy2;
      goto __patsflab__ats2plpre_stream_auxmain_19;
      #ATStailcalseq_end
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
    $tmp55 = ats2plpre_list_reverse($arg2);
    $tmpret48 = [$tmp55];
  } #endif
  return $tmpret48;
} #end-of-function


sub
ats2plpre_stream_drop_opt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret57;
##
  __patsflab_stream_drop_opt:
  $tmpret57 = _ats2plpre_stream_auxmain_21($arg1, $arg0, 0);
  return $tmpret57;
} #end-of-function


sub
_ats2plpre_stream_auxmain_21($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret58;
  my $tmp59;
  my $tmp60;
  my $tmp62;
  my $tmp63;
##
  __patsflab__ats2plpre_stream_auxmain_21:
  $tmp59 = ats2plpre_lt_int1_int1($arg1, $env0);
  if($tmp59) {
    $tmp60 = ATSPMVlazyval_eval($arg0); 
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab28:
      if(ATSCKptriscons($tmp60)) { goto __atstmplab31; }
      __atstmplab29:
      $tmpret58 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab30:
      __atstmplab31:
      $tmp62 = $tmp60->[1];
      $tmp63 = ats2plpre_add_int1_int1($arg1, 1);
      #ATStailcalseq_beg
      $apy0 = $tmp62;
      $apy1 = $tmp63;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab__ats2plpre_stream_auxmain_21;
      #ATStailcalseq_end
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
    $tmpret58 = [$arg0];
  } #endif
  return $tmpret58;
} #end-of-function


sub
ats2plpre_stream_append($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret64;
##
  __patsflab_stream_append:
  $tmpret64 = ATSPMVlazyval(_ats2plpre_stream_patsfun_23__closurerize($arg0, $arg1));
  return $tmpret64;
} #end-of-function


sub
_ats2plpre_stream_patsfun_23($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret65;
  my $tmp66;
  my $tmp67;
  my $tmp68;
  my $tmp69;
##
  __patsflab__ats2plpre_stream_patsfun_23:
  $tmp66 = ATSPMVlazyval_eval($env0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab32:
    if(ATSCKptriscons($tmp66)) { goto __atstmplab35; }
    __atstmplab33:
    $tmpret65 = ATSPMVlazyval_eval($env1); 
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab34:
    __atstmplab35:
    $tmp67 = $tmp66->[0];
    $tmp68 = $tmp66->[1];
    $tmp69 = ats2plpre_stream_append($tmp68, $env1);
    $tmpret65 = [$tmp67, $tmp69];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret65;
} #end-of-function


sub
ats2plpre_stream_concat($)
{
##
  my($arg0) = @_;
##
  my $tmpret70;
##
  __patsflab_stream_concat:
  $tmpret70 = ATSPMVlazyval(_ats2plpre_stream_patsfun_25__closurerize($arg0));
  return $tmpret70;
} #end-of-function


sub
_ats2plpre_stream_patsfun_25($)
{
##
  my($env0) = @_;
##
  my $tmpret71;
  my $tmp72;
  my $tmp73;
  my $tmp74;
  my $tmp75;
  my $tmp76;
##
  __patsflab__ats2plpre_stream_patsfun_25:
  $tmp72 = ATSPMVlazyval_eval($env0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab36:
    if(ATSCKptriscons($tmp72)) { goto __atstmplab39; }
    __atstmplab37:
    $tmpret71 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab38:
    __atstmplab39:
    $tmp73 = $tmp72->[0];
    $tmp74 = $tmp72->[1];
    $tmp76 = ats2plpre_stream_concat($tmp74);
    $tmp75 = ats2plpre_stream_append($tmp73, $tmp76);
    $tmpret71 = ATSPMVlazyval_eval($tmp75); 
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret71;
} #end-of-function


sub
ats2plpre_stream_map_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret77;
##
  __patsflab_stream_map_cloref:
  $tmpret77 = ATSPMVlazyval(_ats2plpre_stream_patsfun_27__closurerize($arg0, $arg1));
  return $tmpret77;
} #end-of-function


sub
_ats2plpre_stream_patsfun_27($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret78;
  my $tmp79;
  my $tmp80;
  my $tmp81;
  my $tmp82;
  my $tmp83;
##
  __patsflab__ats2plpre_stream_patsfun_27:
  $tmp79 = ATSPMVlazyval_eval($env0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab40:
    if(ATSCKptriscons($tmp79)) { goto __atstmplab43; }
    __atstmplab41:
    $tmpret78 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab42:
    __atstmplab43:
    $tmp80 = $tmp79->[0];
    $tmp81 = $tmp79->[1];
    $tmp82 = &{$env1->[0]}($env1, $tmp80);
    $tmp83 = ats2plpre_stream_map_cloref($tmp81, $env1);
    $tmpret78 = [$tmp82, $tmp83];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret78;
} #end-of-function


sub
ats2plpre_stream_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret84;
##
  __patsflab_stream_map_method:
  $tmpret84 = _ats2plpre_stream_patsfun_29__closurerize($arg0);
  return $tmpret84;
} #end-of-function


sub
_ats2plpre_stream_patsfun_29($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret85;
##
  __patsflab__ats2plpre_stream_patsfun_29:
  $tmpret85 = ats2plpre_stream_map_cloref($env0, $arg0);
  return $tmpret85;
} #end-of-function


sub
ats2plpre_stream_filter_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret86;
##
  __patsflab_stream_filter_cloref:
  $tmpret86 = ATSPMVlazyval(_ats2plpre_stream_patsfun_31__closurerize($arg0, $arg1));
  return $tmpret86;
} #end-of-function


sub
_ats2plpre_stream_patsfun_31($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret87;
  my $tmp88;
  my $tmp89;
  my $tmp90;
  my $tmp91;
  my $tmp92;
  my $tmp93;
##
  __patsflab__ats2plpre_stream_patsfun_31:
  $tmp88 = ATSPMVlazyval_eval($env0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab44:
    if(ATSCKptriscons($tmp88)) { goto __atstmplab47; }
    __atstmplab45:
    $tmpret87 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab46:
    __atstmplab47:
    $tmp89 = $tmp88->[0];
    $tmp90 = $tmp88->[1];
    $tmp91 = &{$env1->[0]}($env1, $tmp89);
    if($tmp91) {
      $tmp92 = ats2plpre_stream_filter_cloref($tmp90, $env1);
      $tmpret87 = [$tmp89, $tmp92];
    } else {
      $tmp93 = ats2plpre_stream_filter_cloref($tmp90, $env1);
      $tmpret87 = ATSPMVlazyval_eval($tmp93); 
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret87;
} #end-of-function


sub
ats2plpre_stream_filter_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret94;
##
  __patsflab_stream_filter_method:
  $tmpret94 = _ats2plpre_stream_patsfun_33__closurerize($arg0);
  return $tmpret94;
} #end-of-function


sub
_ats2plpre_stream_patsfun_33($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret95;
##
  __patsflab__ats2plpre_stream_patsfun_33:
  $tmpret95 = ats2plpre_stream_filter_cloref($env0, $arg0);
  return $tmpret95;
} #end-of-function


sub
ats2plpre_stream_forall_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret96;
  my $tmp97;
  my $tmp98;
  my $tmp99;
  my $tmp100;
##
  __patsflab_stream_forall_cloref:
  $tmp97 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab48:
    if(ATSCKptriscons($tmp97)) { goto __atstmplab51; }
    __atstmplab49:
    $tmpret96 = 1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab50:
    __atstmplab51:
    $tmp98 = $tmp97->[0];
    $tmp99 = $tmp97->[1];
    $tmp100 = &{$arg1->[0]}($arg1, $tmp98);
    if($tmp100) {
      #ATStailcalseq_beg
      $apy0 = $tmp99;
      $apy1 = $arg1;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab_stream_forall_cloref;
      #ATStailcalseq_end
    } else {
      $tmpret96 = 0;
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret96;
} #end-of-function


sub
ats2plpre_stream_forall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret101;
##
  __patsflab_stream_forall_method:
  $tmpret101 = _ats2plpre_stream_patsfun_36__closurerize($arg0);
  return $tmpret101;
} #end-of-function


sub
_ats2plpre_stream_patsfun_36($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret102;
##
  __patsflab__ats2plpre_stream_patsfun_36:
  $tmpret102 = ats2plpre_stream_forall_cloref($env0, $arg0);
  return $tmpret102;
} #end-of-function


sub
ats2plpre_stream_exists_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret103;
  my $tmp104;
  my $tmp105;
  my $tmp106;
  my $tmp107;
##
  __patsflab_stream_exists_cloref:
  $tmp104 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab52:
    if(ATSCKptriscons($tmp104)) { goto __atstmplab55; }
    __atstmplab53:
    $tmpret103 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab54:
    __atstmplab55:
    $tmp105 = $tmp104->[0];
    $tmp106 = $tmp104->[1];
    $tmp107 = &{$arg1->[0]}($arg1, $tmp105);
    if($tmp107) {
      $tmpret103 = 1;
    } else {
      #ATStailcalseq_beg
      $apy0 = $tmp106;
      $apy1 = $arg1;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab_stream_exists_cloref;
      #ATStailcalseq_end
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret103;
} #end-of-function


sub
ats2plpre_stream_exists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret108;
##
  __patsflab_stream_exists_method:
  $tmpret108 = _ats2plpre_stream_patsfun_39__closurerize($arg0);
  return $tmpret108;
} #end-of-function


sub
_ats2plpre_stream_patsfun_39($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret109;
##
  __patsflab__ats2plpre_stream_patsfun_39:
  $tmpret109 = ats2plpre_stream_exists_cloref($env0, $arg0);
  return $tmpret109;
} #end-of-function


sub
ats2plpre_stream_foreach_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmp111;
  my $tmp112;
  my $tmp113;
##
  __patsflab_stream_foreach_cloref:
  $tmp111 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab56:
    if(ATSCKptriscons($tmp111)) { goto __atstmplab59; }
    __atstmplab57:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab58:
    __atstmplab59:
    $tmp112 = $tmp111->[0];
    $tmp113 = $tmp111->[1];
    &{$arg1->[0]}($arg1, $tmp112);
    #ATStailcalseq_beg
    $apy0 = $tmp113;
    $apy1 = $arg1;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab_stream_foreach_cloref;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_stream_foreach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret115;
##
  __patsflab_stream_foreach_method:
  $tmpret115 = _ats2plpre_stream_patsfun_42__closurerize($arg0);
  return $tmpret115;
} #end-of-function


sub
_ats2plpre_stream_patsfun_42($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_stream_patsfun_42:
  ats2plpre_stream_foreach_cloref($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_stream_iforeach_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_stream_iforeach_cloref:
  _ats2plpre_stream_loop_44($arg1, 0, $arg0);
  return;#_void
} #end-of-function


sub
_ats2plpre_stream_loop_44($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmp119;
  my $tmp120;
  my $tmp121;
  my $tmp123;
##
  __patsflab__ats2plpre_stream_loop_44:
  $tmp119 = ATSPMVlazyval_eval($arg1); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab60:
    if(ATSCKptriscons($tmp119)) { goto __atstmplab63; }
    __atstmplab61:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab62:
    __atstmplab63:
    $tmp120 = $tmp119->[0];
    $tmp121 = $tmp119->[1];
    &{$env0->[0]}($env0, $arg0, $tmp120);
    $tmp123 = ats2plpre_add_int1_int1($arg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp123;
    $apy1 = $tmp121;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_stream_loop_44;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_stream_iforeach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret124;
##
  __patsflab_stream_iforeach_method:
  $tmpret124 = _ats2plpre_stream_patsfun_46__closurerize($arg0);
  return $tmpret124;
} #end-of-function


sub
_ats2plpre_stream_patsfun_46($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_stream_patsfun_46:
  ats2plpre_stream_iforeach_cloref($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_stream_tabulate_cloref($)
{
##
  my($arg0) = @_;
##
  my $tmpret126;
##
  __patsflab_stream_tabulate_cloref:
  $tmpret126 = _ats2plpre_stream_auxmain_48($arg0, 0);
  return $tmpret126;
} #end-of-function


sub
_ats2plpre_stream_auxmain_48($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret127;
##
  __patsflab__ats2plpre_stream_auxmain_48:
  $tmpret127 = ATSPMVlazyval(_ats2plpre_stream_patsfun_49__closurerize($env0, $arg0));
  return $tmpret127;
} #end-of-function


sub
_ats2plpre_stream_patsfun_49($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret128;
  my $tmp129;
  my $tmp130;
  my $tmp131;
##
  __patsflab__ats2plpre_stream_patsfun_49:
  $tmp129 = &{$env0->[0]}($env0, $env1);
  $tmp131 = ats2plpre_add_int1_int1($env1, 1);
  $tmp130 = _ats2plpre_stream_auxmain_48($env0, $tmp131);
  $tmpret128 = [$tmp129, $tmp130];
  return $tmpret128;
} #end-of-function


sub
ats2plpre_cross_stream_list($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret132;
##
  __patsflab_cross_stream_list:
  $tmpret132 = ATSPMVlazyval(_ats2plpre_stream_patsfun_53__closurerize($arg0, $arg1));
  return $tmpret132;
} #end-of-function


sub
_ats2plpre_stream_auxmain_51($$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3) = @_;
##
  my $tmpret133;
##
  __patsflab__ats2plpre_stream_auxmain_51:
  $tmpret133 = ATSPMVlazyval(_ats2plpre_stream_patsfun_52__closurerize($arg0, $arg1, $arg2, $arg3));
  return $tmpret133;
} #end-of-function


sub
_ats2plpre_stream_patsfun_52($$$$)
{
##
  my($env0, $env1, $env2, $env3) = @_;
##
  my $tmpret134;
  my $tmp135;
  my $tmp136;
  my $tmp137;
  my $tmp138;
  my $tmp139;
##
  __patsflab__ats2plpre_stream_patsfun_52:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab64:
    if(ATSCKptriscons($env3)) { goto __atstmplab67; }
    __atstmplab65:
    $tmp137 = ats2plpre_cross_stream_list($env1, $env2);
    $tmpret134 = ATSPMVlazyval_eval($tmp137); 
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab66:
    __atstmplab67:
    $tmp135 = $env3->[0];
    $tmp136 = $env3->[1];
    $tmp138 = [$env0, $tmp135];
    $tmp139 = _ats2plpre_stream_auxmain_51($env0, $env1, $env2, $tmp136);
    $tmpret134 = [$tmp138, $tmp139];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret134;
} #end-of-function


sub
_ats2plpre_stream_patsfun_53($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret140;
  my $tmp141;
  my $tmp142;
  my $tmp143;
  my $tmp144;
##
  __patsflab__ats2plpre_stream_patsfun_53:
  $tmp141 = ATSPMVlazyval_eval($env0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab68:
    if(ATSCKptriscons($tmp141)) { goto __atstmplab71; }
    __atstmplab69:
    $tmpret140 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab70:
    if(ATSCKptrisnull($tmp141)) { ATSINScaseof_fail("/home/hwxi/Research/ATS-Postiats/contrib/libatscc/ATS2-0.3.2/DATS/stream.dats: 6907(line=451, offs=1) -- 6999(line=453, offs=50)"); }
    __atstmplab71:
    $tmp142 = $tmp141->[0];
    $tmp143 = $tmp141->[1];
    $tmp144 = _ats2plpre_stream_auxmain_51($tmp142, $tmp143, $env1, $env1);
    $tmpret140 = ATSPMVlazyval_eval($tmp144); 
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret140;
} #end-of-function


sub
ats2plpre_cross_stream_list0($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret145;
##
  __patsflab_cross_stream_list0:
  $tmpret145 = ats2plpre_cross_stream_list($arg0, $arg1);
  return $tmpret145;
} #end-of-function


sub
ats2plpre_stream2cloref_exn($)
{
##
  my($arg0) = @_;
##
  my $tmpret146;
  my $tmp147;
##
  __patsflab_stream2cloref_exn:
  $tmp147 = ats2plpre_ref($arg0);
  $tmpret146 = _ats2plpre_stream_patsfun_56__closurerize($tmp147);
  return $tmpret146;
} #end-of-function


sub
_ats2plpre_stream_patsfun_56($)
{
##
  my($env0) = @_;
##
  my $tmpret148;
  my $tmp149;
  my $tmp150;
  my $tmp151;
  my $tmp152;
##
  __patsflab__ats2plpre_stream_patsfun_56:
  $tmp149 = ats2plpre_ref_get_elt($env0);
  $tmp150 = ATSPMVlazyval_eval($tmp149); 
  if(ATSCKptrisnull($tmp150)) { ATSINScaseof_fail("/home/hwxi/Research/ATS-Postiats/contrib/libatscc/ATS2-0.3.2/DATS/stream.dats: 7300(line=479, offs=5) -- 7324(line=479, offs=29)"); }
  $tmp151 = $tmp150->[0];
  $tmp152 = $tmp150->[1];
  ats2plpre_ref_set_elt($env0, $tmp152);
  $tmpret148 = $tmp151;
  return $tmpret148;
} #end-of-function


sub
ats2plpre_stream2cloref_opt($)
{
##
  my($arg0) = @_;
##
  my $tmpret154;
  my $tmp155;
##
  __patsflab_stream2cloref_opt:
  $tmp155 = ats2plpre_ref($arg0);
  $tmpret154 = _ats2plpre_stream_patsfun_58__closurerize($tmp155);
  return $tmpret154;
} #end-of-function


sub
_ats2plpre_stream_patsfun_58($)
{
##
  my($env0) = @_;
##
  my $tmpret156;
  my $tmp157;
  my $tmp158;
  my $tmp159;
  my $tmp160;
##
  __patsflab__ats2plpre_stream_patsfun_58:
  $tmp157 = ats2plpre_ref_get_elt($env0);
  $tmp158 = ATSPMVlazyval_eval($tmp157); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab72:
    if(ATSCKptriscons($tmp158)) { goto __atstmplab75; }
    __atstmplab73:
    $tmpret156 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab74:
    __atstmplab75:
    $tmp159 = $tmp158->[0];
    $tmp160 = $tmp158->[1];
    ats2plpre_ref_set_elt($env0, $tmp160);
    $tmpret156 = [$tmp159];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret156;
} #end-of-function


sub
ats2plpre_stream2cloref_last($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret162;
  my $tmp163;
  my $tmp164;
##
  __patsflab_stream2cloref_last:
  $tmp163 = ats2plpre_ref($arg0);
  $tmp164 = ats2plpre_ref($arg1);
  $tmpret162 = _ats2plpre_stream_patsfun_60__closurerize($tmp163, $tmp164);
  return $tmpret162;
} #end-of-function


sub
_ats2plpre_stream_patsfun_60($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret165;
  my $tmp166;
  my $tmp167;
  my $tmp168;
  my $tmp169;
##
  __patsflab__ats2plpre_stream_patsfun_60:
  $tmp166 = ats2plpre_ref_get_elt($env0);
  $tmp167 = ATSPMVlazyval_eval($tmp166); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab76:
    if(ATSCKptriscons($tmp167)) { goto __atstmplab79; }
    __atstmplab77:
    $tmpret165 = ats2plpre_ref_get_elt($env1);
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab78:
    __atstmplab79:
    $tmp168 = $tmp167->[0];
    $tmp169 = $tmp167->[1];
    ats2plpre_ref_set_elt($env0, $tmp169);
    ats2plpre_ref_set_elt($env1, $tmp168);
    $tmpret165 = $tmp168;
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret165;
} #end-of-function


sub
ats2plpre_stream_take_while_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret172;
  my $tmp173;
  my $tmp174;
  my $tmp175;
  my $tmp176;
##
  __patsflab_stream_take_while_cloref:
  $tmp173 = ats2plpre_stream_rtake_while_cloref($arg0, $arg1);
  $tmp174 = $tmp173->[0];
  $tmp175 = $tmp173->[1];
  $tmp176 = ats2plpre_list_reverse($tmp175);
  $tmpret172 = [$tmp174, $tmp176];
  return $tmpret172;
} #end-of-function


sub
ats2plpre_stream_rtake_while_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret177;
  my $tmp185;
##
  __patsflab_stream_rtake_while_cloref:
  $tmp185 = 0;
  $tmpret177 = _ats2plpre_stream_loop_63($arg1, $arg0, 0, $tmp185);
  return $tmpret177;
} #end-of-function


sub
_ats2plpre_stream_loop_63($$$$)
{
##
  my($env0, $arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmpret178;
  my $tmp179;
  my $tmp180;
  my $tmp181;
  my $tmp182;
  my $tmp183;
  my $tmp184;
##
  __patsflab__ats2plpre_stream_loop_63:
  $tmp179 = ATSPMVlazyval_eval($arg0); 
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab80:
    if(ATSCKptriscons($tmp179)) { goto __atstmplab83; }
    __atstmplab81:
    $tmpret178 = [$arg0, $arg2];
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab82:
    __atstmplab83:
    $tmp180 = $tmp179->[0];
    $tmp181 = $tmp179->[1];
    $tmp182 = &{$env0->[0]}($env0, $arg1, $tmp180);
    if($tmp182) {
      $tmp183 = ats2plpre_add_int1_int1($arg1, 1);
      $tmp184 = [$tmp180, $arg2];
      #ATStailcalseq_beg
      $apy0 = $tmp181;
      $apy1 = $tmp183;
      $apy2 = $tmp184;
      $arg0 = $apy0;
      $arg1 = $apy1;
      $arg2 = $apy2;
      goto __patsflab__ats2plpre_stream_loop_63;
      #ATStailcalseq_end
    } else {
      $tmpret178 = [$arg0, $arg2];
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret178;
} #end-of-function


sub
ats2plpre_stream_take_until_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret186;
##
  __patsflab_stream_take_until_cloref:
  $tmpret186 = ats2plpre_stream_take_while_cloref($arg0, _ats2plpre_stream_patsfun_65__closurerize($arg1));
  return $tmpret186;
} #end-of-function


sub
_ats2plpre_stream_patsfun_65($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $tmpret187;
  my $tmp188;
##
  __patsflab__ats2plpre_stream_patsfun_65:
  $tmp188 = &{$env0->[0]}($env0, $arg0, $arg1);
  $tmpret187 = atspre_neg_bool0($tmp188);
  return $tmpret187;
} #end-of-function


sub
ats2plpre_stream_rtake_until_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret189;
##
  __patsflab_stream_rtake_until_cloref:
  $tmpret189 = ats2plpre_stream_rtake_while_cloref($arg0, _ats2plpre_stream_patsfun_67__closurerize($arg1));
  return $tmpret189;
} #end-of-function


sub
_ats2plpre_stream_patsfun_67($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $tmpret190;
  my $tmp191;
##
  __patsflab__ats2plpre_stream_patsfun_67:
  $tmp191 = &{$env0->[0]}($env0, $arg0, $arg1);
  $tmpret190 = atspre_neg_bool0($tmp191);
  return $tmpret190;
} #end-of-function


sub
ats2plpre_stream_list_xprod2($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret192;
##
  __patsflab_stream_list_xprod2:
  $tmpret192 = _ats2plpre_stream_auxlst_71($arg0, $arg1);
  return $tmpret192;
} #end-of-function


sub
_ats2plpre_stream_aux_69($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret193;
##
  __patsflab__ats2plpre_stream_aux_69:
  $tmpret193 = ATSPMVlazyval(_ats2plpre_stream_patsfun_70__closurerize($arg0, $arg1));
  return $tmpret193;
} #end-of-function


sub
_ats2plpre_stream_patsfun_70($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret194;
  my $tmp195;
  my $tmp196;
  my $tmp197;
  my $tmp198;
##
  __patsflab__ats2plpre_stream_patsfun_70:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab84:
    if(ATSCKptriscons($env1)) { goto __atstmplab87; }
    __atstmplab85:
    $tmpret194 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab86:
    __atstmplab87:
    $tmp195 = $env1->[0];
    $tmp196 = $env1->[1];
    $tmp197 = [$env0, $tmp195];
    $tmp198 = _ats2plpre_stream_aux_69($env0, $tmp196);
    $tmpret194 = [$tmp197, $tmp198];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret194;
} #end-of-function


sub
_ats2plpre_stream_auxlst_71($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret199;
##
  __patsflab__ats2plpre_stream_auxlst_71:
  $tmpret199 = ATSPMVlazyval(_ats2plpre_stream_patsfun_72__closurerize($arg0, $arg1));
  return $tmpret199;
} #end-of-function


sub
_ats2plpre_stream_patsfun_72($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret200;
  my $tmp201;
  my $tmp202;
  my $tmp203;
  my $tmp204;
  my $tmp205;
##
  __patsflab__ats2plpre_stream_patsfun_72:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab88:
    if(ATSCKptriscons($env0)) { goto __atstmplab91; }
    __atstmplab89:
    $tmpret200 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab90:
    __atstmplab91:
    $tmp201 = $env0->[0];
    $tmp202 = $env0->[1];
    $tmp204 = _ats2plpre_stream_aux_69($tmp201, $env1);
    $tmp205 = _ats2plpre_stream_auxlst_71($tmp202, $env1);
    $tmp203 = ats2plpre_stream_append($tmp204, $tmp205);
    $tmpret200 = ATSPMVlazyval_eval($tmp203); 
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret200;
} #end-of-function


######
#ATSextcode_beg()
######
######
1; ##note that it is needed by 'use' or 'require'
######
######
#ATSextcode_end()
######
######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-4-11: 16h:58m
##
######
sub
_ats2plpre_stream_vt_patsfun_7__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_vt_patsfun_7($cenv->[1]); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_10__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_10($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_stream_vt_patsfun_19__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_19($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_stream_vt_patsfun_22__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_22($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_25__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_25($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_stream_vt_patsfun_27__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_27($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_30__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_30($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_stream_vt_patsfun_32__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_32($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_36__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_36($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_40__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_40($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_44__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_44($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_48__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_48($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_52__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_52($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_stream_vt_patsfun_55__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_stream_vt_patsfun_55($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}


sub
ats2plpre_stream_vt_free($)
{
##
  my($arg0) = @_;
##
##
  __patsflab_stream_vt_free:
  atspre_lazy_vt_free($arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_stream_vt2t($)
{
##
  my($arg0) = @_;
##
  my $tmpret6;
##
  __patsflab_stream_vt2t:
  $tmpret6 = _ats2plpre_stream_vt_aux_6($arg0);
  return $tmpret6;
} #end-of-function


sub
_ats2plpre_stream_vt_aux_6($)
{
##
  my($arg0) = @_;
##
  my $tmpret7;
##
  __patsflab__ats2plpre_stream_vt_aux_6:
  $tmpret7 = ATSPMVlazyval(_ats2plpre_stream_vt_patsfun_7__closurerize($arg0));
  return $tmpret7;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_7($)
{
##
  my($env0) = @_;
##
  my $tmpret8;
  my $tmp9;
  my $tmp10;
  my $tmp11;
  my $tmp12;
##
  __patsflab__ats2plpre_stream_vt_patsfun_7:
  $tmp9 = ATSPMVllazyval_eval($env0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab0:
    if(ATSCKptriscons($tmp9)) { goto __atstmplab3; }
    __atstmplab1:
    $tmpret8 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab2:
    __atstmplab3:
    $tmp10 = $tmp9->[0];
    $tmp11 = $tmp9->[1];
    #ATSINSfreecon($tmp9);
    $tmp12 = _ats2plpre_stream_vt_aux_6($tmp11);
    $tmpret8 = [$tmp10, $tmp12];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret8;
} #end-of-function


sub
ats2plpre_stream_vt_takeLte($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret13;
##
  __patsflab_stream_vt_takeLte:
  $tmpret13 = _ats2plpre_stream_vt_auxmain_9($arg0, $arg1);
  return $tmpret13;
} #end-of-function


sub
_ats2plpre_stream_vt_auxmain_9($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret14;
##
  __patsflab__ats2plpre_stream_vt_auxmain_9:
  $tmpret14 = ATSPMVllazyval(_ats2plpre_stream_vt_patsfun_10__closurerize($arg0, $arg1));
  return $tmpret14;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_10($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret15;
  my $tmp16;
  my $tmp17;
  my $tmp18;
  my $tmp19;
  my $tmp20;
  my $tmp21;
##
  __patsflab__ats2plpre_stream_vt_patsfun_10:
  if($arg0) {
    $tmp16 = ats2plpre_gt_int1_int1($env1, 0);
    if($tmp16) {
      $tmp17 = ATSPMVllazyval_eval($env0);
      #ATScaseofseq_beg
      while(1)
      {
        #ATSbranchseq_beg
        __atstmplab4:
        if(ATSCKptriscons($tmp17)) { goto __atstmplab7; }
        __atstmplab5:
        $tmpret15 = 0;
        last;
        #ATSbranchseq_end
        #ATSbranchseq_beg
        __atstmplab6:
        __atstmplab7:
        $tmp18 = $tmp17->[0];
        $tmp19 = $tmp17->[1];
        #ATSINSfreecon($tmp17);
        $tmp21 = ats2plpre_sub_int1_int1($env1, 1);
        $tmp20 = _ats2plpre_stream_vt_auxmain_9($tmp19, $tmp21);
        $tmpret15 = [$tmp18, $tmp20];
        last;
        #ATSbranchseq_end
      } #end-of-while-loop;
      #ATScaseofseq_end
    } else {
      atspre_lazy_vt_free($env0);
      $tmpret15 = 0;
    } #endif
  } else {
    atspre_lazy_vt_free($env0);
  } #endif
  return $tmpret15;
} #end-of-function


sub
ats2plpre_stream_vt_length($)
{
##
  my($arg0) = @_;
##
  my $tmpret24;
##
  __patsflab_stream_vt_length:
  $tmpret24 = _ats2plpre_stream_vt_loop_12($arg0, 0);
  return $tmpret24;
} #end-of-function


sub
_ats2plpre_stream_vt_loop_12($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret25;
  my $tmp26;
  my $tmp28;
  my $tmp29;
##
  __patsflab__ats2plpre_stream_vt_loop_12:
  $tmp26 = ATSPMVllazyval_eval($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab8:
    if(ATSCKptriscons($tmp26)) { goto __atstmplab11; }
    __atstmplab9:
    $tmpret25 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab10:
    __atstmplab11:
    $tmp28 = $tmp26->[1];
    #ATSINSfreecon($tmp26);
    $tmp29 = ats2plpre_add_int1_int1($arg1, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp28;
    $apy1 = $tmp29;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_stream_vt_loop_12;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret25;
} #end-of-function


sub
ats2plpre_stream2list_vt($)
{
##
  my($arg0) = @_;
##
  my $tmpret30;
##
  __patsflab_stream2list_vt:
  $tmpret30 = _ats2plpre_stream_vt_aux_14($arg0);
  return $tmpret30;
} #end-of-function


sub
_ats2plpre_stream_vt_aux_14($)
{
##
  my($arg0) = @_;
##
  my $tmpret31;
  my $tmp32;
  my $tmp33;
  my $tmp34;
  my $tmp35;
##
  __patsflab__ats2plpre_stream_vt_aux_14:
  $tmp32 = ATSPMVllazyval_eval($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab12:
    if(ATSCKptriscons($tmp32)) { goto __atstmplab15; }
    __atstmplab13:
    $tmpret31 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab14:
    __atstmplab15:
    $tmp33 = $tmp32->[0];
    $tmp34 = $tmp32->[1];
    #ATSINSfreecon($tmp32);
    $tmp35 = _ats2plpre_stream_vt_aux_14($tmp34);
    $tmpret31 = [$tmp33, $tmp35];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret31;
} #end-of-function


sub
ats2plpre_stream2list_vt_rev($)
{
##
  my($arg0) = @_;
##
  my $tmpret36;
  my $tmp42;
##
  __patsflab_stream2list_vt_rev:
  $tmp42 = 0;
  $tmpret36 = _ats2plpre_stream_vt_loop_16($arg0, $tmp42);
  return $tmpret36;
} #end-of-function


sub
_ats2plpre_stream_vt_loop_16($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret37;
  my $tmp38;
  my $tmp39;
  my $tmp40;
  my $tmp41;
##
  __patsflab__ats2plpre_stream_vt_loop_16:
  $tmp38 = ATSPMVllazyval_eval($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab16:
    if(ATSCKptriscons($tmp38)) { goto __atstmplab19; }
    __atstmplab17:
    $tmpret37 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab18:
    __atstmplab19:
    $tmp39 = $tmp38->[0];
    $tmp40 = $tmp38->[1];
    #ATSINSfreecon($tmp38);
    $tmp41 = [$tmp39, $arg1];
    #ATStailcalseq_beg
    $apy0 = $tmp40;
    $apy1 = $tmp41;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_stream_vt_loop_16;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret37;
} #end-of-function


sub
ats2plpre_stream_vt_append($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret43;
##
  __patsflab_stream_vt_append:
  $tmpret43 = _ats2plpre_stream_vt_auxmain_18($arg0, $arg1);
  return $tmpret43;
} #end-of-function


sub
_ats2plpre_stream_vt_auxmain_18($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret44;
##
  __patsflab__ats2plpre_stream_vt_auxmain_18:
  $tmpret44 = ATSPMVllazyval(_ats2plpre_stream_vt_patsfun_19__closurerize($arg0, $arg1));
  return $tmpret44;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_19($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret45;
  my $tmp46;
  my $tmp47;
  my $tmp48;
  my $tmp49;
##
  __patsflab__ats2plpre_stream_vt_patsfun_19:
  if($arg0) {
    $tmp46 = ATSPMVllazyval_eval($env0);
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab20:
      if(ATSCKptriscons($tmp46)) { goto __atstmplab23; }
      __atstmplab21:
      $tmpret45 = ATSPMVllazyval_eval($env1);
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab22:
      __atstmplab23:
      $tmp47 = $tmp46->[0];
      $tmp48 = $tmp46->[1];
      #ATSINSfreecon($tmp46);
      $tmp49 = _ats2plpre_stream_vt_auxmain_18($tmp48, $env1);
      $tmpret45 = [$tmp47, $tmp49];
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
    atspre_lazy_vt_free($env0);
    atspre_lazy_vt_free($env1);
  } #endif
  return $tmpret45;
} #end-of-function


sub
ats2plpre_stream_vt_concat($)
{
##
  my($arg0) = @_;
##
  my $tmpret52;
##
  __patsflab_stream_vt_concat:
  $tmpret52 = _ats2plpre_stream_vt_auxmain_21($arg0);
  return $tmpret52;
} #end-of-function


sub
_ats2plpre_stream_vt_auxmain_21($)
{
##
  my($arg0) = @_;
##
  my $tmpret53;
##
  __patsflab__ats2plpre_stream_vt_auxmain_21:
  $tmpret53 = ATSPMVllazyval(_ats2plpre_stream_vt_patsfun_22__closurerize($arg0));
  return $tmpret53;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_22($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret54;
  my $tmp55;
  my $tmp56;
  my $tmp57;
  my $tmp58;
  my $tmp59;
##
  __patsflab__ats2plpre_stream_vt_patsfun_22:
  if($arg0) {
    $tmp55 = ATSPMVllazyval_eval($env0);
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab24:
      if(ATSCKptriscons($tmp55)) { goto __atstmplab27; }
      __atstmplab25:
      $tmpret54 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab26:
      __atstmplab27:
      $tmp56 = $tmp55->[0];
      $tmp57 = $tmp55->[1];
      #ATSINSfreecon($tmp55);
      $tmp59 = _ats2plpre_stream_vt_auxmain_21($tmp57);
      $tmp58 = ats2plpre_stream_vt_append($tmp56, $tmp59);
      $tmpret54 = ATSPMVllazyval_eval($tmp58);
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
    atspre_lazy_vt_free($env0);
  } #endif
  return $tmpret54;
} #end-of-function


sub
ats2plpre_stream_vt_map_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret61;
##
  __patsflab_stream_vt_map_cloref:
  $tmpret61 = _ats2plpre_stream_vt_auxmain_24($arg1, $arg0);
  return $tmpret61;
} #end-of-function


sub
_ats2plpre_stream_vt_auxmain_24($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret62;
##
  __patsflab__ats2plpre_stream_vt_auxmain_24:
  $tmpret62 = ATSPMVllazyval(_ats2plpre_stream_vt_patsfun_25__closurerize($env0, $arg0));
  return $tmpret62;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_25($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret63;
  my $tmp64;
  my $tmp65;
  my $tmp66;
  my $tmp67;
  my $tmp68;
##
  __patsflab__ats2plpre_stream_vt_patsfun_25:
  if($arg0) {
    $tmp64 = ATSPMVllazyval_eval($env1);
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab28:
      if(ATSCKptriscons($tmp64)) { goto __atstmplab31; }
      __atstmplab29:
      $tmpret63 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab30:
      __atstmplab31:
      $tmp65 = $tmp64->[0];
      $tmp66 = $tmp64->[1];
      #ATSINSfreecon($tmp64);
      $tmp67 = &{$env0->[0]}($env0, $tmp65);
      $tmp68 = _ats2plpre_stream_vt_auxmain_24($env0, $tmp66);
      $tmpret63 = [$tmp67, $tmp68];
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
    atspre_lazy_vt_free($env1);
  } #endif
  return $tmpret63;
} #end-of-function


sub
ats2plpre_stream_vt_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret70;
##
  __patsflab_stream_vt_map_method:
  $tmpret70 = _ats2plpre_stream_vt_patsfun_27__closurerize($arg0);
  return $tmpret70;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_27($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret71;
##
  __patsflab__ats2plpre_stream_vt_patsfun_27:
  $tmpret71 = ats2plpre_stream_vt_map_cloref($env0, $arg0);
  return $tmpret71;
} #end-of-function


sub
ats2plpre_stream_vt_filter_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret72;
##
  __patsflab_stream_vt_filter_cloref:
  $tmpret72 = _ats2plpre_stream_vt_auxmain_29($arg1, $arg0);
  return $tmpret72;
} #end-of-function


sub
_ats2plpre_stream_vt_auxmain_29($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret73;
##
  __patsflab__ats2plpre_stream_vt_auxmain_29:
  $tmpret73 = ATSPMVllazyval(_ats2plpre_stream_vt_patsfun_30__closurerize($env0, $arg0));
  return $tmpret73;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_30($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret74;
  my $tmp75;
  my $tmp76;
  my $tmp77;
  my $tmp78;
  my $tmp79;
  my $tmp80;
##
  __patsflab__ats2plpre_stream_vt_patsfun_30:
  if($arg0) {
    $tmp75 = ATSPMVllazyval_eval($env1);
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab32:
      if(ATSCKptriscons($tmp75)) { goto __atstmplab35; }
      __atstmplab33:
      $tmpret74 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab34:
      __atstmplab35:
      $tmp76 = $tmp75->[0];
      $tmp77 = $tmp75->[1];
      #ATSINSfreecon($tmp75);
      $tmp78 = &{$env0->[0]}($env0, $tmp76);
      if($tmp78) {
        $tmp79 = _ats2plpre_stream_vt_auxmain_29($env0, $tmp77);
        $tmpret74 = [$tmp76, $tmp79];
      } else {
        $tmp80 = _ats2plpre_stream_vt_auxmain_29($env0, $tmp77);
        $tmpret74 = ATSPMVllazyval_eval($tmp80);
      } #endif
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
  } else {
    atspre_lazy_vt_free($env1);
  } #endif
  return $tmpret74;
} #end-of-function


sub
ats2plpre_stream_vt_filter_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret82;
##
  __patsflab_stream_vt_filter_method:
  $tmpret82 = _ats2plpre_stream_vt_patsfun_32__closurerize($arg0);
  return $tmpret82;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_32($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret83;
##
  __patsflab__ats2plpre_stream_vt_patsfun_32:
  $tmpret83 = ats2plpre_stream_vt_filter_cloref($env0, $arg0);
  return $tmpret83;
} #end-of-function


sub
ats2plpre_stream_vt_exists_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret84;
##
  __patsflab_stream_vt_exists_cloref:
  $tmpret84 = _ats2plpre_stream_vt_loop_34($arg1, $arg0);
  return $tmpret84;
} #end-of-function


sub
_ats2plpre_stream_vt_loop_34($$)
{
##
  my($env0, $arg0) = @_;
##
  my $apy0;
  my $tmpret85;
  my $tmp86;
  my $tmp87;
  my $tmp88;
  my $tmp89;
##
  __patsflab__ats2plpre_stream_vt_loop_34:
  $tmp86 = ATSPMVllazyval_eval($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab36:
    if(ATSCKptriscons($tmp86)) { goto __atstmplab39; }
    __atstmplab37:
    $tmpret85 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab38:
    __atstmplab39:
    $tmp87 = $tmp86->[0];
    $tmp88 = $tmp86->[1];
    #ATSINSfreecon($tmp86);
    $tmp89 = &{$env0->[0]}($env0, $tmp87);
    if($tmp89) {
      atspre_lazy_vt_free($tmp88);
      $tmpret85 = 1;
    } else {
      #ATStailcalseq_beg
      $apy0 = $tmp88;
      $arg0 = $apy0;
      goto __patsflab__ats2plpre_stream_vt_loop_34;
      #ATStailcalseq_end
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret85;
} #end-of-function


sub
ats2plpre_stream_vt_exists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret91;
##
  __patsflab_stream_vt_exists_method:
  $tmpret91 = _ats2plpre_stream_vt_patsfun_36__closurerize($arg0);
  return $tmpret91;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_36($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret92;
##
  __patsflab__ats2plpre_stream_vt_patsfun_36:
  $tmpret92 = ats2plpre_stream_vt_exists_cloref($env0, $arg0);
  return $tmpret92;
} #end-of-function


sub
ats2plpre_stream_vt_forall_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret93;
##
  __patsflab_stream_vt_forall_cloref:
  $tmpret93 = _ats2plpre_stream_vt_loop_38($arg1, $arg0);
  return $tmpret93;
} #end-of-function


sub
_ats2plpre_stream_vt_loop_38($$)
{
##
  my($env0, $arg0) = @_;
##
  my $apy0;
  my $tmpret94;
  my $tmp95;
  my $tmp96;
  my $tmp97;
  my $tmp98;
##
  __patsflab__ats2plpre_stream_vt_loop_38:
  $tmp95 = ATSPMVllazyval_eval($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab40:
    if(ATSCKptriscons($tmp95)) { goto __atstmplab43; }
    __atstmplab41:
    $tmpret94 = 1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab42:
    __atstmplab43:
    $tmp96 = $tmp95->[0];
    $tmp97 = $tmp95->[1];
    #ATSINSfreecon($tmp95);
    $tmp98 = &{$env0->[0]}($env0, $tmp96);
    if($tmp98) {
      #ATStailcalseq_beg
      $apy0 = $tmp97;
      $arg0 = $apy0;
      goto __patsflab__ats2plpre_stream_vt_loop_38;
      #ATStailcalseq_end
    } else {
      atspre_lazy_vt_free($tmp97);
      $tmpret94 = 0;
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret94;
} #end-of-function


sub
ats2plpre_stream_vt_forall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret100;
##
  __patsflab_stream_vt_forall_method:
  $tmpret100 = _ats2plpre_stream_vt_patsfun_40__closurerize($arg0);
  return $tmpret100;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_40($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret101;
##
  __patsflab__ats2plpre_stream_vt_patsfun_40:
  $tmpret101 = ats2plpre_stream_vt_forall_cloref($env0, $arg0);
  return $tmpret101;
} #end-of-function


sub
ats2plpre_stream_vt_foreach_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_stream_vt_foreach_cloref:
  _ats2plpre_stream_vt_loop_42($arg1, $arg0);
  return;#_void
} #end-of-function


sub
_ats2plpre_stream_vt_loop_42($$)
{
##
  my($env0, $arg0) = @_;
##
  my $apy0;
  my $tmp104;
  my $tmp105;
  my $tmp106;
##
  __patsflab__ats2plpre_stream_vt_loop_42:
  $tmp104 = ATSPMVllazyval_eval($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab44:
    if(ATSCKptriscons($tmp104)) { goto __atstmplab47; }
    __atstmplab45:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab46:
    __atstmplab47:
    $tmp105 = $tmp104->[0];
    $tmp106 = $tmp104->[1];
    #ATSINSfreecon($tmp104);
    &{$env0->[0]}($env0, $tmp105);
    #ATStailcalseq_beg
    $apy0 = $tmp106;
    $arg0 = $apy0;
    goto __patsflab__ats2plpre_stream_vt_loop_42;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_stream_vt_foreach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret108;
##
  __patsflab_stream_vt_foreach_method:
  $tmpret108 = _ats2plpre_stream_vt_patsfun_44__closurerize($arg0);
  return $tmpret108;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_44($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_stream_vt_patsfun_44:
  ats2plpre_stream_vt_foreach_cloref($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_stream_vt_iforeach_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_stream_vt_iforeach_cloref:
  _ats2plpre_stream_vt_loop_46($arg1, 0, $arg0);
  return;#_void
} #end-of-function


sub
_ats2plpre_stream_vt_loop_46($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmp112;
  my $tmp113;
  my $tmp114;
  my $tmp116;
##
  __patsflab__ats2plpre_stream_vt_loop_46:
  $tmp112 = ATSPMVllazyval_eval($arg1);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab48:
    if(ATSCKptriscons($tmp112)) { goto __atstmplab51; }
    __atstmplab49:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab50:
    __atstmplab51:
    $tmp113 = $tmp112->[0];
    $tmp114 = $tmp112->[1];
    #ATSINSfreecon($tmp112);
    &{$env0->[0]}($env0, $arg0, $tmp113);
    $tmp116 = ats2plpre_add_int1_int1($arg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp116;
    $apy1 = $tmp114;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_stream_vt_loop_46;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_stream_vt_iforeach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret117;
##
  __patsflab_stream_vt_iforeach_method:
  $tmpret117 = _ats2plpre_stream_vt_patsfun_48__closurerize($arg0);
  return $tmpret117;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_48($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_stream_vt_patsfun_48:
  ats2plpre_stream_vt_iforeach_cloref($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_stream_vt_rforeach_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_stream_vt_rforeach_cloref:
  _ats2plpre_stream_vt_auxmain_50($arg1, $arg0);
  return;#_void
} #end-of-function


sub
_ats2plpre_stream_vt_auxmain_50($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmp121;
  my $tmp122;
  my $tmp123;
##
  __patsflab__ats2plpre_stream_vt_auxmain_50:
  $tmp121 = ATSPMVllazyval_eval($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab52:
    if(ATSCKptriscons($tmp121)) { goto __atstmplab55; }
    __atstmplab53:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab54:
    __atstmplab55:
    $tmp122 = $tmp121->[0];
    $tmp123 = $tmp121->[1];
    #ATSINSfreecon($tmp121);
    _ats2plpre_stream_vt_auxmain_50($env0, $tmp123);
    &{$env0->[0]}($env0, $tmp122);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return;#_void
} #end-of-function


sub
ats2plpre_stream_vt_rforeach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret125;
##
  __patsflab_stream_vt_rforeach_method:
  $tmpret125 = _ats2plpre_stream_vt_patsfun_52__closurerize($arg0);
  return $tmpret125;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_52($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_stream_vt_patsfun_52:
  ats2plpre_stream_vt_rforeach_cloref($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_stream_vt_tabulate_cloref($)
{
##
  my($arg0) = @_;
##
  my $tmpret127;
##
  __patsflab_stream_vt_tabulate_cloref:
  $tmpret127 = _ats2plpre_stream_vt_auxmain_54($arg0, 0);
  return $tmpret127;
} #end-of-function


sub
_ats2plpre_stream_vt_auxmain_54($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret128;
##
  __patsflab__ats2plpre_stream_vt_auxmain_54:
  $tmpret128 = ATSPMVllazyval(_ats2plpre_stream_vt_patsfun_55__closurerize($env0, $arg0));
  return $tmpret128;
} #end-of-function


sub
_ats2plpre_stream_vt_patsfun_55($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret129;
  my $tmp130;
  my $tmp131;
  my $tmp132;
##
  __patsflab__ats2plpre_stream_vt_patsfun_55:
  if($arg0) {
    $tmp130 = &{$env0->[0]}($env0, $env1);
    $tmp132 = ats2plpre_add_int1_int1($env1, 1);
    $tmp131 = _ats2plpre_stream_vt_auxmain_54($env0, $tmp132);
    $tmpret129 = [$tmp130, $tmp131];
  } else {
  } #endif
  return $tmpret129;
} #end-of-function


######
#ATSextcode_beg()
######
######
1; ##note that it is needed by 'use' or 'require'
######
######
#ATSextcode_end()
######
######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-4-11: 16h:58m
##
######
sub
_ats2plpre_intrange_patsfun_4__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_4($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_9__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_9($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_11__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_11($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_13__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_13($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_16__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_16($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}

sub
_ats2plpre_intrange_patsfun_20__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_20($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_23__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_23($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_26__closurerize($$$)
{
  my($env0, $env1, $env2) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_intrange_patsfun_26($cenv->[1], $cenv->[2], $cenv->[3]); }, $env0, $env1, $env2];
}

sub
_ats2plpre_intrange_patsfun_28__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_28($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_31__closurerize($$$)
{
  my($env0, $env1, $env2) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_31($cenv->[1], $cenv->[2], $cenv->[3], $arg0); }, $env0, $env1, $env2];
}

sub
_ats2plpre_intrange_patsfun_33__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_33($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_40__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_40($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_44__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_44($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_48__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_48($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_52__closurerize($$$)
{
  my($env0, $env1, $env2) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_52($cenv->[1], $cenv->[2], $cenv->[3], $arg0); }, $env0, $env1, $env2];
}


sub
ats2plpre_int_repeat_lazy($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmp1;
##
  __patsflab_int_repeat_lazy:
  $tmp1 = ats2plpre_lazy2cloref($arg1);
  ats2plpre_int_repeat_cloref($arg0, $tmp1);
  return;#_void
} #end-of-function


sub
ats2plpre_int_repeat_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_int_repeat_cloref:
  _ats2plpre_intrange_loop_2($arg0, $arg1);
  return;#_void
} #end-of-function


sub
_ats2plpre_intrange_loop_2($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmp4;
  my $tmp6;
##
  __patsflab__ats2plpre_intrange_loop_2:
  $tmp4 = ats2plpre_gt_int0_int0($arg0, 0);
  if($tmp4) {
    &{$arg1->[0]}($arg1);
    $tmp6 = ats2plpre_sub_int0_int0($arg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp6;
    $apy1 = $arg1;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_intrange_loop_2;
    #ATStailcalseq_end
  } else {
    #ATSINSmove_void;
  } #endif
  return;#_void
} #end-of-function


sub
ats2plpre_int_repeat_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret7;
##
  __patsflab_int_repeat_method:
  $tmpret7 = _ats2plpre_intrange_patsfun_4__closurerize($arg0);
  return $tmpret7;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_4($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_intrange_patsfun_4:
  ats2plpre_int_repeat_cloref($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_int_exists_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret9;
##
  __patsflab_int_exists_cloref:
  $tmpret9 = ats2plpre_intrange_exists_cloref(0, $arg0, $arg1);
  return $tmpret9;
} #end-of-function


sub
ats2plpre_int_forall_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret10;
##
  __patsflab_int_forall_cloref:
  $tmpret10 = ats2plpre_intrange_forall_cloref(0, $arg0, $arg1);
  return $tmpret10;
} #end-of-function


sub
ats2plpre_int_foreach_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_int_foreach_cloref:
  ats2plpre_intrange_foreach_cloref(0, $arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_int_exists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret12;
##
  __patsflab_int_exists_method:
  $tmpret12 = _ats2plpre_intrange_patsfun_9__closurerize($arg0);
  return $tmpret12;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_9($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret13;
##
  __patsflab__ats2plpre_intrange_patsfun_9:
  $tmpret13 = ats2plpre_int_exists_cloref($env0, $arg0);
  return $tmpret13;
} #end-of-function


sub
ats2plpre_int_forall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret14;
##
  __patsflab_int_forall_method:
  $tmpret14 = _ats2plpre_intrange_patsfun_11__closurerize($arg0);
  return $tmpret14;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_11($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret15;
##
  __patsflab__ats2plpre_intrange_patsfun_11:
  $tmpret15 = ats2plpre_int_forall_cloref($env0, $arg0);
  return $tmpret15;
} #end-of-function


sub
ats2plpre_int_foreach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret16;
##
  __patsflab_int_foreach_method:
  $tmpret16 = _ats2plpre_intrange_patsfun_13__closurerize($arg0);
  return $tmpret16;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_13($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_intrange_patsfun_13:
  ats2plpre_int_foreach_cloref($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_int_foldleft_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret18;
##
  __patsflab_int_foldleft_cloref:
  $tmpret18 = ats2plpre_intrange_foldleft_cloref(0, $arg0, $arg1, $arg2);
  return $tmpret18;
} #end-of-function


sub
ats2plpre_int_foldleft_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret19;
##
  __patsflab_int_foldleft_method:
  $tmpret19 = _ats2plpre_intrange_patsfun_16__closurerize($arg0, $arg1);
  return $tmpret19;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_16($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret20;
##
  __patsflab__ats2plpre_intrange_patsfun_16:
  $tmpret20 = ats2plpre_int_foldleft_cloref($env0, $env1, $arg0);
  return $tmpret20;
} #end-of-function


sub
ats2plpre_int_list_map_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret21;
##
  __patsflab_int_list_map_cloref:
  $tmpret21 = _ats2plpre_intrange_aux_18($arg0, $arg1, 0);
  return $tmpret21;
} #end-of-function


sub
_ats2plpre_intrange_aux_18($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret22;
  my $tmp23;
  my $tmp24;
  my $tmp25;
  my $tmp26;
##
  __patsflab__ats2plpre_intrange_aux_18:
  $tmp23 = ats2plpre_lt_int1_int1($arg0, $env0);
  if($tmp23) {
    $tmp24 = &{$env1->[0]}($env1, $arg0);
    $tmp26 = ats2plpre_add_int1_int1($arg0, 1);
    $tmp25 = _ats2plpre_intrange_aux_18($env0, $env1, $tmp26);
    $tmpret22 = [$tmp24, $tmp25];
  } else {
    $tmpret22 = 0;
  } #endif
  return $tmpret22;
} #end-of-function


sub
ats2plpre_int_list_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret27;
##
  __patsflab_int_list_map_method:
  $tmpret27 = _ats2plpre_intrange_patsfun_20__closurerize($arg0);
  return $tmpret27;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_20($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret28;
##
  __patsflab__ats2plpre_intrange_patsfun_20:
  $tmpret28 = ats2plpre_int_list_map_cloref($env0, $arg0);
  return $tmpret28;
} #end-of-function


sub
ats2plpre_int_list0_map_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret29;
  my $tmp30;
  my $tmp31;
##
  __patsflab_int_list0_map_cloref:
  $tmp30 = ats2plpre_gte_int1_int1($arg0, 0);
  if($tmp30) {
    $tmp31 = ats2plpre_int_list_map_cloref($arg0, $arg1);
    $tmpret29 = $tmp31;
  } else {
    $tmpret29 = 0;
  } #endif
  return $tmpret29;
} #end-of-function


sub
ats2plpre_int_list0_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret32;
##
  __patsflab_int_list0_map_method:
  $tmpret32 = _ats2plpre_intrange_patsfun_23__closurerize($arg0);
  return $tmpret32;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_23($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret33;
##
  __patsflab__ats2plpre_intrange_patsfun_23:
  $tmpret33 = ats2plpre_int_list0_map_cloref($env0, $arg0);
  return $tmpret33;
} #end-of-function


sub
ats2plpre_int_stream_map_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret34;
##
  __patsflab_int_stream_map_cloref:
  $tmpret34 = _ats2plpre_intrange_aux_25($arg0, $arg1, 0);
  return $tmpret34;
} #end-of-function


sub
_ats2plpre_intrange_aux_25($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret35;
##
  __patsflab__ats2plpre_intrange_aux_25:
  $tmpret35 = ATSPMVlazyval(_ats2plpre_intrange_patsfun_26__closurerize($env0, $env1, $arg0));
  return $tmpret35;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_26($$$)
{
##
  my($env0, $env1, $env2) = @_;
##
  my $tmpret36;
  my $tmp37;
  my $tmp38;
  my $tmp39;
  my $tmp40;
##
  __patsflab__ats2plpre_intrange_patsfun_26:
  $tmp37 = ats2plpre_lt_int1_int1($env2, $env0);
  if($tmp37) {
    $tmp38 = &{$env1->[0]}($env1, $env2);
    $tmp40 = ats2plpre_add_int1_int1($env2, 1);
    $tmp39 = _ats2plpre_intrange_aux_25($env0, $env1, $tmp40);
    $tmpret36 = [$tmp38, $tmp39];
  } else {
    $tmpret36 = 0;
  } #endif
  return $tmpret36;
} #end-of-function


sub
ats2plpre_int_stream_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret41;
##
  __patsflab_int_stream_map_method:
  $tmpret41 = _ats2plpre_intrange_patsfun_28__closurerize($arg0);
  return $tmpret41;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_28($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret42;
##
  __patsflab__ats2plpre_intrange_patsfun_28:
  $tmpret42 = ats2plpre_int_stream_map_cloref($env0, $arg0);
  return $tmpret42;
} #end-of-function


sub
ats2plpre_int_stream_vt_map_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret43;
##
  __patsflab_int_stream_vt_map_cloref:
  $tmpret43 = _ats2plpre_intrange_aux_30($arg0, $arg1, 0);
  return $tmpret43;
} #end-of-function


sub
_ats2plpre_intrange_aux_30($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret44;
##
  __patsflab__ats2plpre_intrange_aux_30:
  $tmpret44 = ATSPMVllazyval(_ats2plpre_intrange_patsfun_31__closurerize($env0, $env1, $arg0));
  return $tmpret44;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_31($$$$)
{
##
  my($env0, $env1, $env2, $arg0) = @_;
##
  my $tmpret45;
  my $tmp46;
  my $tmp47;
  my $tmp48;
  my $tmp49;
##
  __patsflab__ats2plpre_intrange_patsfun_31:
  if($arg0) {
    $tmp46 = ats2plpre_lt_int1_int1($env2, $env0);
    if($tmp46) {
      $tmp47 = &{$env1->[0]}($env1, $env2);
      $tmp49 = ats2plpre_add_int1_int1($env2, 1);
      $tmp48 = _ats2plpre_intrange_aux_30($env0, $env1, $tmp49);
      $tmpret45 = [$tmp47, $tmp48];
    } else {
      $tmpret45 = 0;
    } #endif
  } else {
  } #endif
  return $tmpret45;
} #end-of-function


sub
ats2plpre_int_stream_vt_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret50;
##
  __patsflab_int_stream_vt_map_method:
  $tmpret50 = _ats2plpre_intrange_patsfun_33__closurerize($arg0);
  return $tmpret50;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_33($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret51;
##
  __patsflab__ats2plpre_intrange_patsfun_33:
  $tmpret51 = ats2plpre_int_stream_vt_map_cloref($env0, $arg0);
  return $tmpret51;
} #end-of-function


sub
ats2plpre_int2_exists_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret52;
##
  __patsflab_int2_exists_cloref:
  $tmpret52 = ats2plpre_intrange2_exists_cloref(0, $arg0, 0, $arg1, $arg2);
  return $tmpret52;
} #end-of-function


sub
ats2plpre_int2_forall_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret53;
##
  __patsflab_int2_forall_cloref:
  $tmpret53 = ats2plpre_intrange2_forall_cloref(0, $arg0, 0, $arg1, $arg2);
  return $tmpret53;
} #end-of-function


sub
ats2plpre_int2_foreach_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
##
  __patsflab_int2_foreach_cloref:
  ats2plpre_intrange2_foreach_cloref(0, $arg0, 0, $arg1, $arg2);
  return;#_void
} #end-of-function


sub
ats2plpre_intrange_exists_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret55;
##
  __patsflab_intrange_exists_cloref:
  $tmpret55 = _ats2plpre_intrange_loop_38($arg0, $arg1, $arg2);
  return $tmpret55;
} #end-of-function


sub
_ats2plpre_intrange_loop_38($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmpret56;
  my $tmp57;
  my $tmp58;
  my $tmp59;
##
  __patsflab__ats2plpre_intrange_loop_38:
  $tmp57 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp57) {
    $tmp58 = &{$arg2->[0]}($arg2, $arg0);
    if($tmp58) {
      $tmpret56 = 1;
    } else {
      $tmp59 = ats2plpre_add_int0_int0($arg0, 1);
      #ATStailcalseq_beg
      $apy0 = $tmp59;
      $apy1 = $arg1;
      $apy2 = $arg2;
      $arg0 = $apy0;
      $arg1 = $apy1;
      $arg2 = $apy2;
      goto __patsflab__ats2plpre_intrange_loop_38;
      #ATStailcalseq_end
    } #endif
  } else {
    $tmpret56 = 0;
  } #endif
  return $tmpret56;
} #end-of-function


sub
ats2plpre_intrange_exists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret60;
##
  __patsflab_intrange_exists_method:
  $tmpret60 = _ats2plpre_intrange_patsfun_40__closurerize($arg0);
  return $tmpret60;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_40($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret61;
##
  __patsflab__ats2plpre_intrange_patsfun_40:
  $tmpret61 = ats2plpre_intrange_exists_cloref($env0->[0], $env0->[1], $arg0);
  return $tmpret61;
} #end-of-function


sub
ats2plpre_intrange_forall_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret62;
##
  __patsflab_intrange_forall_cloref:
  $tmpret62 = _ats2plpre_intrange_loop_42($arg0, $arg1, $arg2);
  return $tmpret62;
} #end-of-function


sub
_ats2plpre_intrange_loop_42($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmpret63;
  my $tmp64;
  my $tmp65;
  my $tmp66;
##
  __patsflab__ats2plpre_intrange_loop_42:
  $tmp64 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp64) {
    $tmp65 = &{$arg2->[0]}($arg2, $arg0);
    if($tmp65) {
      $tmp66 = ats2plpre_add_int0_int0($arg0, 1);
      #ATStailcalseq_beg
      $apy0 = $tmp66;
      $apy1 = $arg1;
      $apy2 = $arg2;
      $arg0 = $apy0;
      $arg1 = $apy1;
      $arg2 = $apy2;
      goto __patsflab__ats2plpre_intrange_loop_42;
      #ATStailcalseq_end
    } else {
      $tmpret63 = 0;
    } #endif
  } else {
    $tmpret63 = 1;
  } #endif
  return $tmpret63;
} #end-of-function


sub
ats2plpre_intrange_forall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret67;
##
  __patsflab_intrange_forall_method:
  $tmpret67 = _ats2plpre_intrange_patsfun_44__closurerize($arg0);
  return $tmpret67;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_44($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret68;
##
  __patsflab__ats2plpre_intrange_patsfun_44:
  $tmpret68 = ats2plpre_intrange_forall_cloref($env0->[0], $env0->[1], $arg0);
  return $tmpret68;
} #end-of-function


sub
ats2plpre_intrange_foreach_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
##
  __patsflab_intrange_foreach_cloref:
  _ats2plpre_intrange_loop_46($arg0, $arg1, $arg2);
  return;#_void
} #end-of-function


sub
_ats2plpre_intrange_loop_46($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmp71;
  my $tmp73;
##
  __patsflab__ats2plpre_intrange_loop_46:
  $tmp71 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp71) {
    &{$arg2->[0]}($arg2, $arg0);
    $tmp73 = ats2plpre_add_int0_int0($arg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp73;
    $apy1 = $arg1;
    $apy2 = $arg2;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    goto __patsflab__ats2plpre_intrange_loop_46;
    #ATStailcalseq_end
  } else {
    #ATSINSmove_void;
  } #endif
  return;#_void
} #end-of-function


sub
ats2plpre_intrange_foreach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret74;
##
  __patsflab_intrange_foreach_method:
  $tmpret74 = _ats2plpre_intrange_patsfun_48__closurerize($arg0);
  return $tmpret74;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_48($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_intrange_patsfun_48:
  ats2plpre_intrange_foreach_cloref($env0->[0], $env0->[1], $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_intrange_foldleft_cloref($$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3) = @_;
##
  my $tmpret76;
##
  __patsflab_intrange_foldleft_cloref:
  $tmpret76 = _ats2plpre_intrange_loop_50($arg3, $arg0, $arg1, $arg2, $arg3);
  return $tmpret76;
} #end-of-function


sub
_ats2plpre_intrange_loop_50($$$$$)
{
##
  my($env0, $arg0, $arg1, $arg2, $arg3) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $apy3;
  my $tmpret77;
  my $tmp78;
  my $tmp79;
  my $tmp80;
##
  __patsflab__ats2plpre_intrange_loop_50:
  $tmp78 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp78) {
    $tmp79 = ats2plpre_add_int0_int0($arg0, 1);
    $tmp80 = &{$arg3->[0]}($arg3, $arg2, $arg0);
    #ATStailcalseq_beg
    $apy0 = $tmp79;
    $apy1 = $arg1;
    $apy2 = $tmp80;
    $apy3 = $env0;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    goto __patsflab__ats2plpre_intrange_loop_50;
    #ATStailcalseq_end
  } else {
    $tmpret77 = $arg2;
  } #endif
  return $tmpret77;
} #end-of-function


sub
ats2plpre_intrange_foldleft_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmp81;
  my $tmp82;
  my $tmpret83;
##
  __patsflab_intrange_foldleft_method:
  $tmp81 = $arg0->[0];
  $tmp82 = $arg0->[1];
  $tmpret83 = _ats2plpre_intrange_patsfun_52__closurerize($tmp81, $tmp82, $arg1);
  return $tmpret83;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_52($$$$)
{
##
  my($env0, $env1, $env2, $arg0) = @_;
##
  my $tmpret84;
##
  __patsflab__ats2plpre_intrange_patsfun_52:
  $tmpret84 = ats2plpre_intrange_foldleft_cloref($env0, $env1, $env2, $arg0);
  return $tmpret84;
} #end-of-function


sub
ats2plpre_intrange2_exists_cloref($$$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3, $arg4) = @_;
##
  my $tmpret85;
##
  __patsflab_intrange2_exists_cloref:
  $tmpret85 = _ats2plpre_intrange_loop1_54($arg2, $arg3, $arg4, $arg0, $arg1, $arg2, $arg3, $arg4);
  return $tmpret85;
} #end-of-function


sub
_ats2plpre_intrange_loop1_54($$$$$$$$)
{
##
  my($env0, $env1, $env2, $arg0, $arg1, $arg2, $arg3, $arg4) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $apy3;
  my $apy4;
  my $tmpret86;
  my $tmp87;
  my $a2rg0;
  my $a2rg1;
  my $a2rg2;
  my $a2rg3;
  my $a2rg4;
  my $a2py0;
  my $a2py1;
  my $a2py2;
  my $a2py3;
  my $a2py4;
  my $tmpret88;
  my $tmp89;
  my $tmp90;
  my $tmp91;
  my $tmp92;
##
  __patsflab__ats2plpre_intrange_loop1_54:
  $tmp87 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp87) {
    #ATStailcalseq_beg
    $a2py0 = $arg0;
    $a2py1 = $arg1;
    $a2py2 = $arg2;
    $a2py3 = $arg3;
    $a2py4 = $env2;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2plpre_intrange_loop2_55;
    #ATStailcalseq_end
  } else {
    $tmpret86 = 0;
  } #endif
  return $tmpret86;
##
  __patsflab__ats2plpre_intrange_loop2_55:
  $tmp89 = ats2plpre_lt_int0_int0($a2rg2, $a2rg3);
  if($tmp89) {
    $tmp90 = &{$a2rg4->[0]}($a2rg4, $a2rg0, $a2rg2);
    if($tmp90) {
      $tmpret88 = 1;
    } else {
      $tmp91 = ats2plpre_add_int0_int0($a2rg2, 1);
      #ATStailcalseq_beg
      $a2py0 = $a2rg0;
      $a2py1 = $a2rg1;
      $a2py2 = $tmp91;
      $a2py3 = $a2rg3;
      $a2py4 = $a2rg4;
      $a2rg0 = $a2py0;
      $a2rg1 = $a2py1;
      $a2rg2 = $a2py2;
      $a2rg3 = $a2py3;
      $a2rg4 = $a2py4;
      goto __patsflab__ats2plpre_intrange_loop2_55;
      #ATStailcalseq_end
    } #endif
  } else {
    $tmp92 = ats2plpre_add_int0_int0($a2rg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp92;
    $apy1 = $a2rg1;
    $apy2 = $env0;
    $apy3 = $env1;
    $apy4 = $a2rg4;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    $arg4 = $apy4;
    goto __patsflab__ats2plpre_intrange_loop1_54;
    #ATStailcalseq_end
  } #endif
  return $tmpret88;
} #end-of-function


sub
ats2plpre_intrange2_forall_cloref($$$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3, $arg4) = @_;
##
  my $tmpret93;
##
  __patsflab_intrange2_forall_cloref:
  $tmpret93 = _ats2plpre_intrange_loop1_57($arg2, $arg3, $arg0, $arg1, $arg2, $arg3, $arg4);
  return $tmpret93;
} #end-of-function


sub
_ats2plpre_intrange_loop1_57($$$$$$$)
{
##
  my($env0, $env1, $arg0, $arg1, $arg2, $arg3, $arg4) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $apy3;
  my $apy4;
  my $tmpret94;
  my $tmp95;
  my $a2rg0;
  my $a2rg1;
  my $a2rg2;
  my $a2rg3;
  my $a2rg4;
  my $a2py0;
  my $a2py1;
  my $a2py2;
  my $a2py3;
  my $a2py4;
  my $tmpret96;
  my $tmp97;
  my $tmp98;
  my $tmp99;
  my $tmp100;
##
  __patsflab__ats2plpre_intrange_loop1_57:
  $tmp95 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp95) {
    #ATStailcalseq_beg
    $a2py0 = $arg0;
    $a2py1 = $arg1;
    $a2py2 = $arg2;
    $a2py3 = $arg3;
    $a2py4 = $arg4;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2plpre_intrange_loop2_58;
    #ATStailcalseq_end
  } else {
    $tmpret94 = 1;
  } #endif
  return $tmpret94;
##
  __patsflab__ats2plpre_intrange_loop2_58:
  $tmp97 = ats2plpre_lt_int0_int0($a2rg2, $a2rg3);
  if($tmp97) {
    $tmp98 = &{$a2rg4->[0]}($a2rg4, $a2rg0, $a2rg2);
    if($tmp98) {
      $tmp99 = ats2plpre_add_int0_int0($a2rg2, 1);
      #ATStailcalseq_beg
      $a2py0 = $a2rg0;
      $a2py1 = $a2rg1;
      $a2py2 = $tmp99;
      $a2py3 = $a2rg3;
      $a2py4 = $a2rg4;
      $a2rg0 = $a2py0;
      $a2rg1 = $a2py1;
      $a2rg2 = $a2py2;
      $a2rg3 = $a2py3;
      $a2rg4 = $a2py4;
      goto __patsflab__ats2plpre_intrange_loop2_58;
      #ATStailcalseq_end
    } else {
      $tmpret96 = 0;
    } #endif
  } else {
    $tmp100 = ats2plpre_add_int0_int0($a2rg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp100;
    $apy1 = $a2rg1;
    $apy2 = $env0;
    $apy3 = $env1;
    $apy4 = $a2rg4;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    $arg4 = $apy4;
    goto __patsflab__ats2plpre_intrange_loop1_57;
    #ATStailcalseq_end
  } #endif
  return $tmpret96;
} #end-of-function


sub
ats2plpre_intrange2_foreach_cloref($$$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3, $arg4) = @_;
##
##
  __patsflab_intrange2_foreach_cloref:
  _ats2plpre_intrange_loop1_60($arg2, $arg3, $arg0, $arg1, $arg2, $arg3, $arg4);
  return;#_void
} #end-of-function


sub
_ats2plpre_intrange_loop1_60($$$$$$$)
{
##
  my($env0, $env1, $arg0, $arg1, $arg2, $arg3, $arg4) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $apy3;
  my $apy4;
  my $tmp103;
  my $a2rg0;
  my $a2rg1;
  my $a2rg2;
  my $a2rg3;
  my $a2rg4;
  my $a2py0;
  my $a2py1;
  my $a2py2;
  my $a2py3;
  my $a2py4;
  my $tmp105;
  my $tmp107;
  my $tmp108;
##
  __patsflab__ats2plpre_intrange_loop1_60:
  $tmp103 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp103) {
    #ATStailcalseq_beg
    $a2py0 = $arg0;
    $a2py1 = $arg1;
    $a2py2 = $arg2;
    $a2py3 = $arg3;
    $a2py4 = $arg4;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2plpre_intrange_loop2_61;
    #ATStailcalseq_end
  } else {
    #ATSINSmove_void;
  } #endif
  return;#_void
##
  __patsflab__ats2plpre_intrange_loop2_61:
  $tmp105 = ats2plpre_lt_int0_int0($a2rg2, $a2rg3);
  if($tmp105) {
    &{$a2rg4->[0]}($a2rg4, $a2rg0, $a2rg2);
    $tmp107 = ats2plpre_add_int0_int0($a2rg2, 1);
    #ATStailcalseq_beg
    $a2py0 = $a2rg0;
    $a2py1 = $a2rg1;
    $a2py2 = $tmp107;
    $a2py3 = $a2rg3;
    $a2py4 = $a2rg4;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2plpre_intrange_loop2_61;
    #ATStailcalseq_end
  } else {
    $tmp108 = ats2plpre_succ_int0($a2rg0);
    #ATStailcalseq_beg
    $apy0 = $tmp108;
    $apy1 = $a2rg1;
    $apy2 = $env0;
    $apy3 = $env1;
    $apy4 = $a2rg4;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    $arg4 = $apy4;
    goto __patsflab__ats2plpre_intrange_loop1_60;
    #ATStailcalseq_end
  } #endif
  return;#_void
} #end-of-function


######
#ATSextcode_beg()
######
######
1; ##note that it is needed by 'use' or 'require'
######
######
#ATSextcode_end()
######
######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-4-11: 16h:58m
##
######

sub
ats2plpre_ref($)
{
##
  my($arg0) = @_;
##
  my $tmpret0;
##
  __patsflab_ref:
  $tmpret0 = ats2plpre_ref_make_elt($arg0);
  return $tmpret0;
} #end-of-function


sub
ats2plpre_ref_make_elt($)
{
##
  my($arg0) = @_;
##
  my $tmpret1;
  my $tmp2;
##
  __patsflab_ref_make_elt:
  $tmp2 = ats2plpre_PLarray_sing($arg0);
  $tmpret1 = $tmp2;
  return $tmpret1;
} #end-of-function


sub
ats2plpre_ref_get_elt($)
{
##
  my($arg0) = @_;
##
  my $tmpret3;
##
  __patsflab_ref_get_elt:
  $tmpret3 = ats2plpre_PLarray_get_at($arg0, 0);
  return $tmpret3;
} #end-of-function


sub
ats2plpre_ref_set_elt($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_ref_set_elt:
  ats2plpre_PLarray_set_at($arg0, 0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_ref_exch_elt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret5;
  my $tmp6;
##
  __patsflab_ref_exch_elt:
  $tmp6 = ats2plpre_PLarray_get_at($arg0, 0);
  ats2plpre_PLarray_set_at($arg0, 0, $arg1);
  $tmpret5 = $tmp6;
  return $tmpret5;
} #end-of-function

######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-4-11: 16h:58m
##
######

sub
slistref_make_nil()
{
##
  #argless
##
  my $tmpret0;
  my $tmp1;
##
  __patsflab_slistref_make_nil:
  $tmp1 = 0;
  $tmpret0 = ats2plpre_ref($tmp1);
  return $tmpret0;
} #end-of-function


sub
slistref_length($)
{
##
  my($arg0) = @_;
##
  my $tmpret2;
  my $tmp3;
##
  __patsflab_slistref_length:
  $tmp3 = ats2plpre_ref_get_elt($arg0);
  $tmpret2 = ats2plpre_list_length($tmp3);
  return $tmpret2;
} #end-of-function


sub
slistref_push($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmp5;
  my $tmp6;
##
  __patsflab_slistref_push:
  $tmp6 = ats2plpre_ref_get_elt($arg0);
  $tmp5 = [$arg1, $tmp6];
  ats2plpre_ref_set_elt($arg0, $tmp5);
  return;#_void
} #end-of-function


sub
slistref_pop_opt($)
{
##
  my($arg0) = @_;
##
  my $tmpret7;
  my $tmp8;
  my $tmp9;
  my $tmp10;
##
  __patsflab_slistref_pop_opt:
  $tmp8 = ats2plpre_ref_get_elt($arg0);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab0:
    if(ATSCKptriscons($tmp8)) { goto __atstmplab3; }
    __atstmplab1:
    $tmpret7 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab2:
    __atstmplab3:
    $tmp9 = $tmp8->[0];
    $tmp10 = $tmp8->[1];
    ats2plpre_ref_set_elt($arg0, $tmp10);
    $tmpret7 = [$tmp9];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret7;
} #end-of-function


sub
slistref_foldleft($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret12;
  my $tmp13;
##
  __patsflab_slistref_foldleft:
  $tmp13 = ats2plpre_ref_get_elt($arg0);
  $tmpret12 = ats2plpre_list_foldleft($tmp13, $arg1, $arg2);
  return $tmpret12;
} #end-of-function


sub
slistref_foldright($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret14;
  my $tmp15;
##
  __patsflab_slistref_foldright:
  $tmp15 = ats2plpre_ref_get_elt($arg0);
  $tmpret14 = ats2plpre_list_foldright($tmp15, $arg1, $arg2);
  return $tmpret14;
} #end-of-function

######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-4-11: 16h:58m
##
######

sub
ats2plpre_qlistref_make_nil()
{
##
  #argless
##
  my $tmpret0;
  my $tmp1;
  my $tmp2;
  my $tmp3;
  my $tmp4;
##
  __patsflab_qlistref_make_nil:
  $tmp2 = 0;
  $tmp1 = ats2plpre_ref($tmp2);
  $tmp4 = 0;
  $tmp3 = ats2plpre_ref($tmp4);
  $tmpret0 = [$tmp1, $tmp3];
  return $tmpret0;
} #end-of-function


sub
ats2plpre_qlistref_length($)
{
##
  my($arg0) = @_;
##
  my $tmpret5;
  my $tmp6;
  my $tmp7;
  my $tmp8;
  my $tmp9;
  my $tmp10;
  my $tmp11;
##
  __patsflab_qlistref_length:
  $tmp6 = $arg0->[0];
  $tmp7 = $arg0->[1];
  $tmp9 = ats2plpre_ref_get_elt($tmp6);
  $tmp8 = ats2plpre_list_length($tmp9);
  $tmp11 = ats2plpre_ref_get_elt($tmp7);
  $tmp10 = ats2plpre_list_length($tmp11);
  $tmpret5 = ats2plpre_add_int1_int1($tmp8, $tmp10);
  return $tmpret5;
} #end-of-function


sub
ats2plpre_qlistref_enqueue($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmp13;
  my $tmp14;
  my $tmp15;
  my $tmp16;
##
  __patsflab_qlistref_enqueue:
  $tmp13 = $arg0->[0];
  $tmp14 = $arg0->[1];
  $tmp16 = ats2plpre_ref_get_elt($tmp13);
  $tmp15 = [$arg1, $tmp16];
  ats2plpre_ref_set_elt($tmp13, $tmp15);
  return;#_void
} #end-of-function


sub
ats2plpre_qlistref_dequeue_opt($)
{
##
  my($arg0) = @_;
##
  my $tmpret17;
  my $tmp18;
  my $tmp19;
  my $tmp20;
  my $tmp21;
  my $tmp22;
  my $tmp23;
  my $tmp25;
  my $tmp26;
  my $tmp27;
##
  __patsflab_qlistref_dequeue_opt:
  $tmp18 = $arg0->[0];
  $tmp19 = $arg0->[1];
  $tmp20 = ats2plpre_ref_get_elt($tmp19);
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab0:
    if(ATSCKptriscons($tmp20)) { goto __atstmplab3; }
    __atstmplab1:
    $tmp23 = ats2plpre_ref_get_elt($tmp18);
    $tmp25 = 0;
    ats2plpre_ref_set_elt($tmp18, $tmp25);
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab4:
      if(ATSCKptriscons($tmp23)) { goto __atstmplab7; }
      __atstmplab5:
      $tmpret17 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab6:
      __atstmplab7:
      $tmp26 = $tmp23->[0];
      $tmp27 = $tmp23->[1];
      ats2plpre_ref_set_elt($tmp19, $tmp27);
      $tmpret17 = [$tmp26];
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab2:
    __atstmplab3:
    $tmp21 = $tmp20->[0];
    $tmp22 = $tmp20->[1];
    ats2plpre_ref_set_elt($tmp19, $tmp22);
    $tmpret17 = [$tmp21];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret17;
} #end-of-function


sub
ats2plpre_qlistref_foldleft($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret30;
  my $tmp31;
  my $tmp32;
  my $tmp41;
  my $tmp42;
  my $tmp43;
##
  __patsflab_qlistref_foldleft:
  $tmp31 = $arg0->[0];
  $tmp32 = $arg0->[1];
  $tmp41 = ats2plpre_ref_get_elt($tmp31);
  $tmp43 = ats2plpre_ref_get_elt($tmp32);
  $tmp42 = _ats2plpre_qlistref_auxl_5($arg2, $arg1, $tmp43);
  $tmpret30 = _ats2plpre_qlistref_auxr_6($arg2, $tmp41, $tmp42);
  return $tmpret30;
} #end-of-function


sub
_ats2plpre_qlistref_auxl_5($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret33;
  my $tmp34;
  my $tmp35;
  my $tmp36;
##
  __patsflab__ats2plpre_qlistref_auxl_5:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab8:
    if(ATSCKptriscons($arg1)) { goto __atstmplab11; }
    __atstmplab9:
    $tmpret33 = $arg0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab10:
    __atstmplab11:
    $tmp34 = $arg1->[0];
    $tmp35 = $arg1->[1];
    $tmp36 = &{$env0->[0]}($env0, $arg0, $tmp34);
    #ATStailcalseq_beg
    $apy0 = $tmp36;
    $apy1 = $tmp35;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_qlistref_auxl_5;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret33;
} #end-of-function


sub
_ats2plpre_qlistref_auxr_6($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $tmpret37;
  my $tmp38;
  my $tmp39;
  my $tmp40;
##
  __patsflab__ats2plpre_qlistref_auxr_6:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab12:
    if(ATSCKptriscons($arg0)) { goto __atstmplab15; }
    __atstmplab13:
    $tmpret37 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab14:
    __atstmplab15:
    $tmp38 = $arg0->[0];
    $tmp39 = $arg0->[1];
    $tmp40 = _ats2plpre_qlistref_auxr_6($env0, $tmp39, $arg1);
    $tmpret37 = &{$env0->[0]}($env0, $tmp40, $tmp38);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret37;
} #end-of-function


sub
ats2plpre_qlistref_foldright($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret44;
  my $tmp45;
  my $tmp46;
  my $tmp55;
  my $tmp56;
  my $tmp57;
##
  __patsflab_qlistref_foldright:
  $tmp45 = $arg0->[0];
  $tmp46 = $arg0->[1];
  $tmp55 = ats2plpre_ref_get_elt($tmp46);
  $tmp57 = ats2plpre_ref_get_elt($tmp45);
  $tmp56 = _ats2plpre_qlistref_auxl_8($arg1, $arg2, $tmp57);
  $tmpret44 = _ats2plpre_qlistref_auxr_9($arg1, $tmp55, $tmp56);
  return $tmpret44;
} #end-of-function


sub
_ats2plpre_qlistref_auxl_8($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret47;
  my $tmp48;
  my $tmp49;
  my $tmp50;
##
  __patsflab__ats2plpre_qlistref_auxl_8:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab16:
    if(ATSCKptriscons($arg1)) { goto __atstmplab19; }
    __atstmplab17:
    $tmpret47 = $arg0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab18:
    __atstmplab19:
    $tmp48 = $arg1->[0];
    $tmp49 = $arg1->[1];
    $tmp50 = &{$env0->[0]}($env0, $tmp48, $arg0);
    #ATStailcalseq_beg
    $apy0 = $tmp50;
    $apy1 = $tmp49;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_qlistref_auxl_8;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret47;
} #end-of-function


sub
_ats2plpre_qlistref_auxr_9($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $tmpret51;
  my $tmp52;
  my $tmp53;
  my $tmp54;
##
  __patsflab__ats2plpre_qlistref_auxr_9:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab20:
    if(ATSCKptriscons($arg0)) { goto __atstmplab23; }
    __atstmplab21:
    $tmpret51 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab22:
    __atstmplab23:
    $tmp52 = $arg0->[0];
    $tmp53 = $arg0->[1];
    $tmp54 = _ats2plpre_qlistref_auxr_9($env0, $tmp53, $arg1);
    $tmpret51 = &{$env0->[0]}($env0, $tmp52, $tmp54);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret51;
} #end-of-function

######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-4-11: 16h:58m
##
######
sub
_ats2plpre_ML_list0_patsfun_29__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_29($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_32__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_32($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_35__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_35($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_38__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_38($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_42__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_42($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_45__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_45($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_48__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_48($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_51__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_51($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_54__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_54($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_58__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_58($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_list0_patsfun_64__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_list0_patsfun_64($cenv->[1], $cenv->[2], $arg0); }, $env0, $env1];
}


sub
ats2plpre_ML_list0_head_opt($)
{
##
  my($arg0) = @_;
##
  my $tmpret7;
  my $tmp8;
##
  __patsflab_list0_head_opt:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab6:
    if(ATSCKptriscons($arg0)) { goto __atstmplab9; }
    __atstmplab7:
    $tmpret7 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab8:
    __atstmplab9:
    $tmp8 = $arg0->[0];
    $tmpret7 = [$tmp8];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret7;
} #end-of-function


sub
ats2plpre_ML_list0_tail_opt($)
{
##
  my($arg0) = @_;
##
  my $tmpret10;
  my $tmp12;
##
  __patsflab_list0_tail_opt:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab10:
    if(ATSCKptriscons($arg0)) { goto __atstmplab13; }
    __atstmplab11:
    $tmpret10 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab12:
    __atstmplab13:
    $tmp12 = $arg0->[1];
    $tmpret10 = [$tmp12];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret10;
} #end-of-function


sub
ats2plpre_ML_list0_length($)
{
##
  my($arg0) = @_;
##
  my $tmpret13;
##
  __patsflab_list0_length:
  $tmpret13 = ats2plpre_list_length($arg0);
  return $tmpret13;
} #end-of-function


sub
ats2plpre_ML_list0_last_opt($)
{
##
  my($arg0) = @_;
##
  my $tmpret14;
  my $tmp18;
  my $tmp19;
  my $tmp20;
##
  __patsflab_list0_last_opt:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab18:
    if(ATSCKptriscons($arg0)) { goto __atstmplab21; }
    __atstmplab19:
    $tmpret14 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab20:
    __atstmplab21:
    $tmp18 = $arg0->[0];
    $tmp19 = $arg0->[1];
    $tmp20 = _ats2plpre_ML_list0_loop_8($tmp18, $tmp19);
    $tmpret14 = [$tmp20];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret14;
} #end-of-function


sub
_ats2plpre_ML_list0_loop_8($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret15;
  my $tmp16;
  my $tmp17;
##
  __patsflab__ats2plpre_ML_list0_loop_8:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab14:
    if(ATSCKptriscons($arg1)) { goto __atstmplab17; }
    __atstmplab15:
    $tmpret15 = $arg0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab16:
    __atstmplab17:
    $tmp16 = $arg1->[0];
    $tmp17 = $arg1->[1];
    #ATStailcalseq_beg
    $apy0 = $tmp16;
    $apy1 = $tmp17;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_ML_list0_loop_8;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret15;
} #end-of-function


sub
ats2plpre_ML_list0_get_at_opt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret21;
  my $tmp22;
  my $tmp23;
  my $tmp24;
  my $tmp25;
##
  __patsflab_list0_get_at_opt:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab22:
    if(ATSCKptriscons($arg0)) { goto __atstmplab25; }
    __atstmplab23:
    $tmpret21 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab24:
    __atstmplab25:
    $tmp22 = $arg0->[0];
    $tmp23 = $arg0->[1];
    $tmp24 = ats2plpre_gt_int1_int1($arg1, 0);
    if($tmp24) {
      $tmp25 = ats2plpre_sub_int1_int1($arg1, 1);
      #ATStailcalseq_beg
      $apy0 = $tmp23;
      $apy1 = $tmp25;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab_list0_get_at_opt;
      #ATStailcalseq_end
    } else {
      $tmpret21 = [$tmp22];
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret21;
} #end-of-function


sub
ats2plpre_ML_list0_make_elt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret26;
  my $tmp27;
  my $tmp28;
##
  __patsflab_list0_make_elt:
  $tmp27 = ats2plpre_gte_int1_int1($arg0, 0);
  if($tmp27) {
    $tmp28 = ats2plpre_list_make_elt($arg0, $arg1);
    $tmpret26 = $tmp28;
  } else {
    $tmpret26 = 0;
  } #endif
  return $tmpret26;
} #end-of-function


sub
ats2plpre_ML_list0_make_intrange_2($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret29;
  my $tmp30;
##
  __patsflab_list0_make_intrange_2:
  $tmp30 = ats2plpre_list_make_intrange_2($arg0, $arg1);
  $tmpret29 = $tmp30;
  return $tmpret29;
} #end-of-function


sub
ats2plpre_ML_list0_make_intrange_3($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret31;
  my $tmp32;
##
  __patsflab_list0_make_intrange_3:
  $tmp32 = ats2plpre_list_make_intrange_3($arg0, $arg1, $arg2);
  $tmpret31 = $tmp32;
  return $tmpret31;
} #end-of-function


sub
ats2plpre_ML_list0_snoc($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret44;
  my $tmp45;
##
  __patsflab_list0_snoc:
  $tmp45 = ats2plpre_list_snoc($arg0, $arg1);
  $tmpret44 = $tmp45;
  return $tmpret44;
} #end-of-function


sub
ats2plpre_ML_list0_extend($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret46;
  my $tmp47;
##
  __patsflab_list0_extend:
  $tmp47 = ats2plpre_list_extend($arg0, $arg1);
  $tmpret46 = $tmp47;
  return $tmpret46;
} #end-of-function


sub
ats2plpre_ML_list0_append($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret48;
  my $tmp49;
##
  __patsflab_list0_append:
  $tmp49 = ats2plpre_list_append($arg0, $arg1);
  $tmpret48 = $tmp49;
  return $tmpret48;
} #end-of-function


sub
ats2plpre_ML_mul_int_list0($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret50;
  my $tmp51;
##
  __patsflab_mul_int_list0:
  $tmp51 = ats2plpre_mul_int_list($arg0, $arg1);
  $tmpret50 = $tmp51;
  return $tmpret50;
} #end-of-function


sub
ats2plpre_ML_list0_reverse($)
{
##
  my($arg0) = @_;
##
  my $tmpret52;
  my $tmp53;
##
  __patsflab_list0_reverse:
  $tmp53 = ats2plpre_list_reverse($arg0);
  $tmpret52 = $tmp53;
  return $tmpret52;
} #end-of-function


sub
ats2plpre_ML_list0_reverse_append($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret54;
  my $tmp55;
##
  __patsflab_list0_reverse_append:
  $tmp55 = ats2plpre_list_reverse_append($arg0, $arg1);
  $tmpret54 = $tmp55;
  return $tmpret54;
} #end-of-function


sub
ats2plpre_ML_list0_concat($)
{
##
  my($arg0) = @_;
##
  my $tmpret56;
  my $tmp57;
##
  __patsflab_list0_concat:
  $tmp57 = ats2plpre_list_concat($arg0);
  $tmpret56 = $tmp57;
  return $tmpret56;
} #end-of-function


sub
ats2plpre_ML_list0_remove_at_opt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret58;
##
  __patsflab_list0_remove_at_opt:
  $tmpret58 = _ats2plpre_ML_list0_aux_26($arg0, 0);
  return $tmpret58;
} #end-of-function


sub
_ats2plpre_ML_list0_aux_26($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret59;
  my $tmp60;
  my $tmp61;
  my $tmp62;
  my $tmp63;
  my $tmp64;
  my $tmp65;
  my $tmp66;
##
  __patsflab__ats2plpre_ML_list0_aux_26:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab30:
    if(ATSCKptriscons($arg0)) { goto __atstmplab33; }
    __atstmplab31:
    $tmpret59 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab32:
    __atstmplab33:
    $tmp60 = $arg0->[0];
    $tmp61 = $arg0->[1];
    $tmp62 = ats2plpre_gt_int1_int1($arg1, 0);
    if($tmp62) {
      $tmp64 = ats2plpre_sub_int1_int1($arg1, 1);
      $tmp63 = _ats2plpre_ML_list0_aux_26($tmp61, $tmp64);
      #ATScaseofseq_beg
      while(1)
      {
        #ATSbranchseq_beg
        __atstmplab34:
        if(ATSCKptriscons($tmp63)) { goto __atstmplab37; }
        __atstmplab35:
        $tmpret59 = 0;
        last;
        #ATSbranchseq_end
        #ATSbranchseq_beg
        __atstmplab36:
        __atstmplab37:
        $tmp65 = $tmp63->[0];
        #ATSINSfreecon($tmp63);
        $tmp66 = [$tmp60, $tmp65];
        $tmpret59 = [$tmp66];
        last;
        #ATSbranchseq_end
      } #end-of-while-loop;
      #ATScaseofseq_end
    } else {
      $tmpret59 = [$tmp61];
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret59;
} #end-of-function


sub
ats2plpre_ML_list0_exists($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret67;
##
  __patsflab_list0_exists:
  $tmpret67 = ats2plpre_list_exists($arg0, $arg1);
  return $tmpret67;
} #end-of-function


sub
ats2plpre_ML_list0_exists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret68;
##
  __patsflab_list0_exists_method:
  $tmpret68 = _ats2plpre_ML_list0_patsfun_29__closurerize($arg0);
  return $tmpret68;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_29($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret69;
##
  __patsflab__ats2plpre_ML_list0_patsfun_29:
  $tmpret69 = ats2plpre_ML_list0_exists($env0, $arg0);
  return $tmpret69;
} #end-of-function


sub
ats2plpre_ML_list0_iexists($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret70;
##
  __patsflab_list0_iexists:
  $tmpret70 = ats2plpre_list_iexists($arg0, $arg1);
  return $tmpret70;
} #end-of-function


sub
ats2plpre_ML_list0_iexists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret71;
##
  __patsflab_list0_iexists_method:
  $tmpret71 = _ats2plpre_ML_list0_patsfun_32__closurerize($arg0);
  return $tmpret71;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_32($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret72;
##
  __patsflab__ats2plpre_ML_list0_patsfun_32:
  $tmpret72 = ats2plpre_ML_list0_iexists($env0, $arg0);
  return $tmpret72;
} #end-of-function


sub
ats2plpre_ML_list0_forall($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret73;
##
  __patsflab_list0_forall:
  $tmpret73 = ats2plpre_list_forall($arg0, $arg1);
  return $tmpret73;
} #end-of-function


sub
ats2plpre_ML_list0_forall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret74;
##
  __patsflab_list0_forall_method:
  $tmpret74 = _ats2plpre_ML_list0_patsfun_35__closurerize($arg0);
  return $tmpret74;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_35($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret75;
##
  __patsflab__ats2plpre_ML_list0_patsfun_35:
  $tmpret75 = ats2plpre_ML_list0_forall($env0, $arg0);
  return $tmpret75;
} #end-of-function


sub
ats2plpre_ML_list0_iforall($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret76;
##
  __patsflab_list0_iforall:
  $tmpret76 = ats2plpre_list_iforall($arg0, $arg1);
  return $tmpret76;
} #end-of-function


sub
ats2plpre_ML_list0_iforall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret77;
##
  __patsflab_list0_iforall_method:
  $tmpret77 = _ats2plpre_ML_list0_patsfun_38__closurerize($arg0);
  return $tmpret77;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_38($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret78;
##
  __patsflab__ats2plpre_ML_list0_patsfun_38:
  $tmpret78 = ats2plpre_ML_list0_iforall($env0, $arg0);
  return $tmpret78;
} #end-of-function


sub
ats2plpre_ML_list0_app($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_list0_app:
  ats2plpre_ML_list0_foreach($arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_list0_foreach($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_list0_foreach:
  ats2plpre_list_foreach($arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_list0_foreach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret81;
##
  __patsflab_list0_foreach_method:
  $tmpret81 = _ats2plpre_ML_list0_patsfun_42__closurerize($arg0);
  return $tmpret81;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_42($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_ML_list0_patsfun_42:
  ats2plpre_ML_list0_foreach($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_list0_iforeach($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_list0_iforeach:
  ats2plpre_list_iforeach($arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_list0_iforeach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret84;
##
  __patsflab_list0_iforeach_method:
  $tmpret84 = _ats2plpre_ML_list0_patsfun_45__closurerize($arg0);
  return $tmpret84;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_45($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_ML_list0_patsfun_45:
  ats2plpre_ML_list0_iforeach($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_list0_rforeach($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_list0_rforeach:
  ats2plpre_list_rforeach($arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_list0_rforeach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret87;
##
  __patsflab_list0_rforeach_method:
  $tmpret87 = _ats2plpre_ML_list0_patsfun_48__closurerize($arg0);
  return $tmpret87;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_48($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_ML_list0_patsfun_48:
  ats2plpre_ML_list0_rforeach($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_list0_filter($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret89;
  my $tmp90;
##
  __patsflab_list0_filter:
  $tmp90 = ats2plpre_list_filter($arg0, $arg1);
  $tmpret89 = $tmp90;
  return $tmpret89;
} #end-of-function


sub
ats2plpre_ML_list0_filter_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret91;
##
  __patsflab_list0_filter_method:
  $tmpret91 = _ats2plpre_ML_list0_patsfun_51__closurerize($arg0);
  return $tmpret91;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_51($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret92;
##
  __patsflab__ats2plpre_ML_list0_patsfun_51:
  $tmpret92 = ats2plpre_ML_list0_filter($env0, $arg0);
  return $tmpret92;
} #end-of-function


sub
ats2plpre_ML_list0_map($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret93;
  my $tmp94;
##
  __patsflab_list0_map:
  $tmp94 = ats2plpre_list_map($arg0, $arg1);
  $tmpret93 = $tmp94;
  return $tmpret93;
} #end-of-function


sub
ats2plpre_ML_list0_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret95;
##
  __patsflab_list0_map_method:
  $tmpret95 = _ats2plpre_ML_list0_patsfun_54__closurerize($arg0);
  return $tmpret95;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_54($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret96;
##
  __patsflab__ats2plpre_ML_list0_patsfun_54:
  $tmpret96 = ats2plpre_ML_list0_map($env0, $arg0);
  return $tmpret96;
} #end-of-function


sub
ats2plpre_ML_list0_mapcons($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret97;
  my $tmp98;
  my $tmp99;
  my $tmp100;
  my $tmp101;
##
  __patsflab_list0_mapcons:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab38:
    if(ATSCKptriscons($arg1)) { goto __atstmplab41; }
    __atstmplab39:
    $tmpret97 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab40:
    __atstmplab41:
    $tmp98 = $arg1->[0];
    $tmp99 = $arg1->[1];
    $tmp100 = [$arg0, $tmp98];
    $tmp101 = ats2plpre_ML_list0_mapcons($arg0, $tmp99);
    $tmpret97 = [$tmp100, $tmp101];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret97;
} #end-of-function


sub
ats2plpre_ML_list0_find_opt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret102;
  my $tmp103;
  my $tmp104;
  my $tmp105;
##
  __patsflab_list0_find_opt:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab42:
    if(ATSCKptriscons($arg0)) { goto __atstmplab45; }
    __atstmplab43:
    $tmpret102 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab44:
    __atstmplab45:
    $tmp103 = $arg0->[0];
    $tmp104 = $arg0->[1];
    $tmp105 = &{$arg1->[0]}($arg1, $tmp103);
    if($tmp105) {
      $tmpret102 = [$tmp103];
    } else {
      #ATStailcalseq_beg
      $apy0 = $tmp104;
      $apy1 = $arg1;
      $arg0 = $apy0;
      $arg1 = $apy1;
      goto __patsflab_list0_find_opt;
      #ATStailcalseq_end
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret102;
} #end-of-function


sub
ats2plpre_ML_list0_find_opt_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret106;
##
  __patsflab_list0_find_opt_method:
  $tmpret106 = _ats2plpre_ML_list0_patsfun_58__closurerize($arg0);
  return $tmpret106;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_58($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret107;
##
  __patsflab__ats2plpre_ML_list0_patsfun_58:
  $tmpret107 = ats2plpre_ML_list0_find_opt($env0, $arg0);
  return $tmpret107;
} #end-of-function


sub
ats2plpre_ML_list0_zip($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret108;
##
  __patsflab_list0_zip:
  $tmpret108 = _ats2plpre_ML_list0_aux_60($arg0, $arg1);
  return $tmpret108;
} #end-of-function


sub
_ats2plpre_ML_list0_aux_60($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret109;
  my $tmp110;
  my $tmp111;
  my $tmp112;
  my $tmp113;
  my $tmp114;
  my $tmp115;
##
  __patsflab__ats2plpre_ML_list0_aux_60:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab46:
    if(ATSCKptriscons($arg0)) { goto __atstmplab49; }
    __atstmplab47:
    $tmpret109 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab48:
    __atstmplab49:
    $tmp110 = $arg0->[0];
    $tmp111 = $arg0->[1];
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab50:
      if(ATSCKptriscons($arg1)) { goto __atstmplab53; }
      __atstmplab51:
      $tmpret109 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab52:
      __atstmplab53:
      $tmp112 = $arg1->[0];
      $tmp113 = $arg1->[1];
      $tmp114 = [$tmp110, $tmp112];
      $tmp115 = _ats2plpre_ML_list0_aux_60($tmp111, $tmp113);
      $tmpret109 = [$tmp114, $tmp115];
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret109;
} #end-of-function


sub
ats2plpre_ML_list0_zipwith($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret116;
##
  __patsflab_list0_zipwith:
  $tmpret116 = _ats2plpre_ML_list0_aux_62($arg0, $arg1, $arg2);
  return $tmpret116;
} #end-of-function


sub
_ats2plpre_ML_list0_aux_62($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret117;
  my $tmp118;
  my $tmp119;
  my $tmp120;
  my $tmp121;
  my $tmp122;
  my $tmp123;
##
  __patsflab__ats2plpre_ML_list0_aux_62:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab54:
    if(ATSCKptriscons($arg0)) { goto __atstmplab57; }
    __atstmplab55:
    $tmpret117 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab56:
    __atstmplab57:
    $tmp118 = $arg0->[0];
    $tmp119 = $arg0->[1];
    #ATScaseofseq_beg
    while(1)
    {
      #ATSbranchseq_beg
      __atstmplab58:
      if(ATSCKptriscons($arg1)) { goto __atstmplab61; }
      __atstmplab59:
      $tmpret117 = 0;
      last;
      #ATSbranchseq_end
      #ATSbranchseq_beg
      __atstmplab60:
      __atstmplab61:
      $tmp120 = $arg1->[0];
      $tmp121 = $arg1->[1];
      $tmp122 = &{$arg2->[0]}($arg2, $tmp118, $tmp120);
      $tmp123 = _ats2plpre_ML_list0_aux_62($tmp119, $tmp121, $arg2);
      $tmpret117 = [$tmp122, $tmp123];
      last;
      #ATSbranchseq_end
    } #end-of-while-loop;
    #ATScaseofseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret117;
} #end-of-function


sub
ats2plpre_ML_list0_zipwith_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret124;
##
  __patsflab_list0_zipwith_method:
  $tmpret124 = _ats2plpre_ML_list0_patsfun_64__closurerize($arg0, $arg1);
  return $tmpret124;
} #end-of-function


sub
_ats2plpre_ML_list0_patsfun_64($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret125;
##
  __patsflab__ats2plpre_ML_list0_patsfun_64:
  $tmpret125 = ats2plpre_ML_list0_zipwith($env0, $env1, $arg0);
  return $tmpret125;
} #end-of-function


sub
ats2plpre_ML_list0_foldleft($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret126;
##
  __patsflab_list0_foldleft:
  $tmpret126 = _ats2plpre_ML_list0_aux_66($arg2, $arg1, $arg0);
  return $tmpret126;
} #end-of-function


sub
_ats2plpre_ML_list0_aux_66($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret127;
  my $tmp128;
  my $tmp129;
  my $tmp130;
##
  __patsflab__ats2plpre_ML_list0_aux_66:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab62:
    if(ATSCKptriscons($arg1)) { goto __atstmplab65; }
    __atstmplab63:
    $tmpret127 = $arg0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab64:
    __atstmplab65:
    $tmp128 = $arg1->[0];
    $tmp129 = $arg1->[1];
    $tmp130 = &{$env0->[0]}($env0, $arg0, $tmp128);
    #ATStailcalseq_beg
    $apy0 = $tmp130;
    $apy1 = $tmp129;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_ML_list0_aux_66;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret127;
} #end-of-function


sub
ats2plpre_ML_list0_foldright($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret131;
##
  __patsflab_list0_foldright:
  $tmpret131 = _ats2plpre_ML_list0_aux_68($arg1, $arg2, $arg0, $arg2);
  return $tmpret131;
} #end-of-function


sub
_ats2plpre_ML_list0_aux_68($$$$)
{
##
  my($env0, $env1, $arg0, $arg1) = @_;
##
  my $tmpret132;
  my $tmp133;
  my $tmp134;
  my $tmp135;
##
  __patsflab__ats2plpre_ML_list0_aux_68:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab66:
    if(ATSCKptriscons($arg0)) { goto __atstmplab69; }
    __atstmplab67:
    $tmpret132 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab68:
    __atstmplab69:
    $tmp133 = $arg0->[0];
    $tmp134 = $arg0->[1];
    $tmp135 = _ats2plpre_ML_list0_aux_68($env0, $env1, $tmp134, $env1);
    $tmpret132 = &{$env0->[0]}($env0, $tmp133, $tmp135);
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret132;
} #end-of-function


sub
ats2plpre_ML_list0_sort_2($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret138;
  my $tmp139;
##
  __patsflab_list0_sort_2:
  $tmp139 = ats2plpre_list_sort_2($arg0, $arg1);
  $tmpret138 = $tmp139;
  return $tmpret138;
} #end-of-function


sub
ats2plpre_ML_streamize_list0_zip($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret140;
##
  __patsflab_streamize_list0_zip:
  $tmpret140 = ats2plpre_streamize_list_zip($arg0, $arg1);
  return $tmpret140;
} #end-of-function


sub
ats2plpre_ML_streamize_list0_cross($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret141;
##
  __patsflab_streamize_list0_cross:
  $tmpret141 = ats2plpre_streamize_list_cross($arg0, $arg1);
  return $tmpret141;
} #end-of-function

######
##
## end-of-compilation-unit
##
######
######
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2017-4-11: 16h:58m
##
######
sub
_ats2plpre_ML_array0_patsfun_7__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_array0_patsfun_7($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_array0_patsfun_10__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_array0_patsfun_10($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_ML_array0_patsfun_14__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_ML_array0_patsfun_14($cenv->[1], $arg0); }, $env0];
}


sub
ats2plpre_ML_array0_make_elt($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret0;
##
  __patsflab_array0_make_elt:
  $tmpret0 = ats2plpre_arrszref_make_elt($arg0, $arg1);
  return $tmpret0;
} #end-of-function


sub
ats2plpre_ML_array0_size($)
{
##
  my($arg0) = @_;
##
  my $tmpret1;
##
  __patsflab_array0_size:
  $tmpret1 = ats2plpre_arrszref_size($arg0);
  return $tmpret1;
} #end-of-function


sub
ats2plpre_ML_array0_get_at($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret2;
##
  __patsflab_array0_get_at:
  $tmpret2 = ats2plpre_arrszref_get_at($arg0, $arg1);
  return $tmpret2;
} #end-of-function


sub
ats2plpre_ML_array0_set_at($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
##
  __patsflab_array0_set_at:
  ats2plpre_arrszref_set_at($arg0, $arg1, $arg2);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_array0_exch_at($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret4;
##
  __patsflab_array0_exch_at:
  $tmpret4 = ats2plpre_arrszref_exch_at($arg0, $arg1, $arg2);
  return $tmpret4;
} #end-of-function


sub
ats2plpre_ML_array0_exists_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret5;
##
  __patsflab_array0_exists_cloref:
  $tmpret5 = ats2plpre_arrszref_exists_cloref($arg0, $arg1);
  return $tmpret5;
} #end-of-function


sub
ats2plpre_ML_array0_exists_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret6;
##
  __patsflab_array0_exists_method:
  $tmpret6 = _ats2plpre_ML_array0_patsfun_7__closurerize($arg0);
  return $tmpret6;
} #end-of-function


sub
_ats2plpre_ML_array0_patsfun_7($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret7;
##
  __patsflab__ats2plpre_ML_array0_patsfun_7:
  $tmpret7 = ats2plpre_ML_array0_exists_cloref($env0, $arg0);
  return $tmpret7;
} #end-of-function


sub
ats2plpre_ML_array0_forall_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret8;
##
  __patsflab_array0_forall_cloref:
  $tmpret8 = ats2plpre_arrszref_forall_cloref($arg0, $arg1);
  return $tmpret8;
} #end-of-function


sub
ats2plpre_ML_array0_forall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret9;
##
  __patsflab_array0_forall_method:
  $tmpret9 = _ats2plpre_ML_array0_patsfun_10__closurerize($arg0);
  return $tmpret9;
} #end-of-function


sub
_ats2plpre_ML_array0_patsfun_10($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret10;
##
  __patsflab__ats2plpre_ML_array0_patsfun_10:
  $tmpret10 = ats2plpre_ML_array0_forall_cloref($env0, $arg0);
  return $tmpret10;
} #end-of-function


sub
ats2plpre_ML_array0_app_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_array0_app_cloref:
  ats2plpre_ML_array0_foreach_cloref($arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_array0_foreach_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
##
  __patsflab_array0_foreach_cloref:
  ats2plpre_arrszref_foreach_cloref($arg0, $arg1);
  return;#_void
} #end-of-function


sub
ats2plpre_ML_array0_foreach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret13;
##
  __patsflab_array0_foreach_method:
  $tmpret13 = _ats2plpre_ML_array0_patsfun_14__closurerize($arg0);
  return $tmpret13;
} #end-of-function


sub
_ats2plpre_ML_array0_patsfun_14($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_ML_array0_patsfun_14:
  ats2plpre_ML_array0_foreach_cloref($env0, $arg0);
  return;#_void
} #end-of-function

######
##
## end-of-compilation-unit
##
######

## ###### ###### ##

## end of [libatscc2pl_all.pl] ##

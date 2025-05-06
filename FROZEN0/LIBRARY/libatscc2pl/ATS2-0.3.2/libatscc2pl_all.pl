######
#
# Time of Generation:
# Tue Jul 14 01:04:34 EDT 2015
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
ATSPMVempty() { return; }
#
############################################

=for comment
sub
ATSPMVlazyval_make($) { return [0, $_[0]]; }
=cut

############################################

sub
ATSPMVlazyval_eval($)
{
#
  my($lazyval) = @_;
  my $flag;
  my $thunk;
#
  $flag = $lazyval->[0];
#
  if($flag==0)
  {
    $lazyval->[0] = 1;
    $thunk = $lazyval->[1];
    $lazyval->[1] = &{$thunk->[0]}($thunk);
  } else {
    $lazyval->[0] = $flag + 1;
  } #end-of-[if]
  return;
#
} #end-of-[ATSPMVlazyval_eval]

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

sub
ats2plpre_add_int1_int1($$) { return ($_[0] + $_[1]); }
sub
ats2plpre_sub_int1_int1($$) { return ($_[0] - $_[1]); }
sub
ats2plpre_mul_int1_int1($$) { return ($_[0] * $_[1]); }
sub
ats2plpre_div_int1_int1($$) { return int($_[0] / $_[1]); }

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
##
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2015-7-14:  1h: 4m
##
##

sub
ats2plpre_list_make_intrange_2($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret0;
##
  __patsflab_list_make_intrange_2:
  $tmpret0 = ats2plpre_list_make_intrange_3($arg0, $arg1, 1);
  return $tmpret0;
} #end-of-function


sub
ats2plpre_list_make_intrange_3($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret1;
  my $tmp12;
  my $tmp13;
  my $tmp14;
  my $tmp15;
  my $tmp16;
  my $tmp17;
  my $tmp18;
  my $tmp19;
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
##
  __patsflab_list_make_intrange_3:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab0:
    $tmp12 = ats2plpre_gt_int0_int0($arg2, 0);
    if(!ATSCKpat_bool($tmp12, 1)) { goto __atstmplab1; }
    $tmp13 = ats2plpre_lt_int0_int0($arg0, $arg1);
    if($tmp13) {
      $tmp17 = ats2plpre_sub_int0_int0($arg1, $arg0);
      $tmp16 = ats2plpre_add_int0_int0($tmp17, $arg2);
      $tmp15 = ats2plpre_sub_int0_int0($tmp16, 1);
      $tmp14 = ats2plpre_div_int0_int0($tmp15, $arg2);
      $tmp20 = ats2plpre_sub_int0_int0($tmp14, 1);
      $tmp19 = ats2plpre_mul_int0_int0($tmp20, $arg2);
      $tmp18 = ats2plpre_add_int0_int0($arg0, $tmp19);
      $tmp21 = 0;
      $tmpret1 = _ats2plpre_list_loop1_2($tmp14, $tmp18, $arg2, $tmp21);
    } else {
      $tmpret1 = 0;
    } #endif
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab1:
    $tmp22 = ats2plpre_lt_int0_int0($arg2, 0);
    if(!ATSCKpat_bool($tmp22, 1)) { goto __atstmplab2; }
    $tmp23 = ats2plpre_gt_int0_int0($arg0, $arg1);
    if($tmp23) {
      $tmp24 = ats2plpre_neg_int0($arg2);
      $tmp28 = ats2plpre_sub_int0_int0($arg0, $arg1);
      $tmp27 = ats2plpre_add_int0_int0($tmp28, $tmp24);
      $tmp26 = ats2plpre_sub_int0_int0($tmp27, 1);
      $tmp25 = ats2plpre_div_int0_int0($tmp26, $tmp24);
      $tmp31 = ats2plpre_sub_int0_int0($tmp25, 1);
      $tmp30 = ats2plpre_mul_int0_int0($tmp31, $tmp24);
      $tmp29 = ats2plpre_sub_int0_int0($arg0, $tmp30);
      $tmp32 = 0;
      $tmpret1 = _ats2plpre_list_loop2_3($tmp25, $tmp29, $tmp24, $tmp32);
    } else {
      $tmpret1 = 0;
    } #endif
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab2:
    $tmpret1 = 0;
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret1;
} #end-of-function


sub
_ats2plpre_list_loop1_2($$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $apy3;
  my $tmpret2;
  my $tmp3;
  my $tmp4;
  my $tmp5;
  my $tmp6;
##
  __patsflab__ats2plpre_list_loop1_2:
  $tmp3 = ats2plpre_gt_int0_int0($arg0, 0);
  if($tmp3) {
    $tmp4 = ats2plpre_sub_int0_int0($arg0, 1);
    $tmp5 = ats2plpre_sub_int0_int0($arg1, $arg2);
    $tmp6 = [$arg1, $arg3];
    #ATStailcalseq_beg
    $apy0 = $tmp4;
    $apy1 = $tmp5;
    $apy2 = $arg2;
    $apy3 = $tmp6;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    goto __patsflab__ats2plpre_list_loop1_2;
    #ATStailcalseq_end
  } else {
    $tmpret2 = $arg3;
  } #endif
  return $tmpret2;
} #end-of-function


sub
_ats2plpre_list_loop2_3($$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $apy3;
  my $tmpret7;
  my $tmp8;
  my $tmp9;
  my $tmp10;
  my $tmp11;
##
  __patsflab__ats2plpre_list_loop2_3:
  $tmp8 = ats2plpre_gt_int0_int0($arg0, 0);
  if($tmp8) {
    $tmp9 = ats2plpre_sub_int0_int0($arg0, 1);
    $tmp10 = ats2plpre_add_int0_int0($arg1, $arg2);
    $tmp11 = [$arg1, $arg3];
    #ATStailcalseq_beg
    $apy0 = $tmp9;
    $apy1 = $tmp10;
    $apy2 = $arg2;
    $apy3 = $tmp11;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    goto __patsflab__ats2plpre_list_loop2_3;
    #ATStailcalseq_end
  } else {
    $tmpret7 = $arg3;
  } #endif
  return $tmpret7;
} #end-of-function


sub
ats2plpre_list_length($)
{
##
  my($arg0) = @_;
##
  my $tmpret44;
##
  __patsflab_list_length:
  $tmpret44 = _ats2plpre_list_loop_10($arg0, 0);
  return $tmpret44;
} #end-of-function


sub
_ats2plpre_list_loop_10($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret45;
  my $tmp47;
  my $tmp48;
##
  __patsflab__ats2plpre_list_loop_10:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab7:
    if(ATSCKptriscons($arg0)) { goto __atstmplab10; }
    __atstmplab8:
    $tmpret45 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab9:
    __atstmplab10:
    $tmp47 = $arg0->[1];
    $tmp48 = ats2plpre_add_int1_int1($arg1, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp47;
    $apy1 = $tmp48;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_list_loop_10;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret45;
} #end-of-function


sub
ats2plpre_list_get_at($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret49;
  my $tmp50;
  my $tmp51;
  my $tmp52;
  my $tmp53;
##
  __patsflab_list_get_at:
  $tmp50 = ats2plpre_eq_int1_int1($arg1, 0);
  if($tmp50) {
    $tmp51 = $arg0->[0];
    $tmpret49 = $tmp51;
  } else {
    $tmp52 = $arg0->[1];
    $tmp53 = ats2plpre_sub_int1_int1($arg1, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp52;
    $apy1 = $tmp53;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab_list_get_at;
    #ATStailcalseq_end
  } #endif
  return $tmpret49;
} #end-of-function


sub
ats2plpre_list_append($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret54;
  my $tmp55;
  my $tmp56;
  my $tmp57;
##
  __patsflab_list_append:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab11:
    if(ATSCKptriscons($arg0)) { goto __atstmplab14; }
    __atstmplab12:
    $tmpret54 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab13:
    __atstmplab14:
    $tmp55 = $arg0->[0];
    $tmp56 = $arg0->[1];
    $tmp57 = ats2plpre_list_append($tmp56, $arg1);
    $tmpret54 = [$tmp55, $tmp57];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret54;
} #end-of-function


sub
ats2plpre_list_reverse($)
{
##
  my($arg0) = @_;
##
  my $tmpret58;
  my $tmp59;
##
  __patsflab_list_reverse:
  $tmp59 = 0;
  $tmpret58 = ats2plpre_list_reverse_append($arg0, $tmp59);
  return $tmpret58;
} #end-of-function


sub
ats2plpre_list_reverse_append($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret60;
##
  __patsflab_list_reverse_append:
  $tmpret60 = _ats2plpre_list_loop_15($arg0, $arg1);
  return $tmpret60;
} #end-of-function


sub
_ats2plpre_list_loop_15($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret61;
  my $tmp62;
  my $tmp63;
  my $tmp64;
##
  __patsflab__ats2plpre_list_loop_15:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab15:
    if(ATSCKptriscons($arg0)) { goto __atstmplab18; }
    __atstmplab16:
    $tmpret61 = $arg1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab17:
    __atstmplab18:
    $tmp62 = $arg0->[0];
    $tmp63 = $arg0->[1];
    $tmp64 = [$tmp62, $arg1];
    #ATStailcalseq_beg
    $apy0 = $tmp63;
    $apy1 = $tmp64;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab__ats2plpre_list_loop_15;
    #ATStailcalseq_end
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret61;
} #end-of-function


sub
ats2plpre_list_take($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret65;
  my $tmp66;
  my $tmp67;
  my $tmp68;
  my $tmp69;
  my $tmp70;
##
  __patsflab_list_take:
  $tmp66 = ats2plpre_gt_int1_int1($arg1, 0);
  if($tmp66) {
    $tmp67 = $arg0->[0];
    $tmp68 = $arg0->[1];
    $tmp70 = ats2plpre_sub_int1_int1($arg1, 1);
    $tmp69 = ats2plpre_list_take($tmp68, $tmp70);
    $tmpret65 = [$tmp67, $tmp69];
  } else {
    $tmpret65 = 0;
  } #endif
  return $tmpret65;
} #end-of-function


sub
ats2plpre_list_drop($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $apy0;
  my $apy1;
  my $tmpret71;
  my $tmp72;
  my $tmp73;
  my $tmp74;
##
  __patsflab_list_drop:
  $tmp72 = ats2plpre_gt_int1_int1($arg1, 0);
  if($tmp72) {
    $tmp73 = $arg0->[1];
    $tmp74 = ats2plpre_sub_int1_int1($arg1, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp73;
    $apy1 = $tmp74;
    $arg0 = $apy0;
    $arg1 = $apy1;
    goto __patsflab_list_drop;
    #ATStailcalseq_end
  } else {
    $tmpret71 = $arg0;
  } #endif
  return $tmpret71;
} #end-of-function


sub
ats2plpre_list_split_at($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret75;
  my $tmp76;
  my $tmp77;
##
  __patsflab_list_split_at:
  $tmp76 = ats2plpre_list_take($arg0, $arg1);
  $tmp77 = ats2plpre_list_drop($arg0, $arg1);
  $tmpret75 = [$tmp76, $tmp77];
  return $tmpret75;
} #end-of-function


sub
ats2plpre_list_insert_at($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret78;
  my $tmp79;
  my $tmp80;
  my $tmp81;
  my $tmp82;
  my $tmp83;
##
  __patsflab_list_insert_at:
  $tmp79 = ats2plpre_gt_int1_int1($arg1, 0);
  if($tmp79) {
    $tmp80 = $arg0->[0];
    $tmp81 = $arg0->[1];
    $tmp83 = ats2plpre_sub_int1_int1($arg1, 1);
    $tmp82 = ats2plpre_list_insert_at($tmp81, $tmp83, $arg2);
    $tmpret78 = [$tmp80, $tmp82];
  } else {
    $tmpret78 = [$arg2, $arg0];
  } #endif
  return $tmpret78;
} #end-of-function


sub
ats2plpre_list_remove_at($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret84;
  my $tmp85;
  my $tmp86;
  my $tmp87;
  my $tmp88;
  my $tmp89;
  my $tmp90;
  my $tmp91;
  my $tmp92;
##
  __patsflab_list_remove_at:
  $tmp85 = $arg0->[0];
  $tmp86 = $arg0->[1];
  $tmp87 = ats2plpre_gt_int1_int1($arg1, 0);
  if($tmp87) {
    $tmp89 = ats2plpre_sub_int1_int1($arg1, 1);
    $tmp88 = ats2plpre_list_remove_at($tmp86, $tmp89);
    $tmp90 = $tmp88->[0];
    $tmp91 = $tmp88->[1];
    $tmp92 = [$tmp85, $tmp91];
    $tmpret84 = [$tmp90, $tmp92];
  } else {
    $tmpret84 = [$tmp85, $tmp86];
  } #endif
  return $tmpret84;
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
  my $tmp95;
  my $tmp96;
##
  __patsflab_list_foreach:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab19:
    if(ATSCKptriscons($arg0)) { goto __atstmplab22; }
    __atstmplab20:
    #ATSINSmove_void;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab21:
    __atstmplab22:
    $tmp95 = $arg0->[0];
    $tmp96 = $arg0->[1];
    &{$arg1->[0]}($arg1, $tmp95);
    #ATStailcalseq_beg
    $apy0 = $tmp96;
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
ats2plpre_list_map($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret98;
  my $tmp99;
  my $tmp100;
  my $tmp101;
  my $tmp102;
##
  __patsflab_list_map:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab23:
    if(ATSCKptriscons($arg0)) { goto __atstmplab26; }
    __atstmplab24:
    $tmpret98 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab25:
    __atstmplab26:
    $tmp99 = $arg0->[0];
    $tmp100 = $arg0->[1];
    $tmp101 = &{$arg1->[0]}($arg1, $tmp99);
    $tmp102 = ats2plpre_list_map($tmp100, $arg1);
    $tmpret98 = [$tmp101, $tmp102];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret98;
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
## end-of-compilation-unit
######
##
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2015-7-14:  1h: 4m
##
##

sub
ats2plpre_option_is_some($)
{
##
  my($arg0) = @_;
##
  my $tmpret0;
##
  __patsflab_option_is_some:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab0:
    if(ATSCKptrisnull($arg0)) { goto __atstmplab3; }
    __atstmplab1:
    $tmpret0 = 1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab2:
    __atstmplab3:
    $tmpret0 = 0;
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret0;
} #end-of-function


sub
ats2plpre_option_is_none($)
{
##
  my($arg0) = @_;
##
  my $tmpret1;
##
  __patsflab_option_is_none:
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab4:
    if(ATSCKptriscons($arg0)) { goto __atstmplab7; }
    __atstmplab5:
    $tmpret1 = 1;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab6:
    __atstmplab7:
    $tmpret1 = 0;
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret1;
} #end-of-function

######
## end-of-compilation-unit
######
##
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2015-7-14:  1h: 4m
##
##
sub
_ats2plpre_stream_patsfun_1__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_1($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_3__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_3($cenv->[1], $cenv->[2]); }, $env0, $env1];
}

sub
_ats2plpre_stream_patsfun_6__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv) = @_; return _ats2plpre_stream_patsfun_6($cenv->[1], $cenv->[2]); }, $env0, $env1];
}


sub
ats2plpre_stream_map_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret0;
##
  __patsflab_stream_map_cloref:
  $tmpret0 = [0, _ats2plpre_stream_patsfun_1__closurerize($arg0, $arg1)];
  return $tmpret0;
} #end-of-function


sub
_ats2plpre_stream_patsfun_1($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret1;
  my $tmp2;
  my $tmp3;
  my $tmp4;
  my $tmp5;
  my $tmp6;
##
  __patsflab__ats2plpre_stream_patsfun_1:
  ATSPMVlazyval_eval($env0); $tmp2 = $env0->[1];
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab0:
    if(ATSCKptriscons($tmp2)) { goto __atstmplab3; }
    __atstmplab1:
    $tmpret1 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab2:
    __atstmplab3:
    $tmp3 = $tmp2->[0];
    $tmp4 = $tmp2->[1];
    $tmp5 = &{$env1->[0]}($env1, $tmp3);
    $tmp6 = ats2plpre_stream_map_cloref($tmp4, $env1);
    $tmpret1 = [$tmp5, $tmp6];
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret1;
} #end-of-function


sub
ats2plpre_stream_filter_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret7;
##
  __patsflab_stream_filter_cloref:
  $tmpret7 = [0, _ats2plpre_stream_patsfun_3__closurerize($arg0, $arg1)];
  return $tmpret7;
} #end-of-function


sub
_ats2plpre_stream_patsfun_3($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret8;
  my $tmp9;
  my $tmp10;
  my $tmp11;
  my $tmp12;
  my $tmp13;
  my $tmp14;
##
  __patsflab__ats2plpre_stream_patsfun_3:
  ATSPMVlazyval_eval($env0); $tmp9 = $env0->[1];
  #ATScaseofseq_beg
  while(1)
  {
    #ATSbranchseq_beg
    __atstmplab4:
    if(ATSCKptriscons($tmp9)) { goto __atstmplab7; }
    __atstmplab5:
    $tmpret8 = 0;
    last;
    #ATSbranchseq_end
    #ATSbranchseq_beg
    __atstmplab6:
    __atstmplab7:
    $tmp10 = $tmp9->[0];
    $tmp11 = $tmp9->[1];
    $tmp12 = &{$env1->[0]}($env1, $tmp10);
    if($tmp12) {
      $tmp13 = ats2plpre_stream_filter_cloref($tmp11, $env1);
      $tmpret8 = [$tmp10, $tmp13];
    } else {
      $tmp14 = ats2plpre_stream_filter_cloref($tmp11, $env1);
      ATSPMVlazyval_eval($tmp14); $tmpret8 = $tmp14->[1];
    } #endif
    last;
    #ATSbranchseq_end
  } #end-of-while-loop;
  #ATScaseofseq_end
  return $tmpret8;
} #end-of-function


sub
ats2plpre_stream_tabulate_cloref($)
{
##
  my($arg0) = @_;
##
  my $tmpret15;
##
  __patsflab_stream_tabulate_cloref:
  $tmpret15 = _ats2plpre_stream_aux_5($arg0, 0);
  return $tmpret15;
} #end-of-function


sub
_ats2plpre_stream_aux_5($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret16;
##
  __patsflab__ats2plpre_stream_aux_5:
  $tmpret16 = [0, _ats2plpre_stream_patsfun_6__closurerize($env0, $arg0)];
  return $tmpret16;
} #end-of-function


sub
_ats2plpre_stream_patsfun_6($$)
{
##
  my($env0, $env1) = @_;
##
  my $tmpret17;
  my $tmp18;
  my $tmp19;
  my $tmp20;
##
  __patsflab__ats2plpre_stream_patsfun_6:
  $tmp18 = &{$env0->[0]}($env0, $env1);
  $tmp20 = ats2plpre_add_int1_int1($env1, 1);
  $tmp19 = _ats2plpre_stream_aux_5($env0, $tmp20);
  $tmpret17 = [$tmp18, $tmp19];
  return $tmpret17;
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
## end-of-compilation-unit
######
##
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2015-7-14:  1h: 4m
##
##
sub
_ats2plpre_intrange_patsfun_7__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_7($cenv->[1], $arg0); }, $env0];
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
_ats2plpre_intrange_patsfun_14__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0, $arg1) = @_; return _ats2plpre_intrange_patsfun_14($cenv->[1], $arg0, $arg1); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_18__closurerize($)
{
  my($env0) = @_;
  return [sub{ my($cenv, $arg0) = @_; return _ats2plpre_intrange_patsfun_18($cenv->[1], $arg0); }, $env0];
}

sub
_ats2plpre_intrange_patsfun_31__closurerize($$)
{
  my($env0, $env1) = @_;
  return [sub{ my($cenv, $arg0, $arg1) = @_; return _ats2plpre_intrange_patsfun_31($cenv->[1], $cenv->[2], $arg0, $arg1); }, $env0, $env1];
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
ats2plpre_int_exists_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret7;
##
  __patsflab_int_exists_cloref:
  $tmpret7 = ats2plpre_intrange_exists_cloref(0, $arg0, $arg1);
  return $tmpret7;
} #end-of-function


sub
ats2plpre_int_forall_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret8;
##
  __patsflab_int_forall_cloref:
  $tmpret8 = ats2plpre_intrange_forall_cloref(0, $arg0, $arg1);
  return $tmpret8;
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
  my $tmpret10;
##
  __patsflab_int_exists_method:
  $tmpret10 = _ats2plpre_intrange_patsfun_7__closurerize($arg0);
  return $tmpret10;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_7($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret11;
##
  __patsflab__ats2plpre_intrange_patsfun_7:
  $tmpret11 = ats2plpre_int_exists_cloref($env0, $arg0);
  return $tmpret11;
} #end-of-function


sub
ats2plpre_int_forall_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret12;
##
  __patsflab_int_forall_method:
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
  $tmpret13 = ats2plpre_int_forall_cloref($env0, $arg0);
  return $tmpret13;
} #end-of-function


sub
ats2plpre_int_foreach_method($)
{
##
  my($arg0) = @_;
##
  my $tmpret14;
##
  __patsflab_int_foreach_method:
  $tmpret14 = _ats2plpre_intrange_patsfun_11__closurerize($arg0);
  return $tmpret14;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_11($$)
{
##
  my($env0, $arg0) = @_;
##
##
  __patsflab__ats2plpre_intrange_patsfun_11:
  ats2plpre_int_foreach_cloref($env0, $arg0);
  return;#_void
} #end-of-function


sub
ats2plpre_int_foldleft_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret16;
##
  __patsflab_int_foldleft_cloref:
  $tmpret16 = ats2plpre_intrange_foldleft_cloref(0, $arg0, $arg1, $arg2);
  return $tmpret16;
} #end-of-function


sub
ats2plpre_int_foldleft_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret17;
##
  __patsflab_int_foldleft_method:
  $tmpret17 = _ats2plpre_intrange_patsfun_14__closurerize($arg0);
  return $tmpret17;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_14($$$)
{
##
  my($env0, $arg0, $arg1) = @_;
##
  my $tmpret18;
##
  __patsflab__ats2plpre_intrange_patsfun_14:
  $tmpret18 = ats2plpre_int_foldleft_cloref($env0, $arg0, $arg1);
  return $tmpret18;
} #end-of-function


sub
_057_home_057_hwxi_057_research_057_Postiats_055_contrib_057_git_057_contrib_057_libatscc_057_libatscc2pl_057_SATS_057_intrange_056_sats__int_list_map_cloref($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret19;
##
  __patsflab_int_list_map_cloref:
  $tmpret19 = _ats2plpre_intrange_aux_16($arg0, $arg1, 0);
  return $tmpret19;
} #end-of-function


sub
_ats2plpre_intrange_aux_16($$$)
{
##
  my($env0, $env1, $arg0) = @_;
##
  my $tmpret20;
  my $tmp21;
  my $tmp22;
  my $tmp23;
  my $tmp24;
##
  __patsflab__ats2plpre_intrange_aux_16:
  $tmp21 = ats2plpre_lt_int1_int1($arg0, $env0);
  if($tmp21) {
    $tmp22 = &{$env1->[0]}($env1, $arg0);
    $tmp24 = ats2plpre_add_int1_int1($arg0, 1);
    $tmp23 = _ats2plpre_intrange_aux_16($env0, $env1, $tmp24);
    $tmpret20 = [$tmp22, $tmp23];
  } else {
    $tmpret20 = 0;
  } #endif
  return $tmpret20;
} #end-of-function


sub
_057_home_057_hwxi_057_research_057_Postiats_055_contrib_057_git_057_contrib_057_libatscc_057_libatscc2pl_057_SATS_057_intrange_056_sats__int_list_map_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmpret25;
##
  __patsflab_int_list_map_method:
  $tmpret25 = _ats2plpre_intrange_patsfun_18__closurerize($arg0);
  return $tmpret25;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_18($$)
{
##
  my($env0, $arg0) = @_;
##
  my $tmpret26;
##
  __patsflab__ats2plpre_intrange_patsfun_18:
  $tmpret26 = _057_home_057_hwxi_057_research_057_Postiats_055_contrib_057_git_057_contrib_057_libatscc_057_libatscc2pl_057_SATS_057_intrange_056_sats__int_list_map_cloref($env0, $arg0);
  return $tmpret26;
} #end-of-function


sub
ats2plpre_int2_exists_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret27;
##
  __patsflab_int2_exists_cloref:
  $tmpret27 = ats2plpre_intrange2_exists_cloref(0, $arg0, 0, $arg1, $arg2);
  return $tmpret27;
} #end-of-function


sub
ats2plpre_int2_forall_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret28;
##
  __patsflab_int2_forall_cloref:
  $tmpret28 = ats2plpre_intrange2_forall_cloref(0, $arg0, 0, $arg1, $arg2);
  return $tmpret28;
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
  my $tmpret30;
##
  __patsflab_intrange_exists_cloref:
  $tmpret30 = _ats2plpre_intrange_loop_23($arg0, $arg1, $arg2);
  return $tmpret30;
} #end-of-function


sub
_ats2plpre_intrange_loop_23($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmpret31;
  my $tmp32;
  my $tmp33;
  my $tmp34;
##
  __patsflab__ats2plpre_intrange_loop_23:
  $tmp32 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp32) {
    $tmp33 = &{$arg2->[0]}($arg2, $arg0);
    if($tmp33) {
      $tmpret31 = 1;
    } else {
      $tmp34 = ats2plpre_add_int0_int0($arg0, 1);
      #ATStailcalseq_beg
      $apy0 = $tmp34;
      $apy1 = $arg1;
      $apy2 = $arg2;
      $arg0 = $apy0;
      $arg1 = $apy1;
      $arg2 = $apy2;
      goto __patsflab__ats2plpre_intrange_loop_23;
      #ATStailcalseq_end
    } #endif
  } else {
    $tmpret31 = 0;
  } #endif
  return $tmpret31;
} #end-of-function


sub
ats2plpre_intrange_forall_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $tmpret35;
##
  __patsflab_intrange_forall_cloref:
  $tmpret35 = _ats2plpre_intrange_loop_25($arg0, $arg1, $arg2);
  return $tmpret35;
} #end-of-function


sub
_ats2plpre_intrange_loop_25($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmpret36;
  my $tmp37;
  my $tmp38;
  my $tmp39;
##
  __patsflab__ats2plpre_intrange_loop_25:
  $tmp37 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp37) {
    $tmp38 = &{$arg2->[0]}($arg2, $arg0);
    if($tmp38) {
      $tmp39 = ats2plpre_add_int0_int0($arg0, 1);
      #ATStailcalseq_beg
      $apy0 = $tmp39;
      $apy1 = $arg1;
      $apy2 = $arg2;
      $arg0 = $apy0;
      $arg1 = $apy1;
      $arg2 = $apy2;
      goto __patsflab__ats2plpre_intrange_loop_25;
      #ATStailcalseq_end
    } else {
      $tmpret36 = 0;
    } #endif
  } else {
    $tmpret36 = 1;
  } #endif
  return $tmpret36;
} #end-of-function


sub
ats2plpre_intrange_foreach_cloref($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
##
  __patsflab_intrange_foreach_cloref:
  _ats2plpre_intrange_loop_27($arg0, $arg1, $arg2);
  return;#_void
} #end-of-function


sub
_ats2plpre_intrange_loop_27($$$)
{
##
  my($arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmp42;
  my $tmp44;
##
  __patsflab__ats2plpre_intrange_loop_27:
  $tmp42 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp42) {
    &{$arg2->[0]}($arg2, $arg0);
    $tmp44 = ats2plpre_add_int0_int0($arg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp44;
    $apy1 = $arg1;
    $apy2 = $arg2;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    goto __patsflab__ats2plpre_intrange_loop_27;
    #ATStailcalseq_end
  } else {
    #ATSINSmove_void;
  } #endif
  return;#_void
} #end-of-function


sub
ats2plpre_intrange_foldleft_cloref($$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3) = @_;
##
  my $tmpret45;
##
  __patsflab_intrange_foldleft_cloref:
  $tmpret45 = _ats2plpre_intrange_loop_29($arg0, $arg1, $arg2, $arg3);
  return $tmpret45;
} #end-of-function


sub
_ats2plpre_intrange_loop_29($$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $apy3;
  my $tmpret46;
  my $tmp47;
  my $tmp48;
  my $tmp49;
##
  __patsflab__ats2plpre_intrange_loop_29:
  $tmp47 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp47) {
    $tmp48 = ats2plpre_add_int0_int0($arg0, 1);
    $tmp49 = &{$arg3->[0]}($arg3, $arg2, $arg0);
    #ATStailcalseq_beg
    $apy0 = $tmp48;
    $apy1 = $arg1;
    $apy2 = $tmp49;
    $apy3 = $arg3;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    $arg3 = $apy3;
    goto __patsflab__ats2plpre_intrange_loop_29;
    #ATStailcalseq_end
  } else {
    $tmpret46 = $arg2;
  } #endif
  return $tmpret46;
} #end-of-function


sub
ats2plpre_intrange_foldleft_method($$)
{
##
  my($arg0, $arg1) = @_;
##
  my $tmp50;
  my $tmp51;
  my $tmpret52;
##
  __patsflab_intrange_foldleft_method:
  $tmp50 = $arg0->[0];
  $tmp51 = $arg0->[1];
  $tmpret52 = _ats2plpre_intrange_patsfun_31__closurerize($tmp50, $tmp51);
  return $tmpret52;
} #end-of-function


sub
_ats2plpre_intrange_patsfun_31($$$$)
{
##
  my($env0, $env1, $arg0, $arg1) = @_;
##
  my $tmpret53;
##
  __patsflab__ats2plpre_intrange_patsfun_31:
  $tmpret53 = ats2plpre_intrange_foldleft_cloref($env0, $env1, $arg0, $arg1);
  return $tmpret53;
} #end-of-function


sub
ats2plpre_intrange2_exists_cloref($$$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3, $arg4) = @_;
##
  my $tmpret54;
##
  __patsflab_intrange2_exists_cloref:
  $tmpret54 = _ats2plpre_intrange_loop1_33($arg2, $arg3, $arg0, $arg1, $arg4);
  return $tmpret54;
} #end-of-function


sub
_ats2plpre_intrange_loop1_33($$$$$)
{
##
  my($env0, $env1, $arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmpret55;
  my $tmp56;
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
  my $tmpret57;
  my $tmp58;
  my $tmp59;
  my $tmp60;
  my $tmp61;
##
  __patsflab__ats2plpre_intrange_loop1_33:
  $tmp56 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp56) {
    #ATStailcalseq_beg
    $a2py0 = $arg0;
    $a2py1 = $arg1;
    $a2py2 = $env0;
    $a2py3 = $env1;
    $a2py4 = $arg2;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2plpre_intrange_loop2_34;
    #ATStailcalseq_end
  } else {
    $tmpret55 = 0;
  } #endif
  return $tmpret55;
##
  __patsflab__ats2plpre_intrange_loop2_34:
  $tmp58 = ats2plpre_lt_int0_int0($a2rg2, $a2rg3);
  if($tmp58) {
    $tmp59 = &{$a2rg4->[0]}($a2rg4, $a2rg0, $a2rg2);
    if($tmp59) {
      $tmpret57 = 1;
    } else {
      $tmp60 = ats2plpre_add_int0_int0($a2rg2, 1);
      #ATStailcalseq_beg
      $a2py0 = $a2rg0;
      $a2py1 = $a2rg1;
      $a2py2 = $tmp60;
      $a2py3 = $a2rg3;
      $a2py4 = $a2rg4;
      $a2rg0 = $a2py0;
      $a2rg1 = $a2py1;
      $a2rg2 = $a2py2;
      $a2rg3 = $a2py3;
      $a2rg4 = $a2py4;
      goto __patsflab__ats2plpre_intrange_loop2_34;
      #ATStailcalseq_end
    } #endif
  } else {
    $tmp61 = ats2plpre_add_int0_int0($a2rg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp61;
    $apy1 = $a2rg1;
    $apy2 = $a2rg4;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    goto __patsflab__ats2plpre_intrange_loop1_33;
    #ATStailcalseq_end
  } #endif
  return $tmpret57;
} #end-of-function


sub
ats2plpre_intrange2_forall_cloref($$$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3, $arg4) = @_;
##
  my $tmpret62;
##
  __patsflab_intrange2_forall_cloref:
  $tmpret62 = _ats2plpre_intrange_loop1_36($arg2, $arg3, $arg0, $arg1, $arg4);
  return $tmpret62;
} #end-of-function


sub
_ats2plpre_intrange_loop1_36($$$$$)
{
##
  my($env0, $env1, $arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmpret63;
  my $tmp64;
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
  my $tmpret65;
  my $tmp66;
  my $tmp67;
  my $tmp68;
  my $tmp69;
##
  __patsflab__ats2plpre_intrange_loop1_36:
  $tmp64 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp64) {
    #ATStailcalseq_beg
    $a2py0 = $arg0;
    $a2py1 = $arg1;
    $a2py2 = $env0;
    $a2py3 = $env1;
    $a2py4 = $arg2;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2plpre_intrange_loop2_37;
    #ATStailcalseq_end
  } else {
    $tmpret63 = 1;
  } #endif
  return $tmpret63;
##
  __patsflab__ats2plpre_intrange_loop2_37:
  $tmp66 = ats2plpre_lt_int0_int0($a2rg2, $a2rg3);
  if($tmp66) {
    $tmp67 = &{$a2rg4->[0]}($a2rg4, $a2rg0, $a2rg2);
    if($tmp67) {
      $tmp68 = ats2plpre_add_int0_int0($a2rg2, 1);
      #ATStailcalseq_beg
      $a2py0 = $a2rg0;
      $a2py1 = $a2rg1;
      $a2py2 = $tmp68;
      $a2py3 = $a2rg3;
      $a2py4 = $a2rg4;
      $a2rg0 = $a2py0;
      $a2rg1 = $a2py1;
      $a2rg2 = $a2py2;
      $a2rg3 = $a2py3;
      $a2rg4 = $a2py4;
      goto __patsflab__ats2plpre_intrange_loop2_37;
      #ATStailcalseq_end
    } else {
      $tmpret65 = 0;
    } #endif
  } else {
    $tmp69 = ats2plpre_add_int0_int0($a2rg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp69;
    $apy1 = $a2rg1;
    $apy2 = $a2rg4;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    goto __patsflab__ats2plpre_intrange_loop1_36;
    #ATStailcalseq_end
  } #endif
  return $tmpret65;
} #end-of-function


sub
ats2plpre_intrange2_foreach_cloref($$$$$)
{
##
  my($arg0, $arg1, $arg2, $arg3, $arg4) = @_;
##
##
  __patsflab_intrange2_foreach_cloref:
  _ats2plpre_intrange_loop1_39($arg2, $arg3, $arg0, $arg1, $arg4);
  return;#_void
} #end-of-function


sub
_ats2plpre_intrange_loop1_39($$$$$)
{
##
  my($env0, $env1, $arg0, $arg1, $arg2) = @_;
##
  my $apy0;
  my $apy1;
  my $apy2;
  my $tmp72;
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
  my $tmp74;
  my $tmp76;
  my $tmp77;
##
  __patsflab__ats2plpre_intrange_loop1_39:
  $tmp72 = ats2plpre_lt_int0_int0($arg0, $arg1);
  if($tmp72) {
    #ATStailcalseq_beg
    $a2py0 = $arg0;
    $a2py1 = $arg1;
    $a2py2 = $env0;
    $a2py3 = $env1;
    $a2py4 = $arg2;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2plpre_intrange_loop2_40;
    #ATStailcalseq_end
  } else {
    #ATSINSmove_void;
  } #endif
  return;#_void
##
  __patsflab__ats2plpre_intrange_loop2_40:
  $tmp74 = ats2plpre_lt_int0_int0($a2rg2, $a2rg3);
  if($tmp74) {
    &{$a2rg4->[0]}($a2rg4, $a2rg0, $a2rg2);
    $tmp76 = ats2plpre_add_int0_int0($a2rg2, 1);
    #ATStailcalseq_beg
    $a2py0 = $a2rg0;
    $a2py1 = $a2rg1;
    $a2py2 = $tmp76;
    $a2py3 = $a2rg3;
    $a2py4 = $a2rg4;
    $a2rg0 = $a2py0;
    $a2rg1 = $a2py1;
    $a2rg2 = $a2py2;
    $a2rg3 = $a2py3;
    $a2rg4 = $a2py4;
    goto __patsflab__ats2plpre_intrange_loop2_40;
    #ATStailcalseq_end
  } else {
    $tmp77 = ats2plpre_add_int0_int0($a2rg0, 1);
    #ATStailcalseq_beg
    $apy0 = $tmp77;
    $apy1 = $a2rg1;
    $apy2 = $a2rg4;
    $arg0 = $apy0;
    $arg1 = $apy1;
    $arg2 = $apy2;
    goto __patsflab__ats2plpre_intrange_loop1_39;
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
## end-of-compilation-unit
######
##
##
## The Perl code is generated by atscc2pl
## The starting compilation time is: 2015-7-14:  1h: 4m
##
##

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
## end-of-compilation-unit
######

## ###### ###### ##

## end of [libatscc2pl_all.pl] ##

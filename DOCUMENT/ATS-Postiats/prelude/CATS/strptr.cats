/***********************************************************************/
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/***********************************************************************/

/* (*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2013 Hongwei Xi, ATS Trustful Software, Inc.
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
*) */

/* ****** ****** */

/*
** Source:
** $PATSHOME/prelude/CATS/CODEGEN/strptr.atxt
** Time of generation: Sat Jun 27 21:39:50 2015
*/

/* ****** ****** */

/*
(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: March, 2013 *)
*/

/* ****** ****** */

#ifndef ATSLIB_PRELUDE_CATS_STRPTR
#define ATSLIB_PRELUDE_CATS_STRPTR

/* ****** ****** */
//
// [string.h]
//
extern
int // (sign)
strcmp (const char *x1, const char *x2) ;

/* ****** ****** */

#define atspre_strptr_null() atsptr_null

/* ****** ****** */

#define atspre_strptr_free atspre_mfree_gc
#define atspre_strnptr_free atspre_mfree_gc

/* ****** ****** */

ATSinline()
atstype_int
atspre_compare_strptr_strptr
(
  atstype_strptr x1, atstype_strptr x2
) {
  if (x1==0) {
    return (x2==0 ? 0 : -1) ;
  } else {
    return (x2==0 ? 1 : strcmp((char*)x1, (char*)x2)) ;
  } // end of [if]
} // end of [atspre_compare_strptr_strptr]

/* ****** ****** */

#define atspre_eq_strptr_string atspre_eq_string_string 
#define atspre_neq_strptr_string atspre_neq_string_string 
#define atspre_compare_strptr_string atspre_compare_string_string 

/* ****** ****** */

ATSinline()
atsvoid_t0ype
atspre_fprint_strptr
(
  atstype_ref out, atstype_strptr x
) {
  int err = 0 ;
  if (x != 0) {
    err += fprintf((FILE*)out, "%s", (char*)x) ;
  } else {
    err += fprintf((FILE*)out, "%s", "(strnull)") ;
  } // end of [if]
/*
  if (err < 0) {
    fprintf(stderr, "exit(ATS): [fprint_strptr] failed.") ; exit(1) ;
  } // end of [if]
*/
  return ;
} // end of [atspre_fprint_strptr]
#define atspre_print_strptr(x) atspre_fprint_strptr(stdout, (x))
#define atspre_prerr_strptr(x) atspre_fprint_strptr(stderr, (x))

/* ****** ****** */

#define atspre_fprint_strbuf atspre_fprint_strptr
#define atspre_print_strbuf(x) atspre_fprint_strbuf(stdout, (x))
#define atspre_prerr_strbuf(x) atspre_fprint_strbuf(stderr, (x))

/* ****** ****** */

#endif // ifndef ATSLIB_PRELUDE_CATS_STRPTR

/* ****** ****** */

/* end of [strptr.cats] */

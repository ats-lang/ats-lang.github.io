/***********************************************************************/
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/***********************************************************************/

/* (*
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
*) */

/* ****** ****** */

/*
** Source:
** $PATSHOME/prelude/CATS/CODEGEN/array.atxt
** Time of generation: Wed Oct 10 21:08:58 2018
*/

/* ****** ****** */

/*
(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: January, 2013 *)
*/

/* ****** ****** */

#ifndef ATSLIB_PRELUDE_CATS_ARRAY
#define ATSLIB_PRELUDE_CATS_ARRAY

/* ****** ****** */
//
// [stdlib.h]
//
extern
void qsort
(
  void *base, size_t nmemb, size_t size
, int(*compar)(const void *, const void *)
) ; // end of [qsort]
extern
void *bsearch
(
  const void *key
, const void *base
, size_t nmemb, size_t size
, int (*compar)(const void *, const void *)
) ; // end of [bsearch]
//
#define atspre_array_qsort qsort
#define atspre_array_bsearch bsearch
//
/* ****** ****** */
//
// [string.h]
//
#ifndef memcpy
extern
void *memcpy(void *dst, const void *src, size_t n) ;
#endif // #ifndef
#ifndef memmove
extern
void *memmove(void *dst, const void *src, size_t n) ;
#endif // #ifndef
//
#define atspre_array_memcpy memcpy
#define atspre_array_memmove memmove
//
/* ****** ****** */

ATSinline()
atsvoid_t0ype
atspre_array_foreach_funenv_tsz
(
  atstype_ptr A
, atstype_size n
, atstype_size tsz
, atstype_funptr f
, atstype_boxed env
) {
  char *p ;
  size_t i ;
  p = (char*)A ;
  for (i = 0 ; i < n ; i += 1)
  {
    ((void(*)(void*, void*))(f))(p, env) ; p += tsz ;
  }
  return ;
} // end of [atspre_array_foreach_funenv_tsz]

/* ****** ****** */

#endif // ifndef ATSLIB_PRELUDE_CATS_ARRAY

/* ****** ****** */

/* end of [array.cats] */

/***********************************************************************/
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/***********************************************************************/

/* (*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2013 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by the
** Free Software Foundation; either version 2.1, or (at your option)  any
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
(* Author: Hongwei Xi *)
(* Authoremail: gmhwxiATgmailDOTcom *)
(* Start time: September, 2013 *)
*/

/* ****** ****** */

#ifndef LIBCURL_CURL_CATS
#define LIBCURL_CURL_CATS

/* ****** ****** */

#include <curl/curl.h>

/* ****** ****** */

#define atscntrb_curl_curl_version curl_version

/* ****** ****** */

#define \
atscntrb_curl_eq_CURLcode_CURLcode atspre_eq_int_int
#define \
atscntrb_curl_eq_CURLerror_CURLcode atspre_eq_int_int

/* ****** ****** */

#define \
atscntrb_curl_neq_CURLcode_CURLcode atspre_neq_int_int
#define \
atscntrb_curl_neq_CURLerror_CURLcode atspre_neq_int_int

/* ****** ****** */

#define atscntrb_curl_curl_global_init curl_global_init
#define atscntrb_curl_curl_global_cleanup curl_global_cleanup

/* ****** ****** */

#define atscntrb_curl_curl_easy_init curl_easy_init
#define atscntrb_curl_curl_easy_setopt curl_easy_setopt
#define atscntrb_curl_curl_easy_perform curl_easy_perform
#define atscntrb_curl_curl_easy_cleanup curl_easy_cleanup

/* ****** ****** */

#define atscntrb_curl_curl_easy_recv curl_easy_recv
#define atscntrb_curl_curl_easy_send curl_easy_send

/* ****** ****** */

#define atscntrb_curl_curl_easy_reset curl_easy_reset

/* ****** ****** */

#define atscntrb_curl_curl_easy_duphandle curl_easy_duphandle

/* ****** ****** */

#define \
atscntrb_curl_curl_easy_strerror(err) ((char*)(curl_easy_strerror(err)))

/* ****** ****** */

#endif // ifndef LIBCURL_CURL_CATS

/* ****** ****** */

/* end of [curl.cats] */

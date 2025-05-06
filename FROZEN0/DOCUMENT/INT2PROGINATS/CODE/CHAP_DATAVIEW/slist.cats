/*
** Manipulating Singly-Linked Lists
**
** Author: Hongwei Xi (hwxi AT cs DOT bu DOT edu)
** Time: September, 2011
*/

typedef int T ;

typedef
struct slist {
  T data ; struct slist *next ;
} slist_struct ;

#define NULL 0

int slist_ptr_length (slist_struct *p) {
  int res = 0 ;
  while (p != NULL) { res = res + 1 ; p = p->next ; }
  return res ;
} // end of [slist_ptr_length]

slist_struct *slist_ptr_reverse (slist_struct *p) {
  slist_struct *tmp, *res = NULL ;
  while (p != NULL) {
    tmp = p->next ; p->next = res ; res = p ; p = tmp ;
  }
  return res ;
} // end of [slist_ptr_reverse]

slist_struct *slist_ptr_append
  (slist_struct *p, slist_struct *q) {
  slist_struct *p0 = p ;
  if (p == NULL) return q ;
  while (p->next != NULL) p = p->next ; p->next = q ;
  return p0 ;
} // end of [slist_ptr_append]

/* ****** ****** */

/* end of [slist.c] */

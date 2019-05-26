(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
** Start Time: September, 2012
*)

(* ****** ****** *)

#include "./../mybasis.sats"

(* ****** ****** *)

/*
typedef             cairo_region_t;
cairo_region_t *    cairo_region_create                 (void);
cairo_region_t *    cairo_region_create_rectangle       (const
cairo_rectangle_int_t *rectangle);
cairo_region_t *    cairo_region_create_rectangles      (const
cairo_rectangle_int_t *rects,
                                                         int count);
cairo_region_t *    cairo_region_copy                   (const
cairo_region_t *original);
cairo_region_t *    cairo_region_reference              (cairo_region_t *region);
void                cairo_region_destroy                (cairo_region_t *region);
cairo_status_t      cairo_region_status                 (const cairo_region_t *region);
void                cairo_region_get_extents            (const cairo_region_t *region,
                                                         cairo_rectangle_int_t
							 *extents);
int                 cairo_region_num_rectangles         (const cairo_region_t *region);
void                cairo_region_get_rectangle          (const cairo_region_t *region,
                                                         int nth,
                                                         cairo_rectangle_int_t
							 *rectangle);
cairo_bool_t        cairo_region_is_empty               (const cairo_region_t *region);
cairo_bool_t        cairo_region_contains_point         (const cairo_region_t *region,
                                                         int x,
                                                         int y);
enum                cairo_region_overlap_t;
cairo_region_overlap_t cairo_region_contains_rectangle  (const cairo_region_t *region,
                                                         const cairo_rectangle_int_t *rectangle);
cairo_bool_t        cairo_region_equal                  (const cairo_region_t *a,
                                                         const cairo_region_t *b);
void                cairo_region_translate              (cairo_region_t *region,
                                                         int dx,
                                                         int dy);
cairo_status_t      cairo_region_intersect              (cairo_region_t *dst,
                                                         const
							 cairo_region_t
							 *other);
cairo_status_t      cairo_region_intersect_rectangle    (cairo_region_t *dst,
                                                         const
							 cairo_rectangle_int_t *rectangle);
cairo_status_t      cairo_region_subtract               (cairo_region_t *dst,
                                                         const cairo_region_t *other);
cairo_status_t      cairo_region_subtract_rectangle     (cairo_region_t *dst,
                                                         const cairo_rectangle_int_t *rectangle);
cairo_status_t      cairo_region_union                  (cairo_region_t *dst,
                                                         const cairo_region_t *other);
cairo_status_t      cairo_region_union_rectangle        (cairo_region_t *dst,
                                                         const cairo_rectangle_int_t *rectangle);
cairo_status_t      cairo_region_xor                    (cairo_region_t *dst,
                                                         const cairo_region_t *other);
cairo_status_t      cairo_region_xor_rectangle          (cairo_region_t *dst,
                                                         const cairo_rectangle_int_t *rectangle);
*/

(* ****** ****** *)

(* end of [cairo-Regions.sats] *)

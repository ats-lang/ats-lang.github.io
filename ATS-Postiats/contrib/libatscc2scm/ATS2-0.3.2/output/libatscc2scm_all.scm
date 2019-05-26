
;;
;; Time of Generation:
;; Sat Jun 23 07:51:02 EDT 2018
;;

;;
;;;;;;
;
; HX-2016-05:
; for Scheme code
; translated from ATS
;
;;;;;;
;;
;; For some implementations of scheme,
;; we may have to map [define-macro] to [defmacro]
;;
;; (defmacro (define-macro x y) `(defmacro ,x ,y))
;;
;;;;;;

;; ****** ****** ;;

(define atscc2scm_null '())

;; ****** ****** ;;

(define atscc2scm_true #t)
(define atscc2scm_false #f)

;; ****** ****** ;;

(define-macro
 (ats2scmpre_list_nil) atscc2scm_null)
(define-macro
 (ats2scmpre_list_cons x xs) `(cons ,x ,xs))

;; ****** ****** ;;
;;
(define ATSINSmove0_void atscc2scm_null)
;;
(define-macro (ATSINSmove1_void cmd) cmd)
;;
;; ****** ****** ;;
;;
(define-macro
 (ATSINStmpset tmp val) `(set! ,tmp ,val)
)
(define-macro
 (ATSINSstatmpset statmp val) `(set! ,statmp ,val)
)
;;
(define-macro
 (ATSdynloadset flag val) `(set! ,flag ,val)
)
(define-macro
 (ATSINSdyncst_valbind d2cst val) `(set! ,d2cst ,val)
)
;;
;; ****** ****** ;;

(define-macro (ATSfunclo_fun fc) fc)
(define-macro (ATSfunclo_fclo fc) `(car ,fc))

;; ****** ****** ;;

(define-macro (ATSCKiseqz x) `(= ,x 0))
(define-macro (ATSCKisneqz x) `(not (= ,x 0)))

;; ****** ****** ;;
;;
(define-macro (ATSCKpat_int x y) `(= ,x ,y))
;;
(define-macro (ATSCKpat_bool x y) `(eqv? ,x ,y))
;;
(define-macro (ATSCKpat_string x y) `(eqv? ,x ,y))
;;
;; ****** ****** ;;
;;
(define-macro (ATSCKpat_con0 x tag) `(= ,x ,tag))
(define-macro (ATSCKpat_con1 x tag) `(= (car ,x) ,tag))
;;
;; ****** ****** ;;

(define-macro (ATSCKptrisnull x) `(eqv? ,x atscc2scm_null))
(define-macro (ATSCKptriscons x) `(not (eqv? ,x atscc2scm_null)))

;; ****** ****** ;;
;;
(define-macro (ATSCCget_0 xs) `(car ,xs))
(define-macro (ATSCCget_1 xs) `(car (cdr ,xs)))
(define-macro (ATSCCget_2 xs) `(car (cdr (cdr ,xs))))
(define-macro (ATSCCget_3 xs) `(car (cdr (cdr (cdr ,xs)))))
;;
(define-macro (ATSCCget_at xs n) `(list-ref ,xs ,n))
;;
(define-macro (ATSCCset_0 xs x0) `(set-car! ,xs ,x0))
(define-macro (ATSCCset_1 xs x0) `(set-car! (cdr ,xs) ,x0))
(define-macro (ATSCCset_2 xs x0) `(set-car! (cdr (cdr ,xs)) ,x0))
(define-macro (ATSCCset_3 xs x0) `(set-car! (cdr (cdr (cdr ,xs))) ,x0))
;;
;; ****** ****** ;;
;;
(define-syntax
 ATSPMVtyrec (syntax-rules () ((_ . xs) (list . xs))))
(define-syntax
 ATSPMVtysum (syntax-rules () ((_ . xs) (list . xs))))
;;
;; ****** ****** ;;
;;
(define-macro
 (ATSPMVlazyval fc) `(list 0 ,fc))
;;
(define
 (ATSPMVlazyval_eval lazyval)
 (let ((flag (ATSCCget_0 lazyval)))
   (if (= flag 0)
     (begin
      (ATSCCset_0 lazyval 1)
      (let ((thunk (ATSCCget_1 lazyval)))
	(let ((result ((ATSfunclo_fclo thunk) thunk)))
          (ATSCCset_1 lazyval result) result))
     )
     (begin
      (ATSCCset_0 lazyval (+ flag 1)) (ATSCCget_1 lazyval)
     )
   ) ;; if
 ) ;; let
) ;; define
;;
;; ****** ****** ;;
;;
(define-macro
 (ATSPMVllazyval thunk) thunk)
;;
(define
 (ATSPMVllazyval_eval llazyval)
  ((ATSfunclo_fclo llazyval) llazyval #t)
) ;; define
;;
(define
 (atspre_lazy_vt_free llazyval)
  ((ATSfunclo_fclo llazyval) llazyval #f)
) ;; define
;;
;; ****** ****** ;;

(define-macro (ATSSELcon xs i) `(ATSCCget_at ,xs ,i))
(define-macro (ATSSELboxrec xs i) `(ATSCCget_at ,xs ,i))

;; ****** ****** ;;
;;
(define (ATSINSdeadcode_fail) (exit 1))
;;
(define
 (ATSINScaseof_fail msg)
 (begin
  (display msg (current-error-port))
  (exit 1)
 )
) ;; end-of-define
;;
;; ****** ****** ;;
;;
(define
 (ats2scmpre_assert_bool0 tfv) (if (not tfv) (exit 1)))
(define
 (ats2scmpre_assert_bool1 tfv) (if (not tfv) (exit 1)))
;;
(define
 (ats2scmpre_assert_errmsg_bool0 msg tfv)
 (if (not tfv)
   (begin (display msg (current-error-port)) (exit 1))
 )
) ;; end-of-define
(define
 (ats2scmpre_assert_errmsg_bool1 msg tfv)
 (if (not tfv)
   (begin (display msg (current-error-port)) (exit 1))
 )
) ;; end-of-define
;;
;; ****** ****** ;;

(define-macro
 (ats2scmpre_cloref0_app cf)
`(let ((cf1 ,cf)) ((ATSfunclo_fclo cf1) cf1))
) ; define-macro
(define-macro
 (ats2scmpre_cloref1_app cf x)
`(let ((cf1 ,cf)) ((ATSfunclo_fclo cf1) cf1 ,x))
) ; define-macro
(define-macro
 (ats2scmpre_cloref2_app cf x1 x2)
`(let ((cf1 ,cf)) ((ATSfunclo_fclo cf1) cf1 x1 x2))
) ; define-macro
(define-macro
 (ats2scmpre_cloref3_app cf x1 x2 x3)
`(let ((cf1 ,cf)) ((ATSfunclo_fclo cf1) cf1 ,x1 ,x2 ,x3))
) ; define-macro

;; ****** ****** ;;

(define
 (ats2scmpre_cloref2fun0 cf)
 (lambda () (ats2scmpre_cloref0_app cf))
) ; define
(define
 (ats2scmpre_cloref2fun1 cf)
 (lambda (x) (ats2scmpre_cloref1_app cf x))
) ; define
(define
 (ats2scmpre_cloref2fun2 cf)
 (lambda (x1 x2) (ats2scmpre_cloref2_app cf x1 x2))
) ; define
(define
 (ats2scmpre_cloref2fun3 cf)
 (lambda (x1 x2 x3) (ats2scmpre_cloref3_app cf x1 x2 x3))
) ; define

;; ****** ****** ;;

(define-macro
 (ats2scmpre_lazy2cloref lazyval) `(ATSCCget_1 ,lazyval)
) ;; end-of-define

;; ****** ****** ;;

;;;;;; end of [basics_cats.scm] ;;;;;;
;;
;;;;;;
;
; HX-2016-05:
; for Scheme code
; translated from ATS
;
;;;;;;
;;

;;
;;;;;;
; beg of [integer_cats.scm]
;;;;;;
;;

;; ****** ****** ;;
;;
;; HX: for signed integers
;;
;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_neg_int0 x) `(- ,x)
)
(define-macro
 (ats2scmpre_neg_int1 x) `(- ,x)
)
;;
;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_abs_int0 x) `(abs ,x)
)
(define-macro
 (ats2scmpre_abs_int1 x) `(abs ,x)
)
;;
;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_succ_int0 x) `(+ ,x 1)
)
(define-macro
 (ats2scmpre_pred_int0 x) `(- ,x 1)
)
;;
(define-macro
 (ats2scmpre_succ_int1 x) `(+ ,x 1)
)
(define-macro
 (ats2scmpre_pred_int1 x) `(- ,x 1)
)
;;
;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_add_int0_int0 x y) `(+ ,x ,y)
)
(define-macro
 (ats2scmpre_sub_int0_int0 x y) `(- ,x ,y)
)
(define-macro
 (ats2scmpre_mul_int0_int0 x y) `(* ,x ,y)
)
(define-macro
 (ats2scmpre_div_int0_int0 x y) `(quotient ,x ,y)
)
;;
(define-macro
 (ats2scmpre_mod_int0_int0 x y) `(modulo ,x ,y)
)
(define-macro
 (ats2scmpre_rem_int0_int0 x y) `(remainder ,x ,y)
)
;;
(define-macro
 (ats2scmpre_add_int1_int1 x y) `(+ ,x ,y)
)
(define-macro
 (ats2scmpre_sub_int1_int1 x y) `(- ,x ,y)
)
(define-macro
 (ats2scmpre_mul_int1_int1 x y) `(* ,x ,y)
)
(define-macro
 (ats2scmpre_div_int1_int1 x y) `(quotient ,x ,y)
)
;;
(define-macro
 (ats2scmpre_mod_int1_int1 x y) `(modulo ,x ,y)
)
(define-macro
 (ats2scmpre_nmod_int1_int1 x y) `(modulo ,x ,y)
)
;;
(define-macro
 (ats2scmpre_rem_int1_int1 x y) `(remainder ,x ,y)
)
;;
;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_lt_int0_int0 x y) `(< ,x ,y)
)
(define-macro
 (ats2scmpre_lte_int0_int0 x y) `(<= ,x ,y)
)
(define-macro
 (ats2scmpre_gt_int0_int0 x y) `(> ,x ,y)
)
(define-macro
 (ats2scmpre_gte_int0_int0 x y) `(>= ,x ,y)
)
;;
(define-macro
 (ats2scmpre_eq_int0_int0 x y) `(= ,x ,y)
)
(define-macro
 (ats2scmpre_neq_int0_int0 x y) `(not (= ,x ,y))
)
;;
(define-macro
 (ats2scmpre_lt_int1_int1 x y) `(< ,x ,y)
)
(define-macro
 (ats2scmpre_lte_int1_int1 x y) `(<= ,x ,y)
)
(define-macro
 (ats2scmpre_gt_int1_int1 x y) `(> ,x ,y)
)
(define-macro
 (ats2scmpre_gte_int1_int1 x y) `(>= ,x ,y)
)
;;
(define-macro
 (ats2scmpre_eq_int1_int1 x y) `(= ,x ,y)
)
(define-macro
 (ats2scmpre_neq_int1_int1 x y) `(not (= ,x ,y))
)
;;
(define-macro
 (ats2scmpre_compare_int0_int0 x y)
`(let ((x1 ,x) (y1 ,y)) (if (< x1 y1) -1 (if (<= x1 y1) 0 1)))
)
(define-macro
 (ats2scmpre_compare_int1_int1 x y)
`(let ((x1 ,x) (y1 ,y)) (if (< x1 y1) -1 (if (<= x1 y1) 0 1)))
)
;;
;; ****** ****** ;;

;; end of [integer_cats.scm] ;;
;;
;;;;;;
;
; HX-2016-06:
; for Scheme code
; translated from ATS
;
;;;;;;
;;

;;
;;;;;;
; beg of [bool_cats.scm]
;;;;;;
;;

;; ****** ****** ;;

(define-macro
 (ats2scmpre_neg_bool0 x) `(not ,x)
)
(define-macro
 (ats2scmpre_neg_bool1 x) `(not ,x)
)

;; ****** ****** ;;

;; end of [bool_cats.scm] ;;
;;
;;;;;;
;
; HX-2016-05:
; for Scheme code
; translated from ATS
;
;;;;;;
;;

;;
;;;;;;
; beg of [float_cats.scm]
;;;;;;
;;

;; ****** ****** ;;
;;
;; HX: for signed floats
;;
;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_int2double x) x)
(define-macro
 (ats2scmpre_double_of_int x) x)
;;
(define-macro
 (ats2scmpre_double2int x) `(truncate ,x))
(define-macro
 (ats2scmpre_int_of_double x) `(truncate ,x))
;;
;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_neg_double x) `(- ,x)
)
;;
;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_abs_double x) `(abs ,x)
)
;;
;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_succ_double x) `(+ ,x 1)
)
(define-macro
 (ats2scmpre_pred_double x) `(- ,x 1)
)
;;
;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_add_int_double x y) `(+ ,x ,y)
)
(define-macro
 (ats2scmpre_sub_int_double x y) `(- ,x ,y)
)
(define-macro
 (ats2scmpre_mul_int_double x y) `(* ,x ,y)
)
(define-macro
 (ats2scmpre_div_int_double x y) `(/ ,x ,y)
)
;;
;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_add_double_int x y) `(+ ,x ,y)
)
(define-macro
 (ats2scmpre_sub_double_int x y) `(- ,x ,y)
)
(define-macro
 (ats2scmpre_mul_double_int x y) `(* ,x ,y)
)
(define-macro
 (ats2scmpre_div_double_int x y) `(/ ,x ,y)
)
;;
;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_add_double_double x y) `(+ ,x ,y)
)
(define-macro
 (ats2scmpre_sub_double_double x y) `(- ,x ,y)
)
(define-macro
 (ats2scmpre_mul_double_double x y) `(* ,x ,y)
)
(define-macro
 (ats2scmpre_div_double_double x y) `(/ ,x ,y)
)
;;
;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_lt_double_double x y) `(< ,x ,y)
)
(define-macro
 (ats2scmpre_lte_double_double x y) `(<= ,x ,y)
)
(define-macro
 (ats2scmpre_gt_double_double x y) `(> ,x ,y)
)
(define-macro
 (ats2scmpre_gte_double_double x y) `(>= ,x ,y)
)
;;
(define-macro
 (ats2scmpre_eq_double_double x y) `(= ,x ,y)
)
(define-macro
 (ats2scmpre_neq_double_double x y) `(not (= ,x ,y))
)
;;
;; ****** ****** ;;

;; end of [float_cats.scm] ;;
;;
;;;;;;
;
; HX-2016-06:
; for Scheme code
; translated from ATS
;
;;;;;;
;;

;;
;;;;;;
; beg of [print_cats.scm]
;;;;;;
;;

;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_print_int x) `(display ,x))
;;
(define-macro
 (ats2scmpre_print_bool x)
`(display (if ,x "true" "false")))
(define-macro
 (ats2scmpre_print_char x) `(display ,x))
;;
(define-macro
 (ats2scmpre_print_double x) `(display ,x))
(define-macro
 (ats2scmpre_print_string x) `(display ,x))
;;
(define-macro
 (ats2scmpre_print_SCMval x) `(display ,x))
;;
;; ****** ****** ;;
;;
(define-macro (ats2scmpre_print_newline) `(newline))
;;
;; ****** ****** ;;

(define-macro
 (ats2scmpre_fprint_int out x) `(display ,x ,out))
;;
(define-macro
 (ats2scmpre_fprint_bool out x)
`(display (if ,x "true" "false") ,out))
(define-macro
 (ats2scmpre_fprint_char out x) `(display ,x ,out))
;;
(define-macro
 (ats2scmpre_fprint_double out x) `(display ,x ,out))
(define-macro
 (ats2scmpre_fprint_string out x) `(display ,x ,out))
(define-macro
 (ats2scmpre_fprint_SCMval out x) `(display ,x ,out))
;;
;; ****** ****** ;;
;;
(define-macro (ats2scmpre_fprint_newline out) `(newline ,out))
;;
;; ****** ****** ;;

;; end of [print_cats.scm] ;;
;;
;;;;;;
;
; HX-2016-05:
; for Scheme code
; translated from ATS
;
;;;;;;
;;

;;
;;;;;;
; beg of [reference_cats.scm]
;;;;;;
;;

;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_ref x) `(list ,x))
(define-macro
 (ats2scmpre_ref_make_elt x) `(list ,x))
;;
;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_ref_get_elt r) `(car ,r))
(define-macro
 (ats2scmpre_ref_set_elt r x0) `(set-car! ,r ,x0))
;;
(define-syntax
 ats2scmpre_ref_exch_elt
 (syntax-rules ()
  ((_ r x0) (let ((tmp (car r))) (set-car! r x0) tmp))
 )
)
;;
;; ****** ****** ;;

;; end of [reference_cats.scm] ;;
;;;;;;
;
; HX-2016-06:
; for Scheme code translated from ATS
;
;;;;;;

;;;;;;
;beg of [filebas_cats.scm]
;;;;;;
;;
(define-macro
 (ats2scmpre_stdin_get) `(current=input-port))
(define-macro
 (ats2scmpre_stdout_get) `(current-output-port))
(define-macro
 (ats2scmpre_stderr_get) `(current-error-port))
;;
;;;;;;
;;
(define-macro
 (ats2scmpre_fileref_close_input inp) `(close-input-port ,(inp))
) ;; define-macro
;;
(define-macro
 (ats2scmpre_fileref_open_input_exn fname) `(open-input-file ,(fname))
) ;; define-macro
;;
;;;;;;
;;
(define-macro
 (ats2scmpre_write_char c) `(write-char ,(c))) 
(define-macro
 (ats2scmpre_fwrite_char out c) `(write-char ,(c) ,(out))) 
;;
(define-macro
 (ats2scmpre_write_scmval scmval) `(write ,(scmval))) 
(define-macro
 (ats2scmpre_fwrite_scmval out scmval) `(write ,(scmval) ,(out))) 
;;
(define-macro
 (ats2scmpre_fileref_close_output inp) `(close-output-port ,(inp))
) ;; define-macro
;;
(define-macro
 (ats2scmpre_fileref_open_output_exn fname) `(open-output-file ,(fname))
) ;; define-macro
;;
;;;;;;
;;;;;; end of [filebas_cats.scm] ;;;;;;
;;;;;;
;
; HX-2016-06:
; for Scheme code translated from ATS
;
;;;;;;

;;;;;;
; beg of [SCMlist_cats.scm]
;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(define-macro
 (ats2scmpre_SCMlist_nil) `(list))
(define-macro
 (ats2scmpre_SCMlist_sing x) `(list ,x))
(define-macro
 (ats2scmpre_SCMlist_pair x1 x2) `(list ,x1 ,x2))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-macro
 (ats2scmpre_SCMlist_cons x0 xs) `(cons ,x0 ,xs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; (define
;;  (ats2scmpre_SCMlist_make_elt n x0)
;;  (letrec
;;    ((loop
;;      (lambda(n res)
;;       (if (> n 0) (loop (- n 1) (ats2scmpre_SCMlist_cons x0 res)) res))
;;     )
;;    ) (loop n (ats2scmpre_SCMlist_nil))
;;  ) ;; letrec
;; ) ;; define-ats2scmpre_SCMlist_make_elt
(define-macro
 (ats2scmpre_SCMlist_make_elt n x0) `(make-list ,n ,x0))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-macro
 (ats2scmpre_SCMlist_is_nil xs) `(null? ,xs))
(define-macro
 (ats2scmpre_SCMlist_is_cons xs) `(not (null? ,xs)))
(define-macro
 (ats2scmpre_SCMlist_isnot_nil xs) `(not (null? ,xs)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(define-macro
 (ats2scmpre_SCMlist_length xs) `(length ,xs))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-macro (ats2scmpre_SCMlist_head xs) `(car ,xs))
(define-macro (ats2scmpre_SCMlist_tail xs) `(cdr ,xs))
(define-macro (ats2scmpre_SCMlist_last_pair xs) `(last-pair ,xs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(define-macro
 (ats2scmpre_SCMlist_get_at xs i) `(list-ref ,xs ,i))
(define-macro
 (ats2scmpre_SCMlist_set_at xs i x0) `(list-set! ,xs ,i ,x0))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(define-macro
 (ats2scmpre_SCMlist_append xs ys) `(append ,xs ,ys))
;;
(define-macro (ats2scmpre_SCMlist_reverse xs) `(reverse ,xs))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; Note that [fold] is is SRFI-1
;; So this one is implemented in list.dats
;; 
;;(define-macro
;; (ats2scmpre_SCMlist2list_rev xs)
;;`(fold (lambda (x xs) (cons x xs)) '() ,xs)
;;) ; define-macro
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-macro
 (ats2scmpre_SCMlist_sort_2 xs cmp)
`(let ((cmp (ats2scmpre_cloref2fun2 ,cmp)))
    (sort ,xs (lambda(x1 x2) (< (cmp x1 x2) 0))))
) ; define-macro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;; end of [SCMlist_cats.scm] ;;;;;;
;;;;;;
;;
;; The Scheme code is generated by atscc2scm
;; The starting compilation time is: 2018-6-23:  7h:50m
;;
;;;;;;

(define
(_ats2scmpre_list_patsfun_40__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_40 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_44__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_44 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_47__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_47 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_51__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_51 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_55__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_55 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_59__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_59 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_62__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_62 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_66__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_66 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_68__closurerize)
;;%{
  (list (lambda(_fcenvs_ xarg0 xarg1)(_ats2scmpre_list_patsfun_68 xarg0 xarg1)))
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_72__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_72 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_76__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_76 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_81__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_81 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_85__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_85 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_89__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_89 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_93__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_93 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_101__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_101 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_104__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_104 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_107__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_107 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_109__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_list_patsfun_109 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_list_patsfun_117__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0 xarg1)(_ats2scmpre_list_patsfun_117 (ATSCCget_1 _fcenvs_) xarg0 xarg1)) xenv0)
;;%}
) ;; define


;;fun
(define
(ats2scmpre_list_make_elt arg0 arg1)
(let(
;;knd = 0
  (tmpret2 #f)
  (tmp7 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_make_elt
  (ATSINStmpset tmp7 atscc2scm_null)
  (_ats2scmpre_list_loop_3 arg1 arg0 tmp7)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_loop_3 env0 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret3 #f)
  (tmp4 #f)
  (tmp5 #f)
  (tmp6 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_list_loop_3
    (ATSINStmpset tmp4 (ats2scmpre_gt_int1_int1 arg0 0))
    (if tmp4
      (begin
       (ATSINStmpset tmp5 (ats2scmpre_sub_int1_int1 arg0 1))
       (ATSINStmpset tmp6 (ATSPMVtysum env0 arg1))
       ;; apy0 = tmp5
       ;; apy1 = tmp6
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; funlab_scm = 1; // __patsflab__ats2scmpre_list_loop_3
       (_ats2scmpre_list_loop_3 env0 tmp5 tmp6)
      ) ;; if-then
      (begin
       arg1
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret3;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_make_intrange_2 arg0 arg1)
(let(
;;knd = 0
  (tmpret8 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_make_intrange_2
  (ats2scmpre_list_make_intrange_3 arg0 arg1 1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_make_intrange_3 arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret9 #f)
  (tmp20 #f)
  (tmp21 #f)
  (tmp22 #f)
  (tmp23 #f)
  (tmp24 #f)
  (tmp25 #f)
  (tmp26 #f)
  (tmp27 #f)
  (tmp28 #f)
  (tmp29 #f)
  (tmp30 #f)
  (tmp31 #f)
  (tmp32 #f)
  (tmp33 #f)
  (tmp34 #f)
  (tmp35 #f)
  (tmp36 #f)
  (tmp37 #f)
  (tmp38 #f)
  (tmp39 #f)
  (tmp40 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_make_intrange_3
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (ATSINStmpset tmp20 (ats2scmpre_gt_int0_int0 arg2 0))
       (if (not (ATSCKpat_bool tmp20 atscc2scm_true))
         (casefnx 2)
         (begin
          (ATSINStmpset tmp21 (ats2scmpre_lt_int0_int0 arg0 arg1))
          (if tmp21
            (begin
             (ATSINStmpset tmp25 (ats2scmpre_sub_int0_int0 arg1 arg0))
             (ATSINStmpset tmp24 (ats2scmpre_add_int0_int0 tmp25 arg2))
             (ATSINStmpset tmp23 (ats2scmpre_sub_int0_int0 tmp24 1))
             (ATSINStmpset tmp22 (ats2scmpre_div_int0_int0 tmp23 arg2))
             (ATSINStmpset tmp28 (ats2scmpre_sub_int0_int0 tmp22 1))
             (ATSINStmpset tmp27 (ats2scmpre_mul_int0_int0 tmp28 arg2))
             (ATSINStmpset tmp26 (ats2scmpre_add_int0_int0 arg0 tmp27))
             (ATSINStmpset tmp29 atscc2scm_null)
             (_ats2scmpre_list_loop1_6 tmp22 tmp26 arg2 tmp29)
            ) ;; if-then
            (begin
             atscc2scm_null
            ) ;; if-else
          )
         )
       )
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((2)
       (ATSINStmpset tmp30 (ats2scmpre_lt_int0_int0 arg2 0))
       (if (not (ATSCKpat_bool tmp30 atscc2scm_true))
         (casefnx 3)
         (begin
          (ATSINStmpset tmp31 (ats2scmpre_gt_int0_int0 arg0 arg1))
          (if tmp31
            (begin
             (ATSINStmpset tmp32 (ats2scmpre_neg_int0 arg2))
             (ATSINStmpset tmp36 (ats2scmpre_sub_int0_int0 arg0 arg1))
             (ATSINStmpset tmp35 (ats2scmpre_add_int0_int0 tmp36 tmp32))
             (ATSINStmpset tmp34 (ats2scmpre_sub_int0_int0 tmp35 1))
             (ATSINStmpset tmp33 (ats2scmpre_div_int0_int0 tmp34 tmp32))
             (ATSINStmpset tmp39 (ats2scmpre_sub_int0_int0 tmp33 1))
             (ATSINStmpset tmp38 (ats2scmpre_mul_int0_int0 tmp39 tmp32))
             (ATSINStmpset tmp37 (ats2scmpre_sub_int0_int0 arg0 tmp38))
             (ATSINStmpset tmp40 atscc2scm_null)
             (_ats2scmpre_list_loop2_7 tmp33 tmp37 tmp32 tmp40)
            ) ;; if-then
            (begin
             atscc2scm_null
            ) ;; if-else
          )
         )
       )
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_loop1_6 arg0 arg1 arg2 arg3)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
;;(apy2 #f)
;;(apy3 #f)
  (tmpret10 #f)
  (tmp11 #f)
  (tmp12 #f)
  (tmp13 #f)
  (tmp14 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_list_loop1_6
    (ATSINStmpset tmp11 (ats2scmpre_gt_int0_int0 arg0 0))
    (if tmp11
      (begin
       (ATSINStmpset tmp12 (ats2scmpre_sub_int0_int0 arg0 1))
       (ATSINStmpset tmp13 (ats2scmpre_sub_int0_int0 arg1 arg2))
       (ATSINStmpset tmp14 (ATSPMVtysum arg1 arg3))
       ;; apy0 = tmp12
       ;; apy1 = tmp13
       ;; apy2 = arg2
       ;; apy3 = tmp14
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; arg2 = apy2
       ;; arg3 = apy3
       ;; funlab_scm = 1; // __patsflab__ats2scmpre_list_loop1_6
       (_ats2scmpre_list_loop1_6 tmp12 tmp13 arg2 tmp14)
      ) ;; if-then
      (begin
       arg3
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret10;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_loop2_7 arg0 arg1 arg2 arg3)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
;;(apy2 #f)
;;(apy3 #f)
  (tmpret15 #f)
  (tmp16 #f)
  (tmp17 #f)
  (tmp18 #f)
  (tmp19 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_list_loop2_7
    (ATSINStmpset tmp16 (ats2scmpre_gt_int0_int0 arg0 0))
    (if tmp16
      (begin
       (ATSINStmpset tmp17 (ats2scmpre_sub_int0_int0 arg0 1))
       (ATSINStmpset tmp18 (ats2scmpre_add_int0_int0 arg1 arg2))
       (ATSINStmpset tmp19 (ATSPMVtysum arg1 arg3))
       ;; apy0 = tmp17
       ;; apy1 = tmp18
       ;; apy2 = arg2
       ;; apy3 = tmp19
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; arg2 = apy2
       ;; arg3 = apy3
       ;; funlab_scm = 1; // __patsflab__ats2scmpre_list_loop2_7
       (_ats2scmpre_list_loop2_7 tmp17 tmp18 arg2 tmp19)
      ) ;; if-then
      (begin
       arg3
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret15;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_length arg0)
(let(
;;knd = 0
  (tmpret52 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_length
  (_ats2scmpre_list_loop_14 arg0 0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_loop_14 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret53 #f)
  (tmp55 #f)
  (tmp56 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_list_loop_14
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp55 (ATSSELcon arg0 1))
         (ATSINStmpset tmp56 (ats2scmpre_add_int1_int1 arg1 1))
         ;; apy0 = tmp55
         ;; apy1 = tmp56
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_list_loop_14
         (_ats2scmpre_list_loop_14 tmp55 tmp56)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret53;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_length_gte arg0 arg1)
(let(
;;knd = 0
  (tmpret57 #f)
  (tmp58 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_length_gte
  (ATSINStmpset tmp58 (ats2scmpre_list_length_compare arg0 arg1))
  (ats2scmpre_gte_int1_int1 tmp58 0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_length_compare arg0 arg1)
(let(
;;knd = 0
  (tmpret59 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_length_compare
  (_ats2scmpre_list_loop_17 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_loop_17 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret60 #f)
  (tmp61 #f)
  (tmp63 #f)
  (tmp64 #f)
  (tmp65 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_list_loop_17
    (ATSINStmpset tmp61 (ats2scmpre_lt_int1_int1 arg1 0))
    (if tmp61
      (begin
       1
      ) ;; if-then
      (begin
       (letrec(
         (casefnx
          (lambda(tmplab)(case tmplab
           ;; ATSbranchseq_beg
           ((1)
            (if (ATSCKptrisnull arg0)
              (casefnx 3)
              (begin
               (casefnx 2)
              )
            )
           ) ;; end-of-branch
           ((2)
            (ATSINStmpset tmp63 (ATSSELcon arg0 1))
            (ATSINStmpset tmp64 (ats2scmpre_sub_int1_int1 arg1 1))
            ;; apy0 = tmp63
            ;; apy1 = tmp64
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_scm = 1; // __patsflab__ats2scmpre_list_loop_17
            (_ats2scmpre_list_loop_17 tmp63 tmp64)
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; ATSbranchseq_beg
           ((3)
            (ATSINStmpset tmp65 (ats2scmpre_eq_int1_int1 arg1 0))
            (if tmp65
              (begin
               0
              ) ;; if-then
              (begin
               (ats2scmpre_neg_int1 1)
              ) ;; if-else
            )
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
           ) ;; end-of-case
          ) ;; end-of-lambda
         ) ;; end-of-casefnx
        ) (casefnx 1)
       ) ;; end-of-letrec
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret60;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_head arg0)
(let(
;;knd = 0
  (tmpret66 #f)
  (tmp67 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_head
  (ATSINStmpset tmp67 (ATSSELcon arg0 0))
  tmp67
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_tail arg0)
(let(
;;knd = 0
  (tmpret68 #f)
  (tmp69 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_tail
  (ATSINStmpset tmp69 (ATSSELcon arg0 1))
  tmp69
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_last arg0)
(let(
;;knd = 1
;;(apy0 #f)
  (tmpret70 #f)
  (tmp71 #f)
  (tmp72 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab_list_last
    (ATSINStmpset tmp71 (ATSSELcon arg0 0))
    (ATSINStmpset tmp72 (ATSSELcon arg0 1))
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons tmp72)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         tmp71
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         ;; apy0 = tmp72
         ;; arg0 = apy0
         ;; funlab_scm = 1; // __patsflab_list_last
         (ats2scmpre_list_last tmp72)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret70;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_get_at arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret73 #f)
  (tmp74 #f)
  (tmp75 #f)
  (tmp76 #f)
  (tmp77 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab_list_get_at
    (ATSINStmpset tmp74 (ats2scmpre_eq_int1_int1 arg1 0))
    (if tmp74
      (begin
       (ATSINStmpset tmp75 (ATSSELcon arg0 0))
       tmp75
      ) ;; if-then
      (begin
       (ATSINStmpset tmp76 (ATSSELcon arg0 1))
       (ATSINStmpset tmp77 (ats2scmpre_sub_int1_int1 arg1 1))
       ;; apy0 = tmp76
       ;; apy1 = tmp77
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; funlab_scm = 1; // __patsflab_list_get_at
       (ats2scmpre_list_get_at tmp76 tmp77)
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret73;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_snoc arg0 arg1)
(let(
;;knd = 0
  (tmpret78 #f)
  (tmp79 #f)
  (tmp80 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_snoc
  (ATSINStmpset tmp80 atscc2scm_null)
  (ATSINStmpset tmp79 (ATSPMVtysum arg1 tmp80))
  (ats2scmpre_list_append arg0 tmp79)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_extend arg0 arg1)
(let(
;;knd = 0
  (tmpret81 #f)
  (tmp82 #f)
  (tmp83 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_extend
  (ATSINStmpset tmp83 atscc2scm_null)
  (ATSINStmpset tmp82 (ATSPMVtysum arg1 tmp83))
  (ats2scmpre_list_append arg0 tmp82)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_append arg0 arg1)
(let(
;;knd = 0
  (tmpret84 #f)
  (tmp85 #f)
  (tmp86 #f)
  (tmp87 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_append
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       arg1
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp85 (ATSSELcon arg0 0))
       (ATSINStmpset tmp86 (ATSSELcon arg0 1))
       (ATSINStmpset tmp87 (ats2scmpre_list_append tmp86 arg1))
       (ATSPMVtysum tmp85 tmp87)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_mul_int_list arg0 arg1)
(let(
;;knd = 0
  (tmpret88 #f)
  (tmp93 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_mul_int_list
  (ATSINStmpset tmp93 atscc2scm_null)
  (_ats2scmpre_list_loop_26 arg1 arg0 tmp93)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_loop_26 env0 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret89 #f)
  (tmp90 #f)
  (tmp91 #f)
  (tmp92 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_list_loop_26
    (ATSINStmpset tmp90 (ats2scmpre_gt_int1_int1 arg0 0))
    (if tmp90
      (begin
       (ATSINStmpset tmp91 (ats2scmpre_sub_int1_int1 arg0 1))
       (ATSINStmpset tmp92 (ats2scmpre_list_append env0 arg1))
       ;; apy0 = tmp91
       ;; apy1 = tmp92
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; funlab_scm = 1; // __patsflab__ats2scmpre_list_loop_26
       (_ats2scmpre_list_loop_26 env0 tmp91 tmp92)
      ) ;; if-then
      (begin
       arg1
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret89;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_reverse arg0)
(let(
;;knd = 0
  (tmpret94 #f)
  (tmp95 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_reverse
  (ATSINStmpset tmp95 atscc2scm_null)
  (ats2scmpre_list_reverse_append arg0 tmp95)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_reverse_append arg0 arg1)
(let(
;;knd = 0
  (tmpret96 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_reverse_append
  (_ats2scmpre_list_loop_29 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_loop_29 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret97 #f)
  (tmp98 #f)
  (tmp99 #f)
  (tmp100 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_list_loop_29
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp98 (ATSSELcon arg0 0))
         (ATSINStmpset tmp99 (ATSSELcon arg0 1))
         (ATSINStmpset tmp100 (ATSPMVtysum tmp98 arg1))
         ;; apy0 = tmp99
         ;; apy1 = tmp100
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_list_loop_29
         (_ats2scmpre_list_loop_29 tmp99 tmp100)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret97;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_concat arg0)
(let(
;;knd = 0
  (tmpret101 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_concat
  (_ats2scmpre_list_auxlst_31 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_auxlst_31 arg0)
(let(
;;knd = 0
  (tmpret102 #f)
  (tmp103 #f)
  (tmp104 #f)
  (tmp105 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_auxlst_31
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp103 (ATSSELcon arg0 0))
       (ATSINStmpset tmp104 (ATSSELcon arg0 1))
       (ATSINStmpset tmp105 (_ats2scmpre_list_auxlst_31 tmp104))
       (ats2scmpre_list_append tmp103 tmp105)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_take arg0 arg1)
(let(
;;knd = 0
  (tmpret106 #f)
  (tmp107 #f)
  (tmp108 #f)
  (tmp109 #f)
  (tmp110 #f)
  (tmp111 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_take
  (ATSINStmpset tmp107 (ats2scmpre_gt_int1_int1 arg1 0))
  (if tmp107
    (begin
     (ATSINStmpset tmp108 (ATSSELcon arg0 0))
     (ATSINStmpset tmp109 (ATSSELcon arg0 1))
     (ATSINStmpset tmp111 (ats2scmpre_sub_int1_int1 arg1 1))
     (ATSINStmpset tmp110 (ats2scmpre_list_take tmp109 tmp111))
     (ATSPMVtysum tmp108 tmp110)
    ) ;; if-then
    (begin
     atscc2scm_null
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_drop arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret112 #f)
  (tmp113 #f)
  (tmp114 #f)
  (tmp115 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab_list_drop
    (ATSINStmpset tmp113 (ats2scmpre_gt_int1_int1 arg1 0))
    (if tmp113
      (begin
       (ATSINStmpset tmp114 (ATSSELcon arg0 1))
       (ATSINStmpset tmp115 (ats2scmpre_sub_int1_int1 arg1 1))
       ;; apy0 = tmp114
       ;; apy1 = tmp115
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; funlab_scm = 1; // __patsflab_list_drop
       (ats2scmpre_list_drop tmp114 tmp115)
      ) ;; if-then
      (begin
       arg0
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret112;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_split_at arg0 arg1)
(let(
;;knd = 0
  (tmpret116 #f)
  (tmp117 #f)
  (tmp118 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_split_at
  (ATSINStmpset tmp117 (ats2scmpre_list_take arg0 arg1))
  (ATSINStmpset tmp118 (ats2scmpre_list_drop arg0 arg1))
  (ATSPMVtyrec tmp117 tmp118)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_insert_at arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret119 #f)
  (tmp120 #f)
  (tmp121 #f)
  (tmp122 #f)
  (tmp123 #f)
  (tmp124 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_insert_at
  (ATSINStmpset tmp120 (ats2scmpre_gt_int1_int1 arg1 0))
  (if tmp120
    (begin
     (ATSINStmpset tmp121 (ATSSELcon arg0 0))
     (ATSINStmpset tmp122 (ATSSELcon arg0 1))
     (ATSINStmpset tmp124 (ats2scmpre_sub_int1_int1 arg1 1))
     (ATSINStmpset tmp123 (ats2scmpre_list_insert_at tmp122 tmp124 arg2))
     (ATSPMVtysum tmp121 tmp123)
    ) ;; if-then
    (begin
     (ATSPMVtysum arg2 arg0)
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_remove_at arg0 arg1)
(let(
;;knd = 0
  (tmpret125 #f)
  (tmp126 #f)
  (tmp127 #f)
  (tmp128 #f)
  (tmp129 #f)
  (tmp130 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_remove_at
  (ATSINStmpset tmp126 (ATSSELcon arg0 0))
  (ATSINStmpset tmp127 (ATSSELcon arg0 1))
  (ATSINStmpset tmp128 (ats2scmpre_gt_int1_int1 arg1 0))
  (if tmp128
    (begin
     (ATSINStmpset tmp130 (ats2scmpre_sub_int1_int1 arg1 1))
     (ATSINStmpset tmp129 (ats2scmpre_list_remove_at tmp127 tmp130))
     (ATSPMVtysum tmp126 tmp129)
    ) ;; if-then
    (begin
     tmp127
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_takeout_at arg0 arg1)
(let(
;;knd = 0
  (tmpret131 #f)
  (tmp132 #f)
  (tmp133 #f)
  (tmp134 #f)
  (tmp135 #f)
  (tmp136 #f)
  (tmp137 #f)
  (tmp138 #f)
  (tmp139 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_takeout_at
  (ATSINStmpset tmp132 (ATSSELcon arg0 0))
  (ATSINStmpset tmp133 (ATSSELcon arg0 1))
  (ATSINStmpset tmp134 (ats2scmpre_gt_int1_int1 arg1 0))
  (if tmp134
    (begin
     (ATSINStmpset tmp136 (ats2scmpre_sub_int1_int1 arg1 1))
     (ATSINStmpset tmp135 (ats2scmpre_list_takeout_at tmp133 tmp136))
     (ATSINStmpset tmp137 (ATSSELboxrec tmp135 0))
     (ATSINStmpset tmp138 (ATSSELboxrec tmp135 1))
     (ATSINStmpset tmp139 (ATSPMVtysum tmp132 tmp138))
     (ATSPMVtyrec tmp137 tmp139)
    ) ;; if-then
    (begin
     (ATSPMVtyrec tmp132 tmp133)
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_exists arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret140 #f)
  (tmp141 #f)
  (tmp142 #f)
  (tmp143 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab_list_exists
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         atscc2scm_false
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp141 (ATSSELcon arg0 0))
         (ATSINStmpset tmp142 (ATSSELcon arg0 1))
         (ATSINStmpset tmp143 ((ATSfunclo_fclo arg1) arg1 tmp141))
         (if tmp143
           (begin
            atscc2scm_true
           ) ;; if-then
           (begin
            ;; apy0 = tmp142
            ;; apy1 = arg1
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_scm = 1; // __patsflab_list_exists
            (ats2scmpre_list_exists tmp142 arg1)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret140;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_exists_method arg0)
(let(
;;knd = 0
  (tmpret144 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_exists_method
  (_ats2scmpre_list_patsfun_40__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_40 env0 arg0)
(let(
;;knd = 0
  (tmpret145 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_40
  (ats2scmpre_list_exists env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_iexists arg0 arg1)
(let(
;;knd = 0
  (tmpret146 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_iexists
  (_ats2scmpre_list_loop_42 arg1 0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_loop_42 env0 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret147 #f)
  (tmp148 #f)
  (tmp149 #f)
  (tmp150 #f)
  (tmp151 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_list_loop_42
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         atscc2scm_false
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp148 (ATSSELcon arg1 0))
         (ATSINStmpset tmp149 (ATSSELcon arg1 1))
         (ATSINStmpset tmp150 ((ATSfunclo_fclo env0) env0 arg0 tmp148))
         (if tmp150
           (begin
            atscc2scm_true
           ) ;; if-then
           (begin
            (ATSINStmpset tmp151 (ats2scmpre_add_int1_int1 arg0 1))
            ;; apy0 = tmp151
            ;; apy1 = tmp149
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_scm = 1; // __patsflab__ats2scmpre_list_loop_42
            (_ats2scmpre_list_loop_42 env0 tmp151 tmp149)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret147;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_iexists_method arg0)
(let(
;;knd = 0
  (tmpret152 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_iexists_method
  (_ats2scmpre_list_patsfun_44__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_44 env0 arg0)
(let(
;;knd = 0
  (tmpret153 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_44
  (ats2scmpre_list_iexists env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_forall arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret154 #f)
  (tmp155 #f)
  (tmp156 #f)
  (tmp157 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab_list_forall
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         atscc2scm_true
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp155 (ATSSELcon arg0 0))
         (ATSINStmpset tmp156 (ATSSELcon arg0 1))
         (ATSINStmpset tmp157 ((ATSfunclo_fclo arg1) arg1 tmp155))
         (if tmp157
           (begin
            ;; apy0 = tmp156
            ;; apy1 = arg1
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_scm = 1; // __patsflab_list_forall
            (ats2scmpre_list_forall tmp156 arg1)
           ) ;; if-then
           (begin
            atscc2scm_false
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret154;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_forall_method arg0)
(let(
;;knd = 0
  (tmpret158 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_forall_method
  (_ats2scmpre_list_patsfun_47__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_47 env0 arg0)
(let(
;;knd = 0
  (tmpret159 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_47
  (ats2scmpre_list_forall env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_iforall arg0 arg1)
(let(
;;knd = 0
  (tmpret160 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_iforall
  (_ats2scmpre_list_loop_49 arg1 0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_loop_49 env0 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret161 #f)
  (tmp162 #f)
  (tmp163 #f)
  (tmp164 #f)
  (tmp165 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_list_loop_49
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         atscc2scm_true
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp162 (ATSSELcon arg1 0))
         (ATSINStmpset tmp163 (ATSSELcon arg1 1))
         (ATSINStmpset tmp164 ((ATSfunclo_fclo env0) env0 arg0 tmp162))
         (if tmp164
           (begin
            (ATSINStmpset tmp165 (ats2scmpre_add_int1_int1 arg0 1))
            ;; apy0 = tmp165
            ;; apy1 = tmp163
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_scm = 1; // __patsflab__ats2scmpre_list_loop_49
            (_ats2scmpre_list_loop_49 env0 tmp165 tmp163)
           ) ;; if-then
           (begin
            atscc2scm_false
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret161;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_iforall_method arg0)
(let(
;;knd = 0
  (tmpret166 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_iforall_method
  (_ats2scmpre_list_patsfun_51__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_51 env0 arg0)
(let(
;;knd = 0
  (tmpret167 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_51
  (ats2scmpre_list_iforall env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_app arg0 arg1)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_app
  (ATSINSmove1_void (ats2scmpre_list_foreach arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_foreach arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmp170 #f)
  (tmp171 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab_list_foreach
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         ATSINSmove0_void
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp170 (ATSSELcon arg0 0))
         (ATSINStmpset tmp171 (ATSSELcon arg0 1))
         (ATSINSmove1_void ((ATSfunclo_fclo arg1) arg1 tmp170))
         ;; apy0 = tmp171
         ;; apy1 = arg1
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab_list_foreach
         (ats2scmpre_list_foreach tmp171 arg1)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return/*_void*/;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_foreach_method arg0)
(let(
;;knd = 0
  (tmpret173 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_foreach_method
  (_ats2scmpre_list_patsfun_55__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_55 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_55
  (ATSINSmove1_void (ats2scmpre_list_foreach env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_iforeach arg0 arg1)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_iforeach
  (ATSINSmove1_void (_ats2scmpre_list_aux_57 arg1 0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_aux_57 env0 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmp177 #f)
  (tmp178 #f)
  (tmp180 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_list_aux_57
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         ATSINSmove0_void
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp177 (ATSSELcon arg1 0))
         (ATSINStmpset tmp178 (ATSSELcon arg1 1))
         (ATSINSmove1_void ((ATSfunclo_fclo env0) env0 arg0 tmp177))
         (ATSINStmpset tmp180 (ats2scmpre_add_int1_int1 arg0 1))
         ;; apy0 = tmp180
         ;; apy1 = tmp178
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_list_aux_57
         (_ats2scmpre_list_aux_57 env0 tmp180 tmp178)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return/*_void*/;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_iforeach_method arg0)
(let(
;;knd = 0
  (tmpret181 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_iforeach_method
  (_ats2scmpre_list_patsfun_59__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_59 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_59
  (ATSINSmove1_void (ats2scmpre_list_iforeach env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_rforeach arg0 arg1)
(let(
;;knd = 0
  (tmp184 #f)
  (tmp185 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_rforeach
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       ATSINSmove0_void
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp184 (ATSSELcon arg0 0))
       (ATSINStmpset tmp185 (ATSSELcon arg0 1))
       (ATSINSmove1_void (ats2scmpre_list_rforeach tmp185 arg1))
       (ATSINSmove1_void ((ATSfunclo_fclo arg1) arg1 tmp184))
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_rforeach_method arg0)
(let(
;;knd = 0
  (tmpret187 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_rforeach_method
  (_ats2scmpre_list_patsfun_62__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_62 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_62
  (ATSINSmove1_void (ats2scmpre_list_rforeach env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_filter arg0 arg1)
(let(
;;knd = 0
  (tmpret189 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_filter
  (_ats2scmpre_list_aux_64 arg1 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_aux_64 env0 arg0)
(let(
;;knd = 1
;;(apy0 #f)
  (tmpret190 #f)
  (tmp191 #f)
  (tmp192 #f)
  (tmp193 #f)
  (tmp194 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_list_aux_64
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         atscc2scm_null
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp191 (ATSSELcon arg0 0))
         (ATSINStmpset tmp192 (ATSSELcon arg0 1))
         (ATSINStmpset tmp193 ((ATSfunclo_fclo env0) env0 tmp191))
         (if tmp193
           (begin
            (ATSINStmpset tmp194 (_ats2scmpre_list_aux_64 env0 tmp192))
            (ATSPMVtysum tmp191 tmp194)
           ) ;; if-then
           (begin
            ;; apy0 = tmp192
            ;; arg0 = apy0
            ;; funlab_scm = 1; // __patsflab__ats2scmpre_list_aux_64
            (_ats2scmpre_list_aux_64 env0 tmp192)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret190;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_filter_method arg0)
(let(
;;knd = 0
  (tmpret195 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_filter_method
  (_ats2scmpre_list_patsfun_66__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_66 env0 arg0)
(let(
;;knd = 0
  (tmpret196 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_66
  (ats2scmpre_list_filter env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_labelize arg0)
(let(
;;knd = 0
  (tmpret197 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_labelize
  (ats2scmpre_list_imap arg0 (_ats2scmpre_list_patsfun_68__closurerize))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_68 arg0 arg1)
(let(
;;knd = 0
  (tmpret198 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_68
  (ATSPMVtyrec arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_map arg0 arg1)
(let(
;;knd = 0
  (tmpret199 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_map
  (_ats2scmpre_list_aux_70 arg1 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_aux_70 env0 arg0)
(let(
;;knd = 0
  (tmpret200 #f)
  (tmp201 #f)
  (tmp202 #f)
  (tmp203 #f)
  (tmp204 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_aux_70
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp201 (ATSSELcon arg0 0))
       (ATSINStmpset tmp202 (ATSSELcon arg0 1))
       (ATSINStmpset tmp203 ((ATSfunclo_fclo env0) env0 tmp201))
       (ATSINStmpset tmp204 (_ats2scmpre_list_aux_70 env0 tmp202))
       (ATSPMVtysum tmp203 tmp204)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_map_method arg0 arg1)
(let(
;;knd = 0
  (tmpret205 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_map_method
  (_ats2scmpre_list_patsfun_72__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_72 env0 arg0)
(let(
;;knd = 0
  (tmpret206 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_72
  (ats2scmpre_list_map env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_imap arg0 arg1)
(let(
;;knd = 0
  (tmpret207 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_imap
  (_ats2scmpre_list_aux_74 arg1 0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_aux_74 env0 arg0 arg1)
(let(
;;knd = 0
  (tmpret208 #f)
  (tmp209 #f)
  (tmp210 #f)
  (tmp211 #f)
  (tmp212 #f)
  (tmp213 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_aux_74
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg1)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp209 (ATSSELcon arg1 0))
       (ATSINStmpset tmp210 (ATSSELcon arg1 1))
       (ATSINStmpset tmp211 ((ATSfunclo_fclo env0) env0 arg0 tmp209))
       (ATSINStmpset tmp213 (ats2scmpre_add_int1_int1 arg0 1))
       (ATSINStmpset tmp212 (_ats2scmpre_list_aux_74 env0 tmp213 tmp210))
       (ATSPMVtysum tmp211 tmp212)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_imap_method arg0 arg1)
(let(
;;knd = 0
  (tmpret214 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_imap_method
  (_ats2scmpre_list_patsfun_76__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_76 env0 arg0)
(let(
;;knd = 0
  (tmpret215 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_76
  (ats2scmpre_list_imap env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_map2 arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret216 #f)
  (tmp217 #f)
  (tmp218 #f)
  (tmp219 #f)
  (tmp220 #f)
  (tmp221 #f)
  (tmp222 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_map2
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp217 (ATSSELcon arg0 0))
       (ATSINStmpset tmp218 (ATSSELcon arg0 1))
       (letrec(
         (casefnx
          (lambda(tmplab)(case tmplab
           ;; ATSbranchseq_beg
           ((1)
            (if (ATSCKptriscons arg1)
              (casefnx 4)
              (begin
               (casefnx 2)
              )
            )
           ) ;; end-of-branch
           ((2)
            atscc2scm_null
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; ATSbranchseq_beg
           ((3)
            (casefnx 4)
           ) ;; end-of-branch
           ((4)
            (ATSINStmpset tmp219 (ATSSELcon arg1 0))
            (ATSINStmpset tmp220 (ATSSELcon arg1 1))
            (ATSINStmpset tmp221 ((ATSfunclo_fclo arg2) arg2 tmp217 tmp219))
            (ATSINStmpset tmp222 (ats2scmpre_list_map2 tmp218 tmp220 arg2))
            (ATSPMVtysum tmp221 tmp222)
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
           ) ;; end-of-case
          ) ;; end-of-lambda
         ) ;; end-of-casefnx
        ) (casefnx 1)
       ) ;; end-of-letrec
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_foldleft arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret223 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_foldleft
  (_ats2scmpre_list_loop_79 arg2 arg1 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_loop_79 env0 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret224 #f)
  (tmp225 #f)
  (tmp226 #f)
  (tmp227 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_list_loop_79
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         arg0
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp225 (ATSSELcon arg1 0))
         (ATSINStmpset tmp226 (ATSSELcon arg1 1))
         (ATSINStmpset tmp227 ((ATSfunclo_fclo env0) env0 arg0 tmp225))
         ;; apy0 = tmp227
         ;; apy1 = tmp226
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_list_loop_79
         (_ats2scmpre_list_loop_79 env0 tmp227 tmp226)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret224;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_foldleft_method arg0 arg1)
(let(
;;knd = 0
  (tmpret228 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_foldleft_method
  (_ats2scmpre_list_patsfun_81__closurerize arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_81 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret229 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_81
  (ats2scmpre_list_foldleft env0 env1 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_ifoldleft arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret230 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_ifoldleft
  (_ats2scmpre_list_loop_83 arg2 0 arg1 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_loop_83 env0 arg0 arg1 arg2)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
;;(apy2 #f)
  (tmpret231 #f)
  (tmp232 #f)
  (tmp233 #f)
  (tmp234 #f)
  (tmp235 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_list_loop_83
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg2)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp232 (ATSSELcon arg2 0))
         (ATSINStmpset tmp233 (ATSSELcon arg2 1))
         (ATSINStmpset tmp234 (ats2scmpre_add_int1_int1 arg0 1))
         (ATSINStmpset tmp235 ((ATSfunclo_fclo env0) env0 arg0 arg1 tmp232))
         ;; apy0 = tmp234
         ;; apy1 = tmp235
         ;; apy2 = tmp233
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; arg2 = apy2
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_list_loop_83
         (_ats2scmpre_list_loop_83 env0 tmp234 tmp235 tmp233)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret231;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_ifoldleft_method arg0 arg1)
(let(
;;knd = 0
  (tmpret236 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_ifoldleft_method
  (_ats2scmpre_list_patsfun_85__closurerize arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_85 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret237 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_85
  (ats2scmpre_list_ifoldleft env0 env1 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_foldright arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret238 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_foldright
  (_ats2scmpre_list_aux_87 arg1 arg0 arg2)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_aux_87 env0 arg0 arg1)
(let(
;;knd = 0
  (tmpret239 #f)
  (tmp240 #f)
  (tmp241 #f)
  (tmp242 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_aux_87
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       arg1
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp240 (ATSSELcon arg0 0))
       (ATSINStmpset tmp241 (ATSSELcon arg0 1))
       (ATSINStmpset tmp242 (_ats2scmpre_list_aux_87 env0 tmp241 arg1))
       ((ATSfunclo_fclo env0) env0 tmp240 tmp242)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_foldright_method arg0 arg1)
(let(
;;knd = 0
  (tmpret243 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_foldright_method
  (_ats2scmpre_list_patsfun_89__closurerize arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_89 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret244 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_89
  (ats2scmpre_list_foldright env0 arg0 env1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_ifoldright arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret245 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_ifoldright
  (_ats2scmpre_list_aux_91 arg1 0 arg0 arg2)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_aux_91 env0 arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret246 #f)
  (tmp247 #f)
  (tmp248 #f)
  (tmp249 #f)
  (tmp250 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_aux_91
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg1)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       arg2
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp247 (ATSSELcon arg1 0))
       (ATSINStmpset tmp248 (ATSSELcon arg1 1))
       (ATSINStmpset tmp250 (ats2scmpre_add_int1_int1 arg0 1))
       (ATSINStmpset tmp249 (_ats2scmpre_list_aux_91 env0 tmp250 tmp248 arg2))
       ((ATSfunclo_fclo env0) env0 arg0 tmp247 tmp249)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_ifoldright_method arg0 arg1)
(let(
;;knd = 0
  (tmpret251 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_ifoldright_method
  (_ats2scmpre_list_patsfun_93__closurerize arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_93 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret252 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_93
  (ats2scmpre_list_ifoldright env0 arg0 env1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_mergesort arg0 arg1)
(let(
;;knd = 0
  (tmpret255 #f)
  (tmp274 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_mergesort
  (ATSINStmpset tmp274 (ats2scmpre_list_length arg0))
  (_ats2scmpre_list_msort_97 arg1 arg0 tmp274)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_msort_97 env0 arg0 arg1)
(let(
;;knd = 0
  (tmpret256 #f)
  (tmp257 #f)
  (tmp258 #f)
  (tmp259 #f)
  (tmp260 #f)
  (tmp261 #f)
  (tmp262 #f)
  (tmp263 #f)
  (tmp264 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_msort_97
  (ATSINStmpset tmp257 (ats2scmpre_lt_int1_int1 arg1 2))
  (if tmp257
    (begin
     arg0
    ) ;; if-then
    (begin
     (ATSINStmpset tmp258 (ats2scmpre_half_int1 arg1))
     (ATSINStmpset tmp259 (ats2scmpre_list_split_at arg0 tmp258))
     (ATSINStmpset tmp260 (ATSSELboxrec tmp259 0))
     (ATSINStmpset tmp261 (ATSSELboxrec tmp259 1))
     (ATSINStmpset tmp262 (_ats2scmpre_list_msort_97 env0 tmp260 tmp258))
     (ATSINStmpset tmp264 (ats2scmpre_sub_int1_int1 arg1 tmp258))
     (ATSINStmpset tmp263 (_ats2scmpre_list_msort_97 env0 tmp261 tmp264))
     (_ats2scmpre_list_merge_98 env0 tmp262 tmp263)
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_merge_98 env0 arg0 arg1)
(let(
;;knd = 0
  (tmpret265 #f)
  (tmp266 #f)
  (tmp267 #f)
  (tmp268 #f)
  (tmp269 #f)
  (tmp270 #f)
  (tmp271 #f)
  (tmp272 #f)
  (tmp273 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_merge_98
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       arg1
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp266 (ATSSELcon arg0 0))
       (ATSINStmpset tmp267 (ATSSELcon arg0 1))
       (letrec(
         (casefnx
          (lambda(tmplab)(case tmplab
           ;; ATSbranchseq_beg
           ((1)
            (if (ATSCKptriscons arg1)
              (casefnx 4)
              (begin
               (casefnx 2)
              )
            )
           ) ;; end-of-branch
           ((2)
            arg0
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; ATSbranchseq_beg
           ((3)
            (casefnx 4)
           ) ;; end-of-branch
           ((4)
            (ATSINStmpset tmp268 (ATSSELcon arg1 0))
            (ATSINStmpset tmp269 (ATSSELcon arg1 1))
            (ATSINStmpset tmp270 ((ATSfunclo_fclo env0) env0 tmp266 tmp268))
            (ATSINStmpset tmp271 (ats2scmpre_lte_int0_int0 tmp270 0))
            (if tmp271
              (begin
               (ATSINStmpset tmp272 (_ats2scmpre_list_merge_98 env0 tmp267 arg1))
               (ATSPMVtysum tmp266 tmp272)
              ) ;; if-then
              (begin
               (ATSINStmpset tmp273 (_ats2scmpre_list_merge_98 env0 arg0 tmp269))
               (ATSPMVtysum tmp268 tmp273)
              ) ;; if-else
            )
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
           ) ;; end-of-case
          ) ;; end-of-lambda
         ) ;; end-of-casefnx
        ) (casefnx 1)
       ) ;; end-of-letrec
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_streamize_list_elt arg0)
(let(
;;knd = 0
  (tmpret275 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_streamize_list_elt
  (_ats2scmpre_list_auxmain_100 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_auxmain_100 arg0)
(let(
;;knd = 0
  (tmpret276 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_auxmain_100
  (ATSPMVllazyval (_ats2scmpre_list_patsfun_101__closurerize arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_101 env0 arg0)
(let(
;;knd = 0
  (tmpret277 #f)
  (tmp278 #f)
  (tmp279 #f)
  (tmp280 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_101
  (if arg0
    (begin
     (letrec(
       (casefnx
        (lambda(tmplab)(case tmplab
         ;; ATSbranchseq_beg
         ((1)
          (if (ATSCKptriscons env0)
            (casefnx 4)
            (begin
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         ((2)
          atscc2scm_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         ((3)
          (casefnx 4)
         ) ;; end-of-branch
         ((4)
          (ATSINStmpset tmp278 (ATSSELcon env0 0))
          (ATSINStmpset tmp279 (ATSSELcon env0 1))
          (ATSINStmpset tmp280 (_ats2scmpre_list_auxmain_100 tmp279))
          (ATSPMVtysum tmp278 tmp280)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
         ) ;; end-of-case
        ) ;; end-of-lambda
       ) ;; end-of-casefnx
      ) (casefnx 1)
     ) ;; end-of-letrec
    ) ;; if-then
    (begin
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_streamize_list_zip arg0 arg1)
(let(
;;knd = 0
  (tmpret281 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_streamize_list_zip
  (_ats2scmpre_list_auxmain_103 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_auxmain_103 arg0 arg1)
(let(
;;knd = 0
  (tmpret282 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_auxmain_103
  (ATSPMVllazyval (_ats2scmpre_list_patsfun_104__closurerize arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_104 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret283 #f)
  (tmp284 #f)
  (tmp285 #f)
  (tmp286 #f)
  (tmp287 #f)
  (tmp288 #f)
  (tmp289 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_104
  (if arg0
    (begin
     (letrec(
       (casefnx
        (lambda(tmplab)(case tmplab
         ;; ATSbranchseq_beg
         ((1)
          (if (ATSCKptriscons env0)
            (casefnx 4)
            (begin
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         ((2)
          atscc2scm_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         ((3)
          (casefnx 4)
         ) ;; end-of-branch
         ((4)
          (ATSINStmpset tmp284 (ATSSELcon env0 0))
          (ATSINStmpset tmp285 (ATSSELcon env0 1))
          (letrec(
            (casefnx
             (lambda(tmplab)(case tmplab
              ;; ATSbranchseq_beg
              ((1)
               (if (ATSCKptriscons env1)
                 (casefnx 4)
                 (begin
                  (casefnx 2)
                 )
               )
              ) ;; end-of-branch
              ((2)
               atscc2scm_null
              ) ;; end-of-branch
              ;; ATSbranchseq_end
              ;; ATSbranchseq_beg
              ((3)
               (casefnx 4)
              ) ;; end-of-branch
              ((4)
               (ATSINStmpset tmp286 (ATSSELcon env1 0))
               (ATSINStmpset tmp287 (ATSSELcon env1 1))
               (ATSINStmpset tmp288 (ATSPMVtyrec tmp284 tmp286))
               (ATSINStmpset tmp289 (_ats2scmpre_list_auxmain_103 tmp285 tmp287))
               (ATSPMVtysum tmp288 tmp289)
              ) ;; end-of-branch
              ;; ATSbranchseq_end
              ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
              ) ;; end-of-case
             ) ;; end-of-lambda
            ) ;; end-of-casefnx
           ) (casefnx 1)
          ) ;; end-of-letrec
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
         ) ;; end-of-case
        ) ;; end-of-lambda
       ) ;; end-of-casefnx
      ) (casefnx 1)
     ) ;; end-of-letrec
    ) ;; if-then
    (begin
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_streamize_list_cross arg0 arg1)
(let(
;;knd = 0
  (tmpret290 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_streamize_list_cross
  (_ats2scmpre_list_auxmain_108 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_auxone_106 arg0 arg1)
(let(
;;knd = 0
  (tmpret291 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_auxone_106
  (ATSPMVllazyval (_ats2scmpre_list_patsfun_107__closurerize arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_107 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret292 #f)
  (tmp293 #f)
  (tmp294 #f)
  (tmp295 #f)
  (tmp296 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_107
  (if arg0
    (begin
     (letrec(
       (casefnx
        (lambda(tmplab)(case tmplab
         ;; ATSbranchseq_beg
         ((1)
          (if (ATSCKptriscons env1)
            (casefnx 4)
            (begin
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         ((2)
          atscc2scm_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         ((3)
          (casefnx 4)
         ) ;; end-of-branch
         ((4)
          (ATSINStmpset tmp293 (ATSSELcon env1 0))
          (ATSINStmpset tmp294 (ATSSELcon env1 1))
          (ATSINStmpset tmp295 (ATSPMVtyrec env0 tmp293))
          (ATSINStmpset tmp296 (_ats2scmpre_list_auxone_106 env0 tmp294))
          (ATSPMVtysum tmp295 tmp296)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
         ) ;; end-of-case
        ) ;; end-of-lambda
       ) ;; end-of-casefnx
      ) (casefnx 1)
     ) ;; end-of-letrec
    ) ;; if-then
    (begin
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_auxmain_108 arg0 arg1)
(let(
;;knd = 0
  (tmpret297 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_auxmain_108
  (ATSPMVllazyval (_ats2scmpre_list_patsfun_109__closurerize arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_109 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret298 #f)
  (tmp299 #f)
  (tmp300 #f)
  (tmp301 #f)
  (tmp302 #f)
  (tmp303 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_109
  (if arg0
    (begin
     (letrec(
       (casefnx
        (lambda(tmplab)(case tmplab
         ;; ATSbranchseq_beg
         ((1)
          (if (ATSCKptriscons env0)
            (casefnx 4)
            (begin
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         ((2)
          atscc2scm_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         ((3)
          (casefnx 4)
         ) ;; end-of-branch
         ((4)
          (ATSINStmpset tmp299 (ATSSELcon env0 0))
          (ATSINStmpset tmp300 (ATSSELcon env0 1))
          (ATSINStmpset tmp302 (_ats2scmpre_list_auxone_106 tmp299 env1))
          (ATSINStmpset tmp303 (_ats2scmpre_list_auxmain_108 tmp300 env1))
          (ATSINStmpset tmp301 (ats2scmpre_stream_vt_append tmp302 tmp303))
          (ATSPMVllazyval_eval tmp301)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
         ) ;; end-of-case
        ) ;; end-of-lambda
       ) ;; end-of-casefnx
      ) (casefnx 1)
     ) ;; end-of-letrec
    ) ;; if-then
    (begin
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_SCMlist2list_rev arg0)
(let(
;;knd = 0
  (tmpret308 #f)
  (tmp314 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_SCMlist2list_rev
  (ATSINStmpset tmp314 atscc2scm_null)
  (_ats2scmpre_list_loop_113 arg0 tmp314)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_loop_113 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret309 #f)
  (tmp310 #f)
  (tmp311 #f)
  (tmp312 #f)
  (tmp313 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_list_loop_113
    (ATSINStmpset tmp310 (ats2scmpre_SCMlist_is_nil arg0))
    (if tmp310
      (begin
       arg1
      ) ;; if-then
      (begin
       (ATSINStmpset tmp311 (ats2scmpre_SCMlist_tail arg0))
       (ATSINStmpset tmp313 (ats2scmpre_SCMlist_head arg0))
       (ATSINStmpset tmp312 (ATSPMVtysum tmp313 arg1))
       ;; apy0 = tmp311
       ;; apy1 = tmp312
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; funlab_scm = 1; // __patsflab__ats2scmpre_list_loop_113
       (_ats2scmpre_list_loop_113 tmp311 tmp312)
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret309;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_SCMlist_oflist_rev arg0)
(let(
;;knd = 0
  (tmpret315 #f)
  (tmp320 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_SCMlist_oflist_rev
  (ATSINStmpset tmp320 (ats2scmpre_SCMlist_nil))
  (_ats2scmpre_list_aux_115 arg0 tmp320)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_aux_115 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret316 #f)
  (tmp317 #f)
  (tmp318 #f)
  (tmp319 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_list_aux_115
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp317 (ATSSELcon arg0 0))
         (ATSINStmpset tmp318 (ATSSELcon arg0 1))
         (ATSINStmpset tmp319 (ats2scmpre_SCMlist_cons tmp317 arg1))
         ;; apy0 = tmp318
         ;; apy1 = tmp319
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_list_aux_115
         (_ats2scmpre_list_aux_115 tmp318 tmp319)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret316;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_list_sort_2 arg0 arg1)
(let(
;;knd = 0
  (tmpret321 #f)
  (tmp322 #f)
  (tmp323 #f)
  (tmp326 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list_sort_2
  (ATSINStmpset tmp322 (ats2scmpre_SCMlist_oflist_rev arg0))
  (ATSINStmpset tmp323 (ats2scmpre_SCMlist_sort_2 tmp322 (_ats2scmpre_list_patsfun_117__closurerize arg1)))
  (ATSINStmpset tmp326 (ats2scmpre_SCMlist2list_rev tmp323))
  tmp326
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_list_patsfun_117 env0 arg0 arg1)
(let(
;;knd = 0
  (tmpret324 #f)
  (tmp325 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_list_patsfun_117
  (ATSINStmpset tmp325 ((ATSfunclo_fclo env0) env0 arg0 arg1))
  (ats2scmpre_neg_int0 tmp325)
) ;; end-of-let
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Scheme code is generated by atscc2scm
;; The starting compilation time is: 2018-6-23:  7h:50m
;;
;;;;;;

;;fun
(define
(ats2scmpre_option_some arg0)
(let(
;;knd = 0
  (tmpret0 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_option_some
  (ATSPMVtysum arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_option_none)
(let(
;;knd = 0
  (tmpret1 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_option_none
  atscc2scm_null
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_option_unsome arg0)
(let(
;;knd = 0
  (tmpret2 #f)
  (tmp3 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_option_unsome
  (ATSINStmpset tmp3 (ATSSELcon arg0 0))
  tmp3
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_option_is_some arg0)
(let(
;;knd = 0
  (tmpret4 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_option_is_some
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptrisnull arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_true
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       atscc2scm_false
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_option_is_none arg0)
(let(
;;knd = 0
  (tmpret5 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_option_is_none
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_true
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       atscc2scm_false
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Scheme code is generated by atscc2scm
;; The starting compilation time is: 2018-6-23:  7h:50m
;;
;;;;;;

(define
(_ats2scmpre_stream_patsfun_6__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_patsfun_6 (ATSCCget_1 _fcenvs_))) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_16__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_patsfun_16 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_18__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_patsfun_18 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_24__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_patsfun_24 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_26__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_patsfun_26 (ATSCCget_1 _fcenvs_))) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_28__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_patsfun_28 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_30__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_patsfun_30 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_32__closurerize xenv0 xenv1 xenv2)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_patsfun_32 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) (ATSCCget_3 _fcenvs_))) xenv0 xenv1 xenv2)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_34__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0 xarg1)(_ats2scmpre_stream_patsfun_34 (ATSCCget_1 _fcenvs_) xarg0 xarg1)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_36__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_patsfun_36 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_38__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_patsfun_38 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_41__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_patsfun_41 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_44__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_patsfun_44 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_47__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_patsfun_47 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_51__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_patsfun_51 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_54__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_patsfun_54 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_57__closurerize xenv0 xenv1 xenv2 xenv3)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_patsfun_57 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) (ATSCCget_3 _fcenvs_) (ATSCCget_at _fcenvs_ 4))) xenv0 xenv1 xenv2 xenv3)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_58__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_patsfun_58 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_61__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_patsfun_61 (ATSCCget_1 _fcenvs_))) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_63__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_patsfun_63 (ATSCCget_1 _fcenvs_))) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_65__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_patsfun_65 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_70__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0 xarg1)(_ats2scmpre_stream_patsfun_70 (ATSCCget_1 _fcenvs_) xarg0 xarg1)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_72__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0 xarg1)(_ats2scmpre_stream_patsfun_72 (ATSCCget_1 _fcenvs_) xarg0 xarg1)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_75__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_patsfun_75 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_stream_patsfun_77__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_patsfun_77 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; define


;;fun
(define
(ats2scmpre_stream_make_list arg0)
(let(
;;knd = 0
  (tmpret7 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_make_list
  (ATSPMVlazyval (_ats2scmpre_stream_patsfun_6__closurerize arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_6 env0)
(let(
;;knd = 0
  (tmpret8 #f)
  (tmp9 #f)
  (tmp10 #f)
  (tmp11 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_6
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons env0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp9 (ATSSELcon env0 0))
       (ATSINStmpset tmp10 (ATSSELcon env0 1))
       (ATSINStmpset tmp11 (ats2scmpre_stream_make_list tmp10))
       (ATSPMVtysum tmp9 tmp11)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_make_list0 arg0)
(let(
;;knd = 0
  (tmpret12 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_make_list0
  (ats2scmpre_stream_make_list arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_nth_opt arg0 arg1)
(let(
;;knd = 0
  (tmpret13 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_nth_opt
  (_ats2scmpre_stream_loop_9 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_loop_9 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret14 #f)
  (tmp15 #f)
  (tmp16 #f)
  (tmp17 #f)
  (tmp18 #f)
  (tmp19 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_stream_loop_9
    (ATSINStmpset tmp15 (ATSPMVlazyval_eval arg0))
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons tmp15)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         atscc2scm_null
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp16 (ATSSELcon tmp15 0))
         (ATSINStmpset tmp17 (ATSSELcon tmp15 1))
         (ATSINStmpset tmp18 (ats2scmpre_gt_int1_int1 arg1 0))
         (if tmp18
           (begin
            (ATSINStmpset tmp19 (ats2scmpre_pred_int1 arg1))
            ;; apy0 = tmp17
            ;; apy1 = tmp19
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_scm = 1; // __patsflab__ats2scmpre_stream_loop_9
            (_ats2scmpre_stream_loop_9 tmp17 tmp19)
           ) ;; if-then
           (begin
            (ATSPMVtysum tmp16)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret14;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_length arg0)
(let(
;;knd = 0
  (tmpret20 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_length
  (_ats2scmpre_stream_loop_11 arg0 0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_loop_11 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret21 #f)
  (tmp22 #f)
  (tmp24 #f)
  (tmp25 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_stream_loop_11
    (ATSINStmpset tmp22 (ATSPMVlazyval_eval arg0))
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons tmp22)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp24 (ATSSELcon tmp22 1))
         (ATSINStmpset tmp25 (ats2scmpre_add_int1_int1 arg1 1))
         ;; apy0 = tmp24
         ;; apy1 = tmp25
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_stream_loop_11
         (_ats2scmpre_stream_loop_11 tmp24 tmp25)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret21;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream2list arg0)
(let(
;;knd = 0
  (tmpret26 #f)
  (tmp27 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream2list
  (ATSINStmpset tmp27 (ats2scmpre_stream2list_rev arg0))
  (ats2scmpre_list_reverse tmp27)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream2list_rev arg0)
(let(
;;knd = 0
  (tmpret28 #f)
  (tmp34 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream2list_rev
  (ATSINStmpset tmp34 atscc2scm_null)
  (_ats2scmpre_stream_loop_14 arg0 tmp34)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_loop_14 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret29 #f)
  (tmp30 #f)
  (tmp31 #f)
  (tmp32 #f)
  (tmp33 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_stream_loop_14
    (ATSINStmpset tmp30 (ATSPMVlazyval_eval arg0))
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons tmp30)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp31 (ATSSELcon tmp30 0))
         (ATSINStmpset tmp32 (ATSSELcon tmp30 1))
         (ATSINStmpset tmp33 (ATSPMVtysum tmp31 arg1))
         ;; apy0 = tmp32
         ;; apy1 = tmp33
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_stream_loop_14
         (_ats2scmpre_stream_loop_14 tmp32 tmp33)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret29;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_takeLte arg0 arg1)
(let(
;;knd = 0
  (tmpret35 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_takeLte
  (ATSPMVlazyval (_ats2scmpre_stream_patsfun_16__closurerize arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_16 env0 env1)
(let(
;;knd = 0
  (tmpret36 #f)
  (tmp37 #f)
  (tmp38 #f)
  (tmp39 #f)
  (tmp40 #f)
  (tmp41 #f)
  (tmp42 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_16
  (ATSINStmpset tmp37 (ats2scmpre_gt_int1_int1 env1 0))
  (if tmp37
    (begin
     (ATSINStmpset tmp38 (ATSPMVlazyval_eval env0))
     (letrec(
       (casefnx
        (lambda(tmplab)(case tmplab
         ;; ATSbranchseq_beg
         ((1)
          (if (ATSCKptriscons tmp38)
            (casefnx 4)
            (begin
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         ((2)
          atscc2scm_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         ((3)
          (casefnx 4)
         ) ;; end-of-branch
         ((4)
          (ATSINStmpset tmp39 (ATSSELcon tmp38 0))
          (ATSINStmpset tmp40 (ATSSELcon tmp38 1))
          (ATSINStmpset tmp42 (ats2scmpre_sub_int1_int1 env1 1))
          (ATSINStmpset tmp41 (ats2scmpre_stream_takeLte tmp40 tmp42))
          (ATSPMVtysum tmp39 tmp41)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
         ) ;; end-of-case
        ) ;; end-of-lambda
       ) ;; end-of-casefnx
      ) (casefnx 1)
     ) ;; end-of-letrec
    ) ;; if-then
    (begin
     atscc2scm_null
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_takeLte_vt arg0 arg1)
(let(
;;knd = 0
  (tmpret43 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_takeLte_vt
  (ATSPMVllazyval (_ats2scmpre_stream_patsfun_18__closurerize arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_18 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret44 #f)
  (tmp45 #f)
  (tmp46 #f)
  (tmp47 #f)
  (tmp48 #f)
  (tmp49 #f)
  (tmp50 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_18
  (if arg0
    (begin
     (ATSINStmpset tmp45 (ats2scmpre_gt_int1_int1 env1 0))
     (if tmp45
       (begin
        (ATSINStmpset tmp46 (ATSPMVlazyval_eval env0))
        (letrec(
          (casefnx
           (lambda(tmplab)(case tmplab
            ;; ATSbranchseq_beg
            ((1)
             (if (ATSCKptriscons tmp46)
               (casefnx 4)
               (begin
                (casefnx 2)
               )
             )
            ) ;; end-of-branch
            ((2)
             atscc2scm_null
            ) ;; end-of-branch
            ;; ATSbranchseq_end
            ;; ATSbranchseq_beg
            ((3)
             (casefnx 4)
            ) ;; end-of-branch
            ((4)
             (ATSINStmpset tmp47 (ATSSELcon tmp46 0))
             (ATSINStmpset tmp48 (ATSSELcon tmp46 1))
             (ATSINStmpset tmp50 (ats2scmpre_sub_int1_int1 env1 1))
             (ATSINStmpset tmp49 (ats2scmpre_stream_takeLte_vt tmp48 tmp50))
             (ATSPMVtysum tmp47 tmp49)
            ) ;; end-of-branch
            ;; ATSbranchseq_end
            ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
            ) ;; end-of-case
           ) ;; end-of-lambda
          ) ;; end-of-casefnx
         ) (casefnx 1)
        ) ;; end-of-letrec
       ) ;; if-then
       (begin
        atscc2scm_null
       ) ;; if-else
     )
    ) ;; if-then
    (begin
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_take_opt arg0 arg1)
(let(
;;knd = 0
  (tmpret51 #f)
  (tmp60 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_take_opt
  (ATSINStmpset tmp60 atscc2scm_null)
  (_ats2scmpre_stream_auxmain_20 arg1 arg0 0 tmp60)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_auxmain_20 env0 arg0 arg1 arg2)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
;;(apy2 #f)
  (tmpret52 #f)
  (tmp53 #f)
  (tmp54 #f)
  (tmp55 #f)
  (tmp56 #f)
  (tmp57 #f)
  (tmp58 #f)
  (tmp59 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_stream_auxmain_20
    (ATSINStmpset tmp53 (ats2scmpre_lt_int1_int1 arg1 env0))
    (if tmp53
      (begin
       (ATSINStmpset tmp54 (ATSPMVlazyval_eval arg0))
       (letrec(
         (casefnx
          (lambda(tmplab)(case tmplab
           ;; ATSbranchseq_beg
           ((1)
            (if (ATSCKptriscons tmp54)
              (casefnx 4)
              (begin
               (casefnx 2)
              )
            )
           ) ;; end-of-branch
           ((2)
            atscc2scm_null
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; ATSbranchseq_beg
           ((3)
            (casefnx 4)
           ) ;; end-of-branch
           ((4)
            (ATSINStmpset tmp55 (ATSSELcon tmp54 0))
            (ATSINStmpset tmp56 (ATSSELcon tmp54 1))
            (ATSINStmpset tmp57 (ats2scmpre_add_int1_int1 arg1 1))
            (ATSINStmpset tmp58 (ATSPMVtysum tmp55 arg2))
            ;; apy0 = tmp56
            ;; apy1 = tmp57
            ;; apy2 = tmp58
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; arg2 = apy2
            ;; funlab_scm = 1; // __patsflab__ats2scmpre_stream_auxmain_20
            (_ats2scmpre_stream_auxmain_20 env0 tmp56 tmp57 tmp58)
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
           ) ;; end-of-case
          ) ;; end-of-lambda
         ) ;; end-of-casefnx
        ) (casefnx 1)
       ) ;; end-of-letrec
      ) ;; if-then
      (begin
       (ATSINStmpset tmp59 (ats2scmpre_list_reverse arg2))
       (ATSPMVtysum tmp59)
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret52;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_drop_opt arg0 arg1)
(let(
;;knd = 0
  (tmpret61 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_drop_opt
  (_ats2scmpre_stream_auxmain_22 arg1 arg0 0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_auxmain_22 env0 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret62 #f)
  (tmp63 #f)
  (tmp64 #f)
  (tmp66 #f)
  (tmp67 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_stream_auxmain_22
    (ATSINStmpset tmp63 (ats2scmpre_lt_int1_int1 arg1 env0))
    (if tmp63
      (begin
       (ATSINStmpset tmp64 (ATSPMVlazyval_eval arg0))
       (letrec(
         (casefnx
          (lambda(tmplab)(case tmplab
           ;; ATSbranchseq_beg
           ((1)
            (if (ATSCKptriscons tmp64)
              (casefnx 4)
              (begin
               (casefnx 2)
              )
            )
           ) ;; end-of-branch
           ((2)
            atscc2scm_null
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; ATSbranchseq_beg
           ((3)
            (casefnx 4)
           ) ;; end-of-branch
           ((4)
            (ATSINStmpset tmp66 (ATSSELcon tmp64 1))
            (ATSINStmpset tmp67 (ats2scmpre_add_int1_int1 arg1 1))
            ;; apy0 = tmp66
            ;; apy1 = tmp67
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_scm = 1; // __patsflab__ats2scmpre_stream_auxmain_22
            (_ats2scmpre_stream_auxmain_22 env0 tmp66 tmp67)
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
           ) ;; end-of-case
          ) ;; end-of-lambda
         ) ;; end-of-casefnx
        ) (casefnx 1)
       ) ;; end-of-letrec
      ) ;; if-then
      (begin
       (ATSPMVtysum arg0)
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret62;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_append arg0 arg1)
(let(
;;knd = 0
  (tmpret68 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_append
  (ATSPMVlazyval (_ats2scmpre_stream_patsfun_24__closurerize arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_24 env0 env1)
(let(
;;knd = 0
  (tmpret69 #f)
  (tmp70 #f)
  (tmp71 #f)
  (tmp72 #f)
  (tmp73 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_24
  (ATSINStmpset tmp70 (ATSPMVlazyval_eval env0))
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons tmp70)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       (ATSPMVlazyval_eval env1)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp71 (ATSSELcon tmp70 0))
       (ATSINStmpset tmp72 (ATSSELcon tmp70 1))
       (ATSINStmpset tmp73 (ats2scmpre_stream_append tmp72 env1))
       (ATSPMVtysum tmp71 tmp73)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_concat arg0)
(let(
;;knd = 0
  (tmpret74 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_concat
  (ATSPMVlazyval (_ats2scmpre_stream_patsfun_26__closurerize arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_26 env0)
(let(
;;knd = 0
  (tmpret75 #f)
  (tmp76 #f)
  (tmp77 #f)
  (tmp78 #f)
  (tmp79 #f)
  (tmp80 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_26
  (ATSINStmpset tmp76 (ATSPMVlazyval_eval env0))
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons tmp76)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp77 (ATSSELcon tmp76 0))
       (ATSINStmpset tmp78 (ATSSELcon tmp76 1))
       (ATSINStmpset tmp80 (ats2scmpre_stream_concat tmp78))
       (ATSINStmpset tmp79 (ats2scmpre_stream_append tmp77 tmp80))
       (ATSPMVlazyval_eval tmp79)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_map_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret81 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_map_cloref
  (ATSPMVlazyval (_ats2scmpre_stream_patsfun_28__closurerize arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_28 env0 env1)
(let(
;;knd = 0
  (tmpret82 #f)
  (tmp83 #f)
  (tmp84 #f)
  (tmp85 #f)
  (tmp86 #f)
  (tmp87 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_28
  (ATSINStmpset tmp83 (ATSPMVlazyval_eval env0))
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons tmp83)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp84 (ATSSELcon tmp83 0))
       (ATSINStmpset tmp85 (ATSSELcon tmp83 1))
       (ATSINStmpset tmp86 ((ATSfunclo_fclo env1) env1 tmp84))
       (ATSINStmpset tmp87 (ats2scmpre_stream_map_cloref tmp85 env1))
       (ATSPMVtysum tmp86 tmp87)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_map_method arg0 arg1)
(let(
;;knd = 0
  (tmpret88 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_map_method
  (_ats2scmpre_stream_patsfun_30__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_30 env0 arg0)
(let(
;;knd = 0
  (tmpret89 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_30
  (ats2scmpre_stream_map_cloref env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_scan_cloref arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret90 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_scan_cloref
  (ATSPMVlazyval (_ats2scmpre_stream_patsfun_32__closurerize arg0 arg1 arg2))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_32 env0 env1 env2)
(let(
;;knd = 0
  (tmpret91 #f)
  (tmp92 #f)
  (tmp93 #f)
  (tmp94 #f)
  (tmp95 #f)
  (tmp96 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_32
  (ATSINStmpset tmp92 (ATSPMVlazyval_eval env0))
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons tmp92)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp93 (ATSSELcon tmp92 0))
       (ATSINStmpset tmp94 (ATSSELcon tmp92 1))
       (ATSINStmpset tmp96 ((ATSfunclo_fclo env2) env2 env1 tmp93))
       (ATSINStmpset tmp95 (ats2scmpre_stream_scan_cloref tmp94 tmp96 env2))
       (ATSPMVtysum env1 tmp95)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_scan_method arg0 arg1)
(let(
;;knd = 0
  (tmpret97 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_scan_method
  (_ats2scmpre_stream_patsfun_34__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_34 env0 arg0 arg1)
(let(
;;knd = 0
  (tmpret98 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_34
  (ats2scmpre_stream_scan_cloref env0 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_filter_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret99 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_filter_cloref
  (ATSPMVlazyval (_ats2scmpre_stream_patsfun_36__closurerize arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_36 env0 env1)
(let(
;;knd = 0
  (tmpret100 #f)
  (tmp101 #f)
  (tmp102 #f)
  (tmp103 #f)
  (tmp104 #f)
  (tmp105 #f)
  (tmp106 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_36
  (ATSINStmpset tmp101 (ATSPMVlazyval_eval env0))
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons tmp101)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp102 (ATSSELcon tmp101 0))
       (ATSINStmpset tmp103 (ATSSELcon tmp101 1))
       (ATSINStmpset tmp104 ((ATSfunclo_fclo env1) env1 tmp102))
       (if tmp104
         (begin
          (ATSINStmpset tmp105 (ats2scmpre_stream_filter_cloref tmp103 env1))
          (ATSPMVtysum tmp102 tmp105)
         ) ;; if-then
         (begin
          (ATSINStmpset tmp106 (ats2scmpre_stream_filter_cloref tmp103 env1))
          (ATSPMVlazyval_eval tmp106)
         ) ;; if-else
       )
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_filter_method arg0)
(let(
;;knd = 0
  (tmpret107 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_filter_method
  (_ats2scmpre_stream_patsfun_38__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_38 env0 arg0)
(let(
;;knd = 0
  (tmpret108 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_38
  (ats2scmpre_stream_filter_cloref env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_forall_cloref arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret109 #f)
  (tmp110 #f)
  (tmp111 #f)
  (tmp112 #f)
  (tmp113 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab_stream_forall_cloref
    (ATSINStmpset tmp110 (ATSPMVlazyval_eval arg0))
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons tmp110)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         atscc2scm_true
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp111 (ATSSELcon tmp110 0))
         (ATSINStmpset tmp112 (ATSSELcon tmp110 1))
         (ATSINStmpset tmp113 ((ATSfunclo_fclo arg1) arg1 tmp111))
         (if tmp113
           (begin
            ;; apy0 = tmp112
            ;; apy1 = arg1
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_scm = 1; // __patsflab_stream_forall_cloref
            (ats2scmpre_stream_forall_cloref tmp112 arg1)
           ) ;; if-then
           (begin
            atscc2scm_false
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret109;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_forall_method arg0)
(let(
;;knd = 0
  (tmpret114 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_forall_method
  (_ats2scmpre_stream_patsfun_41__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_41 env0 arg0)
(let(
;;knd = 0
  (tmpret115 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_41
  (ats2scmpre_stream_forall_cloref env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_exists_cloref arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret116 #f)
  (tmp117 #f)
  (tmp118 #f)
  (tmp119 #f)
  (tmp120 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab_stream_exists_cloref
    (ATSINStmpset tmp117 (ATSPMVlazyval_eval arg0))
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons tmp117)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         atscc2scm_false
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp118 (ATSSELcon tmp117 0))
         (ATSINStmpset tmp119 (ATSSELcon tmp117 1))
         (ATSINStmpset tmp120 ((ATSfunclo_fclo arg1) arg1 tmp118))
         (if tmp120
           (begin
            atscc2scm_true
           ) ;; if-then
           (begin
            ;; apy0 = tmp119
            ;; apy1 = arg1
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_scm = 1; // __patsflab_stream_exists_cloref
            (ats2scmpre_stream_exists_cloref tmp119 arg1)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret116;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_exists_method arg0)
(let(
;;knd = 0
  (tmpret121 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_exists_method
  (_ats2scmpre_stream_patsfun_44__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_44 env0 arg0)
(let(
;;knd = 0
  (tmpret122 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_44
  (ats2scmpre_stream_exists_cloref env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_foreach_cloref arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmp124 #f)
  (tmp125 #f)
  (tmp126 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab_stream_foreach_cloref
    (ATSINStmpset tmp124 (ATSPMVlazyval_eval arg0))
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons tmp124)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         ATSINSmove0_void
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp125 (ATSSELcon tmp124 0))
         (ATSINStmpset tmp126 (ATSSELcon tmp124 1))
         (ATSINSmove1_void ((ATSfunclo_fclo arg1) arg1 tmp125))
         ;; apy0 = tmp126
         ;; apy1 = arg1
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab_stream_foreach_cloref
         (ats2scmpre_stream_foreach_cloref tmp126 arg1)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return/*_void*/;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_foreach_method arg0)
(let(
;;knd = 0
  (tmpret128 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_foreach_method
  (_ats2scmpre_stream_patsfun_47__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_47 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_47
  (ATSINSmove1_void (ats2scmpre_stream_foreach_cloref env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_iforeach_cloref arg0 arg1)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_iforeach_cloref
  (ATSINSmove1_void (_ats2scmpre_stream_loop_49 arg1 0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_loop_49 env0 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmp132 #f)
  (tmp133 #f)
  (tmp134 #f)
  (tmp136 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_stream_loop_49
    (ATSINStmpset tmp132 (ATSPMVlazyval_eval arg1))
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons tmp132)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         ATSINSmove0_void
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp133 (ATSSELcon tmp132 0))
         (ATSINStmpset tmp134 (ATSSELcon tmp132 1))
         (ATSINSmove1_void ((ATSfunclo_fclo env0) env0 arg0 tmp133))
         (ATSINStmpset tmp136 (ats2scmpre_add_int1_int1 arg0 1))
         ;; apy0 = tmp136
         ;; apy1 = tmp134
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_stream_loop_49
         (_ats2scmpre_stream_loop_49 env0 tmp136 tmp134)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return/*_void*/;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_iforeach_method arg0)
(let(
;;knd = 0
  (tmpret137 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_iforeach_method
  (_ats2scmpre_stream_patsfun_51__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_51 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_51
  (ATSINSmove1_void (ats2scmpre_stream_iforeach_cloref env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_tabulate_cloref arg0)
(let(
;;knd = 0
  (tmpret139 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_tabulate_cloref
  (_ats2scmpre_stream_auxmain_53 arg0 0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_auxmain_53 env0 arg0)
(let(
;;knd = 0
  (tmpret140 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_auxmain_53
  (ATSPMVlazyval (_ats2scmpre_stream_patsfun_54__closurerize env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_54 env0 env1)
(let(
;;knd = 0
  (tmpret141 #f)
  (tmp142 #f)
  (tmp143 #f)
  (tmp144 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_54
  (ATSINStmpset tmp142 ((ATSfunclo_fclo env0) env0 env1))
  (ATSINStmpset tmp144 (ats2scmpre_add_int1_int1 env1 1))
  (ATSINStmpset tmp143 (_ats2scmpre_stream_auxmain_53 env0 tmp144))
  (ATSPMVtysum tmp142 tmp143)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_cross_stream_list arg0 arg1)
(let(
;;knd = 0
  (tmpret145 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_cross_stream_list
  (ATSPMVlazyval (_ats2scmpre_stream_patsfun_58__closurerize arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_auxmain_56 arg0 arg1 arg2 arg3)
(let(
;;knd = 0
  (tmpret146 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_auxmain_56
  (ATSPMVlazyval (_ats2scmpre_stream_patsfun_57__closurerize arg0 arg1 arg2 arg3))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_57 env0 env1 env2 env3)
(let(
;;knd = 0
  (tmpret147 #f)
  (tmp148 #f)
  (tmp149 #f)
  (tmp150 #f)
  (tmp151 #f)
  (tmp152 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_57
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons env3)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       (ATSINStmpset tmp150 (ats2scmpre_cross_stream_list env1 env2))
       (ATSPMVlazyval_eval tmp150)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp148 (ATSSELcon env3 0))
       (ATSINStmpset tmp149 (ATSSELcon env3 1))
       (ATSINStmpset tmp151 (ATSPMVtyrec env0 tmp148))
       (ATSINStmpset tmp152 (_ats2scmpre_stream_auxmain_56 env0 env1 env2 tmp149))
       (ATSPMVtysum tmp151 tmp152)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_58 env0 env1)
(let(
;;knd = 0
  (tmpret153 #f)
  (tmp154 #f)
  (tmp155 #f)
  (tmp156 #f)
  (tmp157 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_58
  (ATSINStmpset tmp154 (ATSPMVlazyval_eval env0))
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons tmp154)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (if (ATSCKptrisnull tmp154)
         (ATSINScaseof_fail "/home/hwxi/Research/ATS-Postiats/contrib/libatscc/ATS2-0.3.2/DATS/stream.dats: 7890(line=515, offs=1) -- 7982(line=517, offs=50)")
         (begin
          (casefnx 4)
         )
       )
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp155 (ATSSELcon tmp154 0))
       (ATSINStmpset tmp156 (ATSSELcon tmp154 1))
       (ATSINStmpset tmp157 (_ats2scmpre_stream_auxmain_56 tmp155 tmp156 env1 env1))
       (ATSPMVlazyval_eval tmp157)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_cross_stream_list0 arg0 arg1)
(let(
;;knd = 0
  (tmpret158 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_cross_stream_list0
  (ats2scmpre_cross_stream_list arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream2cloref_exn arg0)
(let(
;;knd = 0
  (tmpret159 #f)
  (tmp160 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream2cloref_exn
  (ATSINStmpset tmp160 (ats2scmpre_ref arg0))
  (_ats2scmpre_stream_patsfun_61__closurerize tmp160)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_61 env0)
(let(
;;knd = 0
  (tmpret161 #f)
  (tmp162 #f)
  (tmp163 #f)
  (tmp164 #f)
  (tmp165 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_61
  (ATSINStmpset tmp162 (ats2scmpre_ref_get_elt env0))
  (ATSINStmpset tmp163 (ATSPMVlazyval_eval tmp162))
  (if (ATSCKptrisnull tmp163) (ATSINScaseof_fail "/home/hwxi/Research/ATS-Postiats/contrib/libatscc/ATS2-0.3.2/DATS/stream.dats: 8283(line=543, offs=5) -- 8307(line=543, offs=29)"))
  (ATSINStmpset tmp164 (ATSSELcon tmp163 0))
  (ATSINStmpset tmp165 (ATSSELcon tmp163 1))
  (ATSINSmove1_void (ats2scmpre_ref_set_elt env0 tmp165))
  tmp164
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream2cloref_opt arg0)
(let(
;;knd = 0
  (tmpret167 #f)
  (tmp168 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream2cloref_opt
  (ATSINStmpset tmp168 (ats2scmpre_ref arg0))
  (_ats2scmpre_stream_patsfun_63__closurerize tmp168)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_63 env0)
(let(
;;knd = 0
  (tmpret169 #f)
  (tmp170 #f)
  (tmp171 #f)
  (tmp172 #f)
  (tmp173 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_63
  (ATSINStmpset tmp170 (ats2scmpre_ref_get_elt env0))
  (ATSINStmpset tmp171 (ATSPMVlazyval_eval tmp170))
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons tmp171)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp172 (ATSSELcon tmp171 0))
       (ATSINStmpset tmp173 (ATSSELcon tmp171 1))
       (ATSINSmove1_void (ats2scmpre_ref_set_elt env0 tmp173))
       (ATSPMVtysum tmp172)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream2cloref_last arg0 arg1)
(let(
;;knd = 0
  (tmpret175 #f)
  (tmp176 #f)
  (tmp177 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream2cloref_last
  (ATSINStmpset tmp176 (ats2scmpre_ref arg0))
  (ATSINStmpset tmp177 (ats2scmpre_ref arg1))
  (_ats2scmpre_stream_patsfun_65__closurerize tmp176 tmp177)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_65 env0 env1)
(let(
;;knd = 0
  (tmpret178 #f)
  (tmp179 #f)
  (tmp180 #f)
  (tmp181 #f)
  (tmp182 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_65
  (ATSINStmpset tmp179 (ats2scmpre_ref_get_elt env0))
  (ATSINStmpset tmp180 (ATSPMVlazyval_eval tmp179))
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons tmp180)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       (ats2scmpre_ref_get_elt env1)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp181 (ATSSELcon tmp180 0))
       (ATSINStmpset tmp182 (ATSSELcon tmp180 1))
       (ATSINSmove1_void (ats2scmpre_ref_set_elt env0 tmp182))
       (ATSINSmove1_void (ats2scmpre_ref_set_elt env1 tmp181))
       tmp181
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_take_while_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret185 #f)
  (tmp186 #f)
  (tmp187 #f)
  (tmp188 #f)
  (tmp189 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_take_while_cloref
  (ATSINStmpset tmp186 (ats2scmpre_stream_rtake_while_cloref arg0 arg1))
  (ATSINStmpset tmp187 (ATSSELboxrec tmp186 0))
  (ATSINStmpset tmp188 (ATSSELboxrec tmp186 1))
  (ATSINStmpset tmp189 (ats2scmpre_list_reverse tmp188))
  (ATSPMVtyrec tmp187 tmp189)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_rtake_while_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret190 #f)
  (tmp198 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_rtake_while_cloref
  (ATSINStmpset tmp198 atscc2scm_null)
  (_ats2scmpre_stream_loop_68 arg1 arg0 0 tmp198)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_loop_68 env0 arg0 arg1 arg2)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
;;(apy2 #f)
  (tmpret191 #f)
  (tmp192 #f)
  (tmp193 #f)
  (tmp194 #f)
  (tmp195 #f)
  (tmp196 #f)
  (tmp197 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_stream_loop_68
    (ATSINStmpset tmp192 (ATSPMVlazyval_eval arg0))
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons tmp192)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         (ATSPMVtyrec arg0 arg2)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp193 (ATSSELcon tmp192 0))
         (ATSINStmpset tmp194 (ATSSELcon tmp192 1))
         (ATSINStmpset tmp195 ((ATSfunclo_fclo env0) env0 arg1 tmp193))
         (if tmp195
           (begin
            (ATSINStmpset tmp196 (ats2scmpre_add_int1_int1 arg1 1))
            (ATSINStmpset tmp197 (ATSPMVtysum tmp193 arg2))
            ;; apy0 = tmp194
            ;; apy1 = tmp196
            ;; apy2 = tmp197
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; arg2 = apy2
            ;; funlab_scm = 1; // __patsflab__ats2scmpre_stream_loop_68
            (_ats2scmpre_stream_loop_68 env0 tmp194 tmp196 tmp197)
           ) ;; if-then
           (begin
            (ATSPMVtyrec arg0 arg2)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret191;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_take_until_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret199 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_take_until_cloref
  (ats2scmpre_stream_take_while_cloref arg0 (_ats2scmpre_stream_patsfun_70__closurerize arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_70 env0 arg0 arg1)
(let(
;;knd = 0
  (tmpret200 #f)
  (tmp201 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_70
  (ATSINStmpset tmp201 ((ATSfunclo_fclo env0) env0 arg0 arg1))
  (ats2scmpre_neg_bool0 tmp201)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_rtake_until_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret202 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_rtake_until_cloref
  (ats2scmpre_stream_rtake_while_cloref arg0 (_ats2scmpre_stream_patsfun_72__closurerize arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_72 env0 arg0 arg1)
(let(
;;knd = 0
  (tmpret203 #f)
  (tmp204 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_72
  (ATSINStmpset tmp204 ((ATSfunclo_fclo env0) env0 arg0 arg1))
  (ats2scmpre_neg_bool0 tmp204)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_list_xprod2 arg0 arg1)
(let(
;;knd = 0
  (tmpret205 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_list_xprod2
  (_ats2scmpre_stream_auxlst_76 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_aux_74 arg0 arg1)
(let(
;;knd = 0
  (tmpret206 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_aux_74
  (ATSPMVlazyval (_ats2scmpre_stream_patsfun_75__closurerize arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_75 env0 env1)
(let(
;;knd = 0
  (tmpret207 #f)
  (tmp208 #f)
  (tmp209 #f)
  (tmp210 #f)
  (tmp211 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_75
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons env1)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp208 (ATSSELcon env1 0))
       (ATSINStmpset tmp209 (ATSSELcon env1 1))
       (ATSINStmpset tmp210 (ATSPMVtyrec env0 tmp208))
       (ATSINStmpset tmp211 (_ats2scmpre_stream_aux_74 env0 tmp209))
       (ATSPMVtysum tmp210 tmp211)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_auxlst_76 arg0 arg1)
(let(
;;knd = 0
  (tmpret212 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_auxlst_76
  (ATSPMVlazyval (_ats2scmpre_stream_patsfun_77__closurerize arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_patsfun_77 env0 env1)
(let(
;;knd = 0
  (tmpret213 #f)
  (tmp214 #f)
  (tmp215 #f)
  (tmp216 #f)
  (tmp217 #f)
  (tmp218 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_patsfun_77
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons env0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp214 (ATSSELcon env0 0))
       (ATSINStmpset tmp215 (ATSSELcon env0 1))
       (ATSINStmpset tmp217 (_ats2scmpre_stream_aux_74 tmp214 env1))
       (ATSINStmpset tmp218 (_ats2scmpre_stream_auxlst_76 tmp215 env1))
       (ATSINStmpset tmp216 (ats2scmpre_stream_append tmp217 tmp218))
       (ATSPMVlazyval_eval tmp216)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Scheme code is generated by atscc2scm
;; The starting compilation time is: 2018-6-23:  7h:50m
;;
;;;;;;

(define
(_ats2scmpre_stream_vt_patsfun_10__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_stream_vt_patsfun_10 (ATSCCget_1 _fcenvs_))) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_vt_patsfun_13__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_vt_patsfun_13 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_stream_vt_patsfun_21__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_vt_patsfun_21 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_stream_vt_patsfun_24__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_vt_patsfun_24 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_vt_patsfun_27__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_vt_patsfun_27 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_stream_vt_patsfun_29__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_vt_patsfun_29 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_vt_patsfun_32__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_vt_patsfun_32 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_stream_vt_patsfun_34__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_vt_patsfun_34 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_vt_patsfun_37__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_vt_patsfun_37 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_stream_vt_patsfun_39__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_vt_patsfun_39 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_vt_patsfun_43__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_vt_patsfun_43 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_vt_patsfun_47__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_vt_patsfun_47 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_vt_patsfun_51__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_vt_patsfun_51 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_vt_patsfun_55__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_vt_patsfun_55 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_vt_patsfun_59__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_vt_patsfun_59 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_stream_vt_patsfun_62__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_stream_vt_patsfun_62 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


;;fun
(define
(ats2scmpre_stream_vt_free arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_free
  (ATSINSmove1_void (atspre_lazy_vt_free arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt2t arg0)
(let(
;;knd = 0
  (tmpret11 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt2t
  (_ats2scmpre_stream_vt_aux_9 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_aux_9 arg0)
(let(
;;knd = 0
  (tmpret12 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_aux_9
  (ATSPMVlazyval (_ats2scmpre_stream_vt_patsfun_10__closurerize arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_10 env0)
(let(
;;knd = 0
  (tmpret13 #f)
  (tmp14 #f)
  (tmp15 #f)
  (tmp16 #f)
  (tmp17 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_10
  (ATSINStmpset tmp14 (ATSPMVllazyval_eval env0))
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons tmp14)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp15 (ATSSELcon tmp14 0))
       (ATSINStmpset tmp16 (ATSSELcon tmp14 1))
       ;; ATSINSfreecon(tmp14);
       (ATSINStmpset tmp17 (_ats2scmpre_stream_vt_aux_9 tmp16))
       (ATSPMVtysum tmp15 tmp17)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_takeLte arg0 arg1)
(let(
;;knd = 0
  (tmpret18 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_takeLte
  (_ats2scmpre_stream_vt_auxmain_12 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_auxmain_12 arg0 arg1)
(let(
;;knd = 0
  (tmpret19 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_auxmain_12
  (ATSPMVllazyval (_ats2scmpre_stream_vt_patsfun_13__closurerize arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_13 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret20 #f)
  (tmp21 #f)
  (tmp22 #f)
  (tmp23 #f)
  (tmp24 #f)
  (tmp25 #f)
  (tmp26 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_13
  (if arg0
    (begin
     (ATSINStmpset tmp21 (ats2scmpre_gt_int1_int1 env1 0))
     (if tmp21
       (begin
        (ATSINStmpset tmp22 (ATSPMVllazyval_eval env0))
        (letrec(
          (casefnx
           (lambda(tmplab)(case tmplab
            ;; ATSbranchseq_beg
            ((1)
             (if (ATSCKptriscons tmp22)
               (casefnx 4)
               (begin
                (casefnx 2)
               )
             )
            ) ;; end-of-branch
            ((2)
             atscc2scm_null
            ) ;; end-of-branch
            ;; ATSbranchseq_end
            ;; ATSbranchseq_beg
            ((3)
             (casefnx 4)
            ) ;; end-of-branch
            ((4)
             (ATSINStmpset tmp23 (ATSSELcon tmp22 0))
             (ATSINStmpset tmp24 (ATSSELcon tmp22 1))
             ;; ATSINSfreecon(tmp22);
             (ATSINStmpset tmp26 (ats2scmpre_sub_int1_int1 env1 1))
             (ATSINStmpset tmp25 (_ats2scmpre_stream_vt_auxmain_12 tmp24 tmp26))
             (ATSPMVtysum tmp23 tmp25)
            ) ;; end-of-branch
            ;; ATSbranchseq_end
            ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
            ) ;; end-of-case
           ) ;; end-of-lambda
          ) ;; end-of-casefnx
         ) (casefnx 1)
        ) ;; end-of-letrec
       ) ;; if-then
       (begin
        (ATSINSmove1_void (atspre_lazy_vt_free env0))
        atscc2scm_null
       ) ;; if-else
     )
    ) ;; if-then
    (begin
     (ATSINSmove1_void (atspre_lazy_vt_free env0))
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_length arg0)
(let(
;;knd = 0
  (tmpret29 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_length
  (_ats2scmpre_stream_vt_loop_15 arg0 0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_loop_15 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret30 #f)
  (tmp31 #f)
  (tmp33 #f)
  (tmp34 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_stream_vt_loop_15
    (ATSINStmpset tmp31 (ATSPMVllazyval_eval arg0))
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons tmp31)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp33 (ATSSELcon tmp31 1))
         ;; ATSINSfreecon(tmp31);
         (ATSINStmpset tmp34 (ats2scmpre_add_int1_int1 arg1 1))
         ;; apy0 = tmp33
         ;; apy1 = tmp34
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_stream_vt_loop_15
         (_ats2scmpre_stream_vt_loop_15 tmp33 tmp34)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret30;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream2list_vt arg0)
(let(
;;knd = 0
  (tmpret35 #f)
  (tmp36 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream2list_vt
  (ATSINStmpset tmp36 (ats2scmpre_stream2list_vt_rev arg0))
  (ats2scmpre_list_vt_reverse tmp36)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream2list_vt_rev arg0)
(let(
;;knd = 0
  (tmpret37 #f)
  (tmp43 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream2list_vt_rev
  (ATSINStmpset tmp43 atscc2scm_null)
  (_ats2scmpre_stream_vt_loop_18 arg0 tmp43)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_loop_18 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret38 #f)
  (tmp39 #f)
  (tmp40 #f)
  (tmp41 #f)
  (tmp42 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_stream_vt_loop_18
    (ATSINStmpset tmp39 (ATSPMVllazyval_eval arg0))
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons tmp39)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp40 (ATSSELcon tmp39 0))
         (ATSINStmpset tmp41 (ATSSELcon tmp39 1))
         ;; ATSINSfreecon(tmp39);
         (ATSINStmpset tmp42 (ATSPMVtysum tmp40 arg1))
         ;; apy0 = tmp41
         ;; apy1 = tmp42
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_stream_vt_loop_18
         (_ats2scmpre_stream_vt_loop_18 tmp41 tmp42)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret38;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_append arg0 arg1)
(let(
;;knd = 0
  (tmpret44 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_append
  (_ats2scmpre_stream_vt_auxmain_20 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_auxmain_20 arg0 arg1)
(let(
;;knd = 0
  (tmpret45 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_auxmain_20
  (ATSPMVllazyval (_ats2scmpre_stream_vt_patsfun_21__closurerize arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_21 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret46 #f)
  (tmp47 #f)
  (tmp48 #f)
  (tmp49 #f)
  (tmp50 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_21
  (if arg0
    (begin
     (ATSINStmpset tmp47 (ATSPMVllazyval_eval env0))
     (letrec(
       (casefnx
        (lambda(tmplab)(case tmplab
         ;; ATSbranchseq_beg
         ((1)
          (if (ATSCKptriscons tmp47)
            (casefnx 4)
            (begin
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         ((2)
          (ATSPMVllazyval_eval env1)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         ((3)
          (casefnx 4)
         ) ;; end-of-branch
         ((4)
          (ATSINStmpset tmp48 (ATSSELcon tmp47 0))
          (ATSINStmpset tmp49 (ATSSELcon tmp47 1))
          ;; ATSINSfreecon(tmp47);
          (ATSINStmpset tmp50 (_ats2scmpre_stream_vt_auxmain_20 tmp49 env1))
          (ATSPMVtysum tmp48 tmp50)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
         ) ;; end-of-case
        ) ;; end-of-lambda
       ) ;; end-of-casefnx
      ) (casefnx 1)
     ) ;; end-of-letrec
    ) ;; if-then
    (begin
     (ATSINSmove1_void (atspre_lazy_vt_free env0))
     (ATSINSmove1_void (atspre_lazy_vt_free env1))
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_concat arg0)
(let(
;;knd = 0
  (tmpret53 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_concat
  (_ats2scmpre_stream_vt_auxmain_23 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_auxmain_23 arg0)
(let(
;;knd = 0
  (tmpret54 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_auxmain_23
  (ATSPMVllazyval (_ats2scmpre_stream_vt_patsfun_24__closurerize arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_24 env0 arg0)
(let(
;;knd = 0
  (tmpret55 #f)
  (tmp56 #f)
  (tmp57 #f)
  (tmp58 #f)
  (tmp59 #f)
  (tmp60 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_24
  (if arg0
    (begin
     (ATSINStmpset tmp56 (ATSPMVllazyval_eval env0))
     (letrec(
       (casefnx
        (lambda(tmplab)(case tmplab
         ;; ATSbranchseq_beg
         ((1)
          (if (ATSCKptriscons tmp56)
            (casefnx 4)
            (begin
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         ((2)
          atscc2scm_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         ((3)
          (casefnx 4)
         ) ;; end-of-branch
         ((4)
          (ATSINStmpset tmp57 (ATSSELcon tmp56 0))
          (ATSINStmpset tmp58 (ATSSELcon tmp56 1))
          ;; ATSINSfreecon(tmp56);
          (ATSINStmpset tmp60 (_ats2scmpre_stream_vt_auxmain_23 tmp58))
          (ATSINStmpset tmp59 (ats2scmpre_stream_vt_append tmp57 tmp60))
          (ATSPMVllazyval_eval tmp59)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
         ) ;; end-of-case
        ) ;; end-of-lambda
       ) ;; end-of-casefnx
      ) (casefnx 1)
     ) ;; end-of-letrec
    ) ;; if-then
    (begin
     (ATSINSmove1_void (atspre_lazy_vt_free env0))
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_map_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret62 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_map_cloref
  (_ats2scmpre_stream_vt_auxmain_26 arg1 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_auxmain_26 env0 arg0)
(let(
;;knd = 0
  (tmpret63 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_auxmain_26
  (ATSPMVllazyval (_ats2scmpre_stream_vt_patsfun_27__closurerize env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_27 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret64 #f)
  (tmp65 #f)
  (tmp66 #f)
  (tmp67 #f)
  (tmp68 #f)
  (tmp69 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_27
  (if arg0
    (begin
     (ATSINStmpset tmp65 (ATSPMVllazyval_eval env1))
     (letrec(
       (casefnx
        (lambda(tmplab)(case tmplab
         ;; ATSbranchseq_beg
         ((1)
          (if (ATSCKptriscons tmp65)
            (casefnx 4)
            (begin
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         ((2)
          atscc2scm_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         ((3)
          (casefnx 4)
         ) ;; end-of-branch
         ((4)
          (ATSINStmpset tmp66 (ATSSELcon tmp65 0))
          (ATSINStmpset tmp67 (ATSSELcon tmp65 1))
          ;; ATSINSfreecon(tmp65);
          (ATSINStmpset tmp68 ((ATSfunclo_fclo env0) env0 tmp66))
          (ATSINStmpset tmp69 (_ats2scmpre_stream_vt_auxmain_26 env0 tmp67))
          (ATSPMVtysum tmp68 tmp69)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
         ) ;; end-of-case
        ) ;; end-of-lambda
       ) ;; end-of-casefnx
      ) (casefnx 1)
     ) ;; end-of-letrec
    ) ;; if-then
    (begin
     (ATSINSmove1_void (atspre_lazy_vt_free env1))
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_map_method arg0 arg1)
(let(
;;knd = 0
  (tmpret71 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_map_method
  (_ats2scmpre_stream_vt_patsfun_29__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_29 env0 arg0)
(let(
;;knd = 0
  (tmpret72 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_29
  (ats2scmpre_stream_vt_map_cloref env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_mapopt_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret73 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_mapopt_cloref
  (_ats2scmpre_stream_vt_auxmain_31 arg1 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_auxmain_31 env0 arg0)
(let(
;;knd = 0
  (tmpret74 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_auxmain_31
  (ATSPMVllazyval (_ats2scmpre_stream_vt_patsfun_32__closurerize env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_32 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret75 #f)
  (tmp76 #f)
  (tmp77 #f)
  (tmp78 #f)
  (tmp79 #f)
  (tmp80 #f)
  (tmp81 #f)
  (tmp82 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_32
  (if arg0
    (begin
     (ATSINStmpset tmp76 (ATSPMVllazyval_eval env1))
     (letrec(
       (casefnx
        (lambda(tmplab)(case tmplab
         ;; ATSbranchseq_beg
         ((1)
          (if (ATSCKptriscons tmp76)
            (casefnx 4)
            (begin
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         ((2)
          atscc2scm_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         ((3)
          (casefnx 4)
         ) ;; end-of-branch
         ((4)
          (ATSINStmpset tmp77 (ATSSELcon tmp76 0))
          (ATSINStmpset tmp78 (ATSSELcon tmp76 1))
          ;; ATSINSfreecon(tmp76);
          (ATSINStmpset tmp79 ((ATSfunclo_fclo env0) env0 tmp77))
          (letrec(
            (casefnx
             (lambda(tmplab)(case tmplab
              ;; ATSbranchseq_beg
              ((1)
               (if (ATSCKptriscons tmp79)
                 (casefnx 4)
                 (begin
                  (casefnx 2)
                 )
               )
              ) ;; end-of-branch
              ((2)
               (ATSINStmpset tmp81 (_ats2scmpre_stream_vt_auxmain_31 env0 tmp78))
               (ATSPMVllazyval_eval tmp81)
              ) ;; end-of-branch
              ;; ATSbranchseq_end
              ;; ATSbranchseq_beg
              ((3)
               (casefnx 4)
              ) ;; end-of-branch
              ((4)
               (ATSINStmpset tmp80 (ATSSELcon tmp79 0))
               ;; ATSINSfreecon(tmp79);
               (ATSINStmpset tmp82 (_ats2scmpre_stream_vt_auxmain_31 env0 tmp78))
               (ATSPMVtysum tmp80 tmp82)
              ) ;; end-of-branch
              ;; ATSbranchseq_end
              ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
              ) ;; end-of-case
             ) ;; end-of-lambda
            ) ;; end-of-casefnx
           ) (casefnx 1)
          ) ;; end-of-letrec
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
         ) ;; end-of-case
        ) ;; end-of-lambda
       ) ;; end-of-casefnx
      ) (casefnx 1)
     ) ;; end-of-letrec
    ) ;; if-then
    (begin
     (ATSINSmove1_void (atspre_lazy_vt_free env1))
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_mapopt_method arg0 arg1)
(let(
;;knd = 0
  (tmpret84 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_mapopt_method
  (_ats2scmpre_stream_vt_patsfun_34__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_34 env0 arg0)
(let(
;;knd = 0
  (tmpret85 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_34
  (ats2scmpre_stream_vt_mapopt_cloref env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_filter_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret86 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_filter_cloref
  (_ats2scmpre_stream_vt_auxmain_36 arg1 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_auxmain_36 env0 arg0)
(let(
;;knd = 0
  (tmpret87 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_auxmain_36
  (ATSPMVllazyval (_ats2scmpre_stream_vt_patsfun_37__closurerize env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_37 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret88 #f)
  (tmp89 #f)
  (tmp90 #f)
  (tmp91 #f)
  (tmp92 #f)
  (tmp93 #f)
  (tmp94 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_37
  (if arg0
    (begin
     (ATSINStmpset tmp89 (ATSPMVllazyval_eval env1))
     (letrec(
       (casefnx
        (lambda(tmplab)(case tmplab
         ;; ATSbranchseq_beg
         ((1)
          (if (ATSCKptriscons tmp89)
            (casefnx 4)
            (begin
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         ((2)
          atscc2scm_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         ((3)
          (casefnx 4)
         ) ;; end-of-branch
         ((4)
          (ATSINStmpset tmp90 (ATSSELcon tmp89 0))
          (ATSINStmpset tmp91 (ATSSELcon tmp89 1))
          ;; ATSINSfreecon(tmp89);
          (ATSINStmpset tmp92 ((ATSfunclo_fclo env0) env0 tmp90))
          (if tmp92
            (begin
             (ATSINStmpset tmp93 (_ats2scmpre_stream_vt_auxmain_36 env0 tmp91))
             (ATSPMVtysum tmp90 tmp93)
            ) ;; if-then
            (begin
             (ATSINStmpset tmp94 (_ats2scmpre_stream_vt_auxmain_36 env0 tmp91))
             (ATSPMVllazyval_eval tmp94)
            ) ;; if-else
          )
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
         ) ;; end-of-case
        ) ;; end-of-lambda
       ) ;; end-of-casefnx
      ) (casefnx 1)
     ) ;; end-of-letrec
    ) ;; if-then
    (begin
     (ATSINSmove1_void (atspre_lazy_vt_free env1))
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_filter_method arg0)
(let(
;;knd = 0
  (tmpret96 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_filter_method
  (_ats2scmpre_stream_vt_patsfun_39__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_39 env0 arg0)
(let(
;;knd = 0
  (tmpret97 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_39
  (ats2scmpre_stream_vt_filter_cloref env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_exists_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret98 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_exists_cloref
  (_ats2scmpre_stream_vt_loop_41 arg1 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_loop_41 env0 arg0)
(let(
;;knd = 1
;;(apy0 #f)
  (tmpret99 #f)
  (tmp100 #f)
  (tmp101 #f)
  (tmp102 #f)
  (tmp103 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_stream_vt_loop_41
    (ATSINStmpset tmp100 (ATSPMVllazyval_eval arg0))
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons tmp100)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         atscc2scm_false
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp101 (ATSSELcon tmp100 0))
         (ATSINStmpset tmp102 (ATSSELcon tmp100 1))
         ;; ATSINSfreecon(tmp100);
         (ATSINStmpset tmp103 ((ATSfunclo_fclo env0) env0 tmp101))
         (if tmp103
           (begin
            (ATSINSmove1_void (atspre_lazy_vt_free tmp102))
            atscc2scm_true
           ) ;; if-then
           (begin
            ;; apy0 = tmp102
            ;; arg0 = apy0
            ;; funlab_scm = 1; // __patsflab__ats2scmpre_stream_vt_loop_41
            (_ats2scmpre_stream_vt_loop_41 env0 tmp102)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret99;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_exists_method arg0)
(let(
;;knd = 0
  (tmpret105 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_exists_method
  (_ats2scmpre_stream_vt_patsfun_43__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_43 env0 arg0)
(let(
;;knd = 0
  (tmpret106 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_43
  (ats2scmpre_stream_vt_exists_cloref env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_forall_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret107 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_forall_cloref
  (_ats2scmpre_stream_vt_loop_45 arg1 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_loop_45 env0 arg0)
(let(
;;knd = 1
;;(apy0 #f)
  (tmpret108 #f)
  (tmp109 #f)
  (tmp110 #f)
  (tmp111 #f)
  (tmp112 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_stream_vt_loop_45
    (ATSINStmpset tmp109 (ATSPMVllazyval_eval arg0))
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons tmp109)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         atscc2scm_true
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp110 (ATSSELcon tmp109 0))
         (ATSINStmpset tmp111 (ATSSELcon tmp109 1))
         ;; ATSINSfreecon(tmp109);
         (ATSINStmpset tmp112 ((ATSfunclo_fclo env0) env0 tmp110))
         (if tmp112
           (begin
            ;; apy0 = tmp111
            ;; arg0 = apy0
            ;; funlab_scm = 1; // __patsflab__ats2scmpre_stream_vt_loop_45
            (_ats2scmpre_stream_vt_loop_45 env0 tmp111)
           ) ;; if-then
           (begin
            (ATSINSmove1_void (atspre_lazy_vt_free tmp111))
            atscc2scm_false
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret108;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_forall_method arg0)
(let(
;;knd = 0
  (tmpret114 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_forall_method
  (_ats2scmpre_stream_vt_patsfun_47__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_47 env0 arg0)
(let(
;;knd = 0
  (tmpret115 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_47
  (ats2scmpre_stream_vt_forall_cloref env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_foreach_cloref arg0 arg1)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_foreach_cloref
  (ATSINSmove1_void (_ats2scmpre_stream_vt_loop_49 arg1 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_loop_49 env0 arg0)
(let(
;;knd = 1
;;(apy0 #f)
  (tmp118 #f)
  (tmp119 #f)
  (tmp120 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_stream_vt_loop_49
    (ATSINStmpset tmp118 (ATSPMVllazyval_eval arg0))
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons tmp118)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         ATSINSmove0_void
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp119 (ATSSELcon tmp118 0))
         (ATSINStmpset tmp120 (ATSSELcon tmp118 1))
         ;; ATSINSfreecon(tmp118);
         (ATSINSmove1_void ((ATSfunclo_fclo env0) env0 tmp119))
         ;; apy0 = tmp120
         ;; arg0 = apy0
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_stream_vt_loop_49
         (_ats2scmpre_stream_vt_loop_49 env0 tmp120)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return/*_void*/;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_foreach_method arg0)
(let(
;;knd = 0
  (tmpret122 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_foreach_method
  (_ats2scmpre_stream_vt_patsfun_51__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_51 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_51
  (ATSINSmove1_void (ats2scmpre_stream_vt_foreach_cloref env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_iforeach_cloref arg0 arg1)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_iforeach_cloref
  (ATSINSmove1_void (_ats2scmpre_stream_vt_loop_53 arg1 0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_loop_53 env0 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmp126 #f)
  (tmp127 #f)
  (tmp128 #f)
  (tmp130 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_stream_vt_loop_53
    (ATSINStmpset tmp126 (ATSPMVllazyval_eval arg1))
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons tmp126)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         ATSINSmove0_void
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp127 (ATSSELcon tmp126 0))
         (ATSINStmpset tmp128 (ATSSELcon tmp126 1))
         ;; ATSINSfreecon(tmp126);
         (ATSINSmove1_void ((ATSfunclo_fclo env0) env0 arg0 tmp127))
         (ATSINStmpset tmp130 (ats2scmpre_add_int1_int1 arg0 1))
         ;; apy0 = tmp130
         ;; apy1 = tmp128
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_stream_vt_loop_53
         (_ats2scmpre_stream_vt_loop_53 env0 tmp130 tmp128)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return/*_void*/;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_iforeach_method arg0)
(let(
;;knd = 0
  (tmpret131 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_iforeach_method
  (_ats2scmpre_stream_vt_patsfun_55__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_55 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_55
  (ATSINSmove1_void (ats2scmpre_stream_vt_iforeach_cloref env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_rforeach_cloref arg0 arg1)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_rforeach_cloref
  (ATSINSmove1_void (_ats2scmpre_stream_vt_auxmain_57 arg1 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_auxmain_57 env0 arg0)
(let(
;;knd = 0
  (tmp135 #f)
  (tmp136 #f)
  (tmp137 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_auxmain_57
  (ATSINStmpset tmp135 (ATSPMVllazyval_eval arg0))
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons tmp135)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       ATSINSmove0_void
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp136 (ATSSELcon tmp135 0))
       (ATSINStmpset tmp137 (ATSSELcon tmp135 1))
       ;; ATSINSfreecon(tmp135);
       (ATSINSmove1_void (_ats2scmpre_stream_vt_auxmain_57 env0 tmp137))
       (ATSINSmove1_void ((ATSfunclo_fclo env0) env0 tmp136))
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_rforeach_method arg0)
(let(
;;knd = 0
  (tmpret139 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_rforeach_method
  (_ats2scmpre_stream_vt_patsfun_59__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_59 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_59
  (ATSINSmove1_void (ats2scmpre_stream_vt_rforeach_cloref env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_stream_vt_tabulate_cloref arg0)
(let(
;;knd = 0
  (tmpret141 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_stream_vt_tabulate_cloref
  (_ats2scmpre_stream_vt_auxmain_61 arg0 0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_auxmain_61 env0 arg0)
(let(
;;knd = 0
  (tmpret142 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_auxmain_61
  (ATSPMVllazyval (_ats2scmpre_stream_vt_patsfun_62__closurerize env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_stream_vt_patsfun_62 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret143 #f)
  (tmp144 #f)
  (tmp145 #f)
  (tmp146 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_stream_vt_patsfun_62
  (if arg0
    (begin
     (ATSINStmpset tmp144 ((ATSfunclo_fclo env0) env0 env1))
     (ATSINStmpset tmp146 (ats2scmpre_add_int1_int1 env1 1))
     (ATSINStmpset tmp145 (_ats2scmpre_stream_vt_auxmain_61 env0 tmp146))
     (ATSPMVtysum tmp144 tmp145)
    ) ;; if-then
    (begin
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Scheme code is generated by atscc2scm
;; The starting compilation time is: 2018-6-23:  7h:50m
;;
;;;;;;

(define
(_ats2scmpre_intrange_patsfun_4__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_4 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_8__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_8 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_10__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_10 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_14__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_14 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_17__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0 xarg1)(_ats2scmpre_intrange_patsfun_17 (ATSCCget_1 _fcenvs_) xarg0 xarg1)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_20__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0 xarg1)(_ats2scmpre_intrange_patsfun_20 (ATSCCget_1 _fcenvs_) xarg0 xarg1)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_24__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_24 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_27__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_27 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_30__closurerize xenv0 xenv1 xenv2)
;;%{
  (list (lambda(_fcenvs_)(_ats2scmpre_intrange_patsfun_30 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) (ATSCCget_3 _fcenvs_))) xenv0 xenv1 xenv2)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_32__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_32 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_35__closurerize xenv0 xenv1 xenv2)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_35 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) (ATSCCget_3 _fcenvs_) xarg0)) xenv0 xenv1 xenv2)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_37__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_37 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_42__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_42 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_44__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_44 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_46__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_46 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_50__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_50 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_54__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_54 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_58__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_58 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_62__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_intrange_patsfun_62 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_66__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0 xarg1)(_ats2scmpre_intrange_patsfun_66 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0 xarg1)) xenv0 xenv1)
;;%}
) ;; define


(define
(_ats2scmpre_intrange_patsfun_70__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0 xarg1)(_ats2scmpre_intrange_patsfun_70 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0 xarg1)) xenv0 xenv1)
;;%}
) ;; define


;;fun
(define
(ats2scmpre_int_repeat_lazy arg0 arg1)
(let(
;;knd = 0
  (tmp1 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_repeat_lazy
  (ATSINStmpset tmp1 (ats2scmpre_lazy2cloref arg1))
  (ATSINSmove1_void (ats2scmpre_int_repeat_cloref arg0 tmp1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_repeat_cloref arg0 arg1)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_repeat_cloref
  (ATSINSmove1_void (_ats2scmpre_intrange_loop_2 arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_loop_2 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmp4 #f)
  (tmp6 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_intrange_loop_2
    (ATSINStmpset tmp4 (ats2scmpre_gt_int0_int0 arg0 0))
    (if tmp4
      (begin
       (ATSINSmove1_void ((ATSfunclo_fclo arg1) arg1))
       (ATSINStmpset tmp6 (ats2scmpre_sub_int0_int0 arg0 1))
       ;; apy0 = tmp6
       ;; apy1 = arg1
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; funlab_scm = 1; // __patsflab__ats2scmpre_intrange_loop_2
       (_ats2scmpre_intrange_loop_2 tmp6 arg1)
      ) ;; if-then
      (begin
       ATSINSmove0_void
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return/*_void*/;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_repeat_method arg0)
(let(
;;knd = 0
  (tmpret7 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_repeat_method
  (_ats2scmpre_intrange_patsfun_4__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_4 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_4
  (ATSINSmove1_void (ats2scmpre_int_repeat_cloref env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_exists_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret9 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_exists_cloref
  (ats2scmpre_intrange_exists_cloref 0 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_forall_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret10 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_forall_cloref
  (ats2scmpre_intrange_forall_cloref 0 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_exists_method arg0)
(let(
;;knd = 0
  (tmpret11 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_exists_method
  (_ats2scmpre_intrange_patsfun_8__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_8 env0 arg0)
(let(
;;knd = 0
  (tmpret12 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_8
  (ats2scmpre_int_exists_cloref env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_forall_method arg0)
(let(
;;knd = 0
  (tmpret13 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_forall_method
  (_ats2scmpre_intrange_patsfun_10__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_10 env0 arg0)
(let(
;;knd = 0
  (tmpret14 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_10
  (ats2scmpre_int_forall_cloref env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_foreach_cloref arg0 arg1)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_foreach_cloref
  (ATSINSmove1_void (ats2scmpre_intrange_foreach_cloref 0 arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_rforeach_cloref arg0 arg1)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_rforeach_cloref
  (ATSINSmove1_void (ats2scmpre_intrange_rforeach_cloref 0 arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_foreach_method arg0)
(let(
;;knd = 0
  (tmpret17 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_foreach_method
  (_ats2scmpre_intrange_patsfun_14__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_14 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_14
  (ATSINSmove1_void (ats2scmpre_int_foreach_cloref env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_foldleft_cloref arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret19 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_foldleft_cloref
  (ats2scmpre_intrange_foldleft_cloref 0 arg0 arg1 arg2)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_foldleft_method arg0 arg1)
(let(
;;knd = 0
  (tmpret20 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_foldleft_method
  (_ats2scmpre_intrange_patsfun_17__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_17 env0 arg0 arg1)
(let(
;;knd = 0
  (tmpret21 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_17
  (ats2scmpre_int_foldleft_cloref env0 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_foldright_cloref arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret22 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_foldright_cloref
  (ats2scmpre_intrange_foldright_cloref 0 arg0 arg1 arg2)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_foldright_method arg0 arg1)
(let(
;;knd = 0
  (tmpret23 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_foldright_method
  (_ats2scmpre_intrange_patsfun_20__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_20 env0 arg0 arg1)
(let(
;;knd = 0
  (tmpret24 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_20
  (ats2scmpre_int_foldright_cloref env0 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_list_map_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret25 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_list_map_cloref
  (_ats2scmpre_intrange_aux_22 arg0 arg1 0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_aux_22 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret26 #f)
  (tmp27 #f)
  (tmp28 #f)
  (tmp29 #f)
  (tmp30 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_aux_22
  (ATSINStmpset tmp27 (ats2scmpre_lt_int1_int1 arg0 env0))
  (if tmp27
    (begin
     (ATSINStmpset tmp28 ((ATSfunclo_fclo env1) env1 arg0))
     (ATSINStmpset tmp30 (ats2scmpre_add_int1_int1 arg0 1))
     (ATSINStmpset tmp29 (_ats2scmpre_intrange_aux_22 env0 env1 tmp30))
     (ATSPMVtysum tmp28 tmp29)
    ) ;; if-then
    (begin
     atscc2scm_null
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_list_map_method arg0 arg1)
(let(
;;knd = 0
  (tmpret31 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_list_map_method
  (_ats2scmpre_intrange_patsfun_24__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_24 env0 arg0)
(let(
;;knd = 0
  (tmpret32 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_24
  (ats2scmpre_int_list_map_cloref env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_list0_map_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret33 #f)
  (tmp34 #f)
  (tmp35 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_list0_map_cloref
  (ATSINStmpset tmp34 (ats2scmpre_gte_int1_int1 arg0 0))
  (if tmp34
    (begin
     (ATSINStmpset tmp35 (ats2scmpre_int_list_map_cloref arg0 arg1))
     tmp35
    ) ;; if-then
    (begin
     atscc2scm_null
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_list0_map_method arg0 arg1)
(let(
;;knd = 0
  (tmpret36 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_list0_map_method
  (_ats2scmpre_intrange_patsfun_27__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_27 env0 arg0)
(let(
;;knd = 0
  (tmpret37 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_27
  (ats2scmpre_int_list0_map_cloref env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_stream_map_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret38 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_stream_map_cloref
  (_ats2scmpre_intrange_aux_29 arg0 arg1 0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_aux_29 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret39 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_aux_29
  (ATSPMVlazyval (_ats2scmpre_intrange_patsfun_30__closurerize env0 env1 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_30 env0 env1 env2)
(let(
;;knd = 0
  (tmpret40 #f)
  (tmp41 #f)
  (tmp42 #f)
  (tmp43 #f)
  (tmp44 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_30
  (ATSINStmpset tmp41 (ats2scmpre_lt_int1_int1 env2 env0))
  (if tmp41
    (begin
     (ATSINStmpset tmp42 ((ATSfunclo_fclo env1) env1 env2))
     (ATSINStmpset tmp44 (ats2scmpre_add_int1_int1 env2 1))
     (ATSINStmpset tmp43 (_ats2scmpre_intrange_aux_29 env0 env1 tmp44))
     (ATSPMVtysum tmp42 tmp43)
    ) ;; if-then
    (begin
     atscc2scm_null
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_stream_map_method arg0 arg1)
(let(
;;knd = 0
  (tmpret45 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_stream_map_method
  (_ats2scmpre_intrange_patsfun_32__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_32 env0 arg0)
(let(
;;knd = 0
  (tmpret46 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_32
  (ats2scmpre_int_stream_map_cloref env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_stream_vt_map_cloref arg0 arg1)
(let(
;;knd = 0
  (tmpret47 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_stream_vt_map_cloref
  (_ats2scmpre_intrange_aux_34 arg0 arg1 0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_aux_34 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret48 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_aux_34
  (ATSPMVllazyval (_ats2scmpre_intrange_patsfun_35__closurerize env0 env1 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_35 env0 env1 env2 arg0)
(let(
;;knd = 0
  (tmpret49 #f)
  (tmp50 #f)
  (tmp51 #f)
  (tmp52 #f)
  (tmp53 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_35
  (if arg0
    (begin
     (ATSINStmpset tmp50 (ats2scmpre_lt_int1_int1 env2 env0))
     (if tmp50
       (begin
        (ATSINStmpset tmp51 ((ATSfunclo_fclo env1) env1 env2))
        (ATSINStmpset tmp53 (ats2scmpre_add_int1_int1 env2 1))
        (ATSINStmpset tmp52 (_ats2scmpre_intrange_aux_34 env0 env1 tmp53))
        (ATSPMVtysum tmp51 tmp52)
       ) ;; if-then
       (begin
        atscc2scm_null
       ) ;; if-else
     )
    ) ;; if-then
    (begin
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_stream_vt_map_method arg0 arg1)
(let(
;;knd = 0
  (tmpret54 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_stream_vt_map_method
  (_ats2scmpre_intrange_patsfun_37__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_37 env0 arg0)
(let(
;;knd = 0
  (tmpret55 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_37
  (ats2scmpre_int_stream_vt_map_cloref env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int2_exists_cloref arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret56 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int2_exists_cloref
  (ats2scmpre_intrange2_exists_cloref 0 arg0 0 arg1 arg2)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int2_forall_cloref arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret57 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int2_forall_cloref
  (ats2scmpre_intrange2_forall_cloref 0 arg0 0 arg1 arg2)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int2_foreach_cloref arg0 arg1 arg2)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int2_foreach_cloref
  (ATSINSmove1_void (ats2scmpre_intrange2_foreach_cloref 0 arg0 0 arg1 arg2))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_cross_exists_method arg0 arg1)
(let(
;;knd = 0
  (tmpret59 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_cross_exists_method
  (_ats2scmpre_intrange_patsfun_42__closurerize arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_42 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret60 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_42
  (ats2scmpre_int2_exists_cloref env0 env1 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_cross_forall_method arg0 arg1)
(let(
;;knd = 0
  (tmpret61 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_cross_forall_method
  (_ats2scmpre_intrange_patsfun_44__closurerize arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_44 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret62 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_44
  (ats2scmpre_int2_forall_cloref env0 env1 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_int_cross_foreach_method arg0 arg1)
(let(
;;knd = 0
  (tmpret63 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_int_cross_foreach_method
  (_ats2scmpre_intrange_patsfun_46__closurerize arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_46 env0 env1 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_46
  (ATSINSmove1_void (ats2scmpre_int2_foreach_cloref env0 env1 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_intrange_exists_cloref arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret65 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_intrange_exists_cloref
  (_ats2scmpre_intrange_loop_48 arg0 arg1 arg2)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_loop_48 arg0 arg1 arg2)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
;;(apy2 #f)
  (tmpret66 #f)
  (tmp67 #f)
  (tmp68 #f)
  (tmp69 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_intrange_loop_48
    (ATSINStmpset tmp67 (ats2scmpre_lt_int0_int0 arg0 arg1))
    (if tmp67
      (begin
       (ATSINStmpset tmp68 ((ATSfunclo_fclo arg2) arg2 arg0))
       (if tmp68
         (begin
          atscc2scm_true
         ) ;; if-then
         (begin
          (ATSINStmpset tmp69 (ats2scmpre_add_int0_int0 arg0 1))
          ;; apy0 = tmp69
          ;; apy1 = arg1
          ;; apy2 = arg2
          ;; arg0 = apy0
          ;; arg1 = apy1
          ;; arg2 = apy2
          ;; funlab_scm = 1; // __patsflab__ats2scmpre_intrange_loop_48
          (_ats2scmpre_intrange_loop_48 tmp69 arg1 arg2)
         ) ;; if-else
       )
      ) ;; if-then
      (begin
       atscc2scm_false
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret66;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_intrange_exists_method arg0)
(let(
;;knd = 0
  (tmpret70 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_intrange_exists_method
  (_ats2scmpre_intrange_patsfun_50__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_50 env0 arg0)
(let(
;;knd = 0
  (tmpret71 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_50
  (ats2scmpre_intrange_exists_cloref (ATSSELboxrec env0 0) (ATSSELboxrec env0 1) arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_intrange_forall_cloref arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret72 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_intrange_forall_cloref
  (_ats2scmpre_intrange_loop_52 arg0 arg1 arg2)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_loop_52 arg0 arg1 arg2)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
;;(apy2 #f)
  (tmpret73 #f)
  (tmp74 #f)
  (tmp75 #f)
  (tmp76 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_intrange_loop_52
    (ATSINStmpset tmp74 (ats2scmpre_lt_int0_int0 arg0 arg1))
    (if tmp74
      (begin
       (ATSINStmpset tmp75 ((ATSfunclo_fclo arg2) arg2 arg0))
       (if tmp75
         (begin
          (ATSINStmpset tmp76 (ats2scmpre_add_int0_int0 arg0 1))
          ;; apy0 = tmp76
          ;; apy1 = arg1
          ;; apy2 = arg2
          ;; arg0 = apy0
          ;; arg1 = apy1
          ;; arg2 = apy2
          ;; funlab_scm = 1; // __patsflab__ats2scmpre_intrange_loop_52
          (_ats2scmpre_intrange_loop_52 tmp76 arg1 arg2)
         ) ;; if-then
         (begin
          atscc2scm_false
         ) ;; if-else
       )
      ) ;; if-then
      (begin
       atscc2scm_true
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret73;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_intrange_forall_method arg0)
(let(
;;knd = 0
  (tmpret77 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_intrange_forall_method
  (_ats2scmpre_intrange_patsfun_54__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_54 env0 arg0)
(let(
;;knd = 0
  (tmpret78 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_54
  (ats2scmpre_intrange_forall_cloref (ATSSELboxrec env0 0) (ATSSELboxrec env0 1) arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_intrange_foreach_cloref arg0 arg1 arg2)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_intrange_foreach_cloref
  (ATSINSmove1_void (_ats2scmpre_intrange_loop_56 arg0 arg1 arg2))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_loop_56 arg0 arg1 arg2)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
;;(apy2 #f)
  (tmp81 #f)
  (tmp83 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_intrange_loop_56
    (ATSINStmpset tmp81 (ats2scmpre_lt_int0_int0 arg0 arg1))
    (if tmp81
      (begin
       (ATSINSmove1_void ((ATSfunclo_fclo arg2) arg2 arg0))
       (ATSINStmpset tmp83 (ats2scmpre_add_int0_int0 arg0 1))
       ;; apy0 = tmp83
       ;; apy1 = arg1
       ;; apy2 = arg2
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; arg2 = apy2
       ;; funlab_scm = 1; // __patsflab__ats2scmpre_intrange_loop_56
       (_ats2scmpre_intrange_loop_56 tmp83 arg1 arg2)
      ) ;; if-then
      (begin
       ATSINSmove0_void
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return/*_void*/;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_intrange_foreach_method arg0)
(let(
;;knd = 0
  (tmpret84 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_intrange_foreach_method
  (_ats2scmpre_intrange_patsfun_58__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_58 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_58
  (ATSINSmove1_void (ats2scmpre_intrange_foreach_cloref (ATSSELboxrec env0 0) (ATSSELboxrec env0 1) arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_intrange_rforeach_cloref arg0 arg1 arg2)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_intrange_rforeach_cloref
  (ATSINSmove1_void (_ats2scmpre_intrange_loop_60 arg0 arg1 arg2))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_loop_60 arg0 arg1 arg2)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
;;(apy2 #f)
  (tmp88 #f)
  (tmp90 #f)
  (tmp91 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_intrange_loop_60
    (ATSINStmpset tmp88 (ats2scmpre_lt_int0_int0 arg0 arg1))
    (if tmp88
      (begin
       (ATSINStmpset tmp90 (ats2scmpre_sub_int0_int0 arg1 1))
       (ATSINSmove1_void ((ATSfunclo_fclo arg2) arg2 tmp90))
       (ATSINStmpset tmp91 (ats2scmpre_sub_int0_int0 arg1 1))
       ;; apy0 = arg0
       ;; apy1 = tmp91
       ;; apy2 = arg2
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; arg2 = apy2
       ;; funlab_scm = 1; // __patsflab__ats2scmpre_intrange_loop_60
       (_ats2scmpre_intrange_loop_60 arg0 tmp91 arg2)
      ) ;; if-then
      (begin
       ATSINSmove0_void
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return/*_void*/;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_intrange_rforeach_method arg0)
(let(
;;knd = 0
  (tmpret92 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_intrange_rforeach_method
  (_ats2scmpre_intrange_patsfun_62__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_62 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_62
  (ATSINSmove1_void (ats2scmpre_intrange_rforeach_cloref (ATSSELboxrec env0 0) (ATSSELboxrec env0 1) arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_intrange_foldleft_cloref arg0 arg1 arg2 arg3)
(let(
;;knd = 0
  (tmpret94 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_intrange_foldleft_cloref
  (_ats2scmpre_intrange_loop_64 arg3 arg0 arg1 arg2)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_loop_64 env0 arg0 arg1 arg2)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
;;(apy2 #f)
  (tmpret95 #f)
  (tmp96 #f)
  (tmp97 #f)
  (tmp98 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_intrange_loop_64
    (ATSINStmpset tmp96 (ats2scmpre_lt_int0_int0 arg0 arg1))
    (if tmp96
      (begin
       (ATSINStmpset tmp97 (ats2scmpre_add_int0_int0 arg0 1))
       (ATSINStmpset tmp98 ((ATSfunclo_fclo env0) env0 arg2 arg0))
       ;; apy0 = tmp97
       ;; apy1 = arg1
       ;; apy2 = tmp98
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; arg2 = apy2
       ;; funlab_scm = 1; // __patsflab__ats2scmpre_intrange_loop_64
       (_ats2scmpre_intrange_loop_64 env0 tmp97 arg1 tmp98)
      ) ;; if-then
      (begin
       arg2
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret95;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_intrange_foldleft_method arg0 arg1)
(let(
;;knd = 0
  (tmp99 #f)
  (tmp100 #f)
  (tmpret101 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_intrange_foldleft_method
  (ATSINStmpset tmp99 (ATSSELboxrec arg0 0))
  (ATSINStmpset tmp100 (ATSSELboxrec arg0 1))
  (_ats2scmpre_intrange_patsfun_66__closurerize tmp99 tmp100)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_66 env0 env1 arg0 arg1)
(let(
;;knd = 0
  (tmpret102 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_66
  (ats2scmpre_intrange_foldleft_cloref env0 env1 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_intrange_foldright_cloref arg0 arg1 arg2 arg3)
(let(
;;knd = 0
  (tmpret103 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_intrange_foldright_cloref
  (_ats2scmpre_intrange_loop_68 arg2 arg0 arg1 arg3)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_loop_68 env0 arg0 arg1 arg2)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
;;(apy2 #f)
  (tmpret104 #f)
  (tmp105 #f)
  (tmp106 #f)
  (tmp107 #f)
  (tmp108 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_intrange_loop_68
    (ATSINStmpset tmp105 (ats2scmpre_lt_int0_int0 arg0 arg1))
    (if tmp105
      (begin
       (ATSINStmpset tmp106 (ats2scmpre_sub_int0_int0 arg1 1))
       (ATSINStmpset tmp108 (ats2scmpre_sub_int0_int0 arg1 1))
       (ATSINStmpset tmp107 ((ATSfunclo_fclo env0) env0 tmp108 arg2))
       ;; apy0 = arg0
       ;; apy1 = tmp106
       ;; apy2 = tmp107
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; arg2 = apy2
       ;; funlab_scm = 1; // __patsflab__ats2scmpre_intrange_loop_68
       (_ats2scmpre_intrange_loop_68 env0 arg0 tmp106 tmp107)
      ) ;; if-then
      (begin
       arg2
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret104;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_intrange_foldright_method arg0 arg1)
(let(
;;knd = 0
  (tmp109 #f)
  (tmp110 #f)
  (tmpret111 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_intrange_foldright_method
  (ATSINStmpset tmp109 (ATSSELboxrec arg0 0))
  (ATSINStmpset tmp110 (ATSSELboxrec arg0 1))
  (_ats2scmpre_intrange_patsfun_70__closurerize tmp109 tmp110)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_patsfun_70 env0 env1 arg0 arg1)
(let(
;;knd = 0
  (tmpret112 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_intrange_patsfun_70
  (ats2scmpre_intrange_foldright_cloref env0 env1 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_intrange2_exists_cloref arg0 arg1 arg2 arg3 arg4)
(let(
;;knd = 0
  (tmpret113 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_intrange2_exists_cloref
  (_ats2scmpre_intrange_loop1_72 arg2 arg3 arg4 arg0 arg1 arg2 arg3 arg4)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_loop1_72 env0 env1 env2 arg0 arg1 arg2 arg3 arg4)
(_ats2scmpre_intrange_loop1_72__ 1 env0 env1 env2 arg0 arg1 arg2 arg3 arg4)
) ;; end-of-fun
(define
(_ats2scmpre_intrange_loop1_72__ funlab env0 env1 env2 arg0 arg1 arg2 arg3 arg4)
(let(
;;knd = 2
;;(apy0 #f)
;;(apy1 #f)
;;(apy2 #f)
;;(apy3 #f)
;;(apy4 #f)
  (tmpret114 #f)
  (tmp115 #f)
  (a2rg0 arg0)
  (a2rg1 arg1)
  (a2rg2 arg2)
  (a2rg3 arg3)
  (a2rg4 arg4)
;;(a2py0 #f)
;;(a2py1 #f)
;;(a2py2 #f)
;;(a2py3 #f)
;;(a2py4 #f)
  (tmpret116 #f)
  (tmp117 #f)
  (tmp118 #f)
  (tmp119 #f)
  (tmp120 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; funlab_scm = 1;
  ;while(true) {
    ;switch(funlab_scm) {
    (case funlab
      ;case 1: {
      ((1)
        ;; funlab_scm = 0;
        (ATSINStmpset tmp115 (ats2scmpre_lt_int0_int0 arg0 arg1))
        (if tmp115
          (begin
           ;; a2py0 = arg0
           ;; a2py1 = arg1
           ;; a2py2 = arg2
           ;; a2py3 = arg3
           ;; a2py4 = env2
           ;; a2rg0 = a2py0
           ;; a2rg1 = a2py1
           ;; a2rg2 = a2py2
           ;; a2rg3 = a2py3
           ;; a2rg4 = a2py4
           ;; funlab_scm = 2; // __patsflab__ats2scmpre_intrange_loop2_73
           (_ats2scmpre_intrange_loop1_72__ 2 env0 env1 env2 arg0 arg1 arg2 arg3 env2)
          ) ;; if-then
          (begin
           atscc2scm_false
          ) ;; if-else
        );
        ;; if (funlab_scm > 0) continue; else ;; return tmpret114;
      ) ;} // end-of-case
      ;case 2: {
      ((2)
        ;; funlab_scm = 0;
        (ATSINStmpset tmp117 (ats2scmpre_lt_int0_int0 a2rg2 a2rg3))
        (if tmp117
          (begin
           (ATSINStmpset tmp118 ((ATSfunclo_fclo a2rg4) a2rg4 a2rg0 a2rg2))
           (if tmp118
             (begin
              atscc2scm_true
             ) ;; if-then
             (begin
              (ATSINStmpset tmp119 (ats2scmpre_add_int0_int0 a2rg2 1))
              ;; a2py0 = a2rg0
              ;; a2py1 = a2rg1
              ;; a2py2 = tmp119
              ;; a2py3 = a2rg3
              ;; a2py4 = a2rg4
              ;; a2rg0 = a2py0
              ;; a2rg1 = a2py1
              ;; a2rg2 = a2py2
              ;; a2rg3 = a2py3
              ;; a2rg4 = a2py4
              ;; funlab_scm = 2; // __patsflab__ats2scmpre_intrange_loop2_73
              (_ats2scmpre_intrange_loop1_72__ 2 env0 env1 env2 a2rg0 a2rg1 tmp119 a2rg3 a2rg4)
             ) ;; if-else
           )
          ) ;; if-then
          (begin
           (ATSINStmpset tmp120 (ats2scmpre_add_int0_int0 a2rg0 1))
           ;; apy0 = tmp120
           ;; apy1 = a2rg1
           ;; apy2 = env0
           ;; apy3 = env1
           ;; apy4 = a2rg4
           ;; arg0 = apy0
           ;; arg1 = apy1
           ;; arg2 = apy2
           ;; arg3 = apy3
           ;; arg4 = apy4
           ;; funlab_scm = 1; // __patsflab__ats2scmpre_intrange_loop1_72
           (_ats2scmpre_intrange_loop1_72__ 1 env0 env1 env2 tmp120 a2rg1 env0 env1 a2rg4)
          ) ;; if-else
        );
        ;; if (funlab_scm > 0) continue; else ;; return tmpret116;
      ) ;} // end-of-case
    ) ;} // end-of-switch
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_intrange2_forall_cloref arg0 arg1 arg2 arg3 arg4)
(let(
;;knd = 0
  (tmpret121 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_intrange2_forall_cloref
  (_ats2scmpre_intrange_loop1_75 arg2 arg3 arg0 arg1 arg2 arg3 arg4)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_loop1_75 env0 env1 arg0 arg1 arg2 arg3 arg4)
(_ats2scmpre_intrange_loop1_75__ 1 env0 env1 arg0 arg1 arg2 arg3 arg4)
) ;; end-of-fun
(define
(_ats2scmpre_intrange_loop1_75__ funlab env0 env1 arg0 arg1 arg2 arg3 arg4)
(let(
;;knd = 2
;;(apy0 #f)
;;(apy1 #f)
;;(apy2 #f)
;;(apy3 #f)
;;(apy4 #f)
  (tmpret122 #f)
  (tmp123 #f)
  (a2rg0 arg0)
  (a2rg1 arg1)
  (a2rg2 arg2)
  (a2rg3 arg3)
  (a2rg4 arg4)
;;(a2py0 #f)
;;(a2py1 #f)
;;(a2py2 #f)
;;(a2py3 #f)
;;(a2py4 #f)
  (tmpret124 #f)
  (tmp125 #f)
  (tmp126 #f)
  (tmp127 #f)
  (tmp128 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; funlab_scm = 1;
  ;while(true) {
    ;switch(funlab_scm) {
    (case funlab
      ;case 1: {
      ((1)
        ;; funlab_scm = 0;
        (ATSINStmpset tmp123 (ats2scmpre_lt_int0_int0 arg0 arg1))
        (if tmp123
          (begin
           ;; a2py0 = arg0
           ;; a2py1 = arg1
           ;; a2py2 = arg2
           ;; a2py3 = arg3
           ;; a2py4 = arg4
           ;; a2rg0 = a2py0
           ;; a2rg1 = a2py1
           ;; a2rg2 = a2py2
           ;; a2rg3 = a2py3
           ;; a2rg4 = a2py4
           ;; funlab_scm = 2; // __patsflab__ats2scmpre_intrange_loop2_76
           (_ats2scmpre_intrange_loop1_75__ 2 env0 env1 arg0 arg1 arg2 arg3 arg4)
          ) ;; if-then
          (begin
           atscc2scm_true
          ) ;; if-else
        );
        ;; if (funlab_scm > 0) continue; else ;; return tmpret122;
      ) ;} // end-of-case
      ;case 2: {
      ((2)
        ;; funlab_scm = 0;
        (ATSINStmpset tmp125 (ats2scmpre_lt_int0_int0 a2rg2 a2rg3))
        (if tmp125
          (begin
           (ATSINStmpset tmp126 ((ATSfunclo_fclo a2rg4) a2rg4 a2rg0 a2rg2))
           (if tmp126
             (begin
              (ATSINStmpset tmp127 (ats2scmpre_add_int0_int0 a2rg2 1))
              ;; a2py0 = a2rg0
              ;; a2py1 = a2rg1
              ;; a2py2 = tmp127
              ;; a2py3 = a2rg3
              ;; a2py4 = a2rg4
              ;; a2rg0 = a2py0
              ;; a2rg1 = a2py1
              ;; a2rg2 = a2py2
              ;; a2rg3 = a2py3
              ;; a2rg4 = a2py4
              ;; funlab_scm = 2; // __patsflab__ats2scmpre_intrange_loop2_76
              (_ats2scmpre_intrange_loop1_75__ 2 env0 env1 a2rg0 a2rg1 tmp127 a2rg3 a2rg4)
             ) ;; if-then
             (begin
              atscc2scm_false
             ) ;; if-else
           )
          ) ;; if-then
          (begin
           (ATSINStmpset tmp128 (ats2scmpre_add_int0_int0 a2rg0 1))
           ;; apy0 = tmp128
           ;; apy1 = a2rg1
           ;; apy2 = env0
           ;; apy3 = env1
           ;; apy4 = a2rg4
           ;; arg0 = apy0
           ;; arg1 = apy1
           ;; arg2 = apy2
           ;; arg3 = apy3
           ;; arg4 = apy4
           ;; funlab_scm = 1; // __patsflab__ats2scmpre_intrange_loop1_75
           (_ats2scmpre_intrange_loop1_75__ 1 env0 env1 tmp128 a2rg1 env0 env1 a2rg4)
          ) ;; if-else
        );
        ;; if (funlab_scm > 0) continue; else ;; return tmpret124;
      ) ;} // end-of-case
    ) ;} // end-of-switch
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_intrange2_foreach_cloref arg0 arg1 arg2 arg3 arg4)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_intrange2_foreach_cloref
  (ATSINSmove1_void (_ats2scmpre_intrange_loop1_78 arg2 arg3 arg0 arg1 arg2 arg3 arg4))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_intrange_loop1_78 env0 env1 arg0 arg1 arg2 arg3 arg4)
(_ats2scmpre_intrange_loop1_78__ 1 env0 env1 arg0 arg1 arg2 arg3 arg4)
) ;; end-of-fun
(define
(_ats2scmpre_intrange_loop1_78__ funlab env0 env1 arg0 arg1 arg2 arg3 arg4)
(let(
;;knd = 2
;;(apy0 #f)
;;(apy1 #f)
;;(apy2 #f)
;;(apy3 #f)
;;(apy4 #f)
  (tmp131 #f)
  (a2rg0 arg0)
  (a2rg1 arg1)
  (a2rg2 arg2)
  (a2rg3 arg3)
  (a2rg4 arg4)
;;(a2py0 #f)
;;(a2py1 #f)
;;(a2py2 #f)
;;(a2py3 #f)
;;(a2py4 #f)
  (tmp133 #f)
  (tmp135 #f)
  (tmp136 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; funlab_scm = 1;
  ;while(true) {
    ;switch(funlab_scm) {
    (case funlab
      ;case 1: {
      ((1)
        ;; funlab_scm = 0;
        (ATSINStmpset tmp131 (ats2scmpre_lt_int0_int0 arg0 arg1))
        (if tmp131
          (begin
           ;; a2py0 = arg0
           ;; a2py1 = arg1
           ;; a2py2 = arg2
           ;; a2py3 = arg3
           ;; a2py4 = arg4
           ;; a2rg0 = a2py0
           ;; a2rg1 = a2py1
           ;; a2rg2 = a2py2
           ;; a2rg3 = a2py3
           ;; a2rg4 = a2py4
           ;; funlab_scm = 2; // __patsflab__ats2scmpre_intrange_loop2_79
           (_ats2scmpre_intrange_loop1_78__ 2 env0 env1 arg0 arg1 arg2 arg3 arg4)
          ) ;; if-then
          (begin
           ATSINSmove0_void
          ) ;; if-else
        );
        ;; if (funlab_scm > 0) continue; else ;; return/*_void*/;
      ) ;} // end-of-case
      ;case 2: {
      ((2)
        ;; funlab_scm = 0;
        (ATSINStmpset tmp133 (ats2scmpre_lt_int0_int0 a2rg2 a2rg3))
        (if tmp133
          (begin
           (ATSINSmove1_void ((ATSfunclo_fclo a2rg4) a2rg4 a2rg0 a2rg2))
           (ATSINStmpset tmp135 (ats2scmpre_add_int0_int0 a2rg2 1))
           ;; a2py0 = a2rg0
           ;; a2py1 = a2rg1
           ;; a2py2 = tmp135
           ;; a2py3 = a2rg3
           ;; a2py4 = a2rg4
           ;; a2rg0 = a2py0
           ;; a2rg1 = a2py1
           ;; a2rg2 = a2py2
           ;; a2rg3 = a2py3
           ;; a2rg4 = a2py4
           ;; funlab_scm = 2; // __patsflab__ats2scmpre_intrange_loop2_79
           (_ats2scmpre_intrange_loop1_78__ 2 env0 env1 a2rg0 a2rg1 tmp135 a2rg3 a2rg4)
          ) ;; if-then
          (begin
           (ATSINStmpset tmp136 (ats2scmpre_succ_int0 a2rg0))
           ;; apy0 = tmp136
           ;; apy1 = a2rg1
           ;; apy2 = env0
           ;; apy3 = env1
           ;; apy4 = a2rg4
           ;; arg0 = apy0
           ;; arg1 = apy1
           ;; arg2 = apy2
           ;; arg3 = apy3
           ;; arg4 = apy4
           ;; funlab_scm = 1; // __patsflab__ats2scmpre_intrange_loop1_78
           (_ats2scmpre_intrange_loop1_78__ 1 env0 env1 tmp136 a2rg1 env0 env1 a2rg4)
          ) ;; if-else
        );
        ;; if (funlab_scm > 0) continue; else ;; return/*_void*/;
      ) ;} // end-of-case
    ) ;} // end-of-switch
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Scheme code is generated by atscc2scm
;; The starting compilation time is: 2018-6-23:  7h:50m
;;
;;;;;;
;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Scheme code is generated by atscc2scm
;; The starting compilation time is: 2018-6-23:  7h:50m
;;
;;;;;;

;;fun
(define
(ats2scmpre_funarray_make_nil)
(let(
;;knd = 0
  (tmpret0 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_funarray_make_nil
  atscc2scm_null
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_funarray_size arg0)
(let(
;;knd = 0
  (tmpret1 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_funarray_size
  (_ats2scmpre_funarray_size_3 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_funarray_diff_2 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret2 #f)
  (tmp4 #f)
  (tmp5 #f)
  (tmp6 #f)
  (tmp7 #f)
  (tmp8 #f)
  (tmp9 #f)
  (tmp10 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_funarray_diff_2
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         0
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp4 (ATSSELcon arg1 1))
         (ATSINStmpset tmp5 (ATSSELcon arg1 2))
         (ATSINStmpset tmp6 (ats2scmpre_gt_int1_int1 arg0 0))
         (if tmp6
           (begin
            (ATSINStmpset tmp7 (ats2scmpre_half_int1 arg0))
            (ATSINStmpset tmp9 (ats2scmpre_add_int1_int1 tmp7 tmp7))
            (ATSINStmpset tmp8 (ats2scmpre_gt_int1_int1 arg0 tmp9))
            (if tmp8
              (begin
               ;; apy0 = tmp7
               ;; apy1 = tmp4
               ;; arg0 = apy0
               ;; arg1 = apy1
               ;; funlab_scm = 1; // __patsflab__ats2scmpre_funarray_diff_2
               (_ats2scmpre_funarray_diff_2 tmp7 tmp4)
              ) ;; if-then
              (begin
               (ATSINStmpset tmp10 (ats2scmpre_sub_int1_int1 tmp7 1))
               ;; apy0 = tmp10
               ;; apy1 = tmp5
               ;; arg0 = apy0
               ;; arg1 = apy1
               ;; funlab_scm = 1; // __patsflab__ats2scmpre_funarray_diff_2
               (_ats2scmpre_funarray_diff_2 tmp10 tmp5)
              ) ;; if-else
            )
           ) ;; if-then
           (begin
            1
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret2;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_funarray_size_3 arg0)
(let(
;;knd = 0
  (tmpret11 #f)
  (tmp13 #f)
  (tmp14 #f)
  (tmp15 #f)
  (tmp16 #f)
  (tmp17 #f)
  (tmp18 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_funarray_size_3
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       0
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp13 (ATSSELcon arg0 1))
       (ATSINStmpset tmp14 (ATSSELcon arg0 2))
       (ATSINStmpset tmp15 (_ats2scmpre_funarray_size_3 tmp14))
       (ATSINStmpset tmp17 (_ats2scmpre_funarray_diff_2 tmp15 tmp13))
       (ATSINStmpset tmp16 (ats2scmpre_add_int1_int1 1 tmp17))
       (ATSINStmpset tmp18 (ats2scmpre_mul_int1_int1 2 tmp15))
       (ats2scmpre_add_int1_int1 tmp18 tmp16)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_funarray_get_at arg0 arg1)
(let(
;;knd = 0
  (tmpret19 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_funarray_get_at
  (_ats2scmpre_funarray_get_at_5 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_funarray_get_at_5 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret20 #f)
  (tmp21 #f)
  (tmp22 #f)
  (tmp23 #f)
  (tmp24 #f)
  (tmp25 #f)
  (tmp26 #f)
  (tmp27 #f)
  (tmp28 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_funarray_get_at_5
    (ATSINStmpset tmp21 (ats2scmpre_gt_int1_int1 arg1 0))
    (if tmp21
      (begin
       (ATSINStmpset tmp22 (ats2scmpre_half_int1 arg1))
       (ATSINStmpset tmp24 (ats2scmpre_add_int1_int1 tmp22 tmp22))
       (ATSINStmpset tmp23 (ats2scmpre_gt_int1_int1 arg1 tmp24))
       (if tmp23
         (begin
          (ATSINStmpset tmp25 (ATSSELcon arg0 1))
          ;; apy0 = tmp25
          ;; apy1 = tmp22
          ;; arg0 = apy0
          ;; arg1 = apy1
          ;; funlab_scm = 1; // __patsflab__ats2scmpre_funarray_get_at_5
          (_ats2scmpre_funarray_get_at_5 tmp25 tmp22)
         ) ;; if-then
         (begin
          (ATSINStmpset tmp26 (ATSSELcon arg0 2))
          (ATSINStmpset tmp27 (ats2scmpre_sub_int1_int1 tmp22 1))
          ;; apy0 = tmp26
          ;; apy1 = tmp27
          ;; arg0 = apy0
          ;; arg1 = apy1
          ;; funlab_scm = 1; // __patsflab__ats2scmpre_funarray_get_at_5
          (_ats2scmpre_funarray_get_at_5 tmp26 tmp27)
         ) ;; if-else
       )
      ) ;; if-then
      (begin
       (ATSINStmpset tmp28 (ATSSELcon arg0 0))
       tmp28
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret20;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_funarray_set_at arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret29 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_funarray_set_at
  (_ats2scmpre_funarray_set_at_7 arg0 arg1 arg2)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_funarray_set_at_7 arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret30 #f)
  (tmp31 #f)
  (tmp32 #f)
  (tmp33 #f)
  (tmp34 #f)
  (tmp35 #f)
  (tmp36 #f)
  (tmp37 #f)
  (tmp38 #f)
  (tmp39 #f)
  (tmp40 #f)
  (tmp41 #f)
  (tmp42 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_funarray_set_at_7
  (ATSINStmpset tmp31 (ats2scmpre_gt_int1_int1 arg1 0))
  (if tmp31
    (begin
     (ATSINStmpset tmp32 (ats2scmpre_half_int1 arg1))
     (ATSINStmpset tmp33 (ATSSELcon arg0 0))
     (ATSINStmpset tmp34 (ATSSELcon arg0 1))
     (ATSINStmpset tmp35 (ATSSELcon arg0 2))
     (ATSINStmpset tmp37 (ats2scmpre_add_int1_int1 tmp32 tmp32))
     (ATSINStmpset tmp36 (ats2scmpre_gt_int1_int1 arg1 tmp37))
     (if tmp36
       (begin
        (ATSINStmpset tmp38 (_ats2scmpre_funarray_set_at_7 tmp34 tmp32 arg2))
        (ATSPMVtysum tmp33 tmp38 tmp35)
       ) ;; if-then
       (begin
        (ATSINStmpset tmp40 (ats2scmpre_sub_int1_int1 tmp32 1))
        (ATSINStmpset tmp39 (_ats2scmpre_funarray_set_at_7 tmp35 tmp40 arg2))
        (ATSPMVtysum tmp33 tmp34 tmp39)
       ) ;; if-else
     )
    ) ;; if-then
    (begin
     (ATSINStmpset tmp41 (ATSSELcon arg0 1))
     (ATSINStmpset tmp42 (ATSSELcon arg0 2))
     (ATSPMVtysum arg2 tmp41 tmp42)
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_funarray_insert_l arg0 arg1)
(let(
;;knd = 0
  (tmpret43 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_funarray_insert_l
  (_ats2scmpre_funarray_ins_l_9 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_funarray_ins_l_9 arg0 arg1)
(let(
;;knd = 0
  (tmpret44 #f)
  (tmp45 #f)
  (tmp46 #f)
  (tmp47 #f)
  (tmp48 #f)
  (tmp49 #f)
  (tmp50 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_funarray_ins_l_9
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       (ATSINStmpset tmp48 atscc2scm_null)
       (ATSINStmpset tmp49 atscc2scm_null)
       (ATSPMVtysum arg1 tmp48 tmp49)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp45 (ATSSELcon arg0 0))
       (ATSINStmpset tmp46 (ATSSELcon arg0 1))
       (ATSINStmpset tmp47 (ATSSELcon arg0 2))
       (ATSINStmpset tmp50 (_ats2scmpre_funarray_ins_l_9 tmp47 tmp45))
       (ATSPMVtysum arg1 tmp50 tmp46)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_funarray_insert_r arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret51 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_funarray_insert_r
  (_ats2scmpre_funarray_ins_r_11 arg0 arg1 arg2)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_funarray_ins_r_11 arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret52 #f)
  (tmp53 #f)
  (tmp54 #f)
  (tmp55 #f)
  (tmp56 #f)
  (tmp57 #f)
  (tmp58 #f)
  (tmp59 #f)
  (tmp60 #f)
  (tmp61 #f)
  (tmp62 #f)
  (tmp63 #f)
  (tmp64 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_funarray_ins_r_11
  (ATSINStmpset tmp53 (ats2scmpre_gt_int1_int1 arg1 0))
  (if tmp53
    (begin
     (ATSINStmpset tmp54 (ats2scmpre_half_int1 arg1))
     (ATSINStmpset tmp55 (ATSSELcon arg0 0))
     (ATSINStmpset tmp56 (ATSSELcon arg0 1))
     (ATSINStmpset tmp57 (ATSSELcon arg0 2))
     (ATSINStmpset tmp59 (ats2scmpre_add_int1_int1 tmp54 tmp54))
     (ATSINStmpset tmp58 (ats2scmpre_gt_int1_int1 arg1 tmp59))
     (if tmp58
       (begin
        (ATSINStmpset tmp60 (_ats2scmpre_funarray_ins_r_11 tmp56 tmp54 arg2))
        (ATSPMVtysum tmp55 tmp60 tmp57)
       ) ;; if-then
       (begin
        (ATSINStmpset tmp62 (ats2scmpre_sub_int1_int1 tmp54 1))
        (ATSINStmpset tmp61 (_ats2scmpre_funarray_ins_r_11 tmp57 tmp62 arg2))
        (ATSPMVtysum tmp55 tmp56 tmp61)
       ) ;; if-else
     )
    ) ;; if-then
    (begin
     (ATSINStmpset tmp63 atscc2scm_null)
     (ATSINStmpset tmp64 atscc2scm_null)
     (ATSPMVtysum arg2 tmp63 tmp64)
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_funarray_remove_l arg0)
(let(
;;knd = 0
  (tmpret65 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_funarray_remove_l
  (_ats2scmpre_funarray_rem_l_13 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_funarray_rem_l_13 arg0)
(let(
;;knd = 0
  (tmpret66 #f)
  (tmp67 #f)
  (tmp68 #f)
  (tmp70 #f)
  (tmp71 #f)
  (tmp72 #f)
  (tmp73 #f)
  (tmp74 #f)
  (tmp75 #f)
  (tmp76 #f)
  (tmp77 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_funarray_rem_l_13
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (ATSINStmpset tmp68 (ATSSELcon arg0 1))
       (casefnx 2)
      ) ;; end-of-branch
      ((2)
       (if (ATSCKptriscons tmp68)
         (casefnx 5)
         (begin
          (casefnx 3)
         )
       )
      ) ;; end-of-branch
      ((3)
       (ATSINStmpset tmp67 (ATSSELcon arg0 0))
       (ATSINStmpset tmp73 atscc2scm_null)
       (ATSPMVtyrec tmp73 tmp67)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((4)
       (casefnx 5)
      ) ;; end-of-branch
      ((5)
       (ATSINStmpset tmp70 (ATSSELcon arg0 0))
       (ATSINStmpset tmp71 (ATSSELcon arg0 1))
       (ATSINStmpset tmp72 (ATSSELcon arg0 2))
       (ATSINStmpset tmp74 (_ats2scmpre_funarray_rem_l_13 tmp71))
       (ATSINStmpset tmp75 (ATSSELboxrec tmp74 0))
       (ATSINStmpset tmp76 (ATSSELboxrec tmp74 1))
       (ATSINStmpset tmp77 (ATSPMVtysum tmp70 tmp72 tmp75))
       (ATSPMVtyrec tmp77 tmp76)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_funarray_remove_r arg0 arg1)
(let(
;;knd = 0
  (tmpret78 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_funarray_remove_r
  (_ats2scmpre_funarray_rem_r_15 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_funarray_rem_r_15 arg0 arg1)
(let(
;;knd = 0
  (tmpret79 #f)
  (tmp80 #f)
  (tmp81 #f)
  (tmp82 #f)
  (tmp83 #f)
  (tmp84 #f)
  (tmp85 #f)
  (tmp86 #f)
  (tmp87 #f)
  (tmp88 #f)
  (tmp89 #f)
  (tmp90 #f)
  (tmp91 #f)
  (tmp92 #f)
  (tmp93 #f)
  (tmp94 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_funarray_rem_r_15
  (ATSINStmpset tmp80 (ats2scmpre_half_int1 arg1))
  (ATSINStmpset tmp81 (ATSSELcon arg0 0))
  (ATSINStmpset tmp82 (ATSSELcon arg0 1))
  (ATSINStmpset tmp83 (ATSSELcon arg0 2))
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons tmp82)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       (ATSINStmpset tmp84 atscc2scm_null)
       (ATSPMVtyrec tmp84 tmp81)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp86 (ats2scmpre_add_int1_int1 tmp80 tmp80))
       (ATSINStmpset tmp85 (ats2scmpre_gt_int1_int1 arg1 tmp86))
       (if tmp85
         (begin
          (ATSINStmpset tmp87 (_ats2scmpre_funarray_rem_r_15 tmp83 tmp80))
          (ATSINStmpset tmp88 (ATSSELboxrec tmp87 0))
          (ATSINStmpset tmp89 (ATSSELboxrec tmp87 1))
          (ATSINStmpset tmp90 (ATSPMVtysum tmp81 tmp82 tmp88))
          (ATSPMVtyrec tmp90 tmp89)
         ) ;; if-then
         (begin
          (ATSINStmpset tmp91 (_ats2scmpre_funarray_rem_r_15 tmp82 tmp80))
          (ATSINStmpset tmp92 (ATSSELboxrec tmp91 0))
          (ATSINStmpset tmp93 (ATSSELboxrec tmp91 1))
          (ATSINStmpset tmp94 (ATSPMVtysum tmp81 tmp92 tmp83))
          (ATSPMVtyrec tmp94 tmp93)
         ) ;; if-else
       )
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Scheme code is generated by atscc2scm
;; The starting compilation time is: 2018-6-23:  7h:50m
;;
;;;;;;

;;fun
(define
(slistref_make_nil)
(let(
;;knd = 0
  (tmpret0 #f)
  (tmp1 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_slistref_make_nil
  (ATSINStmpset tmp1 atscc2scm_null)
  (ats2scmpre_ref tmp1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(slistref_length arg0)
(let(
;;knd = 0
  (tmpret2 #f)
  (tmp3 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_slistref_length
  (ATSINStmpset tmp3 (ats2scmpre_ref_get_elt arg0))
  (ats2scmpre_list_length tmp3)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(slistref_push arg0 arg1)
(let(
;;knd = 0
  (tmp5 #f)
  (tmp6 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_slistref_push
  (ATSINStmpset tmp6 (ats2scmpre_ref_get_elt arg0))
  (ATSINStmpset tmp5 (ATSPMVtysum arg1 tmp6))
  (ATSINSmove1_void (ats2scmpre_ref_set_elt arg0 tmp5))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(slistref_pop_opt arg0)
(let(
;;knd = 0
  (tmpret7 #f)
  (tmp8 #f)
  (tmp9 #f)
  (tmp10 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_slistref_pop_opt
  (ATSINStmpset tmp8 (ats2scmpre_ref_get_elt arg0))
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons tmp8)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp9 (ATSSELcon tmp8 0))
       (ATSINStmpset tmp10 (ATSSELcon tmp8 1))
       (ATSINSmove1_void (ats2scmpre_ref_set_elt arg0 tmp10))
       (ATSPMVtysum tmp9)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(slistref_foldleft arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret12 #f)
  (tmp13 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_slistref_foldleft
  (ATSINStmpset tmp13 (ats2scmpre_ref_get_elt arg0))
  (ats2scmpre_list_foldleft tmp13 arg1 arg2)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(slistref_foldright arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret14 #f)
  (tmp15 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_slistref_foldright
  (ATSINStmpset tmp15 (ats2scmpre_ref_get_elt arg0))
  (ats2scmpre_list_foldright tmp15 arg1 arg2)
) ;; end-of-let
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Scheme code is generated by atscc2scm
;; The starting compilation time is: 2018-6-23:  7h:50m
;;
;;;;;;

;;fun
(define
(ats2scmpre_qlistref_make_nil)
(let(
;;knd = 0
  (tmpret0 #f)
  (tmp1 #f)
  (tmp2 #f)
  (tmp3 #f)
  (tmp4 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_qlistref_make_nil
  (ATSINStmpset tmp2 atscc2scm_null)
  (ATSINStmpset tmp1 (ats2scmpre_ref tmp2))
  (ATSINStmpset tmp4 atscc2scm_null)
  (ATSINStmpset tmp3 (ats2scmpre_ref tmp4))
  (ATSPMVtysum tmp1 tmp3)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_qlistref_length arg0)
(let(
;;knd = 0
  (tmpret5 #f)
  (tmp6 #f)
  (tmp7 #f)
  (tmp8 #f)
  (tmp9 #f)
  (tmp10 #f)
  (tmp11 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_qlistref_length
  (ATSINStmpset tmp6 (ATSSELcon arg0 0))
  (ATSINStmpset tmp7 (ATSSELcon arg0 1))
  (ATSINStmpset tmp9 (ats2scmpre_ref_get_elt tmp6))
  (ATSINStmpset tmp8 (ats2scmpre_list_length tmp9))
  (ATSINStmpset tmp11 (ats2scmpre_ref_get_elt tmp7))
  (ATSINStmpset tmp10 (ats2scmpre_list_length tmp11))
  (ats2scmpre_add_int1_int1 tmp8 tmp10)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_qlistref_enqueue arg0 arg1)
(let(
;;knd = 0
  (tmp13 #f)
  (tmp14 #f)
  (tmp15 #f)
  (tmp16 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_qlistref_enqueue
  (ATSINStmpset tmp13 (ATSSELcon arg0 0))
  (ATSINStmpset tmp14 (ATSSELcon arg0 1))
  (ATSINStmpset tmp16 (ats2scmpre_ref_get_elt tmp13))
  (ATSINStmpset tmp15 (ATSPMVtysum arg1 tmp16))
  (ATSINSmove1_void (ats2scmpre_ref_set_elt tmp13 tmp15))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_qlistref_dequeue_opt arg0)
(let(
;;knd = 0
  (tmpret17 #f)
  (tmp18 #f)
  (tmp19 #f)
  (tmp20 #f)
  (tmp21 #f)
  (tmp22 #f)
  (tmp23 #f)
  (tmp25 #f)
  (tmp26 #f)
  (tmp27 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_qlistref_dequeue_opt
  (ATSINStmpset tmp18 (ATSSELcon arg0 0))
  (ATSINStmpset tmp19 (ATSSELcon arg0 1))
  (ATSINStmpset tmp20 (ats2scmpre_ref_get_elt tmp19))
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons tmp20)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       (ATSINStmpset tmp23 (ats2scmpre_ref_get_elt tmp18))
       (ATSINStmpset tmp25 atscc2scm_null)
       (ATSINSmove1_void (ats2scmpre_ref_set_elt tmp18 tmp25))
       (letrec(
         (casefnx
          (lambda(tmplab)(case tmplab
           ;; ATSbranchseq_beg
           ((1)
            (if (ATSCKptriscons tmp23)
              (casefnx 4)
              (begin
               (casefnx 2)
              )
            )
           ) ;; end-of-branch
           ((2)
            atscc2scm_null
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; ATSbranchseq_beg
           ((3)
            (casefnx 4)
           ) ;; end-of-branch
           ((4)
            (ATSINStmpset tmp26 (ATSSELcon tmp23 0))
            (ATSINStmpset tmp27 (ATSSELcon tmp23 1))
            (ATSINSmove1_void (ats2scmpre_ref_set_elt tmp19 tmp27))
            (ATSPMVtysum tmp26)
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
           ) ;; end-of-case
          ) ;; end-of-lambda
         ) ;; end-of-casefnx
        ) (casefnx 1)
       ) ;; end-of-letrec
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp21 (ATSSELcon tmp20 0))
       (ATSINStmpset tmp22 (ATSSELcon tmp20 1))
       (ATSINSmove1_void (ats2scmpre_ref_set_elt tmp19 tmp22))
       (ATSPMVtysum tmp21)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_qlistref_foldleft arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret30 #f)
  (tmp31 #f)
  (tmp32 #f)
  (tmp41 #f)
  (tmp42 #f)
  (tmp43 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_qlistref_foldleft
  (ATSINStmpset tmp31 (ATSSELcon arg0 0))
  (ATSINStmpset tmp32 (ATSSELcon arg0 1))
  (ATSINStmpset tmp41 (ats2scmpre_ref_get_elt tmp31))
  (ATSINStmpset tmp43 (ats2scmpre_ref_get_elt tmp32))
  (ATSINStmpset tmp42 (_ats2scmpre_qlistref_auxl_5 arg2 arg1 tmp43))
  (_ats2scmpre_qlistref_auxr_6 arg2 tmp41 tmp42)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_qlistref_auxl_5 env0 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret33 #f)
  (tmp34 #f)
  (tmp35 #f)
  (tmp36 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_qlistref_auxl_5
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         arg0
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp34 (ATSSELcon arg1 0))
         (ATSINStmpset tmp35 (ATSSELcon arg1 1))
         (ATSINStmpset tmp36 ((ATSfunclo_fclo env0) env0 arg0 tmp34))
         ;; apy0 = tmp36
         ;; apy1 = tmp35
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_qlistref_auxl_5
         (_ats2scmpre_qlistref_auxl_5 env0 tmp36 tmp35)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret33;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_qlistref_auxr_6 env0 arg0 arg1)
(let(
;;knd = 0
  (tmpret37 #f)
  (tmp38 #f)
  (tmp39 #f)
  (tmp40 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_qlistref_auxr_6
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       arg1
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp38 (ATSSELcon arg0 0))
       (ATSINStmpset tmp39 (ATSSELcon arg0 1))
       (ATSINStmpset tmp40 (_ats2scmpre_qlistref_auxr_6 env0 tmp39 arg1))
       ((ATSfunclo_fclo env0) env0 tmp40 tmp38)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_qlistref_foldright arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret44 #f)
  (tmp45 #f)
  (tmp46 #f)
  (tmp55 #f)
  (tmp56 #f)
  (tmp57 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_qlistref_foldright
  (ATSINStmpset tmp45 (ATSSELcon arg0 0))
  (ATSINStmpset tmp46 (ATSSELcon arg0 1))
  (ATSINStmpset tmp55 (ats2scmpre_ref_get_elt tmp46))
  (ATSINStmpset tmp57 (ats2scmpre_ref_get_elt tmp45))
  (ATSINStmpset tmp56 (_ats2scmpre_qlistref_auxl_8 arg1 arg2 tmp57))
  (_ats2scmpre_qlistref_auxr_9 arg1 tmp55 tmp56)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_qlistref_auxl_8 env0 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret47 #f)
  (tmp48 #f)
  (tmp49 #f)
  (tmp50 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_qlistref_auxl_8
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         arg0
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp48 (ATSSELcon arg1 0))
         (ATSINStmpset tmp49 (ATSSELcon arg1 1))
         (ATSINStmpset tmp50 ((ATSfunclo_fclo env0) env0 tmp48 arg0))
         ;; apy0 = tmp50
         ;; apy1 = tmp49
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_qlistref_auxl_8
         (_ats2scmpre_qlistref_auxl_8 env0 tmp50 tmp49)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret47;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_qlistref_auxr_9 env0 arg0 arg1)
(let(
;;knd = 0
  (tmpret51 #f)
  (tmp52 #f)
  (tmp53 #f)
  (tmp54 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_qlistref_auxr_9
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       arg1
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp52 (ATSSELcon arg0 0))
       (ATSINStmpset tmp53 (ATSSELcon arg0 1))
       (ATSINStmpset tmp54 (_ats2scmpre_qlistref_auxr_9 env0 tmp53 arg1))
       ((ATSfunclo_fclo env0) env0 tmp52 tmp54)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Scheme code is generated by atscc2scm
;; The starting compilation time is: 2018-6-23:  7h:50m
;;
;;;;;;

(define
(_ats2scmpre_ML_list0_patsfun_29__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_list0_patsfun_29 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_ML_list0_patsfun_32__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_list0_patsfun_32 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_ML_list0_patsfun_35__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_list0_patsfun_35 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_ML_list0_patsfun_38__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_list0_patsfun_38 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_ML_list0_patsfun_42__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_list0_patsfun_42 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_ML_list0_patsfun_45__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_list0_patsfun_45 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_ML_list0_patsfun_48__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_list0_patsfun_48 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_ML_list0_patsfun_51__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_list0_patsfun_51 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_ML_list0_patsfun_55__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_list0_patsfun_55 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_ML_list0_patsfun_58__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_list0_patsfun_58 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_ML_list0_patsfun_65__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_list0_patsfun_65 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_ML_list0_patsfun_68__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_list0_patsfun_68 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_ML_list0_patsfun_74__closurerize xenv0 xenv1)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_list0_patsfun_74 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; define


;;fun
(define
(ats2scmpre_ML_list0_head_opt arg0)
(let(
;;knd = 0
  (tmpret7 #f)
  (tmp8 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_head_opt
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp8 (ATSSELcon arg0 0))
       (ATSPMVtysum tmp8)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_tail_opt arg0)
(let(
;;knd = 0
  (tmpret10 #f)
  (tmp12 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_tail_opt
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp12 (ATSSELcon arg0 1))
       (ATSPMVtysum tmp12)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_length arg0)
(let(
;;knd = 0
  (tmpret13 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_length
  (ats2scmpre_list_length arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_last_opt arg0)
(let(
;;knd = 0
  (tmpret14 #f)
  (tmp18 #f)
  (tmp19 #f)
  (tmp20 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_last_opt
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp18 (ATSSELcon arg0 0))
       (ATSINStmpset tmp19 (ATSSELcon arg0 1))
       (ATSINStmpset tmp20 (_ats2scmpre_ML_list0_loop_8 tmp18 tmp19))
       (ATSPMVtysum tmp20)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_loop_8 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret15 #f)
  (tmp16 #f)
  (tmp17 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_ML_list0_loop_8
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         arg0
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp16 (ATSSELcon arg1 0))
         (ATSINStmpset tmp17 (ATSSELcon arg1 1))
         ;; apy0 = tmp16
         ;; apy1 = tmp17
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_ML_list0_loop_8
         (_ats2scmpre_ML_list0_loop_8 tmp16 tmp17)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret15;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_get_at_opt arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret21 #f)
  (tmp22 #f)
  (tmp23 #f)
  (tmp24 #f)
  (tmp25 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab_list0_get_at_opt
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         atscc2scm_null
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp22 (ATSSELcon arg0 0))
         (ATSINStmpset tmp23 (ATSSELcon arg0 1))
         (ATSINStmpset tmp24 (ats2scmpre_gt_int1_int1 arg1 0))
         (if tmp24
           (begin
            (ATSINStmpset tmp25 (ats2scmpre_sub_int1_int1 arg1 1))
            ;; apy0 = tmp23
            ;; apy1 = tmp25
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_scm = 1; // __patsflab_list0_get_at_opt
            (ats2scmpre_ML_list0_get_at_opt tmp23 tmp25)
           ) ;; if-then
           (begin
            (ATSPMVtysum tmp22)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret21;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_make_elt arg0 arg1)
(let(
;;knd = 0
  (tmpret26 #f)
  (tmp27 #f)
  (tmp28 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_make_elt
  (ATSINStmpset tmp27 (ats2scmpre_gte_int1_int1 arg0 0))
  (if tmp27
    (begin
     (ATSINStmpset tmp28 (ats2scmpre_list_make_elt arg0 arg1))
     tmp28
    ) ;; if-then
    (begin
     atscc2scm_null
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_make_intrange_2 arg0 arg1)
(let(
;;knd = 0
  (tmpret29 #f)
  (tmp30 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_make_intrange_2
  (ATSINStmpset tmp30 (ats2scmpre_list_make_intrange_2 arg0 arg1))
  tmp30
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_make_intrange_3 arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret31 #f)
  (tmp32 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_make_intrange_3
  (ATSINStmpset tmp32 (ats2scmpre_list_make_intrange_3 arg0 arg1 arg2))
  tmp32
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_snoc arg0 arg1)
(let(
;;knd = 0
  (tmpret44 #f)
  (tmp45 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_snoc
  (ATSINStmpset tmp45 (ats2scmpre_list_snoc arg0 arg1))
  tmp45
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_extend arg0 arg1)
(let(
;;knd = 0
  (tmpret46 #f)
  (tmp47 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_extend
  (ATSINStmpset tmp47 (ats2scmpre_list_extend arg0 arg1))
  tmp47
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_append arg0 arg1)
(let(
;;knd = 0
  (tmpret48 #f)
  (tmp49 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_append
  (ATSINStmpset tmp49 (ats2scmpre_list_append arg0 arg1))
  tmp49
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_mul_int_list0 arg0 arg1)
(let(
;;knd = 0
  (tmpret50 #f)
  (tmp51 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_mul_int_list0
  (ATSINStmpset tmp51 (ats2scmpre_mul_int_list arg0 arg1))
  tmp51
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_reverse arg0)
(let(
;;knd = 0
  (tmpret52 #f)
  (tmp53 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_reverse
  (ATSINStmpset tmp53 (ats2scmpre_list_reverse arg0))
  tmp53
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_reverse_append arg0 arg1)
(let(
;;knd = 0
  (tmpret54 #f)
  (tmp55 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_reverse_append
  (ATSINStmpset tmp55 (ats2scmpre_list_reverse_append arg0 arg1))
  tmp55
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_concat arg0)
(let(
;;knd = 0
  (tmpret56 #f)
  (tmp57 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_concat
  (ATSINStmpset tmp57 (ats2scmpre_list_concat arg0))
  tmp57
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_remove_at_opt arg0 arg1)
(let(
;;knd = 0
  (tmpret58 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_remove_at_opt
  (_ats2scmpre_ML_list0_aux_26 arg0 0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_aux_26 arg0 arg1)
(let(
;;knd = 0
  (tmpret59 #f)
  (tmp60 #f)
  (tmp61 #f)
  (tmp62 #f)
  (tmp63 #f)
  (tmp64 #f)
  (tmp65 #f)
  (tmp66 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_aux_26
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp60 (ATSSELcon arg0 0))
       (ATSINStmpset tmp61 (ATSSELcon arg0 1))
       (ATSINStmpset tmp62 (ats2scmpre_gt_int1_int1 arg1 0))
       (if tmp62
         (begin
          (ATSINStmpset tmp64 (ats2scmpre_sub_int1_int1 arg1 1))
          (ATSINStmpset tmp63 (_ats2scmpre_ML_list0_aux_26 tmp61 tmp64))
          (letrec(
            (casefnx
             (lambda(tmplab)(case tmplab
              ;; ATSbranchseq_beg
              ((1)
               (if (ATSCKptriscons tmp63)
                 (casefnx 4)
                 (begin
                  (casefnx 2)
                 )
               )
              ) ;; end-of-branch
              ((2)
               atscc2scm_null
              ) ;; end-of-branch
              ;; ATSbranchseq_end
              ;; ATSbranchseq_beg
              ((3)
               (casefnx 4)
              ) ;; end-of-branch
              ((4)
               (ATSINStmpset tmp65 (ATSSELcon tmp63 0))
               ;; ATSINSfreecon(tmp63);
               (ATSINStmpset tmp66 (ATSPMVtysum tmp60 tmp65))
               (ATSPMVtysum tmp66)
              ) ;; end-of-branch
              ;; ATSbranchseq_end
              ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
              ) ;; end-of-case
             ) ;; end-of-lambda
            ) ;; end-of-casefnx
           ) (casefnx 1)
          ) ;; end-of-letrec
         ) ;; if-then
         (begin
          (ATSPMVtysum tmp61)
         ) ;; if-else
       )
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_exists arg0 arg1)
(let(
;;knd = 0
  (tmpret67 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_exists
  (ats2scmpre_list_exists arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_exists_method arg0)
(let(
;;knd = 0
  (tmpret68 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_exists_method
  (_ats2scmpre_ML_list0_patsfun_29__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_patsfun_29 env0 arg0)
(let(
;;knd = 0
  (tmpret69 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_patsfun_29
  (ats2scmpre_ML_list0_exists env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_iexists arg0 arg1)
(let(
;;knd = 0
  (tmpret70 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_iexists
  (ats2scmpre_list_iexists arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_iexists_method arg0)
(let(
;;knd = 0
  (tmpret71 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_iexists_method
  (_ats2scmpre_ML_list0_patsfun_32__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_patsfun_32 env0 arg0)
(let(
;;knd = 0
  (tmpret72 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_patsfun_32
  (ats2scmpre_ML_list0_iexists env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_forall arg0 arg1)
(let(
;;knd = 0
  (tmpret73 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_forall
  (ats2scmpre_list_forall arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_forall_method arg0)
(let(
;;knd = 0
  (tmpret74 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_forall_method
  (_ats2scmpre_ML_list0_patsfun_35__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_patsfun_35 env0 arg0)
(let(
;;knd = 0
  (tmpret75 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_patsfun_35
  (ats2scmpre_ML_list0_forall env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_iforall arg0 arg1)
(let(
;;knd = 0
  (tmpret76 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_iforall
  (ats2scmpre_list_iforall arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_iforall_method arg0)
(let(
;;knd = 0
  (tmpret77 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_iforall_method
  (_ats2scmpre_ML_list0_patsfun_38__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_patsfun_38 env0 arg0)
(let(
;;knd = 0
  (tmpret78 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_patsfun_38
  (ats2scmpre_ML_list0_iforall env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_app arg0 arg1)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_app
  (ATSINSmove1_void (ats2scmpre_ML_list0_foreach arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_foreach arg0 arg1)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_foreach
  (ATSINSmove1_void (ats2scmpre_list_foreach arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_foreach_method arg0)
(let(
;;knd = 0
  (tmpret81 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_foreach_method
  (_ats2scmpre_ML_list0_patsfun_42__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_patsfun_42 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_patsfun_42
  (ATSINSmove1_void (ats2scmpre_ML_list0_foreach env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_iforeach arg0 arg1)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_iforeach
  (ATSINSmove1_void (ats2scmpre_list_iforeach arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_iforeach_method arg0)
(let(
;;knd = 0
  (tmpret84 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_iforeach_method
  (_ats2scmpre_ML_list0_patsfun_45__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_patsfun_45 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_patsfun_45
  (ATSINSmove1_void (ats2scmpre_ML_list0_iforeach env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_rforeach arg0 arg1)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_rforeach
  (ATSINSmove1_void (ats2scmpre_list_rforeach arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_rforeach_method arg0)
(let(
;;knd = 0
  (tmpret87 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_rforeach_method
  (_ats2scmpre_ML_list0_patsfun_48__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_patsfun_48 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_patsfun_48
  (ATSINSmove1_void (ats2scmpre_ML_list0_rforeach env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_filter arg0 arg1)
(let(
;;knd = 0
  (tmpret89 #f)
  (tmp90 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_filter
  (ATSINStmpset tmp90 (ats2scmpre_list_filter arg0 arg1))
  tmp90
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_filter_method arg0)
(let(
;;knd = 0
  (tmpret91 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_filter_method
  (_ats2scmpre_ML_list0_patsfun_51__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_patsfun_51 env0 arg0)
(let(
;;knd = 0
  (tmpret92 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_patsfun_51
  (ats2scmpre_ML_list0_filter env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_labelize arg0)
(let(
;;knd = 0
  (tmpret93 #f)
  (tmp94 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_labelize
  (ATSINStmpset tmp94 (ats2scmpre_list_labelize arg0))
  tmp94
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_map arg0 arg1)
(let(
;;knd = 0
  (tmpret95 #f)
  (tmp96 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_map
  (ATSINStmpset tmp96 (ats2scmpre_list_map arg0 arg1))
  tmp96
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_map_method arg0 arg1)
(let(
;;knd = 0
  (tmpret97 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_map_method
  (_ats2scmpre_ML_list0_patsfun_55__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_patsfun_55 env0 arg0)
(let(
;;knd = 0
  (tmpret98 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_patsfun_55
  (ats2scmpre_ML_list0_map env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_imap arg0 arg1)
(let(
;;knd = 0
  (tmpret99 #f)
  (tmp100 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_imap
  (ATSINStmpset tmp100 (ats2scmpre_list_imap arg0 arg1))
  tmp100
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_imap_method arg0 arg1)
(let(
;;knd = 0
  (tmpret101 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_imap_method
  (_ats2scmpre_ML_list0_patsfun_58__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_patsfun_58 env0 arg0)
(let(
;;knd = 0
  (tmpret102 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_patsfun_58
  (ats2scmpre_ML_list0_imap env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_map2 arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret103 #f)
  (tmp104 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_map2
  (ATSINStmpset tmp104 (ats2scmpre_list_map2 arg0 arg1 arg2))
  tmp104
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_mapcons arg0 arg1)
(let(
;;knd = 0
  (tmpret105 #f)
  (tmp106 #f)
  (tmp107 #f)
  (tmp108 #f)
  (tmp109 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_mapcons
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg1)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp106 (ATSSELcon arg1 0))
       (ATSINStmpset tmp107 (ATSSELcon arg1 1))
       (ATSINStmpset tmp108 (ATSPMVtysum arg0 tmp106))
       (ATSINStmpset tmp109 (ats2scmpre_ML_list0_mapcons arg0 tmp107))
       (ATSPMVtysum tmp108 tmp109)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_tabulate arg0 arg1)
(let(
;;knd = 0
  (tmpret110 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_tabulate
  (_ats2scmpre_ML_list0_auxmain_62 arg0 arg1 0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_auxmain_62 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret111 #f)
  (tmp112 #f)
  (tmp113 #f)
  (tmp114 #f)
  (tmp115 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_auxmain_62
  (ATSINStmpset tmp112 (ats2scmpre_lt_int0_int0 arg0 env0))
  (if tmp112
    (begin
     (ATSINStmpset tmp113 ((ATSfunclo_fclo env1) env1 arg0))
     (ATSINStmpset tmp115 (ats2scmpre_add_int0_int0 arg0 1))
     (ATSINStmpset tmp114 (_ats2scmpre_ML_list0_auxmain_62 env0 env1 tmp115))
     (ATSPMVtysum tmp113 tmp114)
    ) ;; if-then
    (begin
     atscc2scm_null
    ) ;; if-else
  )
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_find_opt arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret116 #f)
  (tmp117 #f)
  (tmp118 #f)
  (tmp119 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab_list0_find_opt
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         atscc2scm_null
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp117 (ATSSELcon arg0 0))
         (ATSINStmpset tmp118 (ATSSELcon arg0 1))
         (ATSINStmpset tmp119 ((ATSfunclo_fclo arg1) arg1 tmp117))
         (if tmp119
           (begin
            (ATSPMVtysum tmp117)
           ) ;; if-then
           (begin
            ;; apy0 = tmp118
            ;; apy1 = arg1
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_scm = 1; // __patsflab_list0_find_opt
            (ats2scmpre_ML_list0_find_opt tmp118 arg1)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret116;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_find_opt_method arg0)
(let(
;;knd = 0
  (tmpret120 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_find_opt_method
  (_ats2scmpre_ML_list0_patsfun_65__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_patsfun_65 env0 arg0)
(let(
;;knd = 0
  (tmpret121 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_patsfun_65
  (ats2scmpre_ML_list0_find_opt env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_find_suffix arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret122 #f)
  (tmp124 #f)
  (tmp125 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab_list0_find_suffix
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         atscc2scm_null
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp124 (ATSSELcon arg0 1))
         (ATSINStmpset tmp125 ((ATSfunclo_fclo arg1) arg1 arg0))
         (if tmp125
           (begin
            arg0
           ) ;; if-then
           (begin
            ;; apy0 = tmp124
            ;; apy1 = arg1
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_scm = 1; // __patsflab_list0_find_suffix
            (ats2scmpre_ML_list0_find_suffix tmp124 arg1)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret122;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_find_suffix_method arg0)
(let(
;;knd = 0
  (tmpret126 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_find_suffix_method
  (_ats2scmpre_ML_list0_patsfun_68__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_patsfun_68 env0 arg0)
(let(
;;knd = 0
  (tmpret127 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_patsfun_68
  (ats2scmpre_ML_list0_find_suffix env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_zip arg0 arg1)
(let(
;;knd = 0
  (tmpret128 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_zip
  (_ats2scmpre_ML_list0_aux_70 arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_aux_70 arg0 arg1)
(let(
;;knd = 0
  (tmpret129 #f)
  (tmp130 #f)
  (tmp131 #f)
  (tmp132 #f)
  (tmp133 #f)
  (tmp134 #f)
  (tmp135 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_aux_70
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp130 (ATSSELcon arg0 0))
       (ATSINStmpset tmp131 (ATSSELcon arg0 1))
       (letrec(
         (casefnx
          (lambda(tmplab)(case tmplab
           ;; ATSbranchseq_beg
           ((1)
            (if (ATSCKptriscons arg1)
              (casefnx 4)
              (begin
               (casefnx 2)
              )
            )
           ) ;; end-of-branch
           ((2)
            atscc2scm_null
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; ATSbranchseq_beg
           ((3)
            (casefnx 4)
           ) ;; end-of-branch
           ((4)
            (ATSINStmpset tmp132 (ATSSELcon arg1 0))
            (ATSINStmpset tmp133 (ATSSELcon arg1 1))
            (ATSINStmpset tmp134 (ATSPMVtyrec tmp130 tmp132))
            (ATSINStmpset tmp135 (_ats2scmpre_ML_list0_aux_70 tmp131 tmp133))
            (ATSPMVtysum tmp134 tmp135)
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
           ) ;; end-of-case
          ) ;; end-of-lambda
         ) ;; end-of-casefnx
        ) (casefnx 1)
       ) ;; end-of-letrec
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_zipwith arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret136 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_zipwith
  (_ats2scmpre_ML_list0_aux_72 arg0 arg1 arg2)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_aux_72 arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret137 #f)
  (tmp138 #f)
  (tmp139 #f)
  (tmp140 #f)
  (tmp141 #f)
  (tmp142 #f)
  (tmp143 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_aux_72
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       atscc2scm_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp138 (ATSSELcon arg0 0))
       (ATSINStmpset tmp139 (ATSSELcon arg0 1))
       (letrec(
         (casefnx
          (lambda(tmplab)(case tmplab
           ;; ATSbranchseq_beg
           ((1)
            (if (ATSCKptriscons arg1)
              (casefnx 4)
              (begin
               (casefnx 2)
              )
            )
           ) ;; end-of-branch
           ((2)
            atscc2scm_null
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; ATSbranchseq_beg
           ((3)
            (casefnx 4)
           ) ;; end-of-branch
           ((4)
            (ATSINStmpset tmp140 (ATSSELcon arg1 0))
            (ATSINStmpset tmp141 (ATSSELcon arg1 1))
            (ATSINStmpset tmp142 ((ATSfunclo_fclo arg2) arg2 tmp138 tmp140))
            (ATSINStmpset tmp143 (_ats2scmpre_ML_list0_aux_72 tmp139 tmp141 arg2))
            (ATSPMVtysum tmp142 tmp143)
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
           ) ;; end-of-case
          ) ;; end-of-lambda
         ) ;; end-of-casefnx
        ) (casefnx 1)
       ) ;; end-of-letrec
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_zipwith_method arg0 arg1)
(let(
;;knd = 0
  (tmpret144 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_zipwith_method
  (_ats2scmpre_ML_list0_patsfun_74__closurerize arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_patsfun_74 env0 env1 arg0)
(let(
;;knd = 0
  (tmpret145 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_patsfun_74
  (ats2scmpre_ML_list0_zipwith env0 env1 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_foldleft arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret146 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_foldleft
  (_ats2scmpre_ML_list0_aux_76 arg2 arg1 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_aux_76 env0 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret147 #f)
  (tmp148 #f)
  (tmp149 #f)
  (tmp150 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_ML_list0_aux_76
    (letrec(
      (casefnx
       (lambda(tmplab)(case tmplab
        ;; ATSbranchseq_beg
        ((1)
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (begin
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        ((2)
         arg0
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        ((3)
         (casefnx 4)
        ) ;; end-of-branch
        ((4)
         (ATSINStmpset tmp148 (ATSSELcon arg1 0))
         (ATSINStmpset tmp149 (ATSSELcon arg1 1))
         (ATSINStmpset tmp150 ((ATSfunclo_fclo env0) env0 arg0 tmp148))
         ;; apy0 = tmp150
         ;; apy1 = tmp149
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_scm = 1; // __patsflab__ats2scmpre_ML_list0_aux_76
         (_ats2scmpre_ML_list0_aux_76 env0 tmp150 tmp149)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-lambda
      ) ;; end-of-casefnx
     ) (casefnx 1)
    ) ;; end-of-letrec
    ;; if (funlab_scm > 0) continue; else ;; return tmpret147;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_foldright arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret151 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_foldright
  (_ats2scmpre_ML_list0_aux_78 arg1 arg2 arg0 arg2)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_list0_aux_78 env0 env1 arg0 arg1)
(let(
;;knd = 0
  (tmpret152 #f)
  (tmp153 #f)
  (tmp154 #f)
  (tmp155 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_list0_aux_78
  (letrec(
    (casefnx
     (lambda(tmplab)(case tmplab
      ;; ATSbranchseq_beg
      ((1)
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (begin
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      ((2)
       arg1
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      ((3)
       (casefnx 4)
      ) ;; end-of-branch
      ((4)
       (ATSINStmpset tmp153 (ATSSELcon arg0 0))
       (ATSINStmpset tmp154 (ATSSELcon arg0 1))
       (ATSINStmpset tmp155 (_ats2scmpre_ML_list0_aux_78 env0 env1 tmp154 env1))
       ((ATSfunclo_fclo env0) env0 tmp153 tmp155)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2scm_caseof_deadcode _FILE_ _LINE_))
      ) ;; end-of-case
     ) ;; end-of-lambda
    ) ;; end-of-casefnx
   ) (casefnx 1)
  ) ;; end-of-letrec
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_sort_2 arg0 arg1)
(let(
;;knd = 0
  (tmpret158 #f)
  (tmp159 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_sort_2
  (ATSINStmpset tmp159 (ats2scmpre_list_sort_2 arg0 arg1))
  tmp159
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_list0_mergesort arg0 arg1)
(let(
;;knd = 0
  (tmpret160 #f)
  (tmp161 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_list0_mergesort
  (ATSINStmpset tmp161 (ats2scmpre_list_mergesort arg0 arg1))
  tmp161
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_streamize_list0_zip arg0 arg1)
(let(
;;knd = 0
  (tmpret162 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_streamize_list0_zip
  (ats2scmpre_streamize_list_zip arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_streamize_list0_cross arg0 arg1)
(let(
;;knd = 0
  (tmpret163 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_streamize_list0_cross
  (ats2scmpre_streamize_list_cross arg0 arg1)
) ;; end-of-let
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Scheme code is generated by atscc2scm
;; The starting compilation time is: 2018-6-23:  7h:50m
;;
;;;;;;

(define
(_ats2scmpre_ML_array0_patsfun_8__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_array0_patsfun_8 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_ML_array0_patsfun_11__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_array0_patsfun_11 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


(define
(_ats2scmpre_ML_array0_patsfun_17__closurerize xenv0)
;;%{
  (list (lambda(_fcenvs_ xarg0)(_ats2scmpre_ML_array0_patsfun_17 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; define


;;fun
(define
(ats2scmpre_ML_array0_make_elt arg0 arg1)
(let(
;;knd = 0
  (tmpret0 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_array0_make_elt
  (ats2scmpre_arrszref_make_elt arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_array0_size arg0)
(let(
;;knd = 0
  (tmpret1 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_array0_size
  (ats2scmpre_arrszref_size arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_array0_length arg0)
(let(
;;knd = 0
  (tmpret2 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_array0_length
  (ats2scmpre_arrszref_size arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_array0_get_at arg0 arg1)
(let(
;;knd = 0
  (tmpret3 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_array0_get_at
  (ats2scmpre_arrszref_get_at arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_array0_set_at arg0 arg1 arg2)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_array0_set_at
  (ATSINSmove1_void (ats2scmpre_arrszref_set_at arg0 arg1 arg2))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_array0_exch_at arg0 arg1 arg2)
(let(
;;knd = 0
  (tmpret5 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_array0_exch_at
  (ats2scmpre_arrszref_exch_at arg0 arg1 arg2)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_array0_exists arg0 arg1)
(let(
;;knd = 0
  (tmpret6 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_array0_exists
  (ats2scmpre_arrszref_exists_cloref arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_array0_exists_method arg0)
(let(
;;knd = 0
  (tmpret7 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_array0_exists_method
  (_ats2scmpre_ML_array0_patsfun_8__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_array0_patsfun_8 env0 arg0)
(let(
;;knd = 0
  (tmpret8 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_array0_patsfun_8
  (ats2scmpre_ML_array0_exists env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_array0_forall arg0 arg1)
(let(
;;knd = 0
  (tmpret9 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_array0_forall
  (ats2scmpre_arrszref_forall_cloref arg0 arg1)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_array0_forall_method arg0)
(let(
;;knd = 0
  (tmpret10 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_array0_forall_method
  (_ats2scmpre_ML_array0_patsfun_11__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_array0_patsfun_11 env0 arg0)
(let(
;;knd = 0
  (tmpret11 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_array0_patsfun_11
  (ats2scmpre_ML_array0_forall env0 arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(array0_find_index arg0 arg1)
(let(
;;knd = 0
  (tmpret12 #f)
  (tmp17 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_array0_find_index
  (ATSINStmpset tmp17 (ats2scmpre_ML_array0_size arg0))
  (_ats2scmpre_ML_array0_loop_13 arg1 0 tmp17)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_array0_loop_13 env0 arg0 arg1)
(let(
;;knd = 1
;;(apy0 #f)
;;(apy1 #f)
  (tmpret13 #f)
  (tmp14 #f)
  (tmp15 #f)
  (tmp16 #f)
;;var funlab_scm
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;while(true) {
    ;; funlab_scm = 0;
    ;; __patsflab__ats2scmpre_ML_array0_loop_13
    (ATSINStmpset tmp14 (ats2scmpre_lt_int0_int0 arg0 arg1))
    (if tmp14
      (begin
       (ATSINStmpset tmp15 ((ATSfunclo_fclo env0) env0 arg0))
       (if tmp15
         (begin
          arg0
         ) ;; if-then
         (begin
          (ATSINStmpset tmp16 (ats2scmpre_add_int1_int1 arg0 1))
          ;; apy0 = tmp16
          ;; apy1 = arg1
          ;; arg0 = apy0
          ;; arg1 = apy1
          ;; funlab_scm = 1; // __patsflab__ats2scmpre_ML_array0_loop_13
          (_ats2scmpre_ML_array0_loop_13 env0 tmp16 arg1)
         ) ;; if-else
       )
      ) ;; if-then
      (begin
       (ats2scmpre_neg_int1 1)
      ) ;; if-else
    )
    ;; if (funlab_scm > 0) continue; else ;; return tmpret13;
  ;} // endwhile-fun
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_array0_app arg0 arg1)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_array0_app
  (ATSINSmove1_void (ats2scmpre_ML_array0_foreach arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_array0_foreach arg0 arg1)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_array0_foreach
  (ATSINSmove1_void (ats2scmpre_arrszref_foreach_cloref arg0 arg1))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_array0_foreach_method arg0)
(let(
;;knd = 0
  (tmpret20 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_array0_foreach_method
  (_ats2scmpre_ML_array0_patsfun_17__closurerize arg0)
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(_ats2scmpre_ML_array0_patsfun_17 env0 arg0)
(let(
;;knd = 0
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab__ats2scmpre_ML_array0_patsfun_17
  (ATSINSmove1_void (ats2scmpre_ML_array0_foreach env0 arg0))
) ;; end-of-let
) ;; end-of-fun


;;fun
(define
(ats2scmpre_ML_array0_tabulate arg0 arg1)
(let(
;;knd = 0
  (tmpret22 #f)
  (tmp23 #f)
  (tmp24 #f)
;;var tmplab,tmplab_scm
) ;; in-of-let
  ;; __patsflab_array0_tabulate
  (ATSINStmpset tmp24 (ats2scmpre_gte_int1_int1 arg0 0))
  (if tmp24
    (begin
     (ATSINStmpset tmp23 arg0)
    ) ;; if-then
    (begin
     (ATSINStmpset tmp23 0)
    ) ;; if-else
  )
  (ats2scmpre_arrszref_tabulate_cloref tmp23 arg1)
) ;; end-of-let
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Scheme code is generated by atscc2scm
;; The starting compilation time is: 2018-6-23:  7h:50m
;;
;;;;;;
;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;

;; ****** ****** ;;

;; end of [libatscc2scm_all.scm] ;;

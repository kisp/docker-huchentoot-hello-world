

(ql:quickload "hunchentoot")


(defpackage :hello-world
  (:use :cl :tbnl))


(in-package :hello-world)

(define-easy-handler (hello-world :uri "/") ()
  "<h1>hello world!</h1>")

(defun main ()
  (start (make-instance 'easy-acceptor :port 8080))
  (sb-thread:join-thread
   (find-if
    (lambda (th)
      (search "hunchentoot-listener" (sb-thread:thread-name th)))
    (sb-thread:list-all-threads))))

(sb-ext:save-lisp-and-die "hello-world" :executable t :toplevel 'main)

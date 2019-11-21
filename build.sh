#!/bin/sh -e

sbcl --quit --noinform <<EOF
(ql:quickload :cl-repl)
(save-lisp-and-die "cl-repl"
  :executable t
  :toplevel #'(lambda ()
    (cffi:load-foreign-library 'cl-readline:readline)
    (cl-repl:main)))
EOF


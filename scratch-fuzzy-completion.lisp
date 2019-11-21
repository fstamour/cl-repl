
(in-package :cl-repl)

(list-external-symbols :cl-user)


(package-name :cl-user) ; => "common-lisp-user"
(package-nicknames :cl-user) ; => cl-user


;; cl:w-o-t-s


(require 'split-sequence)

(split-sequence:split-sequence #\- "w-o-t-s--" :remove-empty-subseqs t )
;; => ("w" "o" "t" "s")


(declaim (optimize (debug 3) (safety 3) (speed 0)))

(defun in-order-matching-score (input string)
  "Returns a score of how much the input match the string"
  (let ((length (length string)))
    (loop :for part :across input
          :for last = (position part
                                string
                                :start (min
                                        length
                                        (if last
                                            (1+ last)
                                            0)))
          :while last
          :sum (- length last))))

#|
(in-order-matching-score
 "w-o-t-s"
 "with-output-to-string")
;; => 86

(in-order-matching-score
 "zw-o-t-s"
 "with-output-to-string")
;; => 0

(in-order-matching-score
 "w-o-zt-s"
 "with-output-to-string")
;; => 64
|#

(ql:quickload 'cl-heap)

;; Trying out the binary-heap
(let ((heap
        (make-instance 'cl-heap:binary-heap :key #'car)))
  (cl-heap:add-all-to-heap heap '((1 . #\b) (3 . #\c) (2 . #\a)))
  (values (cl-heap:heap-size heap)
          (loop :until (cl-heap:is-empty-heap-p heap)
                :collect (cl-heap:pop-heap heap))))

;; Pick the N best score
(time
 (let ((pkg-name :cl)
       (input (string-downcase "w-o-t-s"))
       (min-heap (make-instance 'cl-heap:binary-heap :key #'car))
       (n 3))
   (loop :for sym :being :the :external-symbols :of (find-package pkg-name)
         :for string = (string-downcase (symbol-name sym))
         :for score = (in-order-matching-score input string)
         :maximizing score :into max-score
         :do
            (when (>= score max-score)
              (when (>= (cl-heap:heap-size min-heap) n)
                (cl-heap:pop-heap min-heap))
              (cl-heap:add-to-heap min-heap (cons score string))))
   (loop :until (cl-heap:is-empty-heap-p min-heap)
         :collect (cl-heap:pop-heap min-heap))))


(defun complete-system (text)
  (select-completions))

(mapcar #'ql-dist:name
 (ql:system-list))


(apropos-list "install" :ql)

;; Install a system without loading it
(ql-dist:install
 (first
  (ql:system-apropos-list "libssh2")))

;; Use asdf to find the system and get the description
(asdf:system-description
 (asdf:find-system "libssh2"))

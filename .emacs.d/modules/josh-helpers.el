;;; package -- Summary
;; Helper functions and macros for the other modules

;;; Commentary:

;;; Code:
(defmacro with-library (symbol &rest body)
  "https://www.emacswiki.org/emacs/LoadingLispFiles"
  `(condition-case nil
       (progn
         (require ',symbol) ,@body)

     (error (message (format "I guess we don't have %s available." ',symbol)) nil)
     ))
(put 'with-library 'lisp-indent-function 1)


(provide 'josh-helpers)
;;; josh-helpers.el ends here

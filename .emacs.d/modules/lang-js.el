;;; package -- Summary
;; js customizations
;;; Commentary:
;;; Code:
(require 'js2-mode)
(require 'xref-js2)
(require 'js2-refactor)
;; set it up on all js files
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; turn off jshint, we use eslint
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))
;; indent 2 spaces
(setq js2-basic-offset 2)
;; jump around js function definitions
(add-hook 'js2-mode-hook
          (lambda () (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
;; Add in refactor mode
(add-hook 'js2-mode-hook #'js2-refactor-mode)
;; Set up eslint in flycheck
(flycheck-add-mode 'javascript-eslint 'web-mode)
;; Let eslint handle style things please!
(setq js2-missing-semi-one-line-override t)
(setq js2-strict-missing-semi-warning nil)
(setq js2-strict-trailing-comma-warning nil)

(provide 'lang-js)
;;; lang-js.el ends here

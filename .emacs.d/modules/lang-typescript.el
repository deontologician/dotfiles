;;; package -- Summary
;; config for typescript
;;; Commentary:
;;; Code:

(require 'typescript-mode)
(require 'tide)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (company-mode +1))
;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(setq typescript-indent-level 2)
(add-hook 'typescript-mode-hook #'setup-tide-mode)


(provide 'lang-typescript)
;;; lang-typescript.el ends here

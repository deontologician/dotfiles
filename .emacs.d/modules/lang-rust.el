;;; package -- Summary
;; Rust customizations
;;; Commentary:
;;; Code:

(require 'rust-mode)
(require 'flycheck-rust)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
; racer is installed in ~/scripts, source is in ~/build
;; Unfortunately this is pretty fragile and needs updating every time there's a new rust out
(setq racer-rust-src-path machine-rust-source-directory) ;; defined in machine-specific.el
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
;; will also require company mode
(add-hook 'racer-mode-hook #'company-mode)
(setq company-tooltip-align-annotations t)

(provide 'lang-rust)
;;; lang-rust.el ends here

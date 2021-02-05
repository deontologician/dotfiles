;;; Setup package archives
(setq package-archives '(
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade.ferrier.me.uk/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
;;; Load paths
;; My customizations
(add-to-list 'load-path "~/.emacs.d/modules")
;; Color theme
;; Typescript IDE (can be removed once 2.0 branch is on melpa)
(add-to-list 'load-path "~/.emacs.d/tide")
(require 'machine-specific)
(require 'josh-helpers)
(require 'josh-theme)
(require 'josh-project)
(require 'josh-behavior)
(require 'lang-js)
(require 'lang-typescript)
(require 'lang-python)
(require 'lang-web)
(require 'lang-rust)
(require 'lang-haskell)
(require 'lang-idris)
(require 'lang-purescript)
(require 'josh-keyboard-maps)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit idris-mode flycheck rust-mode zoom-frm nginx-mode lua-mode yaml-mode xterm-color  workgroups2 unicode-fonts toml-mode shackle purescript-modee markdown-mode  json-mode hungry-delete haskell-mode git-gutter-fringe gist frame-cmds  fish-mode elpy elm-mode counsel ace-window ace-jump-buffer))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

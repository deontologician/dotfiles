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
(add-to-list 'load-path "~/.emacs.d/themes/doom-theme")
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
(require 'josh-keyboard-maps)

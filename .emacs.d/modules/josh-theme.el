;;; package -- Summary

;;; Commentary:

;;; Code:

;; Appearance/ aesthetic changes to emacs

;; main color theme
(require 'doom-theme)
(load-theme 'doom-one t) ; based on Atom dark

;;; Built in customizations
;; No scrollbar
(scroll-bar-mode -1)
;; No menu bar
(menu-bar-mode -1)
;; No toolbar
(tool-bar-mode -1)
;; No startup message
(setq inhibit-startup-message t)

;; Highlight lines
(global-hl-line-mode 1)
;; To customize the highlight color
(set-face-background 'hl-line "#171717")

;; Highlights matching braces/parens/brackets
(show-paren-mode t)
;; Scroll a line at a time
(setq scroll-step 1)
;; Set mouse color so it can be seen over black!
(set-mouse-color "dark orange")
;; Transparency for frames
(set-frame-parameter (selected-frame) 'alpha '(96 . 93))
(add-to-list 'default-frame-alist '(alpha . (96 . 93)))
;;; Modeline stuff
;; Show column number
(column-number-mode t)
;; Show the battery percent
(display-battery-mode)
(setq-default frame-title-format (list "%65b %f"))
(setq-default icon-title-format (list "%b"))
;; highlight parens
(setq show-paren-delay 0
      show-paren-style 'parenthesis)


;; Allow working with unicode fonts
(require 'unicode-fonts)
(unicode-fonts-setup)
(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

;; machine-font-size defined in machine-specific.el
(set-default-font (concat "Fira Mono-" (number-to-string machine-font-size)))

;; Git gutter mode, show git changes in the fringe
(require 'git-gutter-fringe)
(global-git-gutter-mode t)

(provide 'josh-theme)
;;; josh-theme.el ends here

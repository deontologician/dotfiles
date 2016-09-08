;;; Setup package archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade.ferrier.me.uk/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ;("elpy" . "https://jorgenschaefer.github.io/packages/")
))
(package-initialize)

(setenv "PATH" (concat (getenv "PATH") ":~/.cabal/bin"))
(setq exec-path (append exec-path '("~/.cabal/bin")))

;;; Styling (set this first so colors dont flicker while loading)

;; Color theme
(add-to-list 'load-path "~/.emacs.d/themes/doom-theme")
(require 'doom-theme)
(load-theme 'doom-one t)

;; Transparency (not too much)
(set-frame-parameter (selected-frame) 'alpha '(96 . 50))
(add-to-list 'default-frame-alist '(alpha . (96 . 50)))

;;; Emacs built in options

;; Visual stuff
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)

;;; Show stuff in title bar
(setq-default frame-title-format (list "%65b %f"))
(setq-default icon-title-format (list "%b"))

;; Show the battery percent
(display-battery-mode)

;; Highlights matching braces/parens/brackets
(show-paren-mode t)

;; Show column number
(column-number-mode t)

;; Allows typing inside a selection to delete the selection
(delete-selection-mode 1)

;; Scroll a line at a time
(setq scroll-step 1)

;; Set mouse color so it can be seen over black!
(set-mouse-color "dark orange")

;; Set focus follows mouse
(setq mouse-autoselect-window t)

;; Set mouse avoidance, to prevent obscuring the cursor
(mouse-avoidance-mode 'jump)

;; Only use bash with tramp
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
(eval-after-load 'tramp '(setenv "LANG" "C"))



;;; Project management options

;; saves place in the file when re-opening it
(require 'saveplace)
(setq-default save-place t)

;; workgroups for restoring buffer groups
(require 'workgroups2)
(workgroups mode 1)

;;; SVG mode line
(add-to-list 'load-path "~/.emacs.d/plugins")

;;; Erc desktop notifications
;(add-to-list 'erc-modules 'notifications)
;(erc-notify-mode)

;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)


;;; Multiple cursors mode
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)

;;; Highlight lines
(global-hl-line-mode 1)

;;; Recent file mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; To customize the highlight color
(set-face-background 'hl-line "#171717")

;; Enable narrowing to region
(put 'narrow-to-region 'disabled nil)

;; Enable ace-jump mode
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;;; Ace-window mode
;; Remap the awful other window behavior
(define-key global-map (kbd "C-x o") 'ace-window)
;; Set keys to home row, vs. numbers
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; You can select the key you prefer to
(global-set-key (kbd "C-'") 'avy-goto-char)

;;; Change scratch buffer to org-mode
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message "\
# This buffer is for notes you don't want to save. You can use
# org-mode markup (and all Org's goodness) to organise the notes.
# If you want to create a file, visit that file with C-x C-f,
# then enter the text in that file's own buffer.
")

;; set default font
;;(set-default-font "Inconsolata-dz")
;;(add-to-list 'default-frame-alist '(font .  "Inconsolata-g-9"))
;; Don't uncomment this line, it causes emacs --daemon to fail
;;(set-face-attribute 'default t :font "Inconsolata-dz-9")

;;; Do line by line scrolling
(setq scroll-step 1)

;;;use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;;; highlight parens
(setq show-paren-delay 0
      show-paren-style 'parenthesis)

;;;use easy window navigation keys
(windmove-default-keybindings 'meta)

;; Git gutter mode
(require 'git-gutter-fringe)
(global-git-gutter-mode t)
;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
                                   ;
;;; swiper stuff
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

;;; Magit
(setq magit-completing-read-function 'ivy-completing-read)

;;;  Avy mode
(global-set-key (kbd "C-x g") 'avy-goto-line)

;;

;; cleanup whitespace on save
(add-hook 'before-save-hook 'whitespace-cleanup)

;;; KEY BINDINGS
;; General purpose completion (from buffers)
(global-set-key (kbd "M-/") 'hippie-expand)
;; binds linum mode to C-x l
(global-set-key "\C-xl" (quote linum-mode))
;; binds goto line to C-x g
;;(global-set-key "\C-xg" (quote goto-line))


;;;; CUSTOMIZED BEHAVIOR ;;;;

;; Save all tempfiles in $TMPDIR/emacs$UID/
(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
      emacs-tmp-dir)

;;;; Change cursor color according to mode
;; inspired by
;; http://www.emacswiki.org/emacs/ChangingCursorDynamically
(setq djcb-read-only-color       "gray")
;; valid values are t, nil, box, hollow, bar, (bar . WIDTH), hbar,
;; (hbar. HEIGHT); see the docs for set-cursor-type

(setq djcb-read-only-cursor-type 'hbar)
(setq djcb-overwrite-color       "red")
(setq djcb-overwrite-cursor-type 'box)
(setq djcb-normal-color          "yellow")
(setq djcb-normal-cursor-type    'bar)

(defun djcb-set-cursor-according-to-mode ()
  "change cursor color and type according to some minor modes."

  (cond
    (buffer-read-only
      (set-cursor-color djcb-read-only-color)
      (setq cursor-type djcb-read-only-cursor-type))
    (overwrite-mode
      (set-cursor-color djcb-overwrite-color)
      (setq cursor-type djcb-overwrite-cursor-type))
    (t
      (set-cursor-color djcb-normal-color)
      (setq cursor-type djcb-normal-cursor-type))))

(add-hook 'post-command-hook 'djcb-set-cursor-according-to-mode)

;;; END CUSTOMIZED BEHAVIOR ;;;;

;;; LANGUAGE SECTION ;;;;
(require 'flymake)

;;;;; COFFEESCRIPT
(require 'flymake-coffee)
(add-hook 'coffee-mode-hook 'flymake-coffee-load)
;;;;; END COFFEESCRIPT

;;;;; PYTHON
(elpy-enable)
;;;;; END PYTHON

;;;;; HTML
;; autostart zencoding mode in html mode
(add-hook 'sgml-mode-hook 'zencoding-mode)
;;;;; END HTML

;;;; HANDLEBARS
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . web-mode))
;;;; END HANDLEBARS

;;;; Typescript

(add-to-list 'load-path "~/.emacs.d/tide")
(require 'tide)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  (company-mode +1))
;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(setq typescript-indent-level 2)
(setq tide-tsserver-executable "/home/josh/Code/horizon/client/node_modules/typescript/bin/tsserver")
(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; see https://github.com/Microsoft/TypeScript/blob/cc58e2d7eb144f0b2ff89e6a6685fb4deaa24fde/src/server/protocol.d.ts#L421-473 for the full list available options

;;;; End Typescript

;;;; Elm
(add-to-list 'load-path "~/.emacs.d/elm-mode")
(require 'elm-mode)
;;;; End Elm

;;;; JavaScript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))
;;(define-key js2-mode-map (kbd "M-.") nil)
(setq js2-basic-offset 2)
(add-hook 'js2-mode-hook
          (lambda () (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")
(flycheck-add-mode 'javascript-eslint 'web-mode)
(setq js2-basic-offset 2)
(setq js2-missing-semi-one-line-override t)
(setq js2-strict-missing-semi-warning nil)
(setq js2-strict-trailing-comma-warning nil)
;;;; end javascript

;;;;; RUST
;; (require 'rust-mode)
;; (require 'flymake-rust)
;; (add-hook 'rust-mode-hook 'rust-coffee-load)
;;;;; END RUST

;;;;;;; END LANGUAGE SECTION ;;;;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Mono" :foundry "unknown" :slant normal :weight normal :height 90 :width normal)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 4)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("d44939ef462b7efb9bb5739f2dd50b03ac9ecf98c4df6578edcf145d6a2d188d" default)))
 '(display-battery-mode t)
 '(js2-strict-inconsistent-return-warning nil)
 '(purescript-mode-hook (quote (turn-on-purescript-indentation)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

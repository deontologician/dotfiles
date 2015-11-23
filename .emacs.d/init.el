;; Setup package archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade.ferrier.me.uk/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ;("elpy" . "https://jorgenschaefer.github.io/packages/")
))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elm-mode")
(require 'elm-mode)
(setenv "PATH" (concat (getenv "PATH") ":~/.cabal/bin"))
(setq exec-path (append exec-path '("~/.cabal/bin")))

;; ;; Color theme (set this first so colors dont flicker while init.el is loading)
(require 'color-theme-wombat)
(color-theme-wombat)

;; Add ~/.emacs.d for custom modules
;; (add-to-list 'load-path "~/.emacs.d") ;; emacs 24.4 complains about this

;;saves place in the file when re-opening it
(require 'saveplace)
(setq-default save-place t)

;;; Show stuff in title bar
(setq-default frame-title-format (list "%65b %f"))
(setq-default icon-title-format (list "%b"))
(display-battery-mode)

;;; Highlights matching braces/parens/brackets
(show-paren-mode t)

;;; Show column number
(column-number-mode t)

;;; Allows typing inside a selection to delete the selection
(delete-selection-mode 1)

;;; Scroll a line at a time
(setq scroll-step 1)

;;; Set mouse color so it can be seen over black!
(set-mouse-color "dark orange")

;;; Set focus follows mouse
(setq mouse-autoselect-window t)

;;; Set mouse avoidance, to prevent obscuring the cursor
(mouse-avoidance-mode 'jump)

;;; Only use bash with tramp
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
(eval-after-load 'tramp '(setenv "LANG" "C"))

;;; Projectile mode (language agnostic project functionality)
(require 'projectile)
(projectile-global-mode)

;;; SVG mode line
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'ocodo-svg-mode-line)

;;; Erc desktop notifications
;(add-to-list 'erc-modules 'notifications)
;(erc-notify-mode)

;;; Perspective  (group buffers by workspace)
;;(require 'persp-projectile)

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

;;; Change scratch buffer to org-mode
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message "\
# This buffer is for notes you don't want to save. You can use
# org-mode markup (and all Org's goodness) to organise the notes.
# If you want to create a file, visit that file with C-x C-f,
# then enter the text in that file's own buffer.
")

;; You can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

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
(require 'git-gutter)
(global-git-gutter-mode t)

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)

;; nice completion for M-x
(global-set-key (kbd "M-x") 'smex)

;; nice completion for C-x C-f
(ido-mode t)

;; cleanup whitespace on save
(add-hook 'before-save-hook 'whitespace-cleanup)

;;; KEY BINDINGS
;; General purpose completion (from buffers)
(global-set-key (kbd "M-/") 'hippie-expand)
;; binds linum mode to C-x l
(global-set-key "\C-xl" (quote linum-mode))
;; binds goto line to C-x g
(global-set-key "\C-xg" (quote goto-line))


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

;;;; JavaScript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'javascript-mode-hook '(setq js-indent-level 4))
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")
(flycheck-add-mode 'javascript-eslint 'web-mode)
;;;; end javascript

;;;;; RUST
;; (require 'rust-mode)
;; (require 'flymake-rust)
;; (add-hook 'rust-mode-hook 'rust-coffee-load)
;;;;; END RUST

;;;;;;; END LANGUAGE SECTION ;;;;
(smex-initialize)
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
 '(js2-basic-offset 2)
 '(js2-missing-semi-one-line-override t)
 '(js2-strict-missing-semi-warning nil)
 '(js2-strict-trailing-comma-warning nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

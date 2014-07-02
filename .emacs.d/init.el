;; Setup package archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("elpy" . "http://jorgenschaefer.github.io/packages/")))
(package-initialize)

;; Color theme (set this first so colors dont flicker while init.el is loading)
(require 'color-theme-wombat)
(color-theme-wombat)

;; Add ~/.emacs.d for custom modules
(add-to-list 'load-path "~/.emacs.d")

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

;;; Projectile mode (language agnostic project functionality)
(require 'projectile)
(projectile-global-mode)

;;; Perspective  (group buffers by workspace)
;;(require 'persp-projectile)

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

;; You can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; set default font
(add-to-list 'default-frame-alist '(font .  "Inconsolata-dz-13"))

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
(setq menu-bar-mode nil)
(setq tool-bar-mode nil)
(setq inhibit-startup-message t)

;; nice completion for M-x
(global-set-key (kbd "M-x") 'smex)

;; nice completion for C-x C-f
(ido-mode t)

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

;;;;; PYTHON
(elpy-enable)
(elpy-use-ipython)
(elpy-clean-modeline)
;;;;; END PYTHON

;;;;; HTML
;; autostart zencoding mode in html mode
(add-hook 'sgml-mode-hook 'zencoding-mode)
;;;;; END HTML

;;;;; RUST
(require 'rust-mode)
(require 'flymake-rust)
(add-hook 'rust-mode-hook 'rust-coffee-load)
;;;;; END RUST

;;;;;;; END LANGUAGE SECTION ;;;;
(smex-initialize)

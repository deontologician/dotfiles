;;; package --- Summary
;; Modifying how emacs behaves
;;; Commentary:
;;; Code:

;;; Built in customizations

;; Allows typing inside a selection to delete the selection
(delete-selection-mode 1)
;; Set focus follows mouse
(setq mouse-autoselect-window t)
;; Set mouse avoidance, to prevent obscuring the cursor
(mouse-avoidance-mode 'jump)
;; Allows typing inside a selection to delete the selection
(delete-selection-mode 1)
;; Only use bash with tramp
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
(eval-after-load 'tramp '(setenv "LANG" "C"))
;; Enable narrowing to region
(put 'narrow-to-region 'disabled nil)
;; Change scratch buffer to org-mode
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message "\
# This buffer is for notes you don't want to save. You can use
# org-mode markup (and all Org's goodness) to organise the notes.
# If you want to create a file, visit that file with C-x C-f,
# then enter the text in that file's own buffer.
")
;; cleanup whitespace on save
(add-hook 'before-save-hook 'whitespace-cleanup)
;; use spaces instead of tabs (very important to avoid heresy!)
(setq-default indent-tabs-mode nil)
;; Turn electric indent mode off because it's infuriating and slow!
(electric-indent-mode nil)

;; Save all tempfiles in $TMPDIR/emacs$UID/ instead of in the current
;; directory
(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
      emacs-tmp-dir)

;; saves place in a file when re-opening it
(require 'saveplace)
(setq-default save-place t)
;; Multiple cursors mode
(require 'multiple-cursors)
;;; Ace-window mode
(require 'ace-window)
;; Set keys to home row, vs. numbers
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
;;; Magit
(require 'magit)
;;; Avy
(require 'avy)
;;; Swiper / Ivy / counsel
(require 'swiper)
(require 'ivy)
(setq magit-completing-read-function 'ivy-completing-read)

(require 'counsel)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(provide 'josh-behavior)
;; ;;; josh-behavior.el ends here

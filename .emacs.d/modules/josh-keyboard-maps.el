;;; package -- Summary
;; Keyboard remappings. May be dependent on other modes
;;; Commentary:

;;; Code:

;; General purpose completion (from buffers)
(global-set-key (kbd "M-/") 'hippie-expand)
;; To enable linum mode
(global-set-key "\C-xl" (quote linum-mode))

;; Multiple cursors
(with-library multiple-cursors
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-unset-key (kbd "M-<down-mouse-1>"))
  (global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click))

;; Avy for jumping around buffers
(with-library avy
  (global-set-key (kbd "C-x g") 'avy-goto-line)
  (global-set-key (kbd "C-'") 'avy-goto-char))

(with-library ace-window
  ;; Remap the awful other window behavior
  (define-key global-map (kbd "C-x o") 'ace-window))

;; Git-gutter, jumping between hunks is nice
(with-library git-gutter
  (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
  (global-set-key (kbd "C-x n") 'git-gutter:next-hunk))

;; Swiper for searching
;;(with-library swiper
;;  (global-set-key "\C-s" 'swiper))

;; Ivy for finding files etc
(with-library ivy
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume))

;; counsel for M-x functionality
(with-library counsel
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
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history))

;; Nice ast-modifying refactors for javascript
(with-library js2-refactor
  (js2r-add-keybindings-with-prefix "C-c C-m"))

;; Set up tab completion for racer in rust mode
(with-library rust-mode
  (global-set-key (kbd "TAB") #'company-indent-or-complete-common))

(provide 'josh-keyboard-maps)
;;; josh-keyboard-maps.el ends here

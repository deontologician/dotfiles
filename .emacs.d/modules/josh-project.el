;;; package -- Summary
;; Stuff for project management
;;; Commentary:
;;; Code:

;; flycheck
(require 'flycheck)
;; enable flycheck everywhere
(add-hook 'after-init-hook #'global-flycheck-mode)

;; company mode used by ide stuff
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; Workgroups
(require 'workgroups2)
(workgroups-mode 1)

(provide 'josh-project)
;;; josh-project.el ends here

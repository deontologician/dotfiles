;;; package -- Summary
;; customization for html modes
;;; Commentary
;;; Code:

;; Zencoding allows a short way of creating html elements
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)

(provide 'lang-web)
;;; lang-web.el ends here

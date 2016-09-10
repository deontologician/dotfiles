(add-to-list 'load-path "~/.emacs.d/various")
(require 'ghub)
(setq auth-sources '("~/.authinfo.gpg" "~/.authinfo" "~/.netrc"))
(require 'auth-source)

(defun github-get-username ()
  "Get the authorized username for github."
  (substring (shell-command-to-string
              "git config github.user")
             0 -1)
  )

(defun ghub--get-access-token ()
  "Overridden access token get."
  (let ((secret
         (plist-get
          (car (auth-source-search
                :user (github-get-username)
                :host "api.github.com"))
          :secret)))
    (if (functionp secret)
        (funcall secret)
      secret)
    )
  )

(defun ghub--url-encode-params (params)
  (mapconcat (pcase-lambda (`(,key . ,val))
           (concat (url-hexify-string (symbol-name key)) "="
                   (url-hexify-string val)))
           params "&" )
)

(defun make-query (params)
  (mapconcat (pcase-lambda (`(,key . ,val))
               (concat (symbol-name key) ":" val))
               params " "))

(defun issue-search (params)
  (cdr (nth 2 (ghub-get "/search/issues"
                   `((q . ,(make-query params)))))))


(let ((results
      (issue-search `((repo . "rethinkdb/horizon")
                      (is . "open")
                      (type . "issue")
                      (label . "client")
                      (milestone . "2.x.x")))))
  (mapcar (lambda (issue) `(,(assq 'title issue)
                            ,(assq 'number issue)
                            ,(assq 'html_url issue)
                            ))
          results)
  )
(((title . "Remove babel-preset-es2015-loose. It has been deprecated.") (number . 814) (html_url . "https://github.com/rethinkdb/horizon/issues/814")) ((title . "Manually reconnecting the web client") (number . 772) (html_url . "https://github.com/rethinkdb/horizon/issues/772")) ((title . "Resubscribing to a watch() Observable causes duplicated data") (number . 738) (html_url . "https://github.com/rethinkdb/horizon/issues/738")) ((title . "Blank on iphone/Safari") (number . 521) (html_url . "https://github.com/rethinkdb/horizon/issues/521")) ((title . "Audit all exceptions and ensure they are as user friendly as possible") (number . 319) (html_url . "https://github.com/rethinkdb/horizon/issues/319")) ((title . "Issues getting Horizon working with React Native") (number . 255) (html_url . "https://github.com/rethinkdb/horizon/issues/255")))


;(url repository_url labels_url comments_url events_url html_url id
;number title user labels state locked assignee assignees milestone
;comments created_at updated_at closed_at body score)

(provide 'github)
;;; github ends here

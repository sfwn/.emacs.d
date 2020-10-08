;;; init-custom --- init custom
;;; Commentary:
;;; Code:

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(setq-default find-function-C-source-directory '(expand-file-name "sources/27.1" user-emacs-directory))

;; get md5 of action agent
(defun get-action-agent-md5 (image)
  "get MD5 of action-agent"
  (interactive "simage: ")
  (kill-new
   (message
	(substring
	 (shell-command-to-string (concat "docker run --rm --entrypoint cat " image " /opt/action/action-agent-md5")) 0 -1))))

(provide 'init-custom)

;;; init-custom.el ends here

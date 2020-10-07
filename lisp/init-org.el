;;; init-org.el --- init org
;;; Commentary:
;;; Code:

(global-set-key (kbd "C-c o c") 'org-capture)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c o a") 'org-agenda)

(setq org-default-notes-file "~/org/inbox.org")

(provide 'init-org)

;;; init-org.el ends here

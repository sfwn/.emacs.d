;;; init-org.el --- init org
;;; Commentary:
;;; Code:

(global-set-key (kbd "C-c o c") 'org-capture)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c o a") 'org-agenda)

(setq org-default-notes-file "~/org/inbox.org")

;; ox-pandoc
(use-package
  ox-pandoc
  :ensure t)

;; agenda
(setq org-agenda-files '("~/org/gtd/inbox.org" "~/org/gtd/gtd.org" "~/org/gtd/tickler.org"))

;; capture
(setq org-capture-templates '(("t" "Todo [inbox]" entry (file+headline "~/org/gtd/inbox.org" "Tasks")
							   "* TODO %i%?")
							  ("T" "Tickler" entry (file+headline "~/org/gtd/tickler.org" "Tickler")
							   "* %i%?\n %U")))

;; refile targets
(setq org-refile-targets '(("~/org/gtd/gtd.org" :maxlevel . 3)
			  ("~/org/gtd/someday.org" :level . 1)
			  ("~/org/gtd/tickler.org" :maxlevel . 2)))

;; org-roam
(setq org-roam-directory "~/org/")

(provide 'init-org)

;;; init-org.el ends here

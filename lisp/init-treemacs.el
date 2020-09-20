;;; init-treemacs --- init treemacs
;;; Commentary:
;;; Code:

(use-package treemacs
  :ensure t
  :config
  (treemacs-git-mode 'deferred)
  (treemacs-filewatch-mode t)
  (treemacs-follow-mode t)
  (treemacs-fringe-indicator-mode t)
  (treemacs-tag-follow-mode t)
  (setq treemacs-position 'right))

(use-package treemacs-evil
  :ensure t
  :after treemacs evil)

(use-package treemacs-projectile
  :ensure t
  :after treemacs projectile)

(use-package treemacs-magit
  :ensure t
  :after treemacs magit)

(use-package treemacs-icons-dired
  :ensure t
  :after treemacs dired
  :config (treemacs-icons-dired-mode))

(provide 'init-treemacs)

;;; init-treemacs.el ends here

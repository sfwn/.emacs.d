;;; init-treemacs --- init treemacs
;;; Commentary:
;;; Code:

(use-package treemacs
  :ensure t
  :config
  (setq-default treemacs-position 'right)
  (setq-default treemacs-width 50)
  (setq-default treemacs-follow-after-init t)
  (setq-default treemacs-collapse-dirs 10)
  (treemacs-git-mode 'deferred)
  (treemacs-filewatch-mode t)
  (treemacs-follow-mode nil)
  (treemacs-tag-follow-mode nil)
  (treemacs-fringe-indicator-mode nil)
  (treemacs-load-theme 'all-the-icons)
  (global-set-key (kbd "C-c t") 'treemacs)
  (global-set-key (kbd "M-0") 'treemacs-select-window)
  (global-set-key (kbd "s-1") 'treemacs)
  (global-set-key (kbd "s-2") 'treemacs-find-file))

(with-eval-after-load 'treemacs
  (treemacs-follow-mode -1)
  (treemacs-tag-follow-mode -1))

(treemacs-follow-mode nil)
(treemacs-tag-follow-mode nil)

;; (use-package treemacs-evil
;;   :ensure t
;;   :after treemacs evil)

(use-package treemacs-projectile
  :ensure t
  :after treemacs projectile)

(use-package treemacs-magit
  :ensure t
  :after treemacs magit)

(provide 'init-treemacs)

;;; init-treemacs.el ends here

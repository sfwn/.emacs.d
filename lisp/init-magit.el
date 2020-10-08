;;; init-magit --- init magit
;;; Commentary:
;;; Code:

;; magit
(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g g") 'magit-status)
  (global-set-key (kbd "C-x g b") 'magit-blame))

(provide 'init-magit)

;;; init-magit.el ends here

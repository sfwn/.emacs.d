;;; init-icon --- init icon
;;; Commentary: Enable other packages like counsel-projectile before enabling all-the-icons-ivy-rich-mode.
;;; Code:

(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

;; For better performance, enable all-the-icons-ivy-rich-mode before ivy-rich-mode
(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package ivy-rich
  :ensure t
  :init (ivy-rich-mode 1))

(use-package treemacs-all-the-icons
  :ensure t
  :config
  (treemacs-load-theme 'all-the-icons))

(provide 'init-icon)

;;; init-icon.el ends here

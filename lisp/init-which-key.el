;;; init-which-key --- init which-key
;;; Commentary:
;;; Code:

;; (use-package which-key
;;   :ensure t
;;   :config
;;   (which-key-mode 1))
(use-package which-key
  :ensure t
  :defer nil
  :delight
  :config
  (which-key-setup-side-window-bottom)
  (setq which-key-idle-delay 0.3)
  (setq which-key-side-window-max-height 0.25)
  (which-key-mode t))

(provide 'init-which-key)

;;; init-which-key.el ends here

;;; init-which-key --- init which-key
;;; Commentary:
;;; Code:

;; (use-package which-key
;;   :ensure t
;;   :config
;;   (which-key-mode 1))
(use-package which-key
  :defer nil
  :delight
  :custom
  (which-key-idle-delay 0.3)
  (which-key-popup-type 'side-window)
  (which-key-side-window-location 'bottom)
  (which-key-show-docstrings t)
  (which-key-max-display-columns 1)
  (which-key-show-prefix nil)
  (which-key-side-window-max-height 8)
  (which-key-max-description-length 80)
  :config
  (which-key-mode t))

(provide 'init-which-key)

;;; init-which-key.el ends here

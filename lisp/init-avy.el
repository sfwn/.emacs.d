;;; init-avy --- init avy
;;; Commentary:
;;; Code:

;; avy
(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "C-;") 'avy-goto-char-timer))

(provide 'init-avy)

;;; init-avy.el ends here

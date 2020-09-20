;;; init-shell --- init shell
;;; Commentary:
;;; Code:

;; eshell
(add-hook 'eshell-exit-hook (lambda() (company-box-mode ) (company-mode 1) (evil-mode 1)) 'append)
(add-hook 'eshell-mode-hook (lambda() (company-box-mode -1) (company-mode -1) (evil-mode -1)) 'append)

(provide 'init-shell)

;;; init-shell.el ends here

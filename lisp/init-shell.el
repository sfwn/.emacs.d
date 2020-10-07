;;; init-shell --- init shell
;;; Commentary:
;;; Code:

;; eshell
(add-hook 'eshell-exit-hook (lambda() (global-company-mode 1) (company-mode 1) (company-box-mode 1) (evil-mode 1)) 'append)
(add-hook 'eshell-mode-hook (lambda() (global-company-mode -1) (company-mode -1) (company-box-mode -1) (evil-mode -1)) 'append)

;; aweshell
(add-to-list 'load-path (expand-file-name "github-plugins/aweshell" user-emacs-directory))
(require 'aweshell)

;; vterm
(use-package vterm
  :ensure t)

;; multi-vterm
(use-package multi-vterm
  :ensure t
  :config
  (global-set-key (kbd "C-c C-v") 'multi-vterm-dedicated-toggle)
  (global-set-key (kbd "<M-f12>") 'multi-vterm-dedicated-toggle))

(provide 'init-shell)

;;; init-shell.el ends here

;;; init-shell --- init shell
;;; Commentary:
;;; Code:

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

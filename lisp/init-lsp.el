;;; init-lsp.el --- init lsp
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred)
  :config
  (setq lsp-enable-file-watchers t)
  (setq lsp-file-watch-threshold 20000))

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :init
  (setq lsp-ui-doc-enable nil))

;; lsp-ivy
(use-package lsp-ivy
  :ensure t
  :config
  (global-set-key (kbd "s-M-o") 'lsp-ivy-workspace-symbol))

(provide 'init-lsp)

;;; init-lsp.el ends here

;;; init-go --- init go
;;; Commentary:
;;; Code:

;; go-mode
(use-package go-mode
  :ensure t)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; go-impl
(use-package go-impl
  :ensure t)

;; go-playground
(use-package go-playgroud
  :ensure t)

(provide 'init-go)

;;; init-go.el ends here

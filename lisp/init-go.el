;;; init-go --- init go
;;; Commentary:
;;; Code:

;; go-mode
(use-package go-mode
  :ensure t
  :config
  (define-key go-mode-map (kbd "C-4") 'go-goto-function-name)
  (define-key go-mode-map (kbd "C-5") 'go-run)
  (define-key go-mode-map (kbd "C-6") 'go-test-current-test))

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
(use-package go-playground
  :ensure t)

;; go-tag
(use-package go-tag
  :ensure t
  :config
  (setq go-tag-args (list "-transform" "camelcase")))

;; go-fill-struct
(use-package go-fill-struct
  :ensure t)

(provide 'init-go)

;;; init-go.el ends here

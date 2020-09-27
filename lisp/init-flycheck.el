;;; init-flycheck --- init flycheck
;;; Commentary:
;;; Code:

(setq-default flycheck-emacs-lisp-load-path 'inherit)

;; flycheck
(use-package flycheck
  :ensure t
  :config ;; (global-flycheck-mode)
          (add-to-list 'display-buffer-alist
					   `(,(rx bos "*Flycheck errors*" eos)
						 (display-buffer-reuse-window
						  display-buffer-in-side-window)
						 (side . bottom)
						 (reusable-frams .visible)
						 (window-height . 0.2)))
)

;; flycheck-golangci-lint
(use-package flycheck-golangci-lint
  :ensure t
  :hook (go-mode . flycheck-golangci-lint-setup))

(provide 'init-flycheck)

;;; init-flycheck.el ends here

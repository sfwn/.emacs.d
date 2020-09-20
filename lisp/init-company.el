;;; init-company.el --- init company
;;; Commentary:
;;; Code:

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0.25)
  (setq company-minimum-prefix-length 0)
  (global-company-mode 1))

(use-package company-box
  :hook (company-mode . company-box-mode))

(provide 'init-company)

;;; init-company.el ends here

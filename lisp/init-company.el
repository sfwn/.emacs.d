;;; init-company.el --- init company
;;; Commentary:
;;; Code:

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  ()
  (global-company-mode 1)
  (global-set-key (kbd "<C-return>") 'company-capf)
  (setq company-show-numbers t)
)

;; (use-package company-box
;;   :hook (company-mode . company-box-mode))

;; company-tabnine
;; (use-package company-tabnine
;;   :ensure t
;;   :config
;;   (add-to-list 'company-backends #'company-tabnine))

(provide 'init-company)

;;; init-company.el ends here

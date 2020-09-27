;;; init-lsp.el --- init lsp
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook
  (go-mode . lsp-deferred)
  :config
  (setq lsp-enable-file-watchers t)
  (setq lsp-file-watch-threshold 20000)
  (setq gc-cons-threshold 100000000) ;; 100mb
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-completion-provider :capf)
  (setq lsp-idle-delay 0.500)
  (setq lsp-modeline-diagnostics-enable t)
  (setq lsp-modeline-code-actions-enable nil)
  (lsp-enable-which-key-integration t)
  ;; (setq lsp-print-performance t)
)

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  ;; sideline
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-update-mode 'point)
  (setq lsp-ui-sideline-delay 0.5)
  ;; peek
  (setq lsp-ui-peek-enable t)
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (define-key lsp-ui-mode-map (kbd "C-1") 'lsp-ui-doc-glance)
  (define-key lsp-ui-mode-map (kbd "C-2") 'lsp-ui-peek-find-references)
  (define-key lsp-ui-mode-map (kbd "C-3") 'lsp-ui-peek-find-implementation)
  ;; ui-doc
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-position 'at-point)
)

;; lsp-ivy
(use-package lsp-ivy
  :ensure t
  :config
  (global-set-key (kbd "s-M-o") 'lsp-ivy-workspace-symbol))

;; lsp-treemacs
(use-package lsp-treemacs
  :ensure t
  :config
  (lsp-treemacs-sync-mode 1))

(provide 'init-lsp)

;;; init-lsp.el ends here

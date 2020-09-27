;;; init-yasnippet --- init yasnippet
;;; Commentary:
;;; Code:

;; Optional - provides snippet support.
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

;; (add-to-list 'company-backends 'company-yasnippet)

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here

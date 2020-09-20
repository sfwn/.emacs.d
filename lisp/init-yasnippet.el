;;; init-yasnippet --- init yasnippet
;;; Commentary:
;;; Code:

;; Optional - provides snippet support.
(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :config
  (yas-minor-mode 1))

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here

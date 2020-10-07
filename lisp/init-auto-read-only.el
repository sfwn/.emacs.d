;;; init-auto-read-only --- init auto-read-only
;;; Commentary:
;;; Code:

;; auto-read-only
;; (use-package auto-read-only
;;   :ensure t
;;   :config
;;   (auto-read-only-mode t)
;;   (add-to-list 'auto-read-only-file-regexps "/vendor/"))

(use-package hardhat
  :ensure t
  :config
  (global-hardhat-mode t))

(provide 'init-auto-read-only)

;;; init-auto-read-only.el ends here

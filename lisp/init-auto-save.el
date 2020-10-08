;;; init-auto-save.el --- init auto-save
;;; Commentary:
;;; Code:

;; (add-to-list 'load-path (expand-file-name "github-plugins/auto-save" user-emacs-directory))
;; (require 'auto-save)

;; (setq auto-save-silent nil)				; quietly save
;; (setq auto-save-delete-trailing-whitespace t) ; automatically delete spaces at the end of the line when saving
;; (setq auto-save-idle 10)

;; ;;; custom predicates if you don't want auto save.
;; ;;; disable auto save mode when current filetype is an gpg file.
;; (setq auto-save-disable-predicates
;;       '((lambda ()
;;       (string-suffix-p
;;       "gpg"
;;       (file-name-extension (buffer-name)) t))))

;; (auto-save-enable)

;; super-save
(use-package super-save
  :ensure t
  :config
  (super-save-mode t)
  (setq super-save-auto-save-when-idle t))

(provide 'init-auto-save)

;;; init-auto-save.el ends here

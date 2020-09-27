;;; init-auto-save.el --- init auto-save
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "github-plugins/auto-save" user-emacs-directory))
(require 'auto-save)
(auto-save-enable)

(setq auto-save-silent nil)				; quietly save
(setq auto-save-delete-trailing-whitespace t) ; automatically delete spaces at the end of the line when saving
(setq auto-save-idle 10)

;;; custom predicates if you don't want auto save.
;;; disable auto save mode when current filetype is an gpg file.
(setq auto-save-disable-predicates
      '((lambda ()
      (string-suffix-p
      "gpg"
      (file-name-extension (buffer-name)) t))))

(provide 'init-auto-save)

;;; init-auto-save.el ends here

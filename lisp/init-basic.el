;;; init-basic --- init basic
;;; Commentary:
;;; Code:

;; linum-mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(column-number-mode 1)
(size-indication-mode 1)

;; auto pair
(add-hook 'prog-mode-hook 'electric-pair-mode)

;; font
(add-to-list 'default-frame-alist '(font . "-*-JetBrains Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1"))
(set-face-attribute 'default t :font "-*-JetBrains Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")

(global-hl-line-mode 1)

(tool-bar-mode 0)
(tooltip-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(load-theme 'spacemacs-light t)

;; exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; file name
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; no wrap; tab width=4
;;(set-default 'truncate-lines t)
(setq-default tab-width 4)

(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

;; stop creating those #auto-save# files
(setq auto-save-default nil)
;; disable emacs's automatic backup~ file
(setq make-backup-files nil)

(toggle-frame-maximized)

(fset 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode -1)
(setq ring-bell-function 'ignore)

(show-paren-mode 1)

;; fold
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; line spacing
(setq-default line-spacing 0.25)

(defun scroll-half-page-down ()
  "scroll down half the page"
  (interactive)
  (scroll-down (/ (window-body-height) 2)))
(defun scroll-half-page-up ()
  "scroll up half the page"
  (interactive)
  (scroll-up (/ (window-body-height) 2)))

(global-set-key "\M-n" 'scroll-half-page-up)
(global-set-key "\M-p" 'scroll-half-page-down)

(defun say-current-time ()
  "say current time"
  (interactive)
  (insert (shell-command-to-string "echo -n $(date \"+%Y-%m-%d %H:%M:%S\")")))

(provide 'init-basic)

;;; init-basic.el ends here

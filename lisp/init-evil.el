;;; init-evil --- init evil
;;; Commentary:
;;; Code:

;; evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (global-set-key (kbd "<f1>") 'evil-mode))
  (setq evil-emacs-state-cursor '("red" box))
  (setq evil-normal-state-cursor '("green" box))
  (setq evil-visual-state-cursor '("orange" box))
  (setq evil-insert-state-cursor '("red" bar))
  (setq evil-replace-state-cursor '("red" bar))
  (setq evil-operator-state-cursor '("red" hollow))

(defun er-find-user-init-file-in-window ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file))
(defun er-find-user-init-file-in-frame ()
  "Edit the `user-init-file', in another frame."
  (interactive)
  (find-file-other-frame user-init-file))

;; evil-leader mode
(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  ;; flycheck
  (evil-leader/set-key
	"f l n" 'flycheck-next-error
    "f l p" 'flycheck-previous-error
    "f l l" 'flycheck-list-errors
    "f l v" 'flycheck-verify-setup
    "f l b" 'flycheck-buffer
    "f l f" 'flycheck-first-error)
  ;; buffer
  (evil-leader/set-key
	"b e" 'eval-buffer)
  ;; init.el
  (evil-leader/set-key
	"e i" 'er-find-user-init-file-in-window
	"e I" 'er-find-user-init-file-in-frame)
  ;; treemacs
  (evil-leader/set-key
	"t r" 'treemacs
	"t s" 'lsp-treemacs-symbols)
  ;; ace-window
  (evil-leader/set-key
	"w" 'ace-window)
  ;; yas-snippet
  (evil-leader/set-key
	"y i" 'yas-insert-snippet)
  ;; rg
  (evil-leader/set-key
	"s" 'counsel-projectile-rg)
)

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o RET") 'ace-window)
  (ace-window-display-mode t))

(provide 'init-evil)

;;; init-evil.el ends here

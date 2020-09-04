;;; package --- Summary
;;; Commentary:
;;; Code:
(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
        ("http" . "0.0.0.0:1087")
             ("https" . "0.0.0.0:1087")))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package
;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

;; go-mode
(use-package go-mode
  :ensure t)

;; lsp-mode
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred)
  :config
  (setq lsp-enable-file-watchers t)
  (setq lsp-file-watch-threshold 20000))

;; help-lsp
(use-package helm-lsp
  :ensure t)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
;; (add-hook 'go-mode-hook 'go-imenu-setup)

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :init
  (setq lsp-ui-doc-enable nil))

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 0)
  (global-company-mode 0))

;; Optional - provides snippet support.
(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

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

;; helm
(use-package helm
  :ensure t
  :config
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (helm-mode 1))

;; projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; helm-projectile
(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

;; linum-mode
(global-linum-mode 1)

(set-face-attribute 'default nil :height 150)

(global-hl-line-mode 1)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
;(load-theme 'dracula t)
;(load-theme 'leuven t)
(load-theme 'spacemacs-light t)

;; exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; snails
(add-to-list 'load-path "~/.emacs.d/github-plugins/snails")
(require 'snails)

;; multi-translate
(add-to-list 'load-path "~/.emacs.d/github-plugins/multi-translate.el")
(require 'multi-translate)
(global-set-key (kbd "s-b q") 'multi-translate)
(global-set-key (kbd "s-b b") 'bing-dict-brief)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; file name
(setq frame-title-format
      '("" invocation-name ": "
	(:eval
	 (if buffer-file-name
	  (abbreviate-file-name buffer-file-name)
           "%b"))))

;; yasnippet
(use-package yasnippet
  :ensure t)

;; no wrap; tab width=4
(set-default 'truncate-lines t)
(setq-default tab-width 4)

;; go-impl
(use-package go-impl
  :ensure t)

(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

(use-package helm-posframe
  :ensure t
  :config
  (helm-posframe-enable))

(setq make-backup-files nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3899c0f0c9fa57ace9760821780dfe74b7b43de2ebf1938ff7aa21542461c487" "71e5acf6053215f553036482f3340a5445aee364fb2e292c70d9175fb0cc8af7" "9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" "fe00bb593cb7b8c015bb2eafac5bfc82a9b63223fbc2c66eddc75c77ead7c7c1" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "6b80b5b0762a814c62ce858e9d72745a05dd5fc66f821a1c5023b4f2a76bc910" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "8d7684de9abb5a770fbfd72a14506d6b4add9a7d30942c6285f020d41d76e0fa" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "37144b437478e4c235824f0e94afa740ee2c7d16952e69ac3c5ed4352209eefb" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "24714e2cb4a9d6ec1335de295966906474fdb668429549416ed8636196cb1441" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default))
 '(flycheck-pos-tip-mode t)
 '(global-company-mode t)
 '(global-flycheck-mode t)
 '(global-linum-mode t)
 '(helm-completion-style 'emacs)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-selected-packages
   '(helm-posframe posframe quelpa-use-package flycheck-pos-tip flycheck imenu-anywhere dired-imenu discover-my-major srcery-theme go-impl helm-lsp flycheck-golangci-lint gotest yasnippet-snippets helm-rg helm-ag helm-projectile projectile helm doom-themes spacemacs-theme ivy solarized-theme magit exec-path-from-shell evil evil-mode go-mode yasnippet use-package lsp-ui company)))
 ;; Start maximized

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

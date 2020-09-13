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
	"t r" 'treemacs)
  ;; ace-window
  (evil-leader/set-key
	"w" 'ace-window)
)

(defun er-find-user-init-file-in-window ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file))
(defun er-find-user-init-file-in-frame ()
  "Edit the `user-init-file', in another frame."
  (interactive)
  (find-file-other-frame user-init-file))

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

;; flycheck
(use-package flycheck
  :ensure t
  :config (global-flycheck-mode)
          (add-to-list 'display-buffer-alist
					   `(,(rx bos "*Flycheck errors*" eos)
						 (display-buffer-reuse-window
						  display-buffer-in-side-window)
						 (side . bottom)
						 (reusable-frams .visible)
						 (window-height . 0.2)))
)

;; flycheck-golangci-lint
(use-package flycheck-golangci-lint
  :ensure t
  :hook (go-mode . flycheck-golangci-lint-setup))

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
(line-number-mode 1)
(column-number-mode 1)
(size-indication-mode 1)

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
(global-set-key (kbd "s-b q q") 'multi-translate)
(global-set-key (kbd "s-b q a") 'multi-translate-at-point)
(global-set-key (kbd "s-b b b") 'bing-dict-brief)
(global-set-key (kbd "s-b s q") 'sdcv-search-input+)
(global-set-key (kbd "s-b s Q") 'sdcv-search-input)
(global-set-key (kbd "s-b s i") 'sdcv-search-input+)
(global-set-key (kbd "s-b s I") 'sdcv-search-input)
(global-set-key (kbd "s-b s a") 'sdcv-search-pointer+)
(global-set-key (kbd "s-b s A") 'sdcv-search-pointer)
(global-set-key (kbd "s-b B s") 'helm-baidu-fanyi-suggest)

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
;;(set-default 'truncate-lines t)
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
  (helm-posframe-disable))

(setq make-backup-files nil)

(use-package rainbow-delimiters
  :ensure t
  :hook (go-mode . rainbow-delimiters-mode))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package expand-region
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; stop creating those #auto-save# files
(setq auto-save-default nil)
;; disable emacs's automatic backup~ file
(setq make-backup-files nil)

(use-package treemacs
  :ensure t
  :config
  (treemacs-git-mode 'deferred)

(use-package treemacs-evil
  :ensure t
  :after treemacs evil)

(use-package treemacs-projectile
  :ensure t
  :after treemacs projectile)

(use-package treemacs-magit
  :ensure t
  :after treemacs magit)

(use-package treemacs-icons-dired
  :ensure t
  :after treemacs dired
  :config (treemacs-icons-dired-mode))

(use-package ace-window
  :ensure t
  :config
  ((global-set-key (kbd "M-o RET") 'ace-window))
  (ace-window-display-mode t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f7216d3573e1bd2a2b47a2331f368b45e7b5182ddbe396d02b964b1ea5c5dc27" "a3165cd9923c8a033924ef3a342c4ecc26a4b7f5abdefcfa4c6fb659a4404a09" "3899c0f0c9fa57ace9760821780dfe74b7b43de2ebf1938ff7aa21542461c487" "71e5acf6053215f553036482f3340a5445aee364fb2e292c70d9175fb0cc8af7" "9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" "fe00bb593cb7b8c015bb2eafac5bfc82a9b63223fbc2c66eddc75c77ead7c7c1" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "6b80b5b0762a814c62ce858e9d72745a05dd5fc66f821a1c5023b4f2a76bc910" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "8d7684de9abb5a770fbfd72a14506d6b4add9a7d30942c6285f020d41d76e0fa" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "37144b437478e4c235824f0e94afa740ee2c7d16952e69ac3c5ed4352209eefb" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "24714e2cb4a9d6ec1335de295966906474fdb668429549416ed8636196cb1441" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default))
 '(global-company-mode t)
 '(global-linum-mode t)
 '(helm-completion-style 'emacs)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-selected-packages
   '(treemacs-icons-dired treemacs-magit dockerfile-mode treemacs-evil treemacs-projectile treemacs neotree jbeans-theme flycheck-color-mode-line which-key evil-leader rainbow-delimiters-mode rainbow-delimiters flycheck-golangci-lint flycheck yaml-mode evil-surround expand-region goldendict helm-posframe posframe quelpa-use-package imenu-anywhere dired-imenu discover-my-major srcery-theme go-impl helm-lsp gotest yasnippet-snippets helm-rg helm-ag helm-projectile projectile helm doom-themes spacemacs-theme ivy solarized-theme magit exec-path-from-shell evil evil-mode go-mode yasnippet use-package lsp-ui company))
 '(tooltip-mode nil)
 '(treemacs-filewatch-mode t)
 '(treemacs-follow-mode t)
 '(treemacs-fringe-indicator-mode t)
 '(treemacs-tag-follow-mode t)
 '(which-key-mode t))
 ;; Start maximized

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun helm-baidu-fanyi-suggest-fetch (keyword)
  (let ((url-user-agent (format "%s <%s>" user-full-name user-mail-address))
        (url-request-method "POST")
        (url-request-extra-headers '(("Content-Type" . "application/x-www-form-urlencoded")))
        (url-request-data (encode-coding-string
                           (mapconcat
                            (pcase-lambda (`(,key . ,val))
                              (concat (url-hexify-string key)
                                      "="
                                      (url-hexify-string val)))
                            (list (cons "kw" keyword))
                            "&")
                           'utf-8)))
    (with-current-buffer (url-retrieve-synchronously "https://fanyi.baidu.com/sug")
      ;; 百度使用 \uxxxx，而不是 UTF-8
      ;; http://softwaremaniacs.org/blog/2015/03/22/json-encoding-problem/en/
      ;; (set-buffer-multibyte t)
      (goto-char url-http-end-of-headers)
      (let ((json (let ((json-array-type 'list))
                    (json-read))))
        (mapcar
         (lambda (x)
           (let-alist x
             (cons .k .v)))
         (alist-get 'data json))))))

(defun helm-baidu-fanyi-suggest-candidates (&optional keyword)
  (mapcar
   (pcase-lambda (`(,word . ,meaning))
     (format "%-20s %s" word
             ;; 有时开头会有空格
             (string-trim meaning)))
   (helm-baidu-fanyi-suggest-fetch (or keyword helm-pattern))))

(defvar helm-baidu-fanyi-suggest-action
  (helm-make-actions
   "Insert Query"
   (lambda (candidate)
     ;; NOTE 单词和解释之间至少间隔 2 个空格
     (insert (car (split-string candidate "  " t))))
   "Browse URL"
   (lambda (candidate)
     (let* ((query (car (split-string candidate "  " t)))
            ;; NOTE 只考虑中文 ⇔ 英文
            ;; https://fanyi.baidu.com/#en/zh/aggressive
            ;; https://fanyi.baidu.com/#zh/en/%E4%B8%AD%E5%9B%BD
            (from (if (string-match-p "\\cC" query) 'zh 'en))
            (to (pcase from
                  ('zh 'en)
                  ('en 'zh))))
       (browse-url
        (format "https://fanyi.baidu.com/#%s/%s/%s"
                from to (url-hexify-string query)))))))

(defun helm-baidu-fanyi-suggest ()
  "百度翻译（搜索补全）."
  (interactive)
  (helm
   :sources
   (helm-build-sync-source "百度翻译"
     :header-name
     (lambda (name)
       (format "%s <%s>" name "https://fanyi.baidu.com/"))
     :candidates #'helm-baidu-fanyi-suggest-candidates
     :action helm-baidu-fanyi-suggest-action
     :volatile t
     :requires-pattern 1)
   :buffer "*helm 百度翻译*"))

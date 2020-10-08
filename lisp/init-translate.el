;;; init-translate --- init translate
;;; Commentary:
;;; Code:

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

;; company-english-helper
(add-to-list 'load-path (expand-file-name "github-plugins/company-english-helper" user-emacs-directory))
(require 'company-english-helper)
(global-set-key (kbd "s-b e h") 'toggle-company-english-helper)

;; go-translate
(use-package go-translate
  :ensure t
  :config
  (setq go-translate-base-url "https://translate.google.cn")
  (setq go-translate-local-language "zh-CN")
  (setq go-translate-extra-directions '(("zh-CN" . "en") ("en" . "fr"))) ; 中->英
  (setq go-translate-buffer-follow-p t)
  (setq go-translate-inputs-function #'go-translate-inputs-current-or-prompt)
  (setq go-translate-buffer-window-config '((display-buffer-reuse-window display-buffer-in-side-window) (side . right)))
  :bind ("s-b g" . go-translate))

(provide 'init-translate)

;;; init-translate.el ends here

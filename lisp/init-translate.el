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

(provide 'init-translate)

;;; init-translate.el ends here

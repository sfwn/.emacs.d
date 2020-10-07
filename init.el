;;; init.el --- init emacs
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'cl)
(require 'init-proxy)					; set proxy firstly
(require 'init-package)
(require 'init-custom)
(require 'init-lsp)
(require 'init-flycheck)
(require 'init-go)
(require 'init-company)
(require 'init-yasnippet)
(require 'init-evil)
(require 'init-ivy)
(require 'init-projectile)
(require 'init-basic)
(require 'init-snails)
(require 'init-translate)
(require 'init-magit)
(require 'init-which-key)
(require 'init-rainbow-delimiters)
(require 'init-expand-region)
(require 'init-treemacs)
(require 'init-json)
(require 'init-shell)
(require 'init-auto-save)
(require 'init-java)
(require 'init-icon)
(require 'init-sicp)
(require 'init-org)
(require 'init-avy)
(require 'init-auto-read-only)

;;; init.el ends here

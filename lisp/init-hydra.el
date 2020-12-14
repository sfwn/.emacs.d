;;; init-hydra --- init hydra
;;; Commentary:
;;; Code:

;; rainbow-mode show color
(use-package rainbow-mode
  :ensure t)

(use-package pretty-hydra
  :ensure t
  :bind*
  ("C-'" . global-hydra/body)
  :config
  (pretty-hydra-define global-hydra
	(:pre nil
	 :post (message "bye hydra")
	 :color amaranth					; :foreign-keys warn :exit nil
	 :quit-key "q")
	("Window"
	 (("w h" shrink-window-horizontally "←")
	  ("w j" enlarge-window "↓")
	  ("w k" shrink-window "↑")
	  ("w l" enlarge-window-horizontally "→")
	  ("w s" ace-swap-window "swap")
	  ("w f" toggle-frame-fullscreen "fullscreen")
	  ("w m" toggle-frame-maximized "maxscreen"))
	 "Buffer"
	 (("b e" eval-buffer "eval")
	  ("b l" display-line-numbers-mode "line num" :toggle t)
	  ("b w" whitespace-mode "whitespace" :toggle t)
	  ("b W" whitespace-cleanup "whitespace clean")
	  ("b t" toggle-truncate-lines "truncate lines")
	  ("b c" rainbow-mode "color" :toggle t)) ; #000000 #5F5A60 #CDA869 #red #blue
	 "Coding"
	 (("v" evil-mode "evil mode")
	  ("f" flycheck-mode "flycheck" :toggle t)
	  ("s s" projectile-run-eshell "eshell")
	  ("s v" (lambda() (interactive)
			   (message "try to open vshell")
			   (projectile-run-vterm)
			   (hydra-keyboard-quit)) "vterm")
	  ("c i" imenu "imenu")
	  ("g b" magit-blame-echo)
	  ("g c" magit-blame-cycle-style))
	 "Emacs"
	 (("e p" sfwn/proxy-http-toggle "proxy")))))

(provide 'init-hydra)

;;; init-hydra.el ends here

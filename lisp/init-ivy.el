;;; init-ivy --- init ivy
;;; Commentary:
;;; Code:

;; counsel
(use-package counsel
  :ensure t
  :config
  (counsel-mode 1))

;; ivy
(use-package ivy
  :ensure t
  :demand
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-height 20)
  (setq ivy-re-builders-alist
      '((read-file-name-internal . ivy--regex-fuzzy)
        (t . ivy--regex-plus)))
  (global-set-key (kbd "\C-s") 'swiper)
  (global-set-key (kbd "C-c u") 'swiper-all)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (define-key minibuffer-local-map (kbd "C-M-j") 'ivy-immediate-done)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
  (global-set-key (kbd "s-e") 'counsel-recentf)
)

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode 1))

(provide 'init-ivy)

;;; init-ivy.el ends here

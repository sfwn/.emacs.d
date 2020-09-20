;;; init-hydra --- init hydra
;;; Commentary:
;;; Code:

(global-set-key
 (kbd "C-c h")
 (defhydra hydra-all ()
   "window"
   ("h" windmove-left)
   ("j" windmove-down)
   ("k" windmove-up)
   ("l" windmove-right)
 ))

(provide 'init-hydra)

;;; init-hydra.el ends here

;;; init-java --- init java
;;; Commentary:
;;; Code:

(use-package lsp-java
  :ensure t
  :config
  (add-hook 'java-mode-hook #'lsp)
  (setq lsp-java-vmargs
            `("-noverify"
              "-Xmx1G"
              "-XX:+UseG1GC"
              "-XX:+UseStringDeduplication"
              ,(concat "-Xbootclasspath/a:" "/Users/sfwn/.m2/repository/org/projectlombok/lombok/1.18.8/lombok-1.18.8.jar")))
  )

(provide 'init-java)

;;; init-java.el ends here

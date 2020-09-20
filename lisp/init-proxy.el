;;; init-proxy --- init proxy
;;; Commentary:
;;; Code:

(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
        ("http" . "0.0.0.0:1087")
             ("https" . "0.0.0.0:1087")))

(provide 'init-proxy)

;;; init-proxy.el ends here

;;; init-proxy --- init proxy
;;; Commentary:
;;; Code:

;; Network Proxy

(defconst sfwn/http_proxy "0.0.0.0:1087" "HTTP Proxy")

(defun sfwn/proxy-http-show ()
  "Show HTTP/HTTPS proxy."
  (interactive)
  (if url-proxy-services (message "Current HTTP Proxy is `%s'" sfwn/http_proxy)
	(message "No HTTP Proxy")))

(defun sfwn/proxy-http-enable ()
  "Enable HTTP/HTTPS proxy."
  (interactive)
  (setq url-proxy-services
		`(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
		  ("http" . ,sfwn/http_proxy)
		  ("https" . ,sfwn/http_proxy)))
  (sfwn/proxy-http-show))

(defun sfwn/proxy-http-disable ()
  "Disbale HTTP/HTTPS proxy."
  (interactive)
  (setq url-proxy-services nil)
  (sfwn/proxy-http-show))

(defun sfwn/proxy-http-toggle ()
  "Toggle HTTP/HTTPS proxy."
  (interactive)
  (if (bound-and-true-p url-proxy-services)
	  (sfwn/proxy-http-disable)
	(sfwn/proxy-http-enable)))

(provide 'init-proxy)

;;; init-proxy.el ends here

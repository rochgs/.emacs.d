;; Workaround for bug in Emacs 26.1. It was fixed in 26.3:
;; https://www.reddit.com/r/emacs/comments/cdei4p/failed_to_download_gnu_archive_bad_request/
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(add-to-list 'load-path (file-name-directory load-file-name))
(load-library "init-packages.el")
(load-library "init-appearance.el")

(require 'package)

;; List of packages to install
(setq package-list
      '(
        spacemacs-theme
        )
      )

;; Package repositories
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;;(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;; Activate all the packages
(package-initialize)

;; Fetch the list of available
(unless package-archive-contents
  (package-refresh-contents))

;; Install missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
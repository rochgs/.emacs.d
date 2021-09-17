;; Set straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'which-key)
(straight-use-package 'helm)
(straight-use-package 'projectile)
(straight-use-package 'spacemacs-theme)
(straight-use-package 'smartparens)
(straight-use-package 'enh-ruby-mode)
(straight-use-package 'rbenv)
(straight-use-package 'flymake-ruby)
(straight-use-package 'rubocop)
(straight-use-package 'web-mode)
(straight-use-package 'markdown-mode)
(straight-use-package 'yaml-mode)
(straight-use-package 'yafolding)

(add-to-list 'load-path "~/.emacs.d/init.d/")
(load-library "behaviour.el")
(load-library "packages.el")
(load-library "modes.el")
(load-library "appearance.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-intelephense-files-exclude
   ["**/.git/**" "**/.svn/**" "**/.hg/**" "**/CVS/**" "**/.DS_Store/**"
    "**/node_modules/**" "**/bower_components/**"])
 '(package-selected-packages '(helm spacemacs-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; GENERAL

;; Line number mode
(setq line-number-display-limit-width 1000)
;; Flyspell
(require 'flyspell)
(flyspell-mode +1)
(setq flyspell-sort-corrections nil)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
;; Helm
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(setq helm-boring-buffer-regexp-list (list (rx bol" *") (rx bol"*helm") (rx bol"*straight-process*"eol) (rx bol"*Messages*"eol) (rx bol"*Flymake log*"eol) (rx bol"*RuboCop") (rx bol"*Async-native-compile-log*"eol) (rx bol"*iph") (rx bol"*lsp-log*"eol)))
(setq helm-buffer-max-length nil)
;; Projectile
(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)
;; which-key
(which-key-mode 1)
;; org-mode
;; org-mode ovewrites the default truncate-lines variable
(setq org-startup-truncated nil)
(setq org-startup-folded t)
;; smartparents-mode
(require 'smartparens-config)
(add-hook 'php-mode-hook 'smartparens-mode)
(add-hook 'org-mode-hook 'smartparens-mode)
(add-hook 'markdown-mode-hook 'smartparens-mode)
;; revert-mode
(global-auto-revert-mode)
;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml(\\.erb)?\\'" . yaml-mode))
(add-hook 'yaml-mode-hook
          (lambda ()
            (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
;; js.mode
(setq js-indent-level 2)
;; yafolding
(add-hook 'prog-mode-hook
          (lambda () (yafolding-mode)))
;; https://github.com/zenozeng/yafolding.el/issues/13#issuecomment-234706053
(lambda ()
  (yafolding-show-all)
  (delete-trailing-whitespace))
;; shell-script
(setq sh-basic-offset 2)
;; shell-mode
(setq comint-prompt-read-only t)
;; native-complete (emacs-native-shell-complete)
(add-hook 'shell-mode-hook
          (lambda ()
            (add-hook 'completion-at-point-functions 'native-complete-at-point nil t)))
(with-eval-after-load 'shell
  (native-complete-setup-bash))

;; PHP

;; php-mode
(add-to-list 'auto-mode-alist '("\\.module\\'" . php-mode))
;; phpunit
(eval-after-load 'php-mode
  '(define-key php-mode-map (kbd "C-c t t") 'phpunit-current-test))
(eval-after-load 'php-mode
  '(define-key php-mode-map (kbd "C-c t c") 'phpunit-current-class))
(eval-after-load 'php-mode
  '(define-key php-mode-map (kbd "C-c t p") 'phpunit-current-project))

;; Work-exclusive
;; hcl-mode
(add-to-list 'auto-mode-alist '("\\.tf\\'" . hcl-mode))
(add-to-list 'auto-mode-alist '("\\.tfvars\\'" . hcl-mode))
;; lsp-mode
(require 'lsp-mode)
(setq lsp-keymap-prefix "s-i")
(setq lsp-file-watch-threshold nil)
(add-hook 'php-mode-hook #'lsp)
;; lsp-ui-mode
(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-ui-sideline-show-hover nil)
(setq lsp-ui-sideline-show-code-actions nil)
;; web-mode
(add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))
;; company-mode
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'shell-mode-hook (lambda () (company-mode -1)))
(add-hook 'eshell-mode-hook (lambda () (company-mode -1)))
(add-hook 'org-mode-hook (lambda () (company-mode -1)))
(add-hook 'text-mode-hook (lambda () (company-mode -1)))
;; dape
(use-package dape
  :custom
  (dape-cwd-function 'projectile-project-root))
(let* ((xdebug-plist (cdr (assoc 'xdebug dape-configs)))
       (xdebug-web-plist (copy-sequence xdebug-plist))
       (xdebug-core-plist (copy-sequence xdebug-plist)))
  (setq xdebug-web-plist (plist-put (plist-put (plist-put xdebug-web-plist 'command-cwd "~/")
                                               'prefix-local "/home/rochgs/Code/web/")
                                    'prefix-remote "/var/www/html/"))
  (setq xdebug-core-plist (plist-put (plist-put (plist-put xdebug-core-plist 'command-cwd "~/")
                                                'prefix-local "/home/rochgs/Code/core/")
                                     'prefix-remote "/var/www/html/"))
  (setq dape-configs (append dape-configs `((xdebug-web . ,xdebug-web-plist)
                                            (xdebug-core . ,xdebug-core-plist)))))

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
(setq helm-boring-buffer-regexp-list (list (rx bol" *") (rx bol"*helm") (rx bol"*straight-process*"eol) (rx bol"*Messages*"eol) (rx bol"*Flymake log*"eol) (rx bol"*RuboCop")))
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
(add-hook 'enh-ruby-mode-hook 'smartparens-mode)
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

;; RUBY

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\html.erb\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)
;; rbenv
(require 'rbenv)
(global-rbenv-mode)
;; flymake-ruby
(require 'flymake-ruby)
(add-hook 'enh-ruby-mode-hook 'flymake-ruby-load)
;; rubocop-mode
(setq rubocop-autocorrect-on-save t)
(add-hook 'enh-ruby-mode-hook 'rubocop-mode)
(add-hook 'rubocop-mode
          (lambda ()
            (local-set-key (kbd "C-c r") 'rubocop-format-current-file)))
;; enh-ruby-mode
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
(setq enh-ruby-add-encoding-comment-on-save nil)
(setq enh-ruby-deep-indent-paren nil)
(setq enh-ruby-deep-indent-construct nil)
(add-hook 'enh-ruby-mode-hook
          (lambda ()
            (set-fill-column 100)))
;; rspec-mode
(setq compilation-scroll-output t)
(add-hook 'dired-mode-hook 'rspec-dired-mode)
;; https://github.com/pezra/rspec-mode#debugging
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

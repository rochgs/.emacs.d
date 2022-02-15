;; Flyspell
(require 'flyspell)
(flyspell-mode +1)
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(setq flyspell-sort-corrections nil)
;; Helm
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(setq helm-boring-buffer-regexp-list (list (rx bol" *") (rx bol"*helm") (rx bol"*straight-process*"eol) (rx bol"*Messages*"eol) (rx bol"*Flymake log*"eol)))
;; Projectile
(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)
;; which-key
(which-key-mode 1)
;; org-mode
;; org-mode ovewrittes the default truncate-lines variable
(setq org-startup-truncated nil)
;; smartparents-mode
(require 'smartparens-config)
(add-hook 'enh-ruby-mode-hook 'smartparens-mode)
(add-hook 'org-mode-hook 'smartparens-mode)
(add-hook 'markdown-mode-hook 'smartparens-mode)
;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
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
;; rever-mode
(global-auto-revert-mode)
;; rubocop-mode
(add-hook 'enh-ruby-mode-hook
  (lambda ()
    (local-set-key (kbd "C-c r") 'rubocop-format-current-file))) 
;; enh-ruby-mode
(add-to-list 'auto-mode-alist
  '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
(setq enh-ruby-add-encoding-comment-on-save nil)
(setq enh-ruby-deep-indent-paren nil)
(setq enh-ruby-deep-indent-construct nil)
;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
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

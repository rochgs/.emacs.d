;; Sources
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             t)

;; Packages
(use-package coterm
  :ensure t
  ;; coterm should be loaded before opening any shell session or it's not loaded
  ;; properly.
  :demand t
  :config (coterm-mode)
  :bind (:map comint-mode-map
              ("C-;" . coterm-char-mode-cycle)))
(use-package dash
  :ensure t)
(use-package smartparens
  :ensure t
  :after (dash)
  :hook (prog-mode text-mode markdown-mode)
  :config (require 'smartparens-config))
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))
(use-package markdown-mode
  :ensure t
  :mode
  ("\\.md\\'" . markdown-mode)
  ("README\\.md\\'" . gfm-mode))

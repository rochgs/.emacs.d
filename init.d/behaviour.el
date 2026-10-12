;; Default modes
(repeat-mode)
(which-key-mode)
(column-number-mode)
(global-auto-revert-mode)
(fido-vertical-mode)

;; General settings
(setq make-backup-files nil)
(setq-default indent-tabs-mode nil)
(setq-default fill-column 80)
(setq line-number-display-limit-width 1000)

;; General keybinding
(global-set-key (kbd "C-c c") 'save-buffers-kill-emacs)

;; Spellcheck settings
(with-eval-after-load "ispell"
  ;; Configure `LANG`, otherwise ispell.el cannot find a 'default
  ;; dictionary' even though multiple dictionaries will be configured
  ;; in next line.
  (setenv "LANG" "en_US.UTF-8")
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "es_ES,en_US")
  ;; ispell-set-spellchecker-params has to be called
  ;; before ispell-hunspell-add-multi-dic will work
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "es_ES,en_US"))
;; For saving words to the personal dictionary, don't infer it from
;; the locale, otherwise it would save to ~/.hunspell_es.
(setq ispell-personal-dictionary "~/.hunspell_personal")
;; The personal dictionary file has to exist, otherwise hunspell will
;; silently not use it.
(unless (file-exists-p ispell-personal-dictionary)
  (write-region "" nil ispell-personal-dictionary))
;; Flyspell
(setq flyspell-sort-corrections nil)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; org-mode
;; org-mode overwrites the default truncate-lines variable
(setq org-startup-truncated nil)
(setq org-startup-folded t)

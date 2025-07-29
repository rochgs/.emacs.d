(show-paren-mode 1)
(repeat-mode 1)
(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(setq initial-scratch-message nil)
(setq visible-bell t)
(setq-default column-number-mode t)
(setq-default indent-tabs-mode nil)
(setq-default fill-column 80)

;; General keybinding
(global-set-key (kbd "C-c c") 'save-buffers-kill-emacs)

;; Multiple dictionaries for ispell/flyspell
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

;; Indent-region-of-buffer
(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))
(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (whitespace-cleanup-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (indent-buffer)
        (whitespace-cleanup)
        (message "Indented buffer.")))))
(global-set-key (kbd "C-c i") 'indent-region-or-buffer)

;; Rename file & buffer
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;; Required by GUI when started outside a shell:
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match
that used by the user's shell.

This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$" "" (shell-command-to-string
                                          "$SHELL --login -c 'echo $PATH'"
                                          ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

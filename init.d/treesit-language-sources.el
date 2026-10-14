(defvar treesit-language-source-alist nil)

;; Add grammar sources:
(dolist (source '((markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "v0.4.1" "tree-sitter-markdown/src")
                  (markdown-inline "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "v0.4.1" "tree-sitter-markdown-inline/src")))
  (add-to-list 'treesit-language-source-alist source))

(when (and treesit-language-source-alist
           (require 'treesit nil t))
  (dolist (source treesit-language-source-alist)
    (unless (treesit-ready-p (car source) t)
      (treesit-install-language-grammar (car source)))))

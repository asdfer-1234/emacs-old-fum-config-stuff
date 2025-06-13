(require 'asd-package)
(require 'lsp-mode)
(require 'asd-autocomplete)
(require 'autoclose)
(require-package 'rustic)

(defun asd--rustic-mode-hook ()
  (setq autoclose-auto-pairs '((?\( . ?\)) (?{ . ?}) (?\[ . ?\]) (?\" . ?\"))
        autoclose-pairs '((?\( . ?\)) (?{ . ?}) (?\[ . ?\]) (?\" . ?\") (?' . ?') (?< . ?>))
        autoclose-auto-string-pairs '(("/*" . "*/")))
  (indent-tabs-mode -1))

(add-hook 'rustic-mode-hook #'asd--rustic-mode-hook)

(defun asd--rustic-save-hook ()
  (when (derived-mode-p 'rustic-mode) (lsp-format-buffer)))

(add-hook 'before-save-hook #'asd--rustic-save-hook)

(ligature-set-ligatures 'rustic-mode '("->" "=>" "<=" ">=" "::" "::<" ".." "..=" "&&" "||" "||=" "\\\\" "\\n" "//" "/*" "*/" "<<" ">>" "<<=" ">>=" "www" "==" "!="))


(provide 'asd-language-rust)

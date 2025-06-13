(require 'asd-package)
(require 'flycheck)
(require 'elisp-mode)
(require 'autoclose)
(require-package 'rainbow-delimiters)
(require-package 'highlight-defined)
(require-package 'helpful)

(defun asd--emacs-lisp-mode-hook ()
  (rainbow-delimiters-mode)
  (company-mode)
  (highlight-defined-mode)
  (indent-tabs-mode -1)
  (setq autoclose-pairs '((?\( . ?\)) (?\[ . ?\]) (?\" ?\"))
        autoclose-auto-pairs autoclose-pairs))

(add-hook 'emacs-lisp-mode-hook #'asd--emacs-lisp-mode-hook)

(setq-default rainbow-delimiters-outermost-only-face-count 1
              rainbow-delimiters-max-face-count 2
              flycheck-emacs-lisp-load-path 'inherit
              flycheck-disabled-checkers '(emacs-lisp-checkdoc))

(ligature-set-ligatures 'elisp-mode '(">=" "<=" "\\n" "\\\\"))

(provide 'asd-language-emacs-lisp)

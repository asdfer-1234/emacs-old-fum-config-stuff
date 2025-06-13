(require 'asd-package)

(require-package 'lsp-mode)
(require 'lsp-mode)
(setq lsp-inlay-hint-enable t)

(require-package 'flycheck)
(require 'flycheck)
(require-package 'flycheck-inline)
(add-hook 'flycheck-mode-hook 'flycheck-inline-mode)

(require 'asd-undo-tree)
(require 'asd-autocomplete)
(require-package 'editorconfig)
(editorconfig-mode)

(require 'autoclose)

(add-hook 'prog-mode-hook 'hs-minor-mode) ;; Mode for folding

(add-hook 'prog-mode-hook #'autoclose-mode)
(add-hook 'text-mode-hook #'hl-line-mode)
(add-hook 'text-mode-hook #'company-mode)
(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'dired-mode-hook #'hl-line-mode)

(require 'asd-language-cc)
(require 'asd-language-rust)
(require 'asd-language-shell)
(require 'asd-language-emacs-lisp)
(require 'asd-language-org)
(require 'asd-language-sql)
(require 'asd-language-web)
(require 'asd-language-haskell)
(require 'asd-language-cs-unity)

(with-eval-after-load (global-flycheck-mode))

(require-package 'sudo-edit)
(require 'sudo-edit)

(add-hook 'occur-hook
          #'(lambda ()
              (switch-to-buffer-other-window "*Occur*")))


(provide 'asd-editing)

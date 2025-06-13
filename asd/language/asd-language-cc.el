(require 'asd-package)

(require-package 'cmake-mode)

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)


(provide 'asd-language-cc)

(require 'asd-input-common)
(require 'fum)
(with-eval-after-load 'fum (fum-mode))


(require-package 'which-key)
(eval-after-load 'which-key (which-key-mode))
(setq-default line-move-visual nil)

(provide 'asd-input)

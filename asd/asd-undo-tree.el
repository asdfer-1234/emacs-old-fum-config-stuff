(require 'asd-package)

(require-package 'undo-tree)
(require 'undo-tree)
(with-eval-after-load 'undo-tree
  (setq undo-tree-auto-save-history nil)
  (global-undo-tree-mode))

(provide 'asd-undo-tree)

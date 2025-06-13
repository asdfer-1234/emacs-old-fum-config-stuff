(let ((default-directory (expand-file-name "~/.config/emacs")))
  (normal-top-level-add-subdirs-to-load-path))
(require 'asd)

(put 'line-number-mode 'disabled t)

(require 'asd-package)

(require-package 'web-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(defun asd-web-mode-hook ()
  (indent-tabs-mode)
  (message "fffff")
  (setq indent-tabs-mode t)
  (web-mode-use-tabs)
  )

(add-hook 'web-mode-hook 'asd-web-mode-hook)


(provide 'asd-language-web)

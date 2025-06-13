
(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(defun require-package (package)
  (require 'package)
  (unless (member package package-selected-packages)
    (add-to-list 'package-selected-packages package t))
  (unless (package-installed-p package)
    (package-install package)))

(provide 'asd-package)

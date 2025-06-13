(require 'asd-package)

(require-package 'vertico)
(vertico-mode)

(require-package 'marginalia)
(marginalia-mode)

(require-package 'consult)

(defun auto-create-missing-dirs ()
  (let ((target-dir (file-name-directory buffer-file-name)))
    (unless (file-exists-p target-dir)
      (make-directory target-dir t))))

(add-to-list 'find-file-not-found-functions #'auto-create-missing-dirs)


(require-package 'orderless)
(setq completion-styles '(orderless)
      completion-category-defaults nil)


(setq-default find-file-visit-truename t)

(provide 'asd-vertico)

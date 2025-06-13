(require 'asd-package)


(require-package 'org)
(require 'org)
(require-package 'org-bullets)
(require 'org-bullets)

(require-package 'visual-fill-column)
(require 'visual-fill-column)

(add-hook 'org-mode-hook (lambda () (org-indent-mode)(org-bullets-mode) (visual-line-fill-column-mode)))

(setq org-bullets-bullet-list (list "*"))
(setq org-hide-leading-stars t)
(setq-default visual-fill-column-center-text t
              fill-column 120
              org-hide-emphasis-markers t
              org-edit-src-content-indentation 0)

(defface org-base-face '(()) "")

(define-minor-mode org-serif-face-mode
    "Remap the face of org mode default."
    :local t
    :init-value nil
    (if org-serif-face-mode
        ;if true do
        (setq org-base-face-remap-cookie
            (face-remap-add-relative 'default 'org-base-face))
        ;if false do
        (face-remap-remove-relative org-base-face-remap-cookie)))

(add-hook 'org-mode-hook #'org-serif-face-mode)

(provide 'asd-language-org)

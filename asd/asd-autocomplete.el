(require 'asd-package)
(require-package 'company)
(require-package 'company-fuzzy)

(require 'company)

(with-eval-after-load 'company
  (setq company-idle-delay 0.4
        company-minimum-prefix-length 0
        company-selection-wrap-around t
        company-require-match nil
        company-frontends '(company-pseudo-tooltip-frontend
                            company-preview-common-frontend
                            company-echo-metadata-frontend)
        company-tooltip-align-annotations t
        company-tooltip-offset-display 'lines
        company-show-quick-access 'left
        company-quick-access-modifier 'meta))

;;(require 'company-fuzzy)
;;(with-eval-after-load 'company-fuzzy
;;  (setq company-fuzzy-show-annotation t
;;        company-fuzzy-sorting-backend 'alphabetic)
;;  (add-hook 'company-mode-hook 'company-fuzzy-mode))





(provide 'asd-autocomplete)

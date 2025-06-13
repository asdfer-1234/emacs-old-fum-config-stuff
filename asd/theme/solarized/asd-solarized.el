(defvar asd-solarized-theme
  '("Solarized child theme with tweaks"
    (custom-theme-set-faces
     theme-name

     ;; Selection
     `(region ((,class (:background ,violet-2bg))))

     ;; Line Numbers
     `(line-number ((,class (:weight SemiLight :foreground ,base01))))
     `(line-number-current-line ((,class (:weight SemiLight :foreground ,magenta))))
     
     ;; Multilingual
     `(highlight-defined-function-name-face ((,class (:foreground ,green))))
     `(font-lock-keyword-face ((,class (:foreground ,green :slant oblique))))
     `(highlight-defined-variable-name-face ((,class ())))
     `(font-lock-constant-face ((,class ())))
     `(font-lock-comment-face ((,class (:foreground ,yellow :slant italic))))
     `(font-lock-string-face ((,class (:foreground ,cyan :slant italic))))

     ;; Rust
     `(lsp-inlay-hint-face ((,class (:foreground ,base01 :slant oblique :height ,solarized-height-minus-1))))

     ;; Org
     `(org-base-face ((,class (:foreground ,base2))))
     `(org-level-1 ((,class (:foreground ,base3 :height ,solarized-height-plus-4 :weight bold))))
     `(org-level-2 ((,class (:foreground ,base3 :height ,solarized-height-plus-3 :weight bold))))
     `(org-level-3 ((,class (:foreground ,base3 :height ,solarized-height-plus-2 :weight bold))))
     `(org-level-4 ((,class (:foreground ,base3 :height ,solarized-height-plus-1 :weight bold))))
     `(org-level-5 ((,class (:foreground ,base3 :height ,solarized-height-plus-1 :weight bold))))
     `(org-level-6 ((,class (:foreground ,base3 :height ,solarized-height-plus-1 :weight bold))))
     `(org-level-7 ((,class (:foreground ,base3 :height ,solarized-height-plus-1 :weight bold))))
     `(org-level-8 ((,class (:foreground ,base3 :height ,solarized-height-plus-1 :weight bold))))
     `(org-document-title ((,class (:foreground ,base3 :height ,solarized-height-plus-4 :weight bold :slant italic))))
     
     `(org-block ((,class (:foreground ,base1))))
     `(org-code ((,class (:foreground ,base2 :background ,base02 :height ,solarized-height-minus-1 :box t))))
     `(org-verbatim ((,class (:foreground ,base2 :height ,solarized-height-minus-1))))
     `(org-link ((,class (:foreground ,blue :underline t))))
     
     `(org-document-info-keyword ((,class (:foreground ,base01 :height ,solarized-height-minus-1))))
     `(org-block-begin-line ((,class (:foreground ,base01 :height ,solarized-height-minus-1 :underline t))))
     `(org-block-end-line ((,class (:foreground ,base01 :height ,solarized-height-minus-1 :overline t))))
     `(org-checkbox ((,class (:foreground ,green))))

     ;; Company
     `(company-tooltip-common ((,class (:foreground ,yellow))))

     ;; Rainbow Delimiters
     `(rainbow-delimiters-depth-1-face ((,class (:foreground ,base1 :weight bold))))
     `(rainbow-delimiters-depth-2-face ((,class (:foreground ,base01))))

     ;; Fum
     `(fum-navigation-modeline-face ((,class (:foreground ,base03 :background ,red :weight bold :slant oblique))))
     `(fum-insert-modeline-face ((,class (:foreground ,base03 :background ,yellow :weight bold :slant oblique))))
     `(fum-special-modeline-face ((,class (:foreground ,base03 :background ,blue :weight bold :slant oblique))))
     `(fum-secondary-modeline-face ((,class (:foreground ,base03 :background ,base01 :weight bold :slant oblique))))

     ;; Modeline
     `(mode-line ((,class (:background ,base02 :foreground ,base2))))
     `(mode-line-inactive ((,class (:background ,base03 :foreground ,base2))))
     `(buffer-description-modeline-path-face ((,class (:background ,base02 :foreground ,blue))))
     `(buffer-description-modeline-file-face ((,class (:background ,base02 :foreground ,magenta :weight bold))))
     `(buffer-description-modeline-directory-face ((,class (:background ,base02 :foreground ,blue :weight bold))))
     `(buffer-description-modeline-special-face ((,class (:background ,base02 :foreground ,red :weight bold :slant italic))))
     
     `(buffer-modified-modeline-face ((,class (:background ,base02 :foreground ,yellow))))
     `(point-position-modeline-face ((,class (:background ,base02 :foreground ,base01 :slant italic))))
     `(fcitx5-ime-modeline-face ((,class (:background ,base02 :foreground ,yellow :weight bold))))

     ;; Helpful
     `(helpful-heading ((,class (:slant italic :height ,solarized-height-plus-2))))

     ;; Highlight Indent Guides
     `(indent-guide-face ((,class (:foreground ,magenta))))
     
     ;; Helm (Incomplete and Unused)
     `(helm-source-header ((,class (:foreground ,orange :weight bold))))
     `(helm-buffer-file ((,class ())))
     `(helm-buffer-directory ((,class (:foreground ,blue))))
     `(helm-buffer-modified ((,class (:slant italic))))
     `(helm-ff-file-extension ((,class (:foreground ,yellow))))
     `(helm-ff-dotted-directory ((,class (:foreground ,cyan))))
     `(helm-ff-dotted-symlink-directory ((,class (:foreground ,cyan))))
     )))




(provide 'asd-solarized)


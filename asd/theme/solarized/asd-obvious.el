(require-package 'solarized-theme)
(require 'solarized)
(require 'asd-solarized)
(add-to-list 'load-path "~/.config/emacs/asd/theme/solarized")

(eval-when-compile
  (require 'solarized-palettes))

(defvar asd-obvious-faces
  '("asd-obvious"
    (custom-theme-set-faces
     theme-name

     `(default ((,class (:foreground ,base2))))

     ;; Selection
     `(region ((,class (:background "#ffff00"))))
     `(hl-line ((,class (:background ,base02))))

     ;; Line Numbers
     `(line-number ((,class (:weight SemiLight :foreground ,base2))))
     `(line-number-current-line ((,class (:weight bold :foreground ,base3))))

     ;; Multilingual
     `(font-lock-keyword-face ((,class (:foreground ,blue :slant oblique))))
     `(font-lock-builtin-face ((,class (:foreground ,base3 :weight bold))))
     `(font-lock-type-face ((,class (:foreground ,magenta))))
     `(font-lock-string-face ((,class (:foreground ,cyan :slant italic))))
     `(font-lock-constant-face ((,class ())))
     `(font-lock-variable-name-face ((,class ())))

     `(font-lock-comment-face ((,class (:foreground ,base1 :slant italic))))
     `(font-lock-comment-delimiter-face ((,class (:inherit font-lock-comment-face))))

     `(lsp-inlay-hint-face ((,class (:foreground ,base01 :slant oblique :height ,solarized-height-minus-1))))

     ;; Emacs Lisp
     `(highlight-defined-function-name-face ((,class (:foreground ,blue))))
     `(highlight-defined-variable-name-face ((,class ())))

     ;; Org
     `(org-base-face ((,class (:foreground ,base2))))
     `(org-level ((,class (:foreground ,base3 :height ,solarized-height-plus-1 :weight bold))))
     `(org-level-1 ((,class (:inherit org-level :height ,solarized-height-plus-4))))
     `(org-level-2 ((,class (:inherit org-level :height ,solarized-height-plus-3))))
     `(org-level-3 ((,class (:inherit org-level :height ,solarized-height-plus-2))))
     `(org-level-4 ((,class (:inherit org-level))))
     `(org-level-5 ((,class (:inherit org-level))))
     `(org-level-6 ((,class (:inherit org-level))))
     `(org-level-7 ((,class (:inherit org-level))))
     `(org-level-8 ((,class (:inherit org-level))))
     `(org-document-title ((,class (:foreground ,base3 :height ,solarized-height-plus-4 :weight bold :slant italic))))

     `(org-block ((,class (:foreground ,base1))))
     `(org-code ((,class (:foreground ,base2 :background ,base02))))
     `(org-verbatim ((,class (:foreground ,base2 :height ,solarized-height-minus-1 :weight Light))))
     `(org-link ((,class (:foreground ,blue :underline t))))

     `(org-document-info-keyword ((,class (:foreground ,base01 :height ,solarized-height-minus-1))))
     `(org-block-begin-line ((,class (:foreground ,base01 :height ,solarized-height-minus-1 :underline t))))
     `(org-block-end-line ((,class (:foreground ,base01 :height ,solarized-height-minus-1 :overline t))))
     `(org-checkbox ((,class (:foreground ,green))))

     ;; Markdown
     `(markdown-header-face ((,class (:foreground ,base3 :weight bold :height ,solarized-height-plus-1))))
     `(markdown-header-face-1 ((,class (:inherit markdown-header-face :height ,solarized-height-plus-4))))
     `(markdown-header-face-2 ((,class (:inherit markdown-header-face :height ,solarized-height-plus-3))))
     `(markdown-header-face-3 ((,class (:inherit markdown-header-face :height ,solarized-height-plus-2))))

     ;; Company
     `(company-tooltip-common ((,class (:foreground ,magenta))))

     ;; Rainbow Delimiters
     `(rainbow-delimiters-depth-1-face ((,class (:foreground ,base3 :weight bold))))
     `(rainbow-delimiters-depth-2-face ((,class (:foreground ,base1))))

     ;; Fum
     `(fum-navigation-modeline-face ((,class (:foreground ,base03 :background ,blue :weight bold :slant oblique))))
     `(fum-insert-modeline-face ((,class (:foreground ,base03 :background ,magenta :weight bold :slant oblique))))
     `(fum-special-modeline-face ((,class (:foreground ,base03 :background ,blue :weight bold :slant oblique))))
     `(fum-secondary-modeline-face ((,class (:foreground ,base03 :background ,base01 :weight bold :slant oblique))))

     ;; Modeline
     `(mode-line ((,class (:background ,base02 :foreground ,base2))))
     `(mode-line-active ((,class (:inherit mode-line :background "#ffff00"))))
     `(mode-line-inactive ((,class (:inherit mode-line :background ,base02))))
     `(buffer-description-modeline-path-face ((,class (:foreground ,blue))))
     `(buffer-description-modeline-file-face ((,class (:foreground ,magenta :weight bold))))
     `(buffer-description-modeline-directory-face ((,class (:foreground ,blue :weight bold))))
     `(buffer-description-modeline-special-face ((,class (:foreground ,base3 :weight bold :slant italic))))

     `(buffer-modified-modeline-face ((,class (:foreground ,magenta))))
     `(point-position-modeline-face ((,class (:foreground ,base01 :slant italic))))
     `(fcitx5-ime-modeline-face ((,class (:foreground ,magenta :weight bold))))

     ;; Minibuffer & Vertico
     `(minibuffer-prompt ((,class (:weight bold :foreground ,base3))))
     `(marginalia-file-priv-read ((,class (:foreground ,base3))))
     `(marginalia-file-priv-write ((,class (:foreground ,base3))))
     `(marginalia-file-priv-exec ((,class (:foreground ,base3))))
     `(marginalia-file-priv-dir ((,class (:weight bold :foreground ,blue))))
     `(marginalia-file-priv-link ((,class (:foreground ,cyan))))
     `(marginalia-date ((,class (:foreground ,magenta))))
     `(marginalia-documentation ((,class (:foreground ,base3))))
     `(marginalia-size ((,class (:foreground ,blue))))
     `(vertico-current ((,class (:inherit region))))

     ;; Helpful
     `(helpful-heading ((,class (:weight bold :height ,solarized-height-plus-2))))

     ;; Errors
     `(error ((,class (:foreground ,red))))
     `(warning ((,class (:foreground ,yellow))))
     )))

(deftheme asd-obvious "theme with obvious colors made using the solarized package")
(solarized-create-theme-file-with-palette 'light 'asd-obvious
  '("#000000" "#ffffff"
    "#ffbb00" "#ff6600" "#ff0000" "#ff00ff" "#bb00ff" "#0000ff" "#00bbff" "#00bb00")
  asd-obvious-faces)

(provide-theme 'asd-obvious)
(provide 'asd-obvious)


;; I viewed this file on the most student-being-disrespectful(for a reason) lecture ever
;; Six fucking hours of free time taken away without a warning ofc we're pissed off
;; And omg it turned out to be what we have already done!--a job interview practice!

;; I still love you emacs

;; Is this what people mean when they say they love emacs? leaving comments about their daily lives like this

;; SEVEN HOURS it turned out to be!
;; hilfe bitte

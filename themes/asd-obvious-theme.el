(require 'solarized)
(deftheme asd-obvious
  "The asd-obvious colour theme of Solarized colour theme flavor.")
(solarized-with-color-variables 'light 'asd-obvious
  '((base03 . "#000000") (base02 . "#0b0b0b") (base01 . "#525252")
    (base00 . "#5e5e5e") (base0 . "#7c7c7c") (base1 . "#8b8b8b")
    (base2 . "#eeeeee") (base3 . "#ffffff") (yellow . "#ffbb00")
    (orange . "#ff6600") (red . "#ff0000") (magenta . "#ff00ff")
    (violet . "#bb00ff") (blue . "#0000ff") (cyan . "#00bbff")
    (green . "#00bb00") (yellow-d . "#323013") (yellow-l . "#ffffd9")
    (orange-d . "#341307") (orange-l . "#ffd9cb") (red-d . "#341307")
    (red-l . "#ffd9cb") (magenta-d . "#321531")
    (magenta-l . "#ffdcff") (violet-d . "#321531")
    (violet-l . "#ffdcff") (blue-d . "#180d31") (blue-l . "#e3d0ff")
    (cyan-d . "#183130") (cyan-l . "#e2ffff") (green-d . "#183112")
    (green-l . "#e2ffd7") (yellow-1bg . "#272610")
    (orange-1bg . "#2a1005") (red-1bg . "#2a1005")
    (magenta-1bg . "#271226") (blue-1bg . "#160a26")
    (cyan-1bg . "#152626") (green-1bg . "#15260f")
    (violet-1bg . "#271226") (yellow-1fg . "#ffff73")
    (orange-1fg . "#ff7352") (red-1fg . "#ff7352")
    (magenta-1fg . "#ff7bff") (violet-1fg . "#ff7bff")
    (blue-1fg . "#8a5dff") (cyan-1fg . "#8affff")
    (green-1fg . "#89ff6f") (yellow-2bg . "#605e19")
    (orange-2bg . "#62190c") (red-2bg . "#62190c")
    (magenta-2bg . "#601c5f") (violet-2bg . "#601c5f")
    (blue-2bg . "#22115f") (cyan-2bg . "#225f5e")
    (green-2bg . "#215f18") (yellow-2fg . "#ffff93")
    (orange-2fg . "#ff9475") (red-2fg . "#ff9475")
    (magenta-2fg . "#ff9bff") (violet-2fg . "#ff9bff")
    (blue-2fg . "#aa80ff") (cyan-2fg . "#a9ffff")
    (green-2fg . "#a8ff90"))
  '("asd-obvious"
    (custom-theme-set-faces theme-name
			    `(default ((,class (:foreground ,base2))))
			    `(region
			      ((,class (:background "#ffff00"))))
			    `(hl-line ((,class (:background ,base02))))
			    `(line-number
			      ((,class
				(:weight SemiLight :foreground ,base2))))
			    `(line-number-current-line
			      ((,class
				(:weight bold :foreground ,base3))))
			    `(font-lock-keyword-face
			      ((,class
				(:foreground ,blue :slant oblique))))
			    `(font-lock-builtin-face
			      ((,class
				(:foreground ,base3 :weight bold))))
			    `(font-lock-type-face
			      ((,class (:foreground ,magenta))))
			    `(font-lock-string-face
			      ((,class
				(:foreground ,cyan :slant italic))))
			    `(font-lock-constant-face ((,class nil)))
			    `(font-lock-variable-name-face
			      ((,class nil)))
			    `(font-lock-comment-face
			      ((,class
				(:foreground ,base1 :slant italic))))
			    `(font-lock-comment-delimiter-face
			      ((,class
				(:inherit font-lock-comment-face))))
			    `(lsp-inlay-hint-face
			      ((,class
				(:foreground ,base01 :slant oblique
					     :height
					     ,solarized-height-minus-1))))
			    `(highlight-defined-function-name-face
			      ((,class (:foreground ,blue))))
			    `(highlight-defined-variable-name-face
			      ((,class nil)))
			    `(org-base-face
			      ((,class (:foreground ,base2))))
			    `(org-level
			      ((,class
				(:foreground ,base3 :height
					     ,solarized-height-plus-1
					     :weight bold))))
			    `(org-level-1
			      ((,class
				(:inherit org-level :height
					  ,solarized-height-plus-4))))
			    `(org-level-2
			      ((,class
				(:inherit org-level :height
					  ,solarized-height-plus-3))))
			    `(org-level-3
			      ((,class
				(:inherit org-level :height
					  ,solarized-height-plus-2))))
			    `(org-level-4
			      ((,class (:inherit org-level))))
			    `(org-level-5
			      ((,class (:inherit org-level))))
			    `(org-level-6
			      ((,class (:inherit org-level))))
			    `(org-level-7
			      ((,class (:inherit org-level))))
			    `(org-level-8
			      ((,class (:inherit org-level))))
			    `(org-document-title
			      ((,class
				(:foreground ,base3 :height
					     ,solarized-height-plus-4
					     :weight bold :slant
					     italic))))
			    `(org-block
			      ((,class (:foreground ,base1))))
			    `(org-code
			      ((,class
				(:foreground ,base2 :background
					     ,base02))))
			    `(org-verbatim
			      ((,class
				(:foreground ,base2 :height
					     ,solarized-height-minus-1
					     :weight Light))))
			    `(org-link
			      ((,class
				(:foreground ,blue :underline t))))
			    `(org-document-info-keyword
			      ((,class
				(:foreground ,base01 :height
					     ,solarized-height-minus-1))))
			    `(org-block-begin-line
			      ((,class
				(:foreground ,base01 :height
					     ,solarized-height-minus-1
					     :underline t))))
			    `(org-block-end-line
			      ((,class
				(:foreground ,base01 :height
					     ,solarized-height-minus-1
					     :overline t))))
			    `(org-checkbox
			      ((,class (:foreground ,green))))
			    `(markdown-header-face
			      ((,class
				(:foreground ,base3 :weight bold
					     :height
					     ,solarized-height-plus-1))))
			    `(markdown-header-face-1
			      ((,class
				(:inherit markdown-header-face :height
					  ,solarized-height-plus-4))))
			    `(markdown-header-face-2
			      ((,class
				(:inherit markdown-header-face :height
					  ,solarized-height-plus-3))))
			    `(markdown-header-face-3
			      ((,class
				(:inherit markdown-header-face :height
					  ,solarized-height-plus-2))))
			    `(company-tooltip-common
			      ((,class (:foreground ,magenta))))
			    `(rainbow-delimiters-depth-1-face
			      ((,class
				(:foreground ,base3 :weight bold))))
			    `(rainbow-delimiters-depth-2-face
			      ((,class (:foreground ,base1))))
			    `(fum-navigation-modeline-face
			      ((,class
				(:foreground ,base03 :background ,blue
					     :weight bold :slant
					     oblique))))
			    `(fum-insert-modeline-face
			      ((,class
				(:foreground ,base03 :background
					     ,magenta :weight bold
					     :slant oblique))))
			    `(fum-special-modeline-face
			      ((,class
				(:foreground ,base03 :background ,blue
					     :weight bold :slant
					     oblique))))
			    `(fum-secondary-modeline-face
			      ((,class
				(:foreground ,base03 :background
					     ,base01 :weight bold
					     :slant oblique))))
			    `(mode-line
			      ((,class
				(:background ,base02 :foreground
					     ,base2))))
			    `(mode-line-active
			      ((,class
				(:inherit mode-line :background
					  "#ffff00"))))
			    `(mode-line-inactive
			      ((,class
				(:inherit mode-line :background
					  ,base02))))
			    `(buffer-description-modeline-path-face
			      ((,class (:foreground ,blue))))
			    `(buffer-description-modeline-file-face
			      ((,class
				(:foreground ,magenta :weight bold))))
			    `
			    (buffer-description-modeline-directory-face
			     ((,class (:foreground ,blue :weight bold))))
			    `(buffer-description-modeline-special-face
			      ((,class
				(:foreground ,base3 :weight bold
					     :slant italic))))
			    `(buffer-modified-modeline-face
			      ((,class (:foreground ,magenta))))
			    `(point-position-modeline-face
			      ((,class
				(:foreground ,base01 :slant italic))))
			    `(fcitx5-ime-modeline-face
			      ((,class
				(:foreground ,magenta :weight bold))))
			    `(minibuffer-prompt
			      ((,class
				(:weight bold :foreground ,base3))))
			    `(marginalia-file-priv-read
			      ((,class (:foreground ,base3))))
			    `(marginalia-file-priv-write
			      ((,class (:foreground ,base3))))
			    `(marginalia-file-priv-exec
			      ((,class (:foreground ,base3))))
			    `(marginalia-file-priv-dir
			      ((,class
				(:weight bold :foreground ,blue))))
			    `(marginalia-file-priv-link
			      ((,class (:foreground ,cyan))))
			    `(marginalia-date
			      ((,class (:foreground ,magenta))))
			    `(marginalia-documentation
			      ((,class (:foreground ,base3))))
			    `(marginalia-size
			      ((,class (:foreground ,blue))))
			    `(vertico-current
			      ((,class (:inherit region))))
			    `(helpful-heading
			      ((,class
				(:weight bold :height
					 ,solarized-height-plus-2))))
			    `(error ((,class (:foreground ,red))))
			    `(warning ((,class (:foreground ,yellow)))))))
(provide-theme 'asd-obvious)
(provide 'asd-obvious-theme)

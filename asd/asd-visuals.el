(require 'asd-package)

(defun remove-gui ()
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

(remove-gui)

(setq inhibit-startup-screen t)
(setq-default cursor-type 'bar)
(fset 'menu-bar-open nil)

(set-fontset-font "fontset-default" 'hangul "Noto Sans CJK KR")
(set-fontset-font "fontset-default" 'han "Noto Sans CJK KR")
;; 漢汉 all good?

(add-to-list 'default-frame-alist '(font . "Cascadia Code"))
(setq x-underline-at-descent-line t)
(require 'default-text-scale)
(setq default-text-scale-amount 20)
(require 'asd-theme)
(require 'asd-ligature)

(require-package 'spacious-padding)
(require 'spacious-padding)

(setq spacious-padding-widths
  '( :internal-border-width 15
     :header-line-width 10
     :mode-line-width 0
     :tab-width 4
     :right-divider-width 30
     :scroll-bar-width 8
     :fringe-width 8))

(spacious-padding-mode)


(provide 'asd-visuals)

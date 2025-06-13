(require 'asd-package)
(add-to-list 'load-path "~/.config/emacs/asd/theme/solarized")


(require-package 'solarized-theme)
(require 'solarized)
(require 'asd-solarized)
(eval-when-compile
  (require 'solarized-palettes))

(deftheme asd-solarized-dark "Solarized dark with tweaks")
(solarized-with-color-variables
 'dark 'asd-solarized-dark solarized-dark-color-palette-alist asd-solarized-theme)

(provide-theme 'asd-solarized-dark)


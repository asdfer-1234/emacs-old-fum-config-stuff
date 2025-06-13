(require 'asd-package)
(add-to-list 'load-path "~/.config/emacs/asd/theme/solarized")

(require-package 'solarized-theme)
(require 'solarized)
(require 'asd-solarized)
(eval-when-compile
  (require 'solarized-palettes))

(deftheme asd-solarized-light "Solarized light with tweaks")
(solarized-with-color-variables
 'light 'asd-solarized-light solarized-light-color-palette-alist asd-solarized-theme)

(solarized-create-theme-file-with-palette 'light 'asdf-obvious
  '("#000000" "#ffffff"
    "#dddd00" "#ffdd00" "#ff0000" "#ff00ff" "#dd00ff" "#0000ff" "#ff00ff" "#00dd00")
  asdftheme t)



(provide-theme 'asd-solarized-light)

(require 'asd-package)

(require-package 'popwin)

(popwin-mode)
(add-to-list 'popwin:special-display-config '("\*helpful" :regexp t))
(add-to-list 'popwin:special-display-config '("*cargo-run*"))
(add-to-list 'popwin:special-display-config '("*cargo-add*"))
(add-to-list 'popwin:special-display-config '("*cargo-rm*"))
(add-to-list 'popwin:special-display-config '("*cargo-check*"))
(add-to-list 'popwin:special-display-config '("*cargo-init*"))
(add-to-list 'popwin:special-display-config '("*cargo-test*"))
(add-to-list 'popwin:special-display-config '("*rustic-compilation*"))
(add-to-list 'popwin:special-display-config '("*lsp-help*"))

(provide 'asd-windows)

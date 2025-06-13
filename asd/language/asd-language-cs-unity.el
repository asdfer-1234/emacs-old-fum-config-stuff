(require 'asd-package)

(setenv "FrameworkPathOverride" "/lib/mono/4.5")

(require-package 'csharp-mode)

(defun my/csharp-mode-hook ()
  (setq-local lsp-auto-guess-root t)
  (lsp))
(add-hook 'csharp-mode-hook #'my/csharp-mode-hook)
(setenv "DOTNET_ROOT" "/usr/share/dotnet")

(provide 'asd-language-cs-unity)

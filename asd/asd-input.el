(require 'asd-input-common)
(require 'fum)
(with-eval-after-load 'fum (fum-mode))

(require 'fcitx5)

(defvar fum-insert-fcitx5-status (fcitx5-current-input-method))
(defun integrate-fcitx5-fum ()
  (add-hook 'fum-navigation-mode-hook
            (lambda () (when fum-navigation-mode
                         (setq fum-insert-fcitx5-status (fcitx5-current-input-method))
                         (fcitx5-deactivate))))
  (add-hook 'fum-insert-mode-hook
            (lambda () (when fum-insert-mode
                         (fcitx5-set-input-method fum-insert-fcitx5-status))))
  (fcitx5-deactivate))

(integrate-fcitx5-fum)

(require-package 'which-key)
(eval-after-load 'which-key (which-key-mode))
(setq-default line-move-visual nil)

(provide 'asd-input)

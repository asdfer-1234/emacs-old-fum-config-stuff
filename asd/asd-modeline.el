(require 'fum)
(require 'asd-package)
(require-package 's)
(require 's)

(defmacro modeline-segment (name display hooks)
  "Defines a segment for modeline.
variable NAME will be defined and updated on the specified hooks"
  (let ((function-symbol (make-symbol (concat "update-" (symbol-name name))))
        (expand-list ()))
    (list 'progn
          (list 'defvar-local name "")
          (list 'defun function-symbol ()
                '(interactive)
                (list 'setq name display)
                '(force-mode-line-update))
          (let ((hook-adding-list ()))
            (while hooks
              (add-to-list 'hook-adding-list (list 'add-hook (car hooks) (list 'quote function-symbol)))
              (setq hooks (cdr hooks)))
            (add-to-list 'hook-adding-list 'progn)
            hook-adding-list))))


(defface buffer-description-modeline-file-face '(()) "")
(defface buffer-description-modeline-path-face '(()) "")
(defface buffer-description-modeline-directory-face '(()) "")
(defface buffer-description-modeline-special-face '(()) "")

(defface buffer-modified-modeline-face '(()) "")

(defun propertize-regexp (regexp str &rest property)
  (let ((matches (s-matched-positions-all regexp (substring-no-properties str))))
    (while matches
      (let ((match (car matches)))
        (add-text-properties (car match) (cdr match) property str))
      (setq matches (cdr matches)))
    str))

(defun style-path-modeline (path)
  "Styles directory name for modeline usage."
  (setq path (propertize (replace-regexp-in-string (file-truename "~") "~" path) 'face 'buffer-description-modeline-path-face))
  (message path)
  (setq path (propertize-regexp "[^/]*/?$" path 'face 'buffer-description-modeline-directory-face))
  (setq path (propertize-regexp "[^/]*$" path 'face 'buffer-description-modeline-file-face))
  path)

(defface fum-insert-modeline-face '(()) "")
(defface fum-navigation-modeline-face '(()) "")
(defface fum-special-modeline-face '(()) "")
(defface fum-secondary-modeline-face '(()) "")

(modeline-segment fum-status-modeline
                  (concat
                   (cond ((eq fum-state 'fum-navigation-mode) (propertize " Nav " 'face 'fum-navigation-modeline-face))
                         ((eq fum-state 'fum-insert-mode) (propertize " Ins " 'face 'fum-insert-modeline-face))
                         ((eq fum-state 'fum-dired-mode) (propertize " Dir " 'face 'fum-special-modeline-face))
                         ((eq fum-state 'fum-occur-mode) (propertize " Occ " 'face 'fum-special-modeline-face))
                         ((eq fum-state 'fum-scale-adjustment-mode) (propertize " +T- " 'face 'fum-secondary-modeline-face)))
                   " ")
                  ('fum-navigation-mode-hook 'fum-insert-mode-hook 'fum-dired-mode-hook 'fum-occur-mode-hook 'fum-scale-adjustment-mode-hook))

(modeline-segment buffer-description-modeline
                  (concat
                   (cond
                    ((derived-mode-p 'dired-mode) (style-path-modeline default-directory))
                    (buffer-file-name
                     (style-path-modeline (buffer-file-name)))
                    (t (propertize (buffer-name) 'face 'buffer-description-modeline-special-face)))
                   " ")
                   ('buffer-list-update-hook 'emacs-startup-hook))

(modeline-segment buffer-modified-modeline
                  (if (buffer-file-name) (propertize "* " 'face 'buffer-modified-modeline-face) "")
                  ('first-change-hook))

(modeline-segment buffer-modified-modeline
                  (progn (message "a") "")
                  ('after-save-hook))

(defface point-position-modeline-face '(()) "")

(modeline-segment point-position-modeline
                  (when (not (derived-mode-p 'dired-mode))
                    (propertize (format-mode-line "%l:%c ") 'face 'point-position-modeline-face))
                  ('post-command-hook))


(require 'asd-input)
(defface fcitx5-ime-modeline-face '(()) "")
(modeline-segment fcitx5-ime-modeline
                  (when (eq (fum-state-selection) 'fum-navigation-mode)
                    (let ((ime (if (eq fum-state 'fum-insert-mode)
                                   (fcitx5-current-input-method)
                                 fum-insert-fcitx5-status)))
                      (propertize (concat (cond
                                           ((string= ime "keyboard-us") "A")
                                           ((string= ime "keyboard-us-colemak") "A")
                                           ((string= ime "keyboard-us-colemak_asdfer") "A")
                                           ((string= ime "hangul") "가")
                                           (t ime))
                                          " ")
                                  'face 'fcitx5-ime-modeline-face)))
                  ('post-command-hook))



(setq-default mode-line-format
              (list
               '(:eval fum-status-modeline)
               '(:eval fcitx5-ime-modeline)
               '(:eval buffer-description-modeline)
               '(:eval buffer-modified-modeline)
               '(:eval point-position-modeline)))

(provide 'asd-modeline)

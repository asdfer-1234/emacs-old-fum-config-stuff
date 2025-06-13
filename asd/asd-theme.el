(add-to-list 'custom-theme-load-path "~/.config/emacs/asd/theme/solarized")

(require 'asd-obvious)

(load-theme 'asd-obvious t)

(defun disable-all-themes ()
  "Disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))


(defun change-theme (theme)
  (interactive
   (list
    (intern (completing-read "Load custom theme: "
                             (mapcar #'symbol-name
				     (custom-available-themes))))))
  (disable-all-themes)
  (load-theme theme t))

(defvar theme-types '((asd-solarized-dark asd-solarized-light)))

(defun cycle-theme-type ()
  (interactive)
  (dolist (theme theme-types)
    (let (next-theme)
      (dolist (type theme)
        (if next-theme
            (progn (change-theme type)
                   (setq next-theme nil))
          (when (eq (car custom-enabled-themes) type)
            (setq next-theme t)))
        (when next-theme
          (change-theme (car theme)))))))

(provide 'asd-theme)

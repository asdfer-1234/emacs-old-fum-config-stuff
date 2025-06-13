

(defun fcitx5-current-input-method ()
  (substring (shell-command-to-string "fcitx5-remote -n") 0 -1))

(defun fcitx5-set-input-method (method)
  (call-process "/bin/fcitx5-remote" nil nil nil "-s" method))

(defun fcitx5-deactivate ()
  (interactive)
  (call-process "/bin/fcitx5-remote" nil nil nil "-c"))

(defun fcitx5-activate ()
  (interactive)
  (call-process "/bin/fcitx5-remote" nil nil nil "-o"))

(provide 'fcitx5)

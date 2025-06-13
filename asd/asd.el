;; package manager

(require 'asd-early)

(require 'asd-package)
(require-package 'default-text-scale)

(setq make-backup-files nil)
(setq auto-save-default nil)

(require 'asd-visuals)
(require 'asd-windows)

(require 'asd-vertico)
(require 'asd-recent-files)

(require 'asd-editing)
(require 'asd-scroll)
(require 'asd-input)

;; FUCK YOU CUSTOMIZE.EL
(setq custom-file "~/.config/emacs/custom-dump.el")
(require 'asd-modeline)


(defun suppress-messages (old-fun &rest args)
  (cl-flet ((silence (&rest args1) (ignore)))
    (advice-add 'message :around #'silence)
    (unwind-protect
         (apply old-fun args)
      (advice-remove 'message #'silence))))

(provide 'asd)


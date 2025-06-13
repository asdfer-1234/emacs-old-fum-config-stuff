
(defmacro fum-defmode (mode doc lighter &rest body)
  "Define a fum mode.
MODE-NAME will be the mode name.
DOC is the docstring of the mode function
LIGHTER to set the mode label on bar
BODY will get evaled when mode gets turned on/off"
  (list 'define-minor-mode mode doc
	:interacive nil
	:lighter lighter
	`(progn ,@body
                ())))

(defvar fum-state nil "The current state fum-mode is in. Change only by using `fum-state-set'")
(make-variable-buffer-local 'fum-state)

(defun fum-state-set (state)
  "Set the fum mode and change the minor-mode to state."
  (when fum-state
    (funcall fum-state -1))
  (setq fum-state state)
  (when fum-state
    (funcall fum-state)))

(defun fum-state-default ()
  "Set the fum state to default by using fum-mode-selection"
  (interactive)
  (fum-state-set (fum-state-selection)))

(define-minor-mode fum-local-mode nil
  :lighter "fum"
  (if fum-local-mode
      (fum-state-default)
    (fum-state-set nil)))

(defun fum-state-selection () "Redefine this function to select default fum behaviour." nil)

(define-globalized-minor-mode fum-mode fum-local-mode
  (lambda () (fum-local-mode)))

(provide 'fum-core)


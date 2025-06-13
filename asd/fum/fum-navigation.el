(require 'fum-core)
(require 'dash)
(require 'autoclose)

(defvar fum-kill-line nil "Whether the clipboard holds a line-based data or not. For yanking.")
(make-variable-buffer-local 'fum-line-ring)
(defvar fum-line-marker nil "The mark replacement for line selections.")
(make-variable-buffer-local 'fum-line-marker)

(defun fum-whitespacep (char)
  "Return t if CHAR is a space, a tab, or a newline character, otherwise nil"
  (or (eq char ?\s) (eq char ?\t) (eq char ?\n)))

(defun fum-indentp (char)
  "Return t if CHAR is a space or a tab, otherwise nil"
  (or (eq char ?\s) (eq char ?\t)))

(defun fum-endlinep (char)
  "Return t if CHAR is \\n or nil, otherwise nil"
  (or (eq char ?\n) (eq char nil)))

(defun fum-beginning-of-code ()
  "Move point to start of code(before indentation if any).
Alias of `back-to-indentation'"
  (interactive "^")
  (back-to-indentation))

(defun fum-end-of-code ()
  "Move point to end of code(before trailing whitespaces if any)."
  (interactive "^")
  (let ((before-point (point)))
    (end-of-line)
    (while (fum-indentp (char-before))
      (backward-char))))

(defun fum-toggle-point-positions (a b)
  "Goto point A calling the function, if point did not change goto point B."
  (let ((before-point (point)))
    (funcall a)
    (when (eq before-point (point))
      (funcall b))))

(defun fum-toggle-beginning-of-code-line ()
  "Toggle point between `beginning-of-code' and `beginning-of-line'"
  (interactive "^")
  (fum-toggle-point-positions 'fum-beginning-of-code 'beginning-of-line))

(defun fum-toggle-end-of-line-code ()
  "Toggle point between `end-of-line' and `end-of-code'"
  (interactive "^")
  (fum-toggle-point-positions 'end-of-line 'fum-end-of-code))

(defun fum-point-in-indentation ()
  "Return t if only whitespace exists point leftward, otherwise nil"
  (save-excursion
     (while (fum-indentp (char-before))
       (backward-char))
     (fum-endlinep (char-before))))

(defun backward-char-jump-indentation ()
  "Move to beginning of line when in indentation, otherwise `backward-char'"
  (interactive "^")
  (if (fum-point-in-indentation)
      (let ((before-point (point)))
	(beginning-of-line)
	(when (eq before-point (point))
	  (backward-char)))
    (backward-char)))

(defun fum-forward-char-jump-indentation ()
  "Move to beginning of code when in indentation, otherwise `forward-char'"
  (interactive "^")
  (if (eq (char-after) ?\n)
      (forward-char)
    (forward-char)
    (when (fum-point-in-indentation)
      (fum-beginning-of-code))))


(defun fum-delete-backward-char-jump-indentation ()
  "Delete until beginning of line when in indentation, `delete-backward-char'"
  (interactive)
  (if (use-region-p)
      (delete-active-region)
    (if (fum-point-in-indentation)
        (progn (delete-char -1)
               (while (fum-indentp (char-before))
                 (delete-char -1)))
      (if (autoclose-mode) (autoclose-delete-pair-or-char) (delete-char -1)))))

(defun fum-delete-backward-char-jump-directory ()
  "Delete a character, When deleting / delete until another / is found."
  (interactive)
  (if (use-region-p)
      (delete-active-region)
    (if (eq (char-before) ?/)
        (progn (delete-char -1)
               (while (not (eq (char-before) ?/))
                 (delete-char -1)))
      (delete-char -1))))

(defun fum-backward-delete-sexp ()
  (interactive)
  (let (kill-ring)
    (backward-kill-sexp)))

(defun fum-forward-delete-sexp ()
  (interactive)
  (forward-sexp)
  (fum-backward-delete-sexp))

(defun fum-beginning-of-line-at-position (position)
  (save-excursion
    (goto-char position)
    (beginning-of-line)
    (point)))

(defun fum-end-of-line-at-position (position)
  (save-excursion
    (goto-char position)
    (end-of-line)
    (point)))

(defun fum-delete ()
  (interactive)
  (if (region-active-p)
      (delete-active-region)
    (delete-line)
    (fum-beginning-of-code)))

(defun fum-kill-region ()
  (interactive)
  (if (region-active-p)
      (progn (if fum-line-marker
		 (setq fum-kill-line t)
	       (setq fum-kill-line nil))
	     (kill-region nil nil t)
	     (when fum-line-marker
	       (delete-line)))
    (setq fum-kill-line t)
    (kill-region (line-beginning-position) (line-end-position))
    (delete-line)))

(defun fum-kill-region-save ()
  (interactive)
  (let ((buffer-read-only t))
    (fum-kill-region)))

(defun fum-yank ()
  (interactive)
  (when fum-kill-line
    (end-of-line)
    (newline))
  (yank))

(defun fum-line-mark ()
  (interactive)
  (setq fum-line-marker (point-marker))
  (push-mark (line-beginning-position) t t))

(defun fum-sexp-mark ()
  (interactive)
  (backward-sexp)
  (mark-sexp))

(defun fum-update-line-mark ()
  (if (and (region-active-p) fum-line-marker)
      (if (<= (point) fum-line-marker)
	  (progn (set-mark (fum-end-of-line-at-position fum-line-marker)) (beginning-of-line))
	(progn (set-mark (fum-beginning-of-line-at-position fum-line-marker)) (end-of-line)))
    (setq fum-line-marker nil)))

(defun fum-update-line-hook ()
  (if fum-local-mode
      (add-hook 'post-command-hook 'fum-update-line-mark nil t)
    (remove-hook 'post-command-hook 'fum-update-line-mark t)))

(defun fum-open-config ()
  "Open asd.el"
  (interactive)
  (find-file "~/.config/emacs/asd/asd.el"))

(require 'dired)

(defun dired-first-line ()
  "Move dired cursor to first line by a very disturbing and emacs implementation."
  (interactive)
  (goto-char (point-min))
  (dired-next-line 1))

(defun dired-last-line ()
  "Move dired cursor to last line by a very disturbing and emacs implementation"
  (interactive)
  (goto-char (point-max))
  (dired-previous-line 1))

(add-hook 'fum-local-mode-hook 'fum-update-line-hook)

(provide 'fum-navigation)

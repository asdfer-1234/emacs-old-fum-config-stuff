(require 'dash)

(defun cons-eq (a b)
  (and (eq (car a) (car b)) (eq (cdr a) (cdr b))))

(defvar autoclose-pairs '((?\' . ?\') (?\" . ?\") (?\( . ?\)) (?{ . ?}) (?\[ . ?\]) (?< . ?>))
  "Pairs used by autoclose")

(defvar autoclose-auto-pairs '((?\" . ?\") (?\( . ?\)) (?{ . ?}) (?\[ . ?\]))
  "Pairs to be autoclosed")


(defvar autoclose-auto-string-pairs '())

(defun autoclose--insert-after-point (s) (save-excursion (insert s)))

(defun autoclose-insert-closer (pair)
  (autoclose--insert-after-point (cdr pair)))

(defun autoclose-close-if-possible (pair)
  (when (eq (char-after) (cdr pair))
         (delete-char 1) t))

(defun autoclose--match-point-before (pattern)
  (and (>= (- (point) (length pattern)) 1)
       t ;(eq (car (last (string-to-list pattern))) last-command-event)
       (string-equal (buffer-substring (- (point) (length pattern))
                                       (point))
                     pattern)))

(defun autoclose-get-string-pair ()
  (-first #'(lambda (pair)
              (autoclose--match-point-before (car pair)))
          autoclose-auto-string-pairs))


(defun autoclose--auto-close-string-pairs ()
  (let ((pair (autoclose-get-string-pair)))
    (when pair
      (autoclose--insert-after-point (cdr pair)))))

(defun autoclose--auto-close-pairs ()
  (or (autoclose--auto-close-string-pairs)
      (let ((pair (rassoc last-command-event
                          autoclose-pairs)))
        (when pair (autoclose-close-if-possible pair)))
      (let ((pair (assoc last-command-event
                         autoclose-auto-pairs)))
        (when pair (autoclose-insert-closer pair)))))

(defun autoclose-delete-surrounding ()
  (delete-char 1)
  (delete-char -1))

(defun autoclose-surrounded-by-pair ()
  (-first #'(lambda (x) (cons-eq x (cons (char-before) (char-after)))) autoclose-pairs))

(defun autoclose-delete-pair-or-char ()
  (if (autoclose-surrounded-by-pair)
      (autoclose-delete-surrounding)
    (backward-delete-char 1)))

(defun autoclose-wrap-region (pair)
  "Wrap the region with the pair provided."
  (when (use-region-p)
    (let (beg end deactivate-mark)
      (save-excursion
        (narrow-to-region (region-beginning) (region-end))
        (goto-char (point-min))
        (insert (car pair))
        (goto-char (point-max))
        (insert (cdr pair))
        (setq beg (point-min)
              end (point-max))
        (widen))
      (if (< (mark) (point))
          (progn  (goto-char end) (set-mark beg) )
        (progn (goto-char beg) (set-mark end)))
      (activate-mark))))

(defmacro autoclose-define-wrap-region (characters opener closer)
  (list 'defun (intern (concat "autoclose-wrap-region-" (symbol-name characters))) ()
        '(interactive)
        (list 'autoclose-wrap-region (list 'cons opener closer))))


(autoclose-define-wrap-region parens ?\( ?\))
(autoclose-define-wrap-region braces ?\{ ?\})
(autoclose-define-wrap-region brackets ?\[ ?\])
(autoclose-define-wrap-region angled-brackets ?< ?>)
(autoclose-define-wrap-region single-quotes ?\' ?\')
(autoclose-define-wrap-region double-quotes ?\" ?\")
(autoclose-define-wrap-region asterisks ?* ?*)
(autoclose-define-wrap-region slashes ?/ ?/)
(autoclose-define-wrap-region underscores ?\\ ?\\)
(autoclose-define-wrap-region tildes ?~ ?~)
(autoclose-define-wrap-region equals ?= ?=)
(autoclose-define-wrap-region backquotes ?` ?`)


(define-minor-mode autoclose-mode
  "Automatically closes variable-defined parens when they are inserted."
  :lighter " Autoclose"
  (if autoclose-mode
      (progn
        (add-hook 'post-self-insert-hook
                  #'autoclose--auto-close-pairs))
    (remove-hook 'post-self-insert-hook #'autoclose--auto-close-pairs)))

(provide 'autoclose)

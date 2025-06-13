(require 'fum-core)
(require 'fum-navigation)
(require 'asd-vertico)
(require 'asd-input-common)

;; Interactive functions and their dependencies on the fum modes
;; This is my file, not a package nor a downloaded script!

(defun fum-insert ()
  (interactive)
  (when (region-active-p)
    (delete-active-region))
  (fum-state-set 'fum-insert-mode))

(defun fum-split-to-first-line ()
  (interactive)
  (open-line 1)
  (indent-according-to-mode)
  (fum-state-set 'fum-insert-mode))

(defun fum-split-to-second-line ()
  (interactive)
  (newline)
  (indent-according-to-mode)
  (fum-state-set 'fum-insert-mode))

(defun fum-open-previous-line ()
  (interactive)
  (beginning-of-line)
  (fum-split-to-first-line))

(defun fum-open-next-line ()
  (interactive)
  (end-of-line)
  (fum-split-to-second-line))

(defun fum-set-navigation-mode ()
  (interactive "^")
  (fum-state-set 'fum-navigation-mode))

(defun fum-set-scale-adjustment-mode ()
  (interactive)
  (fum-state-set 'fum-scale-adjustment-mode))

(defvar fum-nontyping-mode-map (make-sparse-keymap) "Keymap parent for fum nontyping modes.")
(ignore-typing fum-nontyping-mode-map)

(defvar fum-noninsert-mode-map (make-sparse-keymap) "Keymap parent for fum noninsert modes.")
(set-keymap-parent fum-noninsert-mode-map fum-nontyping-mode-map)

(defvar fum-navigation-mode-map (make-sparse-keymap) "Keymap activated for modal navigation.")
(set-keymap-parent fum-navigation-mode-map fum-noninsert-mode-map)
(defvar fum-insert-mode-map (make-sparse-keymap) "Keymap activated for modal insert.")
(defvar fum-dired-mode-map (make-sparse-keymap) "Keymap activated for modal dired.")
(set-keymap-parent fum-dired-mode-map fum-noninsert-mode-map)
(defvar fum-scale-adjustment-mode-map (make-sparse-keymap) "Temporary keymap for scaling adjustment for fum")
(set-keymap-parent fum-scale-adjustment-mode-map fum-nontyping-mode-map)
(defvar fum-occur-mode-map (make-sparse-keymap) "Keymap activated for modal occur.")
(set-keymap-parent fum-occur-mode-map fum-noninsert-mode-map)


(keymap-mass-set fum-noninsert-mode-map
                 ;; File navigation
		 "c" 'find-file
                 "C" 'consult-recent-file
		 "v" 'consult-buffer
                 
		 ;; Commands
		 "," 'execute-extended-command
		 "<" 'eval-expression
                 
                 ;; Help
                 "SPC a r" 'helpful-at-point
		 "SPC a t" 'helpful-callable
		 "SPC a s" 'helpful-variable
		 "SPC a C" 'find-function
		 "SPC a X" 'find-variable
		 "SPC a v" 'describe-bindings
		 "SPC a b" 'describe-key
		 "SPC a k" 'which-key-show-keymap
		 "SPC a m" 'describe-mode
		 "SPC a a" 'describe-command

                 ;; Windows
		 "SPC s i" 'windmove-right
		 "SPC s n" 'windmove-left
		 "SPC s e" 'windmove-down
		 "SPC s u" 'windmove-up
                 "SPC s c" 'split-window-horizontally
                 "SPC s v" 'split-window-vertically
                 "SPC s m" 'delete-window
                 "SPC s ," 'popwin:close-popup-window

                 ;; Files
                 "SPC f c" 'fum-open-config

                 ;; Visual
                 "SPC c"  'fum-set-scale-adjustment-mode
                 "SPC r RET" 'default-text-scale-decrease
                 "SPC r S-<return>" 'text-scale-decrease
                 "SPC r ESC" 'default-text-scale-increase
                 "SPC r S-<escape>" 'text-scale-increase
                 "SPC r s" 'change-theme
                 "SPC r t" 'cycle-theme-type)

(keymap-mass-set fum-navigation-mode-map
		 ;; Inserting
		 "<return>" 'fum-insert
		 "W" 'fum-open-previous-line
		 "M-W" 'fum-split-to-first-line
		 "w" 'fum-open-next-line
		 "M-w" 'fum-split-to-second-line

		 ;; Movement
                 "i" 'fum-forward-char-jump-indentation
		 "H-i" 'forward-sexp
                 "n" 'backward-char-jump-indentation
		 "C-n" 'backward-sexp
                 "e" 'next-line
                 "u" 'previous-line
                 "y" 'fum-toggle-end-of-line-code
		 "l" 'fum-toggle-beginning-of-code-line
		 "o" 'end-of-buffer
		 "O" 'beginning-of-buffer
		 ";" 'consult-goto-line

		 ;; File
		 "a" 'save-buffer

		 ;; Selecting
		 "t" 'set-mark-command
		 "C-t" 'fum-sexp-mark
		 "T" 'fum-line-mark

                 ;; Folding
                 "m" 'hs-hide-block
                 "M" 'hs-show-block

		 ;; Clipboard
		 "p" 'fum-yank
		 "s" 'fum-kill-region
		 "f" 'fum-kill-region-save
		 
                 ;; Undo
		 "d" 'undo-tree-undo
		 "D" 'undo-tree-redo
		 "S" 'fum-delete

		 ;; File Navigation
		 "z" 'xref-find-definitions
		 "x" 'occur
                 "X" 'consult-grep

                 ;; lsp
                 "SPC t n" 'lsp-format-buffer
                 "SPC t e" 'lsp-execute-code-action
                 "SPC t i" 'lsp-rename
                 "SPC t t" 'lsp-describe-thing-at-point

                 ;; Company
                 "M-e" 'company-complete
                 "M-u" 'company-complete
                 "M-i" 'company-complete
                 "M-y" 'company-complete

                 ;; Autoclose
                 "(" 'autoclose-wrap-region-parens
                 "{" 'autoclose-wrap-region-braces
                 "[" 'autoclose-wrap-region-brackets
                 "<" 'autoclose-wrap-region-angled-brackets
                 "'" 'autoclose-wrap-region-single-quotes
                 "\"" 'autoclose-wrap-region-double-quotes
                 "*" 'autoclose-wrap-region-asterisks
                 "/" 'autoclose-wrap-region-slashes
                 "_" 'autoclose-wrap-region-underscores
                 "~" 'autoclose-wrap-region-tildes
                 "=" 'autoclose-wrap-region-equals
                 "`" 'autoclose-wrap-region-backquotes
                 )

(keymap-mass-set fum-insert-mode-map
		 "<escape>" 'fum-set-navigation-mode

                 ;; Company
                 "M-e" 'company-complete
                 "M-u" 'company-complete
                 "M-i" 'company-complete
                 "M-y" 'company-complete)

(keymap-mass-set fum-dired-mode-map
                 "u" 'dired-previous-line
                 "e" 'dired-next-line
                 "o" 'dired-last-line
                 "O" 'dired-first-line
                 "n" 'dired-up-directory
                 "i" 'dired-find-file
                 "s" 'dired-flag-file-deletion
                 "d" 'dired-unmark-all-marks
                 
                 "c" 'find-file
                 "C" 'consult-recent-file
                 "x" 'consult-grep
                 "X" 'consult-find
                 "v" 'consult-buffer)

(keymap-mass-set fum-occur-mode-map
                 "<return>" 'occur-mode-goto-occurrence
                 "<escape>" 'quit-window
                 "o" 'occur-mode-display-occurrence
                 "n" 'occur-prev
                 "i" 'occur-next
                 "u" 'previous-line
                 "e" 'next-line)

(keymap-mass-set fum-scale-adjustment-mode-map
                 "l" 'default-text-scale-increase
                 "n" 'default-text-scale-decrease
                 "u" 'text-scale-increase
                 "e" 'text-scale-decrease
                 "<escape>" 'fum-state-default)

(keymap-mass-set (current-global-map)
                 "<escape>" 'keyboard-quit
                 "C-<backspace>" 'fum-backward-delete-sexp
                 "C-<delete>" 'fum-forward-delete-sexp
                 "C-<right>" 'forward-sexp
                 "C-<left>" 'backward-sexp)

(keymap-mass-set minibuffer-local-map
		 "<escape>" 'abort-minibuffers
                 "M-y" 'exit-minibuffer
                 "C-n" 'marginalia-cycle)

(with-eval-after-load 'vertico
  (keymap-mass-set vertico-map
                   "<backspace>" 'vertico-directory-delete-char
                   "C-<backspace>" 'vertico-directory-delete-word
		   "M-e" 'vertico-next
		   "M-u" 'vertico-previous
                   "M-i" 'vertico-insert))

(with-eval-after-load 'elisp-mode
  (setq emacs-lisp-mode-map (make-sparse-keymap))
          (keymap-global-set "C-e" 'eval-last-sexp))

(with-eval-after-load 'prog-mode
  (setq prog-mode-map (make-sparse-keymap))
  (keymap-mass-set prog-mode-map
                   "<home>" 'fum-toggle-beginning-of-code-line
                   "<end>" 'fum-toggle-end-of-line-code
                   "<left>" 'backward-char-jump-indentation
                   "<right>" 'fum-forward-char-jump-indentation
                   "<backspace>" 'fum-delete-backward-char-jump-indentation))

(with-eval-after-load 'company
  (setq company-active-map
        (make-sparse-keymap))
  (keymap-mass-set company-active-map
                   "M-<down>" 'company-select-next-or-abort
                   "M-e" 'company-select-next-or-abort
                   "M-<up>" 'company-select-previous-or-abort
                   "M-u" 'company-select-previous-or-abort
                   "M-<right>" 'company-complete-common
                   "M-i" 'company-complete-common
                   "M-<end>" 'company-complete-selection
                   "M-y" 'company-complete-selection
                   "M-<return>" 'company-complete-selection
                   "M-<escape>" 'company-abort
                   "M-h" 'company-show-doc-buffer
                   "M-o" 'company-other-backend
                   "<mouse-1>" 'company-complete-mouse
                   "<mouse-3>" 'company-select-mouse
                   "<down-mouse-1>" 'ignore
                   "<down-mouse-3>" 'ignore
                   "<up-mouse-1>" 'ignore
                   "<up-mouse-3>" 'ignore)
  (company-keymap--bind-quick-access company-active-map))

(with-eval-after-load 'org
  (setq org-mode-map
        (make-sparse-keymap)))

(defun fum-disable-mode-p ()
  (or (string-equal "*Shell Command Output*" (buffer-name))
      (string-match "*eldoc" (buffer-name))
      (derived-mode-p 'minibuffer-mode)))

(defun fum-state-selection ()
  (cond ((fum-disable-mode-p) nil)
        ((derived-mode-p 'dired-mode) 'fum-dired-mode)
        ((derived-mode-p 'occur-mode) 'fum-occur-mode)
        (t 'fum-navigation-mode)))

(fum-defmode fum-navigation-mode "Fum mode for navigating text buffers." "fum-navigation"
	     (setq cursor-type 'hbar))
(fum-defmode fum-insert-mode "Fum mode for inserting text in point." "fum-insert"
	     (setq cursor-type 'bar))

(fum-defmode fum-dired-mode "Fum mode for the major mode Dired." "fum-dired"
             (setq cursor-type 'hbar))
(fum-defmode fum-occur-mode "Fum mode for the major mode Occur." "fum-occur-mode"
             (setq cursor-type 'hbar))

(fum-defmode fum-scale-adjustment-mode nil "fum-scale-adjustment-mode")


(provide 'fum-definition)

;; distinguish tab and C-i
(keyboard-translate ?\C-i ?\H-i)
(keyboard-translate ?\C-m ?\H-m)

(defun keymap-mass-set (keymap &rest key-definition)
  "Set KEY-DEFINITION to KEYMAP with a setq-like manner
taking only even numbers of arguments(odd in this case because keymap)"
  (if (eq (% (length key-definition) 2) 0)
      (while key-definition
        (define-key keymap (kbd (nth 0 key-definition)) (nth 1 key-definition))
        (setq key-definition (nthcdr 2 key-definition)))
    (error "Error: keymap-mass-set requires key-definitions to be paired")))

(defun key-mass-definition (keymap &rest key-definition)
  (if (eq (% (length key-definition) 2) 0)
      (while key-definition
        (define-key keymap (nth 0 key-definition) (nth 1 key-definition))
        (setq key-definition (nthcdr 2 key-definition)))
    (error "Error: keymap-mass-set requires key-definitions to be paired")))

(defun ignore-typing (keymap)
  (let ((i ? ))
    (while (< i ?~)
      (define-key keymap (kbd (string i)) 'ignore)
      (setq i (1+ i)))))

(provide 'asd-input-common)

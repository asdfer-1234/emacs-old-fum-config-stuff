
(require 'asd-package)
(require-package 'ligature)
(require 'ligature)


(defvar ligature-base '("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
                        "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"))
;; Cursive mono fonts are a real blast! yeaaaa!

(defvar two-letter-combinations
  (let (total)
    (dolist (first ligature-base)
      (dolist (second ligature-base)
        (add-to-list 'total (concat first second))))
    total)
  "Two letter combinations, intended for ligature.el use")

(eval-after-load 'ligature
  '(progn
     (ligature-set-ligatures
      't (append two-letter-combinations '("www" "ffi")))))

(provide 'asd-ligature)

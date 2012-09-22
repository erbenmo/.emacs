(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-key-is-meta nil)
(setq mac-option-modifier nil)
(setq blink-matching-paren t)

(tool-bar-mode -1)



; lisp
(add-to-list 'load-path "/Users/Moerben/Documents/Lisp/slime")  ; your SLIME directory
;;(setq inferior-lisp-program "/Applications/AllegroCL/alisp") ; your Lisp system
;;(setq inferior-lisp-program "/Users/Moerben/Documents/Lisp/cmucl-19e/bin/lisp") ; your Lisp system
(setq inferior-lisp-program "/Applications/MIT-GNU-Scheme.app/Contents/Resources/mit-scheme") ; your Lisp system

(setq scheme-program-name "/Applications/MIT-GNU-Scheme.app/Contents/Resources/mit-scheme")
(require 'xscheme)

(require 'slime)
(slime-setup)



; color-theme
(add-to-list 'load-path "/Users/Moerben/Documents/Lisp/ColorTheme")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-high-contrast)))

;; Set the next/prev theme
(setq my-color-themes (mapcar 'car color-themes))
(setq color-theme-index (position 'color-theme-gnome2 my-color-themes))

(defun next-index (index a-list)
  (let ((next (+ index 1)))
    (if (= next (length a-list))
	0
      next)))

(defun prev-index (index a-list)
  (let ((prev (- index 1)))
    (if (< prev 0)
	(- (length a-list) 1)
      prev)))

(defun set-my-color-theme ()
  (setq theme-current
	(nth color-theme-index my-color-themes))
  (funcall theme-current)
  (message "%S" theme-current))
  
(defun next-color-theme ()
  (interactive)
  (setq color-theme-index
	(next-index color-theme-index my-color-themes))
  (set-my-color-theme))
  
(defun prev-color-theme ()
  (interactive)
  (setq color-theme-index
	(prev-index color-theme-index my-color-themes))
  (set-my-color-theme))
  
(setq color-theme-is-global nil) ; Initialization
(global-set-key [f8] 'next-color-theme)
(global-set-key [f7] 'prev-color-theme)
(setq weird my-color-themes)

; iTunes
(add-to-list 'load-path "/Users/Moerben/Documents/Lisp/iTunes/itunes.el")

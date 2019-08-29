;;Packages

(require 'package)
(add-to-list 'package-archives
	     '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "jttps://stable.melpa.org/packages/") t)

;;load and activate emacs packages
(package-initialize)

;;get ELPA description if needed
(when (not package-archive-contents)
  (package-refresh-contents))

;;Package list
(defvar my-packages
  '(
    ;;makes handling lisp expressions easier
    paredit

    ido-completing-read+
    
    ;;Common Lisp REPL
    sly

    ;;clojure REPL
    cider

    ;;Enhances M-x to allow easier execution of commands
    smex

    ;;project navigation
    projectile

    ;;colorful parens
    rainbow-delimiters

    ;;git integration
    magit

    ;;markdown
    markdown-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;SLIME config
(setq inferior-lisp-program "sbcl")

(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/customizations")
(load "shell-integration.el")
(load "navigation.el")
(load "ui.el")
(load "editing.el")
(load "misc.el")
(load "elisp-editing.el")

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
	     
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode cider ido-completing-read+ smex rainbow-delimiters projectile paredit magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

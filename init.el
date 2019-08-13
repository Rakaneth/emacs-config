;;Packages

(require 'package)
(add-to-list 'package-archives
	     '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

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
    slime

    ;;Enhances M-x to allow easier execution of commands
    smex

    ;;project navigation
    projectile

    ;;colorful parens
    rainbow-delimiters

    ;;git integration
    magit))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;SLIME config
(setq inferior-lisp-program "sbcl")
(setq slime-auto-connect 'ask)
(defun my-slime-setup ()
  (require 'slime)
  (slime-setup))
(defvar my--slime-setup-done nil)
(defun my-slime-setup-once ()
  (unless my--slime-setup-done
    (my-slime-setup)
    (setq my--slime-setup-done t)))
(defadvice lisp-mode (before my-slime-setup-once activate)
  (my-slime-setup-once))

(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/customizations")
(load "shell-integration.el")
(load "navigation.el")
(load "ui.el")
(load "editing.el")
(load "misc.el")
(load "elisp-editing.el")
	     
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ido-completing-read+ smex slime rainbow-delimiters projectile paredit magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
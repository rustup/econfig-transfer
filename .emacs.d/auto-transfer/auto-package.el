(require 'cl)
(require 'package)

(add-to-list 'package-archives'
             ("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives'
             ("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives'
             ("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; auto installed package
(when (not package-archive-contents)
  (package-refresh-contents))

;; setting default package to be installed
(defvar my-default-packages '(expand-region
			      evil-leader 
                              evil
			      pos-tip
			      popup
                              auto-complete
                              yasnippet
                              autopair
                              markdown-mode
                              ace-jump-mode
                              go-mode
                              gist
                              company
			      rust-mode
			      helm
			      beacon
			      haskell-mode
			      ensime 
                              ))
(dolist (p my-default-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; normal useful variable set
;; normal useful variable set
(setq dotfiles-dir "~/.emacs.d");;
(setq autoload-file (concat dotfiles-dir "/loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "/elpa"))
(setq custom-file (concat dotfiles-dir "/custom.el"))

(provide 'auto-package)

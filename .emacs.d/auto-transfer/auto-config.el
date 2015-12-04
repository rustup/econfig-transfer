;;------------------------------mode------------------------------
(add-to-list 'load-path "~/.emacs.d/elpa")
(add-to-list 'load-path "~/.emacs.d/elpa/autopair-0.3")
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-1.4")
(require 'auto-complete)
(require 'autopair)
(require 'go-autocomplete)
(helm-mode)
(autopair-global-mode)
(ido-mode)
(global-linum-mode)
(global-evil-leader-mode)


;;------------------------------hook------------------------------
(add-hook 'after-save-hook 'reload-emacs-config-when-save-config)
(add-hook 'global-evil-leader-mode-hook 'evil-mode)
(add-hook 'write-file-hooks 'auto-commit-config-update)



;;------------------------------settings------------------------------
(custom-set-variables
 ;; custom-set-variables was added by custom.
 ;; if you edit it by hand, you could mess it up, so be careful.
 ;; your init file should contain only one such instance.
 ;; if there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes nil)
 '(custom-safe-themes (quote ("3c44eedd72c5ec5d1664e9fb828cc2f6caaa434c6cb929f454e02e8a272bbbe0" "da094437b48c936dcc342acf1a76a3b93cb818a7186360fe3f55d54588aeb453" default)))
 '(fringe-mode 0 nil (fringe))
 '(markdown-command "pandoc -s -c ~/.emacs.d/style.css --toc --highlight-style espresso -n --self-contained --data-dir=~/.emacs.d/")
 '(markdown-enable-math t)
 '(scroll-bar-mode nil)
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t)
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(tool-bar-mode nil))
(set-default-font "consolas 17")
(setq-default line-spacing 6)
(setq default-frame-alist 
	  '((height . 47) (width . 160)(alpha .90 90) (top . 60) (left . 180) (tool-bar-lines . 0))) 
(setq inhibit-startup-message t) 
(set 'yes-or-no-p 'y-or-n-p)
(setq linum-format "%d ")

(setq ac-quick-help-prefer-pos-tip t)   ;default is
(setq ac-quick-help-prefer-pos-tip t)   ;default is
(add-to-list 'ac-dictionary-directories "~/.emacs.d/")
(ac-config-default)
(add-hook 'before-save-hook 'gofmt-before-save)
(setq-default make-backup-files nil)

;;------------------------------key-map------------------------------

(defun reload-emacs-config-when-save-config ()
  
  (if (string-equal (buffer-name) "auto-config.el")
    (load "~/.emacs")
  ())
  )


 (defun auto-commit-config-update()
   (message "call commit")
     (cond
      ((string-equal (buffer-name) "auto-config.el")
            (shell-command "git add ~/.emacs.d/auto-transfer/auto-config.el && git commit -q -F ~/.commit-message  && git push -u origin master")
        )

      ((string-equal (buffer-name) "auto-package.el")
       (shell-command "git add ~/.emacs.d/auto-transfer/auto-package.el && git commit -q -F ~/.commit-message  && git push -u origin master")
        )

      ((string-equal (buffer-name) ".emacs")
       (shell-command "git add ~/.emacs && git commit -q -F ~/.commit-message  && git push -u origin master")
       )
      )
   )
(defun load-molo-theme ()
  (interactive)
  (load "~/.emacs.d/elpa/color-theme-lime/lime-theme.el"))

(defun c-man (NAME)
  "Find the C manual page corresponding to the function NAME.
Search for man(2) and man(3) by default."
  (if (file-exists-p (concat "/usr/share/man/man2/" NAME ".2.gz"))
      (man (concat NAME "(2)"))
    (if (file-exists-p (concat "/usr/share/man/man3/" NAME ".3.gz"))
        (man (concat NAME "(3)"))
      (man NAME))))

(defun c-man-at-point ()
  "Find a C man page with the current word if present, otherwise
require input from user."
  (interactive)
  (when (not (setq cur-word (current-word)))
    (setq cur-word (read-from-minibuffer "Man Page: ")))
  (if (string= "" cur-word)
      (message "No man args given")
    (c-man cur-word)))

(defun enter-evil ()
  "Enter evil, exit current operation "
  (interactive)
    (evil-force-normal-state)
  (keyboard-quit)
  )

;;------------------------------man-follo----------------------
(add-hook 'go-mode-hook '(lambda () 
			   (global-set-key (kbd "C-c d") 'godoc-at-point)))

(add-hook 'c-mode-hook '(lambda ()
				(global-set-key (kbd "C-c d") 'c-man-at-point)))
(global-set-key "\C-cl" 'load-molo-theme)
(global-set-key (kbd "C-^") 'er/expand-region)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key "\C-x\C-m" 'execute-extended-command)
;;(global-set-key (kbd "C-c d") 'godoc-at-point)
(global-set-key (kbd "C-c o") 'pop-tag-mark)
(global-set-key (kbd "C-c C-d") 'c-man-at-point)
(global-set-key (kbd "C-g") 'enter-evil)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
   "e" 'find-file
   "b" 'switch-to-buffer
   "k" 'kill-buffer
   "j" 'godef-jump
   "o" 'pop-tag-mark
 ;;  "<SPC>"  'ace-jump-mode 
   "g" 'enter-evil
   "s" 'ace-jump-word-mode
)

(provide 'auto-config)

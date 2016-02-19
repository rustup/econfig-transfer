
(add-to-list 'load-path "~/.emacs.d/auto-transfer/")
(require 'auto-package)
(require 'auto-config)


;;(defun curl-save (url file)
;;  (interactive)
;;  (with-current-buffer (url-retrieve-synchronously  url)
;;    (goto-char (point-min))
;;    (re-search-forward "\r?\n\r?\n" nil t)
;;    (delete-region (point) (point-min))
;;    (write-region (point-min) (point-max) file))
;;  )
;;(mkdir "~/.emacs.d/auto-transfer")
;;(curl-save "https://raw.githubusercontent.com/rustup/econfig-transfer/master/.emacs"  "~/.emacs")
;;(curl-save "https://raw.githubusercontent.com/rustup/econfig-transfer/master/.emacs.d/auto-transfer/auto-config.el" "~/.emacs.d/auto-transfer/auto-config.el")
;;(curl-save "https://raw.githubusercontent.com/rustup/econfig-transfer/master/.emacs.d/auto-transfer/auto-package.el" "~/.emacs.d/auto-transfer/auto-package.el")

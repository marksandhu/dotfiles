;;; Custom --- Settings
;;; Commentary:
;;; Code:
;;;disable backup
(setq backup-inhibited t)
;;;disable auto save
(setq auto-save-default nil)
(global-linum-mode 't)
(menu-bar-mode 't)
(setq prelude-whitespace nil)
(setq prelude-guru nil)
(setq flx-ido-threshhold 1000)
(setenv "GOPATH" "/home/mark/go")
(setenv "GOROOT" "/usr/local/go")

(load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
(defun my-go-code-hook ()
                                        ; Call gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
                                        ; Godef jump key bindings
  (local-set-key (kbd "M-.") 'godef-jump)
                                        ; Use goimports
  (setq gofmt-command "goimports")
                                        ; Goeldoc
  (go-eldoc-setup))

(add-hook 'go-mode-hook 'my-go-code-hook)

(require 'auto-complete-config)
(require 'go-autocomplete)
(provide 'custom)
;;; Custom ends here

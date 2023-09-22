(menu-bar-mode -1)
(blink-cursor-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq inhibit-startup-echo-area-message t)
(load-theme 'deeper-blue)
;; ^^^ the clean look

;; save minibuffer history
(savehist-mode t)

;; () and ""
(electric-pair-mode t)

;; housekeeping
(set-register ?e '(file . "~/.emacs.d/init.el"))
(set-register ?i '(file . "~/Documents/org/ideas.org"))
(setq tetris-score-file "~/.emacs.d/tetris-scores")
(setq save-place-file "~/.emacs.d/saved-places")
(setq temporary-file-directory "~/.emacs.d/tmp")
(unless (file-directory-p temporary-file-directory)
  (make-directory temporary-file-directory))
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Package Stuff
(require 'package)
(add-to-list
 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; List of packages
(use-package ansible-vault)
(use-package tex
 :ensure auctex
 :init
 (setq TeX-PDF-mode t)
 (setq TeX-auto-save t)
 (setq TeX-parse-self t)
 (setq-default TeX-master nil))
(use-package browse-kill-ring)
(use-package elisp-autofmt
 :commands (elisp-autofmt-mode elisp-autofmt-buffer)
 :hook (emacs-lisp-mode . elisp-autofmt-mode))
(use-package format-all)
(use-package ini-mode)
(use-package js2-mode)
(use-package json-mode)
(use-package magit
 :commands magit-status
 :init (global-set-key (kbd "<f9>") 'magit-status))
(use-package org-bullets)
(use-package poetry)
(use-package switch-window
 :commands switch-window
 :init (global-set-key (kbd "C-x o") 'switch-window))
(use-package terraform-mode)
(use-package yaml-mode)
(use-package graphviz-dot-mode)
(use-package pcap-mode)
(use-package password-generator)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; define function to shutdown emacs server instance
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(connection-local-criteria-alist
   '(((:application eshell) eshell-connection-default-profile)))
 '(connection-local-profile-alist
   '((eshell-connection-default-profile (eshell-path-env-list))))
 '(package-selected-packages
   '(format-all yaml-mode terraform-mode switch-window poetry org-bullets
		magit json-mode ini-mode elisp-autofmt
		browse-kill-ring ansible-vault))
 '(safe-local-variable-values
   '((ansible-vault-password-file . "~/.ansible-vault/parc-pass"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

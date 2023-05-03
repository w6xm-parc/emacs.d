(menu-bar-mode -1)
(blink-cursor-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inihibit-splash-screen t)
(setq inihibit-startup-message t)
(setq initial-scratch-message "")
(setq inihibit-startup-echo-area-message "john.weaver")
(load-theme 'deeper-blue)
;;;; DO THIS ^^^^^ AS FAST AS POSSIBLE!

;; save minibuffer history
(savehist-mode t)

;; () and ""
(electric-pair-mode t)

;; housekeeping
(setq save-place-file "~/.emacs.d/saved-places")
(setq tetris-score-file "~/.emacs.d/tetris-scores")
(setq temporary-file-directory "~/.emacs.d/tmp")
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Package Stuff
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package magit
  :commands magit-status
  :init
  (global-set-key (kbd "<f9>") 'magit-status))

(use-package browse-kill-ring)
(use-package switch-window
  :commands switch-window
  :init
  (global-set-key (kbd "C-x o") 'switch-window))

(use-package json-mode)
(use-package yaml-mode)
(use-package terraform-mode)
(use-package ini-mode)
(use-package org-bullets)
(use-package poetry)
(use-package ansible-vault)

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
   '(((:application eshell)
      eshell-connection-default-profile)) t)
 '(connection-local-profile-alist
   '((eshell-connection-default-profile
      (eshell-path-env-list))) t)
 '(package-selected-packages '(magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

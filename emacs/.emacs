;; Packages
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(setq package-selected-packages '(auctex
                                  cmake-mode
                                  dockerfile-mode
                                  json-mode
                                  lua-mode
                                  magit
                                  markdown-mode
                                  powerline
                                  smex
                                  yaml-mode
                                  zenburn-theme))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

;; UI
(custom-set-variables '(inhibit-startup-screen t))  ; Disable startup screen
(tool-bar-mode -1)
(menu-bar-mode -99)
(scroll-bar-mode -1)
(global-linum-mode 1)
(column-number-mode 1)

;; Themes
(load-theme 'zenburn t)
(powerline-default-theme)

;; Highlighting
(global-hl-line-mode 1)
(show-paren-mode 1)
(setq show-paren-delay 0)

(require 'whitespace)
(setq whitespace-style '(face empty tabs trailing))
(global-whitespace-mode t)

;; Indentation
(setq-default indent-tabs-mode nil)
(setq lua-indent-level 2)

;; Behavior
(setq org-support-shift-select 'always)  ; Always support shift selection
(setq make-backup-files nil)
(setq auto-save-default nil)

(defalias 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "C-x C-b") 'bs-show)  ; BufferSelection

(ido-mode t)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Skip Emacs startup page
(custom-set-variables '(inhibit-startup-screen t))

;; Hide UI
(tool-bar-mode -1)
(menu-bar-mode -99)
(scroll-bar-mode -1)

;; IDO mode
(ido-mode t)

;; Display line and column number
(global-linum-mode 1)
(column-number-mode 1)

;; Font lock mode
(global-font-lock-mode 1)

;; GDB multi windows
(setq-default gdb-many-windows t)

;; Highlight matching braces
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Highlight current line
(global-hl-line-mode 1)

;; Higlight empty lines, tabs and extra spaces
(require 'whitespace)
(setq whitespace-style '(empty tabs trailing))
(global-whitespace-mode t)

;; Disable tab for indentation
(setq-default indent-tabs-mode nil)

;; Linux style indentation
(setq c-default-style "linux"
      c-basic-offset 2)

;; Disable backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Spell check in LaTeX
(setq ispell-dictionary "francais")
(add-hook 'latex-mode-hook 'flyspell-mode)

;; Set up package repositories
(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository

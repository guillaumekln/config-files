(add-to-list 'load-path "~/.emacs.d/lisp")

;; Skip Emacs startup page
(custom-set-variables '(inhibit-startup-screen t))

;; Hide UI
(tool-bar-mode -1)
(menu-bar-mode -99)
(scroll-bar-mode -1)

;; Confirm with 'y' or 'n'
(defalias 'yes-or-no-p 'y-or-n-p)

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
(setq whitespace-style '(face empty tabs trailing))
(global-whitespace-mode t)

;; Disable tab for indentation
(setq-default indent-tabs-mode nil)

;; Linux style indentation
(setq c-default-style "linux"
      c-basic-offset 2)

;; Disable backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Auctex
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;; Spell check in LaTeX
(setq ispell-dictionary "francais")
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)

;; Set up package repositories
(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository

;; CMake mode
(require 'cmake-mode)
(setq auto-mode-alist
      (append
       '(("CMakeLists\\.txt\\'" . cmake-mode))
       '(("\\.cmake\\'" . cmake-mode))
       auto-mode-alist))

;; Rust mode
(add-to-list 'load-path "~/.emacs.d/lisp/rust-mode/")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; Markdown mode
(add-to-list 'load-path "~/.emacs.d/lisp/markdown-mode/")
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

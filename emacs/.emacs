(package-initialize)

;; Skip Emacs startup page
(custom-set-variables '(inhibit-startup-screen t))

;; Hide UI
(tool-bar-mode -1)
(menu-bar-mode -99)
(scroll-bar-mode -1)

;; Confirm with 'y' or 'n'
(defalias 'yes-or-no-p 'y-or-n-p)

;; BufferSelection
(global-set-key (kbd "C-x C-b") 'bs-show)

;; IDO mode
(ido-mode t)

;; SMEX (IDO for M-x")
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

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
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Packages
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(setq package-selected-packages '(auctex
                                  bazel-mode
                                  cmake-mode
                                  dockerfile-mode
                                  json-mode
                                  lua-mode
                                  magit
                                  markdown-mode
                                  nginx-mode
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
(global-linum-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(setq show-paren-delay 0)

(if (display-graphic-p)
    (progn
      (load-theme 'zenburn t)
      (powerline-default-theme)
      (global-hl-line-mode 1)
      (scroll-bar-mode -1))
  (progn
    (setq linum-format "%4d \u2502 ")
    (custom-set-faces
     '(magit-diff-added ((((type tty)) (:foreground "green"))))
     '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
     '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
     '(magit-diff-file-heading ((((type tty)) nil)))
     '(magit-diff-removed ((((type tty)) (:foreground "red"))))
     '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
     '(magit-section-highlight ((((type tty)) nil))))))

(require 'whitespace)
(setq whitespace-style '(face empty tabs trailing))
(global-whitespace-mode t)

;; Indentation
(setq-default indent-tabs-mode nil)
(setq lua-indent-level 2)
(setq c-default-style "linux"
      c-basic-offset 2)

;; Behavior
(setq org-support-shift-select 'always)  ; Always support shift selection
(setq make-backup-files nil)
(setq auto-save-default nil)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))  ; Treat header files as C++ headers by default
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

(defalias 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "C-x C-b") 'bs-show)  ; BufferSelection

(ido-mode t)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

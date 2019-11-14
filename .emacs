;; Packages
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))
(setq package-selected-packages '(auctex
                                  bazel-mode
                                  cmake-mode
                                  company-lsp
                                  dockerfile-mode
                                  flycheck
                                  json-mode
                                  lua-mode
                                  lsp-ui
                                  magit
                                  markdown-mode
                                  nginx-mode
                                  powerline
                                  protobuf-mode
                                  smex
                                  yaml-mode
                                  yasnippet
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

(require 'yasnippet)

;; Setup language servers.
(require 'lsp-mode)

;; C/C++ support:
;; sudo apt-get install clang-tools-8
;; sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-8 100
;; cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
;; ln -s $PWD/compile_commands.json $PWD/../
(add-hook 'c++-mode-hook 'lsp)
(lsp-register-client
 (make-lsp-client :new-connection (lsp-tramp-connection "clangd")
                  :major-modes '(c++-mode)
                  :remote? t
                  :server-id 'cpp-remote))

;; For Python support: sudo pip install python-language-server
(add-hook 'python-mode-hook 'lsp)
(lsp-register-client
 (make-lsp-client :new-connection (lsp-tramp-connection "pyls")
                  :major-modes '(python-mode)
                  :remote? t
                  :server-id 'pyls-remote))

;; Extra UI configuration for LSP.
(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(setq lsp-ui-sideline-enable nil)

;; Auto-completion with Company.
(require 'company-lsp)
(push 'company-lsp company-backends)

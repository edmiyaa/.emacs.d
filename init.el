;; Packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-compute-statistics t)

(use-package org
  :config
  (setq org-startup-indented t))

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  (setq evil-want-keybinding nil)
  :config
  (modify-syntax-entry ?_ "w")
  (evil-set-undo-system 'undo-redo)
  (evil-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package magit
  :ensure t
  :defer)

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode))

(use-package ivy
  :ensure t
  :config
  (setq ivy-format-functions-alist '((t . ivy-format-function-arrow-line)))
  (ivy-mode))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.1
	company-minimum-prefix-length 1)
  (global-company-mode))

(use-package eglot
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

;; UI
(load-theme 'tango-dark)
(tool-bar-mode -1)
(menu-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(global-display-line-numbers-mode)
(setq-default truncate-lines t)
(setq-default fill-column 100)
(global-display-fill-column-indicator-mode)

;; Performance improvements
(setq-default bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t)

;; Shortcuts
(global-set-key (kbd "<f9>") (lambda() (interactive)(find-file user-init-file)))

;; Load .el files
(load-file (expand-file-name (concat user-emacs-directory "functions.el")))

;; Load extra .el files
(let ((extra-config-directory (expand-file-name (concat user-emacs-directory "extra"))))
  (when (file-directory-p extra-config-directory)
    (let ((extra-files (directory-files extra-config-directory t "\\.el")))
      (mapc 'org-babel-load-file extra-files))))

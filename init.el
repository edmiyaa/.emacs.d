;; Packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; (setq use-package-compute-statistics t)

(use-package org
  :config
  (setq org-hide-leading-stars t))

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (modify-syntax-entry ?_ "w")
  (evil-set-undo-system 'undo-redo)
  (evil-mode))

(use-package ivy
  :ensure t
  :config
  (setq ivy-format-functions-alist '((t . ivy-format-function-arrow-line)))
  (ivy-mode))

;; UI
(load-theme 'tango-dark)
(tool-bar-mode -1)
(menu-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode)
(setq-default truncate-lines t)

;; Performance improvements
(setq-default bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t)

;; Shortcuts
(global-set-key (kbd "<f9>") (lambda() (interactive)(find-file user-init-file)))

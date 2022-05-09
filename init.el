(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-acario-dark t))

(use-package evil
  :ensure t
  :config
  (evil-mode))

(use-package ivy
  :ensure t
  :config
  (setq ivy-re-builders-alist
        '((t . ivy--regex-fuzzy)))
  (ivy-mode))

(use-package org
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages '((python . t)))
  (setq org-confirm-babel-evaluate nil))

(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(global-display-line-numbers-mode)

(global-whitespace-mode)
(setq whitespace-style (quote (face trailing spaces tabs space-mark tab-mark)))

(global-set-key (kbd "<f6>") (lambda() (interactive)(find-file user-init-file)))

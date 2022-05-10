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
  :hook (org-mode . org-indent-mode)
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages '((python . t)))
  (setq org-confirm-babel-evaluate nil))

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1)
  (global-company-mode))

(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(global-display-line-numbers-mode)

(global-whitespace-mode)
(setq whitespace-style (quote (face trailing tabs tab-mark)))

(global-set-key (kbd "<f6>") (lambda() (interactive)(find-file user-init-file)))

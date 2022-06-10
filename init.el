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
  (setq ivy-format-functions-alist '((t . ivy-format-function-arrow-line)))
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

(use-package undo-tree
  :ensure t
  :after evil
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1))

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(global-display-line-numbers-mode)
(electric-pair-mode)
(setq-default indent-tabs-mode nil)

(global-whitespace-mode)
(setq whitespace-style (quote (face trailing tabs tab-mark)))

(global-set-key (kbd "<f5>") (lambda() (interactive)(find-file user-init-file)))
(global-set-key (kbd "C-c C-k") 'comment-or-uncomment-region)
(global-set-key (kbd "C-u") 'evil-scroll-up)

;; Load any .org files inside extra directory
(setq extra-config-directory (expand-file-name (concat user-emacs-directory "extra")))
(if (file-directory-p extra-config-directory)
    (progn (setq extra-files (directory-files extra-config-directory t "\\.org$"))
           (mapc 'org-babel-load-file extra-files)))

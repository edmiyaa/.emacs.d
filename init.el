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

(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(global-display-line-numbers-mode)
(global-whitespace-mode)

(global-set-key (kbd "<f6>") (lambda() (interactive)(find-file user-init-file)))

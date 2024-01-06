;; -- Install straight.el for package management
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

; -- Install Nano and and set configurations
(straight-use-package
 '(nano :type git :host github :repo "rougier/nano-emacs"))

(setq nano-font-family-monospaced "Berkeley Mono")
(setq nano-font-family-proportional "Berkeley Mono Variable")
(setq nano-font-size 13)

(require 'nano)



;; -- Install use-package
(straight-use-package 'use-package)

(use-package el-patch
  :straight t)

;; -- Install non-specific packages
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package paredit
  :ensure t
  :config
  (add-hook 'after-init-hook 'enable-paredit-mode))

(use-package magit
  :ensure t)

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))

;; -- Lispy things
(use-package cider
  :ensure t)

(use-package geiser-guile
  :ensure t)

(use-package sly
  :ensure t)

(use-package rainbow-delimiters
  :ensure t)


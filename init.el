(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(setq make-backup-files nil)

(add-to-list 'load-path "~/.emacs.d/asdf.el")
(require 'asdf)
(add-to-list 'exec-path "~/.asdf/shims")

(setq package-selected-packages '(gruvbox-theme rainbow-delimiters geiser-guile racket-mode clojure-mode lsp-mode cider lsp-treemacs flycheck company slime paredit sml-mode use-package ruby-end robe))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(set-frame-font "Berkeley Mono 13" nil t)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/org-roam")
  (org-roam-complete-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 :map org-mode-map
	 ("C-M-i" . completion-at-point))
  :config
  (org-roam-setup))
(org-roam-db-autosync-mode)

(load-theme 'gruvbox-dark-medium t)

(global-company-mode t)


(setenv "PATH" (concat "/usr/local/smlnj/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/smlnj/bin"  exec-path))

(setq inferior-lisp-program (executable-find "sbcl"))
(require 'slime)
(slime-setup '(slime-fancy slime-quicklisp slime-asdf slime-mrepl))


(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)
(add-hook 'ruby-mode-hook 'lsp)

(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'clojurescript-mode-hook 'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
(add-hook 'lisp-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook           'enable-paredit-mode)
(add-hook 'ruby-mode-hook 'robe-mode)

(use-package inf-ruby
  :config
  (add-hook 'after-init-hook 'inf-ruby-switch-setup)
  (add-hook 'compilation-filter-hook 'inf-ruby-auto-enter-and-focus)
  (add-hook 'ruby-base-mode 'inf-ruby-minor-mode)
  (inf-ruby-enable-auto-breakpoint))

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1
					; lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
					; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
      )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(gruvbox-theme rainbow-delimiters geiser-guile racket-mode clojure-mode lsp-mode cider lsp-treemacs flycheck company slime paredit sml-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

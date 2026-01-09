(require 'package)
(setq package-install-upgrade-built-in t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)


;; Add this to your ~/.emacs or ~/.emacs.d/init.el file
(setenv "JAVA_HOME" "/opt/homebrew/opt/openjdk/bin/java")
(add-to-list 'exec-path (expand-file-name "bin" (getenv "JAVA_HOME")))

(setq tool-bar-mode nil)
(setq make-backup-files nil)
(setq-default indent-tabs-mode nil)

(setq package-selected-packages '(gruvbox-theme rainbow-delimiters geiser-guile company sly paredit clojure-mode lsp-mode cider lsp-treemacs flycheck racket-mode org-roam))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;; https://emacs-lsp.github.io/lsp-mode/tutorials/clojure-guide/
(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1
      ; lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
      ; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
      )

(set-frame-font "Berkeley Mono 13" nil t)
(load-theme 'gruvbox-dark-medium t)
(global-company-mode t)
;; -- racket stuff

(add-hook 'racket-mode-hook #'eldoc-mode)
(setq eldoc-idle-delay 0.1)
(setq eldoc-echo-area-use-multiline-p t)
(setq racket-show-functions-in-eldoc t)


(with-eval-after-load 'racket-mode
  (define-key racket-mode-map (kbd "C-c s") #'racket-xp-describe))

(setq racket-xp-eldoc-level 'complete)
(setq eldoc-documentation-strategy #'eldoc-documentation-compose)



;; -- org babel

(add-to-list 'load-path "~/.emacs.d/emacs-ob-racket")
;; Enable Org Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((racket . t)))

;; Don’t ask for confirmation every time
(setq org-confirm-babel-evaluate nil)


(setq inferior-lisp-program (executable-find "sbcl"))




(add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
(add-hook 'lisp-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook           'enable-paredit-mode)
(add-hook 'racket-mode-hook           'enable-paredit-mode)
(add-hook 'racket-mod-hook            #'rainbow-delimiters-mode)
(require 'racket-xp)
(add-hook 'racket-mode-hook #'racket-xp-mode)
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'clojurescript-mode-hook 'enable-paredit-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5aedf993c7220cbbe66a410334239521d8ba91e1815f6ebde59cecc2355d7757" "51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3" default))
 '(package-selected-packages
   '(ajrepl janet-ts-mode gruvbox-theme rainbow-delimiters geiser-guile company sly paredit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

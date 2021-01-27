(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(clojure-mode
    cider
    company
    magit
    gruvbox-theme
    rainbow-delimiters
    paredit
    elpy
    py-autopep8     
    blacken              
    flycheck)
)
    
;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)
    
    

;; ---
;; Global Settings

;; theme
(load-theme 'gruvbox-light-medium t)

;; font
(set-face-attribute 'default nil :font "Hack")

;; line numbers
(global-linum-mode t)

;; highlight current line
(global-hl-line-mode 1)

;; keep syntax highlighting for current line
(set-face-foreground 'highlight nil)

;; set tabwidth
(setq tab-width 4)
    (defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)


;; show parenthesis mode
(show-paren-mode 1)

;; enable paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)


;; stop creating backup~ files
(setq make-backup-files nil)
;; stop creating #autosave# files
(setq auto-save-default nil)

; set the default comment column to 80 
(setq-default comment-column 80)

;; set python3 as default
(setq python-shell-interpreter "/usr/bin/python3")


; add path
(add-to-list 'exec-path "/usr/local/bin" "~/.local/bin")
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; ---
;; Package Settings
;; globally add company mode
(global-company-mode)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

; Projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; ---
;; Clojure settings
;; enter cider mode when entering clojure major mode
(add-hook 'clojure-mode-hook 'cider-mode)

(setq clojure-align-forms-automatically t)



;; Rainbow Delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; enable paredit for Clojure
(add-hook 'clojure-mode-hook #'paredit-mode)

;; enable paredit for cider
(add-hook 'cider-repl-mode-hook 'paredit-mode)


;; ----
;; Python settings

;; Enable elpy
(elpy-enable)

;; enable format-on-save
(add-hook 'elpy-mode-hook (lambda ()
                            (add-hook 'before-save-hook
                                      'elpy-format-code nil t)))


;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


;; Enable autopep8
;(require 'py-autopep8)
;(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(setq elpy-rpc-virtualenv-path 'current)
(setq elpy-rpc-python-command "python3")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-rpc-python-command "python3")
 '(package-selected-packages
   (quote
	(elpy blacken gruvbox-theme markdown-mode rainbow-delimiters projectile paredit magit ivy flycheck-clj-kondo company cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

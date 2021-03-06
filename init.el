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
    flycheck))
    
;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)
    
    

;; ---
;; Global Settings

;; theme
(load-theme 'gruvbox-dark-medium t)

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

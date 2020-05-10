; packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

; set wanted packages
(setq package-list '(cider clojure-mode company paredit projectile rainbow-delimiters))

(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

; ------- Emacs Settings -----------

(set-frame-font "Roboto Mono Light 14")

(setq default-frame-alist
      (append (list '(width . 72) '(height . 40))))

; don't set hard tabs
(setq-default indent-tabs-mode nil)

(set-frame-parameter (selected-frame) 'internal-border-width 20)
(setq x-underline-at-descent-line t)
(setq initial-major-mode 'text-mode)
(setq-default line-spacing 0)
(set-default 'cursor-type  '(hbar . 2))
(blink-cursor-mode 0)
(fringe-mode '(0 . 0))

(setq frame-background-mode 'light)
(set-background-color "#ffffff")
(set-foreground-color "#666666")

(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)   ;; Show/hide startup page
(setq initial-scratch-message nil) ;; Show/hide *scratch* buffer message
;; (menu-bar-mode 0)                  ;; Show/hide menubar
(tool-bar-mode 0)                  ;; Show/hide toolbar
(tooltip-mode  0)                  ;; Show/hide tooltip
(scroll-bar-mode 0)                ;; Show/hide scrollbar



(defun mode-line-render (left right)
  "Return a string of `window-width' length containing left, and
   right aligned respectively."
  (let* ((available-width (- (window-total-width) (length left) )))
    (format (format "%%s %%%ds" available-width) left right)))


(setq-default header-line-format
  '(:eval (mode-line-render

   (format-mode-line
    (list
     (propertize "File " 'face `(:weight regular))
     "%b "
     '(:eval (if (and buffer-file-name (buffer-modified-p))
         (propertize "(modified)" 
		     'face `(:weight light
			     :foreground "#aaaaaa"))))))
   
   (format-mode-line
    (propertize "%3l:%2c "
	'face `(:weight light :foreground "#aaaaaa"))))))

(set-face-attribute 'region nil
		    :background "#f0f0f0")
(set-face-attribute 'highlight nil
		    :foreground "black"
		    :background "#f0f0f0")
(set-face-attribute 'bold nil
 		    :foreground "black"
		    :weight 'regular)


(setq-default mode-line-format "")

(set-face-attribute 'header-line nil
;;                    :weight 'regular
		    :height 140
                    :underline "black"
                    :foreground "black"
		    :background "white"
                    :box `(:line-width 3 :color "white" :style nil))

(set-face-attribute 'mode-line nil
                    :height 10
                    :underline "black"
                    :background "white"
		                :foreground "white"
                                :box nil)

(set-face-attribute 'mode-line-inactive nil
                    :box nil
                    :inherit 'mode-line)

(set-face-attribute 'mode-line-buffer-id nil 
                    :weight 'light)

; line numbers
(global-linum-mode t)

; highlight current line
(global-hl-line-mode 1)

; keep syntax highlighting for current line
(set-face-foreground 'highlight nil)

; experimental tab width setting
(setq tab-width 4) ; or any other preferred value
    (defvaralias 'c-basic-offset 'tab-width)
    (defvaralias 'cperl-indent-level 'tab-width)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

; set the default comment column to 80 
(setq-default comment-column 80)

; add path
(add-to-list 'exec-path "/usr/local/bin")
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))


; --------- Package Settings ------------

;; Company Mode
;; globally add company mode
(global-company-mode)

; Magit
(global-set-key (kbd "C-x g") 'magit-status)


; Projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; -------- Clojure Stuff --------

;; enter cider mode when entering clojure major mode
(add-hook 'clojure-mode-hook 'cider-mode)


;; show parenthesis mode
(show-paren-mode 1)

;; Rainbow Delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; enable paredit for Clojure
(add-hook 'clojure-mode-hook #'paredit-mode)


;; enable paredit for cider
(add-hook 'cider-repl-mode-hook 'paredit-mode)

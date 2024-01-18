(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


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
  :defer t
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :defer t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package eglot
  :ensure t
  :defer t
  :hook (ruby-mode . eglot-ensure))

;; -- Lispy things
(use-package cider
  :ensure t
  :defer t)

(use-package geiser-guile
  :ensure t
  :defer t)

(use-package sly
  :ensure t
  :defer t)

(use-package rainbow-delimiters
  :ensure t
  :defer t)

(use-package janet-mode
  :ensure t
  :defer t)

(load-file "~/.emacs.d/inf-janet.el")
(require 'inf-janet)
(setq inf-janet-program "/opt/homebrew/bin/janet")
(add-hook 'janet-mode-hook #'inf-janet-minor-mode)



;(use-package janet-ts-mode
;  :ensure t
; :defer t)

;(use-package ajrepl
;  :config
;  (add-hook 'janet-ts-mode-hook
;            #'ajrepl-interaction-mode))

;; -- Other langs

(use-package ruby-end
  :ensure t)

(use-package inf-ruby
  :ensure t
  :defer t
  :config
  (autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode))

;; -- Theming
(use-package gruvbox-theme
  :ensure t)

(load-theme 'gruvbox-dark-soft t)
  

(use-package ligature
  :ensure t
  :config
  (ligature-set-ligatures
   'prog-mode
   '(; Group A
     ".." ".=" "..." "..<" "::" ":::" ":=" "::=" ";;" ";;;" "??" "???"
     ".?" "?." ":?" "?:" "?=" "**" "***" "/*" "*/" "/**"
     ; Group B
     "<-" "->" "-<" ">-" "<--" "-->" "<<-" "->>" "-<<" ">>-" "<-<" ">->"
     "<-|" "|->" "-|" "|-" "||-" "<!--" "<#--" "<=" "=>" ">=" "<==" "==>"
     "<<=" "=>>" "=<<" ">>=" "<=<" ">=>" "<=|" "|=>" "<=>" "<==>" "||="
     "|=" "//=" "/="
     ; Group C
     "<<" ">>" "<<<" ">>>" "<>" "<$" "$>" "<$>" "<+" "+>" "<+>" "<:" ":<"
     "<:<" ">:" ":>" "<~" "~>" "<~>" "<<~" "<~~" "~~>" "~~" "<|" "|>"
     "<|>" "<||" "||>" "<|||" "|||>" "</" "/>" "</>" "<*" "*>" "<*>" ":?>"
     ; Group D
     "#(" "#{" "#[" "]#" "#!" "#?" "#=" "#_" "#_(" "##" "###" "####"
     ; Group E
     "[|" "|]" "[<" ">]" "{!!" "!!}" "{|" "|}" "{{" "}}" "{{--" "--}}"
     "{!--" "//" "///" "!!"
     ; Group F
     "www" "@_" "&&" "&&&" "&=" "~@" "++" "+++" "/\\" "\\/" "_|_" "||"
     ; Group G
     "=:" "=:=" "=!=" "==" "===" "=/=" "=~" "~-" "^=" "__" "!=" "!==" "-~"
     "--" "---"))
  
(global-ligature-mode t))

(use-package nerd-icons
  :ensure t
  :defer t)

(display-line-numbers-mode t)
(global-hl-line-mode t)
(tool-bar-mode -1)
(setq inhibit-splash-screen t)
(setq use-file-dialog nil)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("871b064b53235facde040f6bdfa28d03d9f4b966d8ce28fb1725313731a2bcc8" default))
 '(package-selected-packages
   '(inf-janet janet-ts-mode inf-ruby exec-path-from-shell ruby-end ligature gruvbox-theme rainbow-delimiters sly geiser-guile cider magit paredit company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

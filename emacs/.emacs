;;  _____                           ____             __ _       
;; | ____|_ __ ___   __ _  ___ ___ / ___|___  _ __  / _(_) __ _ 
;; |  _| | '_ ` _ \ / _` |/ __/ __| |   / _ \| '_ \| |_| |/ _` |
;; | |___| | | | | | (_| | (__\__ \ |__| (_) | | | |  _| | (_| |
;; |_____|_| |_| |_|\__,_|\___|___/\____\___/|_| |_|_| |_|\__, |
;;                                                        |___/ 

;; Configure repositories
(setq package-archives  '(("elpa" . "https://elpa.gnu.org/packages/")
                          ("melpa" . "http://melpa.org/packages/")
                          ("melpa-stable" . "http://stable.melpa.org/packages/")))

;; Make Emacs look not-ancient out of the box
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tooltip-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 10)

;; Set greeting message
(setq initial-scratch-message "
;;               .......                                    ...            
;;         .;:okOOkkOxkxkOo:.                         .;:dOkkdkkl:;        
;;       :okkxdo;,ddodo;'dcdkxxok               .Okddo,.c':cc:,.:ococ      
;;     ;xONxlOc'xlkkxxxxxxddkkdc                 ;oxxxOxxxO0dd:,,..ood     
;;    dkWXklox0Oxc..          ....                     ...,:xxol:..'Nlx    
;;   xOM0kxdk0x'          .:okO00Oxxl:. .:::lcc;,            dll:c.,lOo.   
;;  oxMN0kodok          ,dk00dkcc;;:oooo:..,'.,.'dl;          O:c''.:0o:   
;;  kXW0xc,cl,        .dOkl:,.      .....,..     ..cx:        k:l:.,ckdl   
;; .kW0Ol;,0o.       ckdo;.          . .'o'lcc     .:xd.      OOkc..,dx:   
;; .xWOo:'.Kol    .cocc'. ...ccxo:;:k0Nxoxdl,;cc,..  .,dc    oxo.  .lOd.   
;;  xK0l;;..xdl;;lx...'co0XWMMK0kkMMMMXXKkdcoMMXkOMWOc..,odccl'  ..;olx    
;;  llOxdl  ','olx' ,OMMMMMMKcd.;NMMMMMXNMNxKMd,WNOMMMNlc.:..  .''ldcx     
;;   ldkdl:,c....:.oMMMMMMMX0OWKMWNNNkXMW0MMMW;XXNkMMMMMk':..clxlxool      
;;    ,dlkood:lc:KdMMMMMMMMMNKMMW'c''.kMMWNMMMol.'cMMMMMMx;xOOkddoc.       
;;      :xxxokl0NdMMMMMMMMMM0MMMWkKc'dKWMMMMMMWl'cOWMMMMMMxodc;;.          
;;        ':okxkkxMMMMMMMMMWkMMMMMMMWMWNMMMMMMMM0O0OMMMMMMM0x.             
;;            .l0WMMMMMMMMW0xMMMMMMMMMMMMMMMMMMMMXKkKXXNMMWMKxk:           
;;            l0NMMMMMMMKdXMWKMMMMMMMMMXXKKKKNMMMMXkMMX0lcddxoc            
;;           ,kXMMMWNOkdOMMMMMMMMMMMMMKxoKXWMNkxKMMWNXWOx                  
;;          x0WNkkxx0XMNKMMMMMMMMXWMMMWKNN,d0KMMWXMMMMMWk.                 
;;         .x0dol'OWMMMXkMMMMMMMMMMNNMWWMMMMXKNMMMMMMNO0o                  
;;                kWMMMMKkWMMMMMMMMMNKOMMMMMMMWMMMXdc:l.                   
;;                kNMMMMWO0XMMMMMMMMMWOWMMMMMMMMMWNNWKx.                   
;;                dOMMMMMMNXOKWMMMMMMMMXKXWMXNN0OdlodKx.                   
;;                .ONMMMMMMMkOWMMMMMMMMMMXO0KXNMMMW0O;                     
;;                 ,OWMMMMMMNKXXMMMMMMWMWMMWWN0O0KKKO.                     
;;                  ;ONMMMMMMMNNKWMWMMMMNXdl'...c:;:.                      
;;                   .dXWMMMMMWXXXO0WXMMMMMXdNNkl                          
;;                     'OKWNMMMWX00xKKMMMMMMNOXKk                          
;;                      oXMWMMMMMMXKXk0NMMXOdOOc                           
;;                       .',cdKMWXXWMKx0XOkxo.                             
;;                              :xWMMXOOOxlk                               
;;                                 'lxO000xdk:.                            
;;                                       .cdo:                             
;;
;;                              Welcome back, Pedro.\n
")


(setq scroll-conservatively 101);; Disable page-jumps

(setq column-number-mode t)	;; Column numbers

(setq-default truncate-lines 1) ;; Disable line-wrap

(setq display-line-numbers-type ;; Relative line numbers
      'relative)
(global-display-line-numbers-mode)

(add-hook			;; undo-tree
 'evil-local-mode-hook
 'turn-on-undo-tree-mode)
(setq global-undo-tree-mode t)

(show-paren-mode 1)		;; Bracket highlighting
(setq show-paren-style 'mixed)

(set-face-attribute		;; Font typeface configuration
 'default nil :font "FiraCode Nerd Font Mono" :height 90)

;; Function declarations
(defun org-mode-setup()
  (org-indent-mode)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))

(defun org-visual-fill()
    (setq visual-fill-column-width 100
	  visual-fill-column-center-text t)
    (visual-fill-column-mode 1))

;; Key Bindings
(global-set-key (kbd "<escape>");; Bind "Cancel" to Escape
		'keyboard-escape-quit)

(require 'package)		;; use-package bootstrap script
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
  (setq use-package-always-ensure t)

;; =================================
;; Automatically install packages

(use-package swiper)		;; Swiper

(use-package counsel)		;; Counsel

(use-package ivy		;; Ivy & binds
  :diminish
  :bind( 
    ("C-s" . swiper)
    :map ivy-minibuffer-map
    ("C-l" . ivy-alt-done)
    ("<tab>" . ivy-next-line)
    ("C-j" . ivy-next-line)
    ("<backtab>" . ivy-previous-line)
    ("C-k" . ivy-previous-line)
    :map ivy-switch-buffer-map
    ("C-k" . ivy-previous-line)
    ("C-l" . ivy-done)
    ("C-d" . ivy-switch-buffer-kill)
    :map ivy-reverse-i-search-map
    ("C-k" . ivy-previous-line)
    ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-modeline	;; DOOM Modeline
  :init (doom-modeline-mode 1))

(use-package ligature		;; Enable font ligatures
    :load-path "~/.emacs.d/github/ligature-el"
    :config
    (ligature-set-ligatures 't '("www"))
    (ligature-set-ligatures 'prog-mode '(
         "www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
         ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
         "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
         "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
         "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
         "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
         "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
         "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
         "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
         "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))
    (global-ligature-mode 't))

(use-package doom-themes	;; Install & Configure DOOM themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (setq doom-themes-treemacs-theme "doom-atom")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(use-package rainbow-delimiters ;; Delimiter color-coding
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package general		;; General
  :config
  (general-create-definer pedro/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"))

(use-package undo-tree)		;; undo-tree

(use-package evil		;; EVIL Mode
 :after undo-tree
 :init
 (setq evil-want-C-u-scroll t)
 (setq evil-want-C-i-scroll t)
 (setq evil-want-integration t)
 (setq evil-want-keybinding nil)
 (setq evil-undo-system 'undo-tree)
 :config
 (evil-mode t))

(use-package evil-collection	;; Auxiliary keybindings for EVIL Mode
  :after evil
  :config
  (evil-collection-init))

(use-package which-key)

(use-package hydra)		;; Hydra

(use-package projectile		;; Projectile
  :diminish projectile-mode
  :config (projectile-mode 1)
  :custom ((projectile-completion-system 'ivy))
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Projetos/")
    (setq projectile-project-search-path '("~/Projetos")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile	;; Ivy integration for Projectile
  :after projectile
  :config (counsel-projectile-mode))

(use-package magit		;; Git module
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function
   #'magit-display-buffer-same-window-except-diff-v1))

(use-package forge)		;; Github integration

(use-package org		;; ORG MODE!
  :hook (org-mode . org-mode-setup)
  :config
  (setq org-ellipsis " ▾"))

(use-package org-bullets	;; Replace Org-Mode bullet points
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package visual-fill-column
  :defer t
  :hook (org-mode . org-visual-fill))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c C-l")
  :config
  (lsp-enable-which-key-integration t))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

;; =================================


;; Automatically generated by EVIL Mode
(setq package-enable-at-startup nil)

;; Hydra macro
(defhydra hydra-text-scale
  (:timeout 4)
  "Change font size"
  ("-" text-scale-decrease "Decrease") 
  ("+" text-scale-increase "Increase"))

;; General function maps
(pedro/leader-keys
    "b" '(counsel-switch-buffer :which-key)	;; Buffer list
    "C-r" '(hydra-text-scale/body :which-key))	;; Font resize mode

;; EVIL remaps
(define-key evil-insert-state-map (kbd "<tab>") 'tab-to-tab-stop)

;; Colorscheme
(load-theme 'doom-one t)

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("6c531d6c3dbc344045af7829a3a20a09929e6c41d7a7278963f7d3215139f6a7" "cbdf8c2e1b2b5c15b34ddb5063f1b21514c7169ff20e081d39cf57ffee89bc1e" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "5784d048e5a985627520beb8a101561b502a191b52fa401139f4dd20acb07607" default))
 '(package-selected-packages
   '(which-key lsp-mode visual-fill-column visual-fill visual-fill-mode org-bullets forge evil-magit magit counsel-projectile projectile minimap undo-tree hydra evil-collection general counsel good-scroll rainbow-delimiters atom-one-dark-theme fira-code-mode doom-modeline swiper evil-visual-mark-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; cl - Common Lisp Extension
(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; Add Packages
(defvar my/packages '(
		      company
		      hungry-delete
		      swiper
		      counsel
		      ;smartparens
		      popwin
		      expand-region
		      iedit
		      org-pomodoro
		      rg
		      yasnippet
		      auto-yasnippet
		      window-numbering
		      evil-nerd-commenter
		      which-key
		      use-package
		      js2-mode
		      web-mode
		      emmet-mode
		      evil
		      evil-leader
		      evil-surround
		      evil-escape
		      nodejs-repl
		      slime
		      treemacs
		      monokai-theme
		      atom-one-dark-theme
		      solarized-theme
		      cnfonts
		      php-mode
		      paredit
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")	
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; cnfonts
(require 'cnfonts)
(cnfonts-enable)

(global-hungry-delete-mode)

;; (require 'smartparens-config)
;; (smartparens-global-mode t)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; js2-mode web-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

;; emmet-mode
(require 'emmet-mode)

;; web-mode 缩进
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 4) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 4)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 4)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)
(add-hook 'web-mode-hook 'emmet-mode)
;; 在两个空格和四个空格之间切换
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

;; 开启全局 Company 补全
(global-company-mode 1)

;; slime设置
(setq inferior-lisp-program "D:\\clisp-2.49\\clisp.exe")
(add-to-list 'slime-contribs 'slime-fancy)

;; popwin插件, 切换窗口, 光标也切换
(require 'popwin)
(popwin-mode t)

;; yasnippet
;; (require 'yasnippet)
;; (yas-reload-all)
;; (add-hook 'prog-mode-hook #'yas-minor-mode)

;; evil-mode
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; evil-leader
(global-evil-leader-mode)
;; evil-leader 快捷键
(evil-leader/set-key
  "ff" 'find-file
  "fed" 'open-init-file
  "fr" 'recentf-open-files
  "bb" 'switch-to-buffer
  "bd" 'kill-this-buffer
  "pf" 'counsel-git
  "fj" 'dired-jump
  "fg" 'rg
  "ss" 'swiper
  "fs" 'save-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wm" 'delete-other-windows
  "wd" 'delete-window
  "wh" 'evil-window-left
  "wl" 'evil-window-right
  "wj" 'evil-window-down
  "wk" 'evil-window-up
  "qq" 'save-buffers-kill-terminal
  "SPC" 'counsel-M-x
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "."  'evilnc-copy-and-comment-operator
  "\\" 'evilnc-comment-operator ; if you prefer backslash key
  "ft" 'treemacs
  )

;; window-number
(window-numbering-mode 1)

;; evil-surround
(require 'evil-surround)
(global-evil-surround-mode)
;; evil-escape
(evil-escape-mode 1)
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.2)
(setq evil-escape-inhibit-functions '(evil-visual-state-p))

;; evil-nerd-commenter
(evilnc-default-hotkeys)

;; php-mode
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.\\(?:php\\|phtml\\)\\'" . php-mode))


;; which-key
(which-key-mode 1)
;; 这一行, 是将which-key的提示信息放到了右边
;; (setq which-key-side-window-location 'righ)

(provide 'init-packages)

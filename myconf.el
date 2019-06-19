(require 'cl)
(require 'package)
(package-initialize)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; Add Packages
(defvar my/packages '(
		   company
		   hungry-delete
		   swiper
		   counsel
		   smartparens
		   popwin
		   expand-region
		   iedit
		   org-pomodoro
		   rg
		   window-numbering
		   evil-surround
		   evil-nerd-commenter
		   which-key
		   js2-mode
		   web-mode
		   emmet-mode
		   evil
		   evil-leader
		   nodejs-repl
		   slime
		   monokai-theme
		   solarized-theme
		   use-package
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

(require 'use-package)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(global-hungry-delete-mode)

(global-company-mode 1)

(require 'smartparens-config)
(smartparens-global-mode t)

(setq auto-mode-alist
    (append
    '(("\\.js\\'" . js2-mode))
    '(("\\.html\\'" . web-mode))
    auto-mode-alist))

(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'slime-contribs 'slime-fancy)

(require 'popwin)
(popwin-mode t)

(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(global-evil-leader-mode)

(window-numbering-mode 1)

(require 'evil-surround)
(global-evil-surround-mode)

(evilnc-default-hotkeys)
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

(which-key-mode 1)

(setq initial-frame-alist (quote ((fullscreen . maximized))))

(global-hl-line-mode 1)

;; (load-theme 'solarized 1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)

(setq-default cursor-type 'bar)

(setq inhibit-splash-screen 1)

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-initorg-file()
  (interactive)
  (find-file "~/.emacs.d/myconf.org"))

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  (cond ((looking-at-p "\\s(") (funcall fn))
      (t (save-excursion
	  (ignore-errors (backward-up-list))
	  (funcall fn)))))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun indent-region-or-buffer ()
"Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
      (progn
	(indent-region (region-beginning) (region-end))
	(message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(defun occur-dwim ()
(interactive)
(push (if (region-active-p)
       (buffer-substring-no-properties
	(region-beginning)
	(region-end))
     (let ((sym (thing-at-point 'symbol)))
       (when (stringp sym)
	 (regexp-quote sym))))
   regexp-history)
(call-interactively 'occur))

(defun disable-smartparens ()
(turn-off-smartparens-mode))
(add-hook 'slime-repl-mode-hook #'disable-smartparens)

(setq ring-bell-function 'ignore)

(set-language-environment "UTF-8")

(global-auto-revert-mode t)

(setq make-backup-files nil)

(setq auto-save-default nil)

(fset 'yes-or-no-p 'y-or-n-p)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
                                           ;; sinagture
					   ("wys" "Wang YaSong")))

(recentf-mode 1)
(setq recentf-max-menu-item 10)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode 1)

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
				    try-expand-dabbrev-all-buffers
				    try-expand-dabbrev-from-kill
				    try-complete-file-name-partially
				    try-complete-file-name
				    try-expand-all-abbrevs
				    try-expand-list
				    try-expand-line
				    try-complete-lisp-symbol-partially
				    try-complete-lisp-symbol))

(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "`" nil :actions nil)
(sp-local-pair '(org-mode lisp-interaction-mode) "'" nil :actions nil)

(with-eval-after-load 'org
;; org 文本内语法高亮
(setq org-src-fontify-natively t)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/org"))

;; 设置一个模版,其中设置了待办事项的优先级还有触发键
(setq org-capture-templates
  '(("t" "Todo" entry (file+headline "~/org/gtd.org" "TODO")
    "* TODO [#B] %?\n  %i\n"
    :empty-lines 1)))
)

(global-set-key (kbd "C-w") 'backward-kill-word)

(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "C-c c") 'org-capture)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "M-/") 'hippie-expand)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(evil-leader/set-key
  "ff" 'find-file
  "ca" 'org-agenda
  "cc" 'org-capture
  "fj" 'dired-jump
  "fed" 'open-initorg-file
  "ss" 'swiper
  "fr" 'recentf-open-files
  "bb" 'switch-to-buffer
  "bd" 'kill-buffer
  "fs" 'save-buffer
  "pf" 'counsel-git
  "fg" 'rg
  "i\\" 'indent-region-or-buffer
  "se" 'iedit-mode
  "so" 'occur-dwim
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wd" 'delete-window
  "SPC" 'counsel-M-x
  "wm" 'delete-other-windows
  "wd" 'delete-window
  "qq" 'save-buffers-kill-terminal
)

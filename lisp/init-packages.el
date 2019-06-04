 ;; cl - Common Lisp Extension
(require 'cl)

(when (>= emacs-major-version 24)
	(require 'package)
	(package-initialize)
	(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
  							("melpa" . "http://elpa.emacs-china.org/melpa/"))))

 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
		popwin
		;; --- Major Mode ---
		js2-mode
		;; --- Minor Mode ---
		nodejs-repl
		slime
		;; exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		;; solarized-theme
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

(global-hungry-delete-mode)

(require 'smartparens-config)
(smartparens-global-mode t)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; 开启全局 Company 补全
(global-company-mode 1)

;; slime设置
(setq inferior-lisp-program "D:\\clisp-2.49\\clisp.exe")
(add-to-list 'slime-contribs 'slime-fancy)

;; popwin插件, 切换窗口, 光标也切换
(require 'popwin)
(popwin-mode t)

(provide 'init-packages)

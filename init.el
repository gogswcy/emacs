;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)
(require 'init-ui)

;; 关闭滚动到底部的提示音
(setq ring-bell-function 'ignore)



;; 启用括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)

;; 关闭自动备份
(setq make-backup-files nil)

;; yes-or-no 换成 y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;; 有修改自动加载
(global-auto-revert-mode t)


;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 将open-init-file绑定到f1上
(global-set-key (kbd "<f1>") 'open-init-file)


;; 最近打开文档
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 选中字符后, 输入内容会替换掉, 而不是直接插入
(delete-selection-mode 1)


;; org 文本内语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/org"))
;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-angeda)

;; 缩写
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; sinagture
					    ("wys" "Wang YaSong")
					    ))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)

;; 关闭滚动到底部的提示音
(setq ring-bell-function 'ignore)

;; 开启后默认全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 启用括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;当前行高亮
(global-hl-line-mode 1)

;; 安装主题
(add-to-list 'my/packages 'monokai-theme)
(load-theme 'monokai 1)


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

;; 关闭工具栏, tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
;; (global-linum-mode 1) ;; 这一个比较老, 效率不好
(global-display-line-numbers-mode 1);

;; 更改光标样式
(setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 更改显示字体大小 16pt
(set-face-attribute 'default nil :height 110)
(set-default-font "Consolas")
(set-fontset-font "fontset-default" 'chinese-gbk "微软雅黑")

(setq face-font-rescale-alist '(("宋体" . 1.1)
                ("微软雅黑" . 1.0)
                ))

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

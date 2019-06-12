;; 关闭滚动到底部的提示音
(setq ring-bell-function 'ignore)

;; 有修改自动加载
(global-auto-revert-mode t)

;; 缩写
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; sinagture
					    ("wys" "Wang YaSong")))

;; 关闭自动备份
(setq make-backup-files nil)

;; 自动保存关闭
(setq auto-save-default nil)

;; 最近打开文档
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; yes-or-no 换成 y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;; 启用括号匹配
(add-hook 'emacs-lisp-mode 'show-paren-mode)

;; 选中字符后, 输入内容会替换掉, 而不是直接插入
(delete-selection-mode 1)

;; 缩进
(defun indent-buffer ()
  "Indent the currently vistied buffer."
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

;; hippie-expand补全, 在company不能用,或者不好用的时候用
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

;; Dired 删除或复制文件夹的时候, 自动确认递归删除或复制
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; Dired 每打开一次, 就生成一个buffer, 用下面的命令只生成一个
(put 'dired-find-alternate-file 'disabled nil)

;; dired
(require 'dired-x)
(setq dired-dwim-target t)

(provide 'init-better-defaults)

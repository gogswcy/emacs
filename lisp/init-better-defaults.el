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
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 选中字符后, 输入内容会替换掉, 而不是直接插入
(delete-selection-mode 1)

;; elisp mode中, 不会自动补全'(单引号)
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

(provide 'init-better-defaults)

;; 开启后默认全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;当前行高亮
(global-hl-line-mode 1)

;; 安装主题
(add-to-list 'my/packages 'monokai-theme)
(load-theme 'monokai 1)

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

(provide 'init-ui)

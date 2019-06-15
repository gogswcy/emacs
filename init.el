;; org-mode 管理配置文件
(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "myconf.org" user-emacs-directory))

;; 自定义系统生成的配置文件的路径
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load-file custom-file)

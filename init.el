;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; org-mode 管理配置文件
(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "myconf.org" user-emacs-directory))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-fun)
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)

;; 自定义系统生成的配置文件的路径
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)

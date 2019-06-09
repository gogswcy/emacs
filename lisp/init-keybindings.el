;; counsel
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)

;; 将open-init-file绑定到f1上
(global-set-key (kbd "<f1>") 'open-init-file)

;; recent file
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 切换缩进, 是4个空格还是2个空格
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; occur-dwim
(global-set-key (kbd "M-s o") 'occur-dwim)

;;imenu
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

(provide 'init-keybindings)

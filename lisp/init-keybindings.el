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

;; indent 缩进
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; hippie-expand
(global-set-key (kbd "M-/") 'hippie-expand)

;; dired
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; occur mode 默认搜索当前被选中的或者在光标下的字符串
(global-set-key (kbd "M-s o") 'occur-dwim)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "M-s e") 'iedit-mode)

;; org-capture 快捷键
(global-set-key (kbd "C-c c") 'org-capture)
;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

;; 设置web-mode缩进, 4个空格还是2个空格
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; 设置company补全快捷键为c-n c-p
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; auto-yasnippet
(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "H-y") #'aya-expand)

;; 向前删除一个单词
(global-set-key (kbd "C-w") 'backward-kill-word)

(provide 'init-keybindings)

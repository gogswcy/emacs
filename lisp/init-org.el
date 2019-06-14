(with-eval-after-load 'org
  ;; org 文本内语法高亮
  (setq org-src-fontify-natively t)

  ;; 设置默认 Org Agenda 文件目录
  (setq org-agenda-files '("~/org"))

  ;; 设置一个模版,其中设置了待办事项的优先级还有触发键
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/org/gtd.org" "工作安排")
	   "* TODO [#B] %?\n  %i\n"
	   :empty-lines 1)))
  )

(provide 'init-org)

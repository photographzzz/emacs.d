;; 取消移动到文件头部或尾部时候的提示音
(setq ring-bell-function 'ignore)


;; 当在外部修改此文件时，自动加载
(global-auto-revert-mode t)


;; 设置缩写
(abbrev-mode 1)
(define-abbrev-table 'global-abbrev-table '(
					   ;; signature
					   ("chp" "photograph")
					   ;; emacs regex
					   
					   ))

;; 文件不自动备份
(setq make-backup-files nil)

;; 文件不自动保存
;; 不生成auto-save-list文件夹
(setq auto-save-default nil)

;; 开启recentf模式
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)


;; 一直开启括号高亮匹配
;; add-hook 顾名思义 添加对勾
;; 目前缺陷 光标放在括号中间 不能提示两边的括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)


(provide 'init-better-defaults)

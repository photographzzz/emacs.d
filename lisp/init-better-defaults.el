;; __________           __     __                                 
;; \______   \  ____  _/  |_ _/  |_   ____  _______               
;;  |    |  _/_/ __ \ \   __\\   __\_/ __ \ \_  __ \              
;;  |    |   \\  ___/  |  |   |  |  \  ___/  |  | \/              
;;  |______  / \___  > |__|   |__|   \___  > |__|                 
;;         \/      \/                    \/                       
;; ________             _____                .__     __           
;; \______ \    ____  _/ ____\_____    __ __ |  |  _/  |_   ______
;;  |    |  \ _/ __ \ \   __\ \__  \  |  |  \|  |  \   __\ /  ___/
;;  |    `   \\  ___/  |  |    / __ \_|  |  /|  |__ |  |   \___ \ 
;; /_______  / \___  > |__|   (____  /|____/ |____/ |__|  /____  >
;;         \/      \/              \/                          \/

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



(defun indent-buffer()
  "Indent the currently currently visited buffer. "
  (interactive);; 这样可以通过M-x，或者可以绑定快捷键来调用此函数
  ;;point-min buffer的开头 point-max buffer
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  "Indent a region if selected, otherwise the whole buffer. "
  (interactive)
  ;;记住执行 save-excursion 代码块里的代码之前光标的位置
  ;;并在执行代码块结束后，把光标返回到之前记住的位置
  (save-excursion
    ;; region-active是判断是否进入Transient Mark Mode (选中时进入)
    ;; (p)redicate 断言 判断一个条件为真或者为假
    (if (region-active-p)
        (progn
	  ;; region-beginning 选中文本的开头，region-end 选中文本的结尾 
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))


(provide 'init-better-defaults)

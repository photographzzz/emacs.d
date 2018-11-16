
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)


(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)

;; 取消移动到文件头部或尾部时候的提示音
(setq ring-bell-function 'ignore) 

(tool-bar-mode -1)

(electric-indent-mode t)
(setq inhibit-splash-screen t)

(global-linum-mode t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

(recentf-mode t)



;; 改变光标样式
;; setq-default
(setq-default cursor-type 'bar)

;; 文件不自动备份
(setq make-backup-files nil)

;; 文件不自动保存
;; 不生成auto-save-list文件夹
(setq auto-save-default nil)


;; 使org模式中的注释代码也高亮
(require 'org)
(setq org-src-fontify-natively t)


;; 开启recentf模式
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
;; 这个快捷键绑定可以用之后的插件 counsel 代替
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)XS

(delete-selection-mode t)

;; 开启时为全屏
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 一直开启括号高亮匹配
;; add-hook 顾名思义 添加对勾
;; 目前缺陷 光标放在括号中间 不能提示两边的括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 高亮光标所在的行
(global-hl-line-mode t)

;; 加载主题
(load-theme 'monokai t)





(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)



;; C-h f 是查找函数的描述
;; C-h C-h 是查找函数在哪里
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)




;; org-mode
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)


;; 当在外部修改此文件时，自动加载
(global-auto-revert-mode t)

;; 设置缩写
(abbrev-mode 1)
(define-abbrev-table 'global-abbrev-table '(
					   ;; signature
					   ("chp" "photograph")
					   ;; emacs regex
					   
					   ))


;; add(set-language-environment 'utf-8)
;; (set-locale-environment "UTF-8")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray")))))

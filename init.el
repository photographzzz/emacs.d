
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

(setq package-selected-packages 'photograph/packages)


;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
;; 定义了一个package列表
(defvar photograph/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel;; swiper的依赖包
		smartparens
		;; --- Major Mode ---
		js2-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell;; mac上要找到命令行的程序 要安装这个
		;; --- Themes ---
		monokai-theme
		solarized-theme
		) "Default packages")

(setq package-selected-packages photograph/packages)

;; 判断"photograph/packages"这个变量里所有的package是否已经全部安装
;; 如果全部安装完了 则返回nil
(defun photograph/packages-installed-p ()
  ;; loop for 是Common Lisp Extension里面的
     (loop for pkg in photograph/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (photograph/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg photograph/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))


;; Find Executable Path on OS X
;; 当系统是mac时 则初始化下面的package
;; node-js-repl
;; node-js-repl-send-buffer
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(tool-bar-mode -1)

(electric-indent-mode t)
(setq inhibit-splash-screen t)

(global-linum-mode t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

(recentf-mode t)

(global-company-mode t)

;; 改变光标样式
;; setq-default
(setq-default cursor-type 'bar)

;; 文件不自动备份
(setq make-backup-files nil)


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

(require 'hungry-delete)
(global-hungry-delete-mode) 

;; config for swiper
;; C-n or C-p to choose
;; C-x b to choose recent file
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; config for smartparens
(require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; C-h f 是查找函数的描述
;; C-h C-h 是查找函数在哪里
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


;; org-mode
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)



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

(when (>= emacs-major-version 24)
  ;; 下面两行在init.el文件开头已经有了
  ;;(require 'package)
  ;;(package-initialize)
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
		popwin
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


(require 'hungry-delete)
(global-hungry-delete-mode)


;; config for smartparens
(smartparens-global-mode t)


;; config for swiper
;; C-n or C-p to choose
;; C-x b to choose recent file
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


(global-company-mode t)


;; 加载主题
(load-theme 'monokai t)


;; when require, wh(setq company-minimum-prefix-length 1)en not require
(require 'popwin)
(popwin-mode 1)


(provide 'init-packages)

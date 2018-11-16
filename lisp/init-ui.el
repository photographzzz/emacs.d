(tool-bar-mode -1)
(scroll-bar-mode -1)

;; 关闭启动时的欢迎界面
(setq inhibit-splash-screen t)


(global-linum-mode t)


;; 改变光标样式
;; setq-default
(setq-default cursor-type 'bar)


;; 开启时为全屏
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 高亮光标所在的行
(global-hl-line-mode t)


(provide 'init-ui)

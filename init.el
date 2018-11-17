;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))


;; (defun my-python-mode-config ()
;;   (setq python-indent-offset 4
;;         python-indent 4
;;         indent-tabs-mode nil
;;         default-tab-width 4

;;         ;; 设置 run-python 的参数
;;         python-shell-interpreter "ipython"
;;         python-shell-interpreter-args "-i"
;;         python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;         python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;         python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
;;         python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
;;         python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;;   (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;;   (hs-minor-mode t)                     ;开启 hs-minor-mode 以支持代码折叠
;;   (auto-fill-mode 0)                    ;关闭 auto-fill-mode，拒绝自动折行
;;   (whitespace-mode t)                   ;开启 whitespace-mode 对制表符和行为空格高亮
;;   (hl-line-mode t)                      ;开启 hl-line-mode 对当前行进行高亮
;;   (pretty-symbols-mode t)               ;开启 pretty-symbols-mode 将 lambda 显示成希腊字符 λ
;;   (set (make-local-variable 'electric-indent-mode) nil)) ;关闭自动缩进

;; (add-hook 'python-mode-hook 'my-python-mode-config)



;; add more personal func
;; new init-func.el
;; (require 'inif-func.el')
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

(electric-indent-mode t)

;; add(set-language-environment 'utf-8)
;; (set-locale-environment "UTF-8")
(put 'dired-find-alternate-file 'disabled nil)

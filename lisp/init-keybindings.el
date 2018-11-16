;;  ____  __.                ___.    .__             .___.__                           
;; |    |/ _|  ____   ___.__.\_ |__  |__|  ____    __| _/|__|  ____     ____    ______ 
;; |      <  _/ __ \ <   |  | | __ \ |  | /    \  / __ | |  | /    \   / ___\  /  ___/ 
;; |    |  \ \  ___/  \___  | | \_\ \|  ||   |  \/ /_/ | |  ||   |  \ / /_/  > \___ \  
;; |____|__ \ \___  > / ____| |___  /|__||___|  /\____ | |__||___|  / \___  / /____  > 
;;         \/     \/  \/          \/          \/      \/          \/ /_____/       \/  
;;    _____                                                                       __   
;;   /     \  _____     ____  _____      ____    ____    _____    ____    ____  _/  |_ 
;;  /  \ /  \ \__  \   /    \ \__  \    / ___\ _/ __ \  /     \ _/ __ \  /    \ \   __\
;; /    Y    \ / __ \_|   |  \ / __ \_ / /_/  >\  ___/ |  Y Y  \\  ___/ |   |  \ |  |  
;; \____|__  /(____  /|___|  /(____  / \___  /  \___  >|__|_|  / \___  >|___|  / |__|  
;;         \/      \/      \/      \/ /_____/       \/       \/      \/      \/        



(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "<f2>") 'open-my-init-file)

;; 这个快捷键绑定可以用之后的插件 counsel 代替
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; C-h f 是查找函数的描述
;; C-h C-h 是查找函数在哪里
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "C-c p f") 'counsel-git)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(provide 'init-keybindings)

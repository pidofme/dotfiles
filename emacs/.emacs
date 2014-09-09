;; author: Limy
;; e-mail: pidofme@gmail.com
;; blog: Limy.github.com
;; date: 2012/11/16

;;=============================================================================
;; 外观设置
;;=============================================================================

;;禁用工具栏
(tool-bar-mode nil)
;;禁用菜单栏，F10开启/关闭菜单
(menu-bar-mode nil)
;;禁用滚动栏，鼠标滚轮代替
(scroll-bar-mode nil)
;;禁用启动画面
(setq inhibit-startup-message t)
;;显示行号和列号
(setq line-number-mode t)
(setq column-number-mode t)
;;在标题栏提示你目前的位置
(setq frame-title-format "Limy@%b")
;;显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;;=============================================================================
;; 缓冲区
;;=============================================================================

;;缺省模式 text-mode
(setq default-major-mode 'text-mode)
;;高亮显示当前行
(global-hl-line-mode 1)
;;语法加亮
(global-font-lock-mode t)
;;高亮显示选择区域
(transient-mark-mode t)
;;页面平滑滚动，scroll-margin 3 靠近屏幕边缘3行时滚动，可以很好的看到上下文
(setq scroll-margin 3 scroll-conservatively 10000)
;;高亮显示成对的括号，但不来回弹跳
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;鼠标指针规避光标
(mouse-avoidance-mode 'animate)
;;粘贴于光标处，而不是鼠标指针处
(setq mouse-yank-at-point t)
;;使用C-k删除整行（包括回车）
(setq-default kill-whole-line t)
;;默认显示80列就换行
(setq default-fill-column 80)
;;超过80列高亮显示
(require 'whitespace)
(setq whitespace-style '(face lines-tail trailing))
(global-whitespace-mode t)

;;=============================================================================
;; ERC设置
;;=============================================================================

;;使用UTF-8编码
(setq erc-default-coding-system '(utf-8 . utf-8))
;;自动加入预定频道

;;=============================================================================
;; 代码风格
;;=============================================================================

;;使用空格和TAB混合缩进
(setq-default indent-tabs-mode t)
;;交换按键，实现回车换行后自动缩进
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-j" 'newline)
;;auto-complete 自动补全
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

;;C mode
(defun my-c-mode-hook()
  ;;使用回车代替C-j的功能，实现换行自动缩进
  ;;(define-key c-mode-map [return] 'newline-and-indent)
  ;;(interactive)
  ;;设置C程序的风格
  (c-set-style "Linux")
  ;;自动模式，此模式下当键入{时，会自动根据你设置的风格缩进
  ;;(c-toggle-auto-state)
  ;;此模式下，当按下Backspace时会删除最多的空格
  ;;(c-toggle-hungry-state)
  ;;TAB键的宽度设置为8
  (setq c-basic-offset 8)
  ;;在菜单中加入当前Buffer的函数索引
  (imenu-add-menubar-index)
  ;;在状态栏上显示当前光标在哪个函数体内部
  (which-function-mode))

;;C++ mode
(defun my-c++-mode-hook()
  ;;使用回车代替C-j的功能，实现换行自动缩进
  ;;(define-key c++-mode-map [return] 'newline-and-indent)
  ;;(interactive)
  ;;设置C++程序的风格
  (c-set-style "Stroustrup")
  ;;自动模式，此模式下当键入{时，会自动根据你设置的风格缩进
  ;;(c-toggle-auto-state)
  ;;此模式下，当按下Backspace时会删除最多的空格
  ;;(c-toggle-hungry-state)
  ;;TAB键的宽度设置为8
  (setq c-basic-offset 4)
  ;;在菜单中加入当前Buffer的函数索引
  (imenu-add-menubar-index)
  ;;在状态栏上显示当前光标在哪个函数体内部
  (which-function-mode))

(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;;=============================================================================
;; 编码设定
;;=============================================================================

;;新建文件的编码方式
(setq default-buffer-file-coding-system 'utf-8)
;;读取文件时优先使用 utf-8方式解码
(prefer-coding-system 'utf-8)

;;=============================================================================
;; 其他设置
;;=============================================================================

;;以 y/n 代替 yes/no
(fset 'yes-or-no-p 'y-or-n-p)
;;支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)
;;不要生成备份文件
(setq-default make-backup-files nil)
;;让Emacs可以直接打开和显示图片
(auto-image-file-mode t)

;;=============================================================================
;; org-mode
;;=============================================================================

;;=============================================================================
;; Lua-mode
;;=============================================================================

;;(setq auto-mode-alist (cons '("\.lua$" . lua-mode)auto-mode-alist))
;;(autoload 'lua-mode "lua-mode" "Lua editing mode."t)

;;=============================================================================
;; CEDET and ECB
;;=============================================================================

;; Load CEDET
;;(load-file "/usr/share/emacs/site-lisp/cedet/common/cedet.el")
;; ECB Load-Path
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/ecb")
;; Load ECB
;;(require 'ecb-autoloads)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(menu-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "gray20"))))
 )

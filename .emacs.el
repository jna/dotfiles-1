;; (setq load-path (cons "~/dotfiles/.elisp/tuareg" load-path))
;; (setq load-path (cons "~/dotfiles/.elisp/" load-path))

(setq debug-on-error nil)
(add-to-list 'load-path "~/dotfiles/.elisp")
(add-to-list 'load-path "~/dotfiles/.elisp/conf")
(add-to-list 'load-path "~/dotfiles/.elisp/tuareg")
(add-to-list 'load-path "~/dotfiles/.elisp/auto-install")

;; C-h to backspace
;;(global-set-key "\C-h" 'delete-backward-char)

; (setq auto-mode-alist (cons '("??.ml??w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(setq auto-mode-alist (cons '("??.scm$" . scheme-mode) auto-mode-alist))

(setq auto-mode-alist (cons '("??.pde" . java-mode) auto-mode-alist))

(setq auto-mode-alist
   (cons '("\\.pde$" . java-mode) auto-mode-alist))

(line-number-mode t)
;(column-number-mode nil)


;; Riece
(setq riece-server-alist 
      '(("is2007" :host   "irc.freenode.net" :coding utf-8 :nickname "suzemacs")))

;; Tabはspace x 4
(setq-default tab-width 4 indent-tabs-mode nil)


;;smart-compile 
(require 'smart-compile)

;; utf-8
(progn
  (set-language-environment 'Japanese)
  (set-terminal-coding-system 'utf-8)
  (setq file-name-coding-system 'utf-8)
  (set-clipboard-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8)
;; For yatex mode
;; (setq coding-system-for-read 'mule-utf-8-unix)
  (prefer-coding-system 'utf-8)
 (set-default-coding-systems 'utf-8)
 (set-keyboard-coding-system 'utf-8)
 (set-buffer-file-coding-system 'utf-8-unix)
)



;; (when (eq window-system 'mac)
;;   (add-hook 'window-setup-hook
;;             (lambda ()
;; ;;              (setq mac-autohide-menubar-on-maximize t)
;;               (set-frame-parameter nil 'fullscreen 'fullboth)
;;               )))
;; CarbonEmacsやgtkのemacsで最大化


(defun toggle-max-window ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))

(defun tm ()
  (interactive)
  (toggle-max-window))

;; Carbon Emacsの設定で入れられた
(custom-set-variables
 '(display-time-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode t))
(custom-set-faces
 )



;;Color
(if window-system (progn
   (set-background-color "Black")
   (set-foreground-color "White")
   (set-cursor-color "Gray")
   (set-frame-parameter nil 'alpha 80)
   ))



;; Highlight Parens
(load "mic-paren.el")
(require 'mic-paren)
(paren-activate)

;; Visible marked area
(transient-mark-mode t)




;; Yatex Mode
;;(setq auto-mode-alist (cons '("\\.tex$" . yatex-mode) auto-mode-alist))
;;(add-hook 'yatex-mode-hook' (lambda () (setq auto-fill-function nil)))


;; Smooth down key
(progn
 (setq scroll-step 1)
 (setq scroll-conservatively 4))

;; Answer y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; no backup file
;(progn
;  (setq auto-save-list-file-name nil)
;  (setq auto-save-list-file-prefix nil)
;  (setq make-backup-files nil))

;; Show time in status line

;(progn
;  (setq display-time-24hr-format t)
;  (setq display-time-format "%Y-%m-%d(%a) %H:%M")
;  (setq display-time-day-and-date t)
;  (setq display-time-interval 30)
;  (display-time))



;; Ack
;; http://d.hatena.ne.jp/antipop/20080311/1205252552
(defun ack ()
  (interactive)
  (let ((grep-find-command "ack --nocolor --nogroup --ignore-dir=HTML"))
    (call-interactively 'grep-find)))


;; C-o to move window
;; But it conflicts "Open directory" in Dired-mode....
(global-set-key "\C-o" 'next-multiframe-window)

;; Orikaeshi
(setq truncate-partial-width-windows nil)



;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)


; install-elisp
; http://d.hatena.ne.jp/tomoya/20090121/1232536106
(require 'install-elisp)
(setq install-elisp-repository-directory (expand-file-name "~/dotfiles/.elisp/"))

; key-chord
; http://d.hatena.ne.jp/rubikitch/20081104/1225745862
(require 'key-chord)
(setq key-chord-two-keys-delay 0.04)
(key-chord-mode 1)


(load "init-physical-move")
(load "init-shell")
(load "init-flymake")
;(load "init-js2")
(load "init-jaspace")
(when (eq window-system 'mac) 
  (load "init-skk"))
;(load "init-perl")
;(load "init-cpp")
;(load "init-autosave-enhanced")
(load "init-autosave")
;(load "init-auto-complete")
;(load "init-anything")

(require 'anything-startup)
(global-set-key [?\C-;] 'anything-for-files)


(load "init-revive")
;(load "init-html")
(load "init-gauche")
(load "init-python")
(load "init-gdb")
(load "init-gtags")
;(load "init-search")
;(load "less")
(load "init-spell")
(load "init-view")
;(load "init-yasnippet")
(load "init-c")
(load "ambienttalk")
(setq auto-mode-alist (cons '("??.at" . at-mode) auto-mode-alist))


(require 'linum)

;(add-to-list 'load-path "/directory/containing/nav/")
;; Project home http://code.google.com/p/emacs-nav/
;; Instructions are seen in the source file nav.el
(require 'nav)


;; Physical line
; http://hal.e-fpage.com/t/20080901.html#p01
(require 'physical-line)
(define-key global-map "\C-a" 'physical-line-beginning-of-line)
(define-key global-map "\C-e" 'physical-line-end-of-line)


;; 変態キーバインド
;; http://d.hatena.ne.jp/k12u/20081118/p1
;(global-set-key [S-right] 'split-window-horizontally)
;(global-set-key [S-left] 'split-window-horizontally)
;(define-key global-map [S-up] 'split-window-vertically)
;(define-key global-map [S-down] 'delete-other-windows)

;(global-set-key [right] 'windmove-right)
;(global-set-key [left] 'windmove-left)
;(define-key global-map [up] 'windmove-up)
;(define-key global-map [down] 'windmove-down) 

;(global-set-key [C-backspace] 'switch-to-buffer)
;(global-set-key [C-delete] '(lambda() (interactive)(kill-buffer (buffer-name))))

;(global-set-key [C-right] 'elscreen-next)
;(global-set-key [C-left] 'elscreen-previous)
;(global-set-key [C-return] 'find-file)

;--------------------------------------------------------------------------------
;; scroll n line from Mr.Sekiguchi *C-q と C-z に当てている。
; by katchan
;--------------------------------------------------------------------------------
(defun scroll-n-lines-ahead (&optional n)
  "Scroll ahead N lines (default N = 2)"
  (interactive "p")
  (scroll-up (prefix-numeric-value n)))
(defun scroll-n-lines-behind (&optional n)
  "Scroll behind N lines (default N = 2)"
  (interactive "p")
  (scroll-down (prefix-numeric-value n)))
(global-set-key "\C-z" 'scroll-n-lines-ahead)
(global-set-key "\C-q" 'scroll-n-lines-behind)





;; デフォルトで分割
(split-window-horizontally)

(if window-system (set-frame-parameter nil 'fullscreen 'fullboth))


; adjust Jis_table
; define whizzy-command-name
(autoload 'whizzytex-mode
"whizzytex"
"WhizzyTeX, a minor-mode WYSIWIG environment for LaTeX" t)

;; Egg the emacs controller of git
;; http://github.com/bogolisk/egg/wikis
;; C-v + c:commit, d:status, l:log, l p:push

(add-to-list 'exec-path "/usr/local/git/bin")
(add-to-list 'exec-path "~/local/bin")
;(require 'egg)

;; Bookmark
(defadvice bookmark-set (around bookmark-set-ad activate)
  (bookmark-load bookmark-default-file t t) ;; 登録前に最新のブックマークを読み直す
  ad-do-it
  (bookmark-save))

(defadvice bookmark-jump (before bookmark-set-ad activate)
  (bookmark-load bookmark-default-file t t))


(defun pukiwiki-pre ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "^$" "　")
    (goto-char (point-max))
    (beginning-of-line)
    (forward-char)
    (open-rectangle (point-min) (point))
    (mark-whole-buffer)
    (copy-region-as-kill-nomark (point-min) (point-max))
    )
)

;; auto-install
;; http://d.hatena.ne.jp/rubikitch/20091221/autoinstall
(require 'auto-install)
(setq auto-install-directory "~/dotfiles/.elisp/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)


; Window resizer
; http://d.hatena.ne.jp/mooz/20100119/p1
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))
(global-set-key "\C-c\C-r" 'window-resizer)


(add-hook 'lisp-mode-hook
          '(lambda ()
             (progn
               (message "lisp-mode-hook")
               (local-set-key "\C-cb" 'eval-buffer)
               (local-set-key "\C-ct" 'at-mode-test-indent-run))))

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)


;; rst
(setq frame-background-mode 'dark)
;;; rst.el --- Mode for viewing and editing reStructuredText
;; http://docutils.sourceforge.net/
(load "rst")
(setq auto-mode-alist
      (append '(
                ("\\.txt$" . rst-mode)
                ("\\.rst$" . rst-mode)
                ) auto-mode-alist))
(add-hook 'rst-mode-hook
              (lambda ()
                (setq rst-slides-program "open -a Firefox")
                ))
(setq erlang-dir  "/opt/local/lib/erlang/lib/tools-2.6.6/emacs/")
(setq load-path (cons "/opt/local/lib/erlang/lib/tools-2.6.6/emacs"
                      load-path))
(setq erlang-root-dir "/opt/local/")
(setq exec-path (cons "/opt/local/bin" exec-path))
(require 'erlang-start)


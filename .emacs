(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;(add-to-list 'load-path "~/.emacs.d/lisp/")

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(add-to-list 'load-path "~/.emacs.d/lisp/")

(add-hook 'verilog-mode-hook
      '(lambda ()
;         (setq verilog-auto-newline nil)
         (setq verilog-indent-level             4
               verilog-indent-level-module      0
               verilog-indent-level-declaration 0
               verilog-indent-level-behavioral  4
               verilog-indent-level-directive   4
               verilog-case-indent              4
               verilog-cexp-indent              4
               verilog-indent-begin-after-if    nil
               verilog-auto-newline             t
               verilog-auto-indent-on-newline   t
               verilog-tab-always-indent        t
               verilog-auto-endcomments         t
               verilog-align-ifelse nil         t
               verilog-minimum-comment-distance 40
               verilog-indent-level 4)
;         (setq verilog-tab-always-indent nil)
))
;(add-to-list 'load-path "/opt/fpgatools/emacs/lisp/")
;(load-file "/opt/fpgatools/emacs/fpga_config.el")

;; try new here
;   ;; Enable syntax highlighting of **all** languages
;   (global-font-lock-mode t)
;
;   ;; User customization for Verilog mode
;   (setq verilog-indent-level             4
;         verilog-indent-level-module      0
;         verilog-indent-level-declaration 0
;         verilog-indent-level-behavioral  4
;         verilog-indent-level-directive   4
;         verilog-case-indent              4
;         verilog-auto-newline             t
;         verilog-auto-indent-on-newline   t
;         verilog-tab-always-indent        t
;         verilog-auto-endcomments         t
;         verilog-minimum-comment-distance 40
;         verilog-indent-begin-after-if    t
;         verilog-auto-lineup              'declarations
;         verilog-highlight-p1800-keywords nil
;         verilog-linter                   "my_lint_shell_command"
;         )
;
;; end 

(global-set-key [f2] 'copy-to-register) 
(global-set-key [f3] 'insert-register) 
(global-set-key [f4] 'string-rectangle) 
(global-set-key [C-f4] 'clear-rectangle)
;(global-set-key [f5] 'call-last-kbd-macro)
;(global-set-key [f5] 'delete-rectangle)
(global-set-key [f5] 'revert-buffer-no-confirm)
(global-set-key [f6] 'query-replace)
(global-set-key [f7] 'align-regexp)
(global-set-key [?\C-x ?l] 'goto-line)

;(load-file "~/emacs/cedet-1.1/common/cedet.el")
;(global-ede-mode 1)                      ; Enable the Project management system
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;(global-srecode-minor-mode 1)            ; Enable template insertion menu


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(inhibit-startup-screen t)
 '(mark-even-if-inactive t)
 '(scroll-bar-mode (quote right))
 '(transient-mark-mode 1))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(eval-after-load "vc-hooks"
  '(define-key vc-prefix-map "=" 'ediff-revision))



;(eval-after-load "vc-hooks"
;  '(define-key vc-prefix-map "=" 'ediff-current-buffer-revision))

(defun ediff-current-buffer-revision ()
  "Run Ediff to diff current buffer's file against VC depot.
Uses `vc.el' or `rcs.el' depending on `ediff-version-control-package'."
  (interactive)
  (let ((file (or (buffer-file-name)
                  (error "Current buffer is not visiting a file"))))
    (if (and (buffer-modified-p)
             (y-or-n-p (message "Buffer %s is modified. Save buffer? "
                                (buffer-name))))
        (save-buffer (current-buffer)))
    (ediff-load-version-control)
    (funcall
     (intern (format "ediff-%S-internal" ediff-version-control-package))
     "" "" nil)))




(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )


(when (display-graphic-p)
  ;(set-face-attribute 'default nil :font "Monospace")
  ;;(set-frame-font "Monospace" nil t)
  ;(set-frame-font "DejaVu Sans Mono" nil t)
  ;(set-frame-size (selected-frame) 120 50)
  ;;(load-theme 'alect-light t)
  (load-theme 'zenburn t)
  ;(load-theme 'solarized-dark t)
  ;(load-theme 'ample t)
  ;(load-theme 'cherry-blossom t)
  ;(load-theme 'soft-charcoal t)
  ;(load-theme 'afternoon t)
  )

(global-set-key [remap kill-ring-save] 'easy-kill)
(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
;(require 'framemove)
;    (windmove-default-keybindings)
;    (setq framemove-hook-into-windmove t)

;; Preset width nlinum
;(add-hook 'nlinum-mode-hook
;          (lambda ()
;            (setq nlinum--width
;              (length (number-to-string
;                       (count-lines (point-min) (point-max)))))))

;(add-hook 'linum-mode-hook)
(add-hook 'isearch-mode-hook
          (function
           (lambda ()
             (define-key isearch-mode-map "\C-h" 'isearch-mode-help)
             (define-key isearch-mode-map "\C-t" 'isearch-toggle-regexp)
             (define-key isearch-mode-map "\C-c" 'isearch-toggle-case-fold)
             (define-key isearch-mode-map "\C-j" 'isearch-edit-string))))


(require 'multiple-cursors)
;(global-set-key (kbd "C->") 'mc/mark-next-like-this)
;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;(global-set-key (kbd "s-c") 'mc/edit-lines)

(global-set-key (kbd "s-s") 'mc/mark-next-like-this)
(global-set-key (kbd "s-r") 'mc/mark-previous-like-this)
(global-set-key (kbd "s-a") 'mc/mark-all-like-this)
(global-set-key (kbd "s-f") 'mc/mark-all-like-this-in-defun)
(global-set-key (kbd "s-1") 'mc/insert-numbers)

(global-set-key (kbd "s-f") 'mc/unmark-next-like-this)
(global-set-key (kbd "s-b") 'mc/unmark-previous-like-this)
;(require 'phi-search)
;(global-set-key (kbd "C-s") 'phi-search)
;(global-set-key (kbd "C-r") 'phi-search-backward)

(global-set-key (kbd "C-=") 'er/expand-region)

(show-paren-mode 1)

;; Source: http://www.emacswiki.org/emacs-en/download/misc-cmds.el
(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive)
    (revert-buffer t t))

(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

; opengrok setup
; requires clj-opengrok
;(require 'eopengrok)

;(define-key global-map (kbd "C-c s i") 'eopengrok-create-index)
;(define-key global-map (kbd "C-c s I") 'eopengrok-create-index-with-enable-projects)
;(define-key global-map (kbd "C-c s d") 'eopengrok-find-definition)
;(define-key global-map (kbd "C-c s f") 'eopengrok-find-file)
;(define-key global-map (kbd "C-c s s") 'eopengrok-find-reference)
;(define-key global-map (kbd "C-c s t") 'eopengrok-find-text)
;(define-key global-map (kbd "C-c s h") 'eopengrok-find-history)
;(define-key global-map (kbd "C-c s c") 'eopengrok-find-custom)
;(define-key global-map (kbd "C-c s b") 'eopengrok-resume)
;(put 'downcase-region 'disabled nil)

(defun color4 ()
  "Sets color scheme number 4"
  (interactive)
  (setq disp (getenv "DISPLAY"))
;  (mouse-set-font "-misc-fixed-*-r-normal--13-120-*-*-m-*-iso8859-1")
;  (mouse-set-font "-adobe-courier-*-r-normal--14-140-*-*-m-*-iso8859-1")
;  (mouse-set-font "lucidasans-typewriterbold12")
;  (mouse-set-font "-B&H-LucidaTypewriter-Medium-R-Normal-Sans-12-120-75-75-M-70-ISO8859-1")
;  (mouse-set-font "7x13")
  (set-background-color "#101020")
  (set-foreground-color "green")
  (set-border-color "white")
  (set-cursor-color "yellow")
  (set-mouse-color "yellow")
  (set-face-background 'region "grey30")
  (set-face-background 'highlight "black")
  (set-face-foreground 'highlight "red")
  (set-face-foreground 'bold "yellow")
  (set-face-background 'bold "black")
  ;(set-face-foreground 'modeline "yellow")
  ;(set-face-background 'modeline "#808080")
)

;(color4)

(dumb-jump-mode)

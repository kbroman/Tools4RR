;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Karl's emacs stuff
;;

;; problem with vc-git
(delete 'Git vc-handled-backends)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; colour themes using color-theme.el
(require 'dark-emacs-theme)

;; polymode (for handling multiple emacs modes)
(add-to-list 'load-path "~/.emacs.d/polymode/")
(add-to-list 'load-path "~/.emacs.d/polymode/modes")
(require 'poly-R)
(require 'poly-markdown)

;; spaces instead of tabs
(setq-default indent-tabs-mode nil)
;; if you want to insert a tab, use C-q C-i
;; note also: delete-trailing-whitespace
(setq-default indent-level 4)
(setq-default tab-width 4)

;; change font
;(set-face-font 'default "-jnk-neep alt-medium-r-*-*-20-*-*-*-c-*-iso8859-1")
;(set-face-attribute 'default nil :font "Droid Sans Mono-10")
(set-default-font "Inconsolata-13")


;; the following to change the look of the font
(setq mac-allow-anti-aliasing nil)  ;; turn off anti-aliasing
;; note: turn it back on with the following:
;; (setq mac-allow-anti-aliasing t)    ;; turn on anti-aliasing (default)

;; get rid of toolbar
;(tool-bar-mode 0)

(setq default-major-mode 'text-mode)
(setq text-mode-hook 'turn-on-auto-fill)

(global-set-key "\M-\C-r"  'isearch-forward)
(global-set-key "\C-H"     'backward-delete-char-untabify)
(global-set-key "\C-X?"    'help-for-help)
(global-set-key "\C-Xe"    'replace-string)
(global-set-key "\C-Xt"    'toggle-read-only)
(global-set-key "\C-Xw"    'goto-line)
(global-set-key "\C-Xz"    'call-last-kbd-macro)
(global-set-key "\C-Xc"    'compile)
;(global-set-key "\C-^"     'set-mark-command)

(display-time)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ESS (from Bill)
;;

;; try to get it to go with 4-space tabs
;;(setq ess-indent-level 4)
;;(defun myindent-ess-hook ()
;;  (setq ess-indent-level 4))
;;(add-hook 'ess-mode-hook 'myindent-ess-hook)
;;; identation style options: DEFAULT, OWN, GNU, BSD, K&R, C++, RRR, CLB. T
;;(setq ess-default-style 'OWN)
;;(setq ess-continued-statement-offset 0) <- this would work for function() but not other continuation lines

;;; ESS
(add-hook 'ess-mode-hook
      (lambda ()
        (ess-set-style 'C++ 'quiet)
        ;; Because
        ;;                                 DEF GNU BSD K&R C++
        ;; ess-indent-level                  2   2   8   5   4
        ;; ess-continued-statement-offset    2   2   8   5   4
        ;; ess-brace-offset                  0   0  -8  -5  -4
        ;; ess-arg-function-offset           2   4   0   0   0
        ;; ess-expression-offset             4   2   8   5   4
        ;; ess-else-offset                   0   0   0   0   0
        ;; ess-close-brace-offset            0   0   0   0   0
        (add-hook 'local-write-file-hooks
              (lambda ()
            (ess-nuke-trailing-whitespace)))))
;;(setq ess-nuke-trailing-whitespace-p 'ask)
;; or even
(setq ess-nuke-trailing-whitespace-p t)
;; Perl
(add-hook 'perl-mode-hook
      (lambda () (setq perl-indent-level 4)))


; get rid of the treatment of # vs ## vs ### comments
(setq ess-fancy-comments nil)

;; Load ess
(load "~/.emacs.d/ess-13.09-1/lisp/ess-site")
(ess-toggle-underscore nil)    ; stop the damned _ to <- thing

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Arduino mode
(autoload 'arduino-mode "~/.emacs.d/lisp/arduino-mode.el"
   "Major mode for editing Arduino files" t)
(setq auto-mode-alist (cons
    '("\\.ino" . arduino-mode) auto-mode-alist))

;; fontification font-lock.el much better than the default hilit19.el
;;     (for coloring)
;;automatic Font Lock mode in TeX mode
(add-hook 'tex-mode-hook 'turn-on-font-lock)
;;if Font Lock necessary for other than .tex files, uncomment following
(global-font-lock-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; magit mode (for git)
;; http://magit.github.io/magit/
(add-to-list 'load-path "~/.emacs.d/git-modes")
(add-to-list 'load-path "~/.emacs.d/magit")
(eval-after-load 'info
  '(progn (info-initialize)
          (add-to-list 'Info-directory-list "~/.emacs.d/magit/")))
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
;; change magit diff colors
(eval-after-load 'magit
  '(progn
     (set-face-background 'magit-item-highlight "black")
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (set-face-background 'magit-diff-add "black")
     (set-face-background 'magit-diff-del "black")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Markdown mode
;; http://jblevins.org/projects/markdown-mode/

(autoload 'markdown-mode "~/.emacs.d/lisp/markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons
    '("\\.md" . markdown-mode) auto-mode-alist))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keys
(global-set-key (kbd "M-D") 'backward-kill-word)
(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))
(global-set-key (kbd "C-x M-m") 'shell)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  macros
;;
(fset 'doublequote
   "\\\"\C-b\C-b\C-d\C-f")
(global-set-key "\C-X\""  'doublequote)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   Duncan's stuff
;;
;;
auto-mode-alist (append (list '("\\.c$" . c-mode)
                   '("\\.tex$" . latex-mode)
                   '("\\.S$" . S-mode)
                   '("\\.s$" . S-mode)
             '("\\.emacs" . emacs-lisp-mode)
                     )
              auto-mode-alist)

;; D mode
;;    placed d-mode.el in /opt/local/share/emacs/site-lisp/
;;    within emacs, used 'byte-compile-file' on d-mode.el to create d-mode.elc
(autoload 'd-mode "d-mode" "Major mode for editing D code." t)
(add-to-list 'auto-mode-alist '("\\.d[i]?\\'" . d-mode))

;; doc mode (for asciidoc)
(add-to-list 'load-path "~/.emacs.d/doc-mode-1.1")
(add-to-list 'auto-mode-alist '("\\.asciidoc$" . doc-mode))
(autoload 'doc-mode "doc-mode")

;; html-helper-mode
(load-file "~/.emacs.d/lisp/beta-html-helper-mode.el")
(require 'html-font)
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode)       auto-mode-alist))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Getting ESS to work with Sweave files
;
(add-to-list 'auto-mode-alist '("\\.Rnw\\'" . Rnw-mode))
(add-to-list 'auto-mode-alist '("\\.Snw\\'" . Rnw-mode))
(setq reftex-file-extensions
     '(("Snw" "Rnw" "nw" "tex" ".tex" ".ltx" "asciidoc") ("bib" ".bib")))
(setq TeX-file-extensions
     '("Snw" "Rnw" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo" "asciidoc"))

;; coffee mode
(add-to-list 'load-path "~/.emacs.d/coffee-mode")
(autoload 'coffee-mode "~/.emacs.d/coffee-mode/coffee-mode.el"
   "Major mode for editing CoffeeScript files" t)
(setq auto-mode-alist (cons
    '("\\.coffee" . coffee-mode) auto-mode-alist))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Copy-and-paste between emacs and OS-X
;
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(require 'quickrun)
(global-set-key (kbd "<f5>") 'quickrun)
(global-set-key (kbd "M-<f5>") 'quickrun-compile-only)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tab widths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'coffee-mode-hook '(lambda ()
  (setq coffee-tab-width 4)))
(add-hook 'css-mode-hook '(lambda ()
  (setq css-indent-offset 4)))
(add-hook 'ruby-mode-hook '(lambda ()
  (setq ruby-indent-level 4)))
(add-hook 'python-mode-hook '(lambda ()
  (setq python-indent 4)))
(add-hook 'ruby-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))
(setq-default c-basic-offset 4)

;; ipython; see http://www.emacswiki.org/emacs/PythonProgrammingInEmacs
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; M-x ipython opens a buffer running ipython
(defun ipython ()
  (interactive)
  (ansi-term "ipython" "ipython"))

; interactive ruby
(require 'inf-ruby)
(defun irb ()
  (interactive)
  (inf-ruby))

; pry (another interactive ruby, like irb)
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-pry")
(require 'pry)

; aliases
(defalias 'ruby 'run-ruby)
; it seems that ip is already an alias for ipython

; julia
(setq inferior-julia-program-name "/usr/local/bin/julia")

; cleanup whitespace before save
(add-hook 'before-save-hook  'whitespace-cleanup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; backup
;; from Jianan
;; original: http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
(setq backup-directory-alist '((".*" . "~/.emacs_backup")))
(setq backup-by-copying t)

;; backup force and more often.
(defun force-backup-of-buffer ()
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook  'force-backup-of-buffer)

(setq version-control t ;; Use version numbers for backups
      kept-new-versions 16 ;; Number of newest versions to keep
      kept-old-versions 2 ;; Number of oldest versions to keep
      delete-old-versions t ;; Ask to delete excess backup versions?
      vc-make-backup-files t ;; Backup files that is registered to a version control system
      backup-by-copying-when-linked t) ;; Copy linked files, don't rename.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:inherit italic :foreground "cyan3" :underline nil))))
 '(font-lock-keyword-face ((t (:inherit italic :foreground "firebrick1" :underline nil))))
 '(font-lock-type-face ((t (:inherit italic :foreground "orchid" :underline nil))))
 '(git-commit-summary-face ((t (:inherit font-lock-type-face :underline nil))))
 '(help-argument-name ((t (:inherit italic :underline nil)))))

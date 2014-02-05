;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Karl's emacs stuff
;;

;; problem with vc-git
(delete 'Git vc-handled-backends)


;; colour themes using color-theme.el
(load-file "~/.emacs_stuff/dark-emacs-theme.el")

;; spaces instead of tabs
(setq-default indent-tabs-mode nil)
;; if you want to insert a tab, use C-q C-i
;; note also: delete-trailing-whitespace
(setq-default indent-level 2)
(setq-default tab-width 2)

;; change font
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
;(global-set-key "\C-^"     'set-mark-command)
(global-set-key (kbd "<f5>") 'quickrun)
(global-set-key (kbd "M-<f5>") 'quickrun-compile-only)

(display-time)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ESS

; try to get it to go with 2-space tabs
(setq ess-indent-level 2)
(defun myindent-ess-hook ()
  (setq ess-indent-level 2))
(add-hook 'ess-mode-hook 'myindent-ess-hook)
;; identation style options: DEFAULT, OWN, GNU, BSD, K&R, C++, RRR, CLB. T
(setq ess-default-style 'OWN) 
;(setq ess-continued-statement-offset 0) <- this would work for function() but not other continuation lines


; get rid of the treatment of # vs ## vs ### comments
(setq ess-fancy-comments nil)

(load "~/.emacs_stuff/ess-13.09-1/lisp/ess-site")
(ess-toggle-underscore nil)    ; stop the damned _ to <- thing

(load "~/.emacs_stuff/arduino-mode")


;; fontification font-lock.el much better than the default hilit19.el
;;     (for coloring)
;;automatic Font Lock mode in TeX mode 
(add-hook 'tex-mode-hook 'turn-on-font-lock) 
;;if Font Lock necessary for other than .tex files, uncomment following
(global-font-lock-mode t) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; magit mode (for git)
;; http://magit.github.io/magit/
;(require 'magit)
;(global-set-key (kbd "C-x g") 'magit-status)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Markdown mode
;; http://jblevins.org/projects/markdown-mode/

(autoload 'markdown-mode "~/.emacs_stuff/markdown-mode.el"
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
;;  a few macros
;;

(fset 'bc
   "/\C-u70*\C-m * \C-m * ")
(fset 'ec
   "\C-m *\C-m \C-u70*/\C-m\C-m")
(fset 'bsc
   "\C-u70#\C-m#\C-m# ")
(fset 'sc
   [?\C-u ?7 ?0 ?# ?\C-a ?\C-n ?# ?\C-a ?\C-n ?#  ?  ?\C-a ?\C-n ?# return ?# ?  ?K ?a ?r ?l ?  ?W ?  ?B ?r ?o ?m ?a ?n return ?# ?  ?M ?a ?r ?s ?h ?f ?i ?e ?l ?d ?  ?M ?e ?d ?i ?c ?a ?l ?  ?R ?e ?s ?e ?a ?r ?c ?h ?  ?F ?o ?u ?n ?d ?a ?t ?i ?o ?n return ?# ?  ?A ?p ?r ?i ?l ?, ?  ?1 ?9 ?9 ?9 return ?# return ?\C-u ?7 ?0 ?# return return ?\C-p ?\C-p ?\C-p ?\C-p ?\C-p ?\C-p ?\C-p ?\C-p ?\C-e])
(fset 'esc
   "\C-m#\C-m\C-u70#\C-m\C-m")
(fset 'blc
   "\C-u70%\C-m%\C-m% ")
(fset 'elc
   "\C-m%\C-m\C-u70%\C-m\C-m")
(fset 'code
   "\\code{}\C-b")
(fset 'dq
   "\\\"\C-b\C-b\C-d\C-f")
(fset 'codeq
   "\\code{\\\"\\\"}\C-b\C-b\C-b\C-b\C-b\C-d\C-f\C-d")
(fset 'codeqq
   "\"\\code{}\"\C-b\C-b\C-b")
(fset 'Sin
   [?\\ ?b ?e ?g ?i ?n ?{ ?S ?c ?h ?u ?n ?k ?} return ?\\ ?b ?e ?g ?i ?n ?{ ?S ?i ?n ?p ?u ?t ?} return ?\\ ?e ?n ?d ?{ ?S ?i ?n ?p ?u ?t ?} return ?\\ ?e ?n ?d ?{ ?S ?c ?h ?u ?n ?k ?} ?\C-a ?\C-p ?\C-p ?\C-n])
(fset 'Sout
   [?\\ ?b ?e ?g ?i ?n ?{ ?S ?c ?h ?u ?n ?k ?} return ?\\ ?b ?e ?g ?i ?n ?{ ?S ?o ?u ?t ?p ?u ?t ?} return ?\\ ?e ?n ?d ?{ ?S ?o ?u ?t ?p ?u ?t ?} return ?\\ ?e ?n ?d ?{ ?S ?c ?h ?u ?n ?k ?} ?\C-a ?\C-p])

(fset 'doublequote
   "\\\"\C-b\C-b\C-d\C-f")
(global-set-key "\C-X\""  'doublequote)

(fset 'rqtlcode
   "\\usercolor \\verb|| \\normalcolor\C-b\C-b\C-b\C-b\C-b\C-b\C-b\C-b\C-b\C-b\C-b\C-b\C-b\C-b")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; modes from file extensions
 auto-mode-alist (append (list '("\\.c$" . c-mode)
			       '("\\.tex$" . latex-mode)
			       '("\\.S$" . S-mode)
			       '("\\.s$" . S-mode)
			       '("\\.html$" . html-mode)
			       '("\\.ino$" . arduino-mode)
                               '("\\.emacs" . emacs-lisp-mode)
	                 )
		      auto-mode-alist)

;; D mode
;;    placed d-mode.el in /opt/local/share/emacs/site-lisp/
;;    within emacs, used 'byte-compile-file' on d-mode.el to create d-mode.elc
(autoload 'd-mode "d-mode" "Major mode for editing D code." t)
(add-to-list 'auto-mode-alist '("\\.d[i]?\\'" . d-mode))

;; doc mode (for asciidoc)
(add-to-list 'auto-mode-alist '("\\.asciidoc$" . doc-mode))
(autoload 'doc-mode "doc-mode")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Taken from http://www.farne.uklinux.net/emacs-primer.html
;     I believe this will allow automatic update of the 
;     "Last modified" line at the end of html files
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
(setq html-helper-do-write-file-hooks t)
(add-hook 'html-helper-load-hook '(lambda() (require 'html-font)))
(add-hook 'html-helper-mode-hook '(lambda () (font-lock-mode 1)))


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
(add-to-list 'load-path "coffee-mode")
(require 'coffee-mode)


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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tab widths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'coffee-mode-hook '(lambda ()
  (setq coffee-tab-width 2)))
(add-hook 'css-mode-hook '(lambda ()
  (setq css-indent-offset 2)))
(add-hook 'ruby-mode-hook '(lambda ()
  (setq ruby-indent-level 2)))
(add-hook 'python-mode-hook '(lambda ()
  (setq python-indent 2)))
(add-hook 'ruby-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))

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

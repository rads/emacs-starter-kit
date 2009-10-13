;; Fonts
(setq default-frame-alist '((font . "-unknown-Consolas-normal-normal-normal-*-15-*-*-*-m-0-*-*")))

;; Settings
(setq-default tab-width 2)
(setq-default c-indent-level 2)
(setq-default indent-tabs-mode nil)
(prefer-coding-system 'utf-8)
(setq-default ispell-program-name "aspell")
(add-to-list 'exec-path "/usr/local/bin")

(add-to-list 'default-frame-alist '(height . 57))

(defun word-count nil "Count words in buffer" (interactive)
  (shell-command-on-region (point-min) (point-max) "wc -w"))

;; Markdown
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(add-hook 'markdown-mode-hook 'longlines-mode)

;; Colors
(color-theme-twilight)

;; Shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; swank-clojure
(add-to-list 'load-path "~/.emacs.d/vendor/swank-clojure/src/emacs")

(setq swank-clojure-jar-path "/usr/local/clojure/clojure.jar"
      swank-clojure-extra-classpaths (list
				      "~/.emacs.d/vendor/swank-clojure/src/main/clojure"
				      "/usr/local/clojure-contrib/clojure-contrib.jar"))

(require 'swank-clojure-autoload)

;; slime
(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))))

(add-to-list 'load-path "~/.emacs.d/vendor/slime")
(require 'slime)
(slime-setup)

;; TextMate
(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
(textmate-mode)

;; yasnippet
(add-to-list 'load-path "~/.emacs.d/vendor/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets")

(server-start)
(shell)
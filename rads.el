;; Fonts
(set-default-font "-unknown-Menlo-normal-normal-normal-*-13-*-*-*-m-0-*-*")

;; Settings
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(prefer-coding-system 'utf-8)

(if (window-system)
    (set-frame-height (selected-frame) 57))

;; Colors
(color-theme-twilight)

;; Shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(shell)

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
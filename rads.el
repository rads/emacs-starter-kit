;; Fonts
(setq default-frame-alist '((font . "-unknown-Consolas-normal-normal-normal-*-15-*-*-*-m-0-*-*")))

;; Settings
(setq-default tab-width 4)
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
(add-to-list 'load-path "~/.emacs.d/vendor/color-theme")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-arjen)))

;; Shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; swank-clojure
(add-to-list 'load-path "~/.emacs.d/vendor/swank-clojure/src/emacs")
(clojure-slime-config "/Users/rads/.clojure")
(setq swank-clojure-jar-path "~/.clojure/clojure.jar")
(setq swank-clojure-extra-classpaths (cons "~/.emacs.d/vendor/swank-clojure/src/main/clojure" (directory-files "~/.clojure/" t ".jar$")))

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
(yas/load-directory "~/.emacs.d/vendor/yasnippets-rails/rails-snippets")

;; ruby
(add-hook 'ruby-mode-hook 'whitespace-mode)

(dolist (command '(yank yank-pop))
       (eval `(defadvice ,command (after indent-region activate)
                (and (not current-prefix-arg)
                     (member major-mode '(emacs-lisp-mode lisp-mode
                                                          clojure-mode    scheme-mode
                                                          haskell-mode    ruby-mode
                                                          rspec-mode      python-mode
                                                          c-mode          c++-mode
                                                          objc-mode       latex-mode
                                                          plain-tex-mode))
                     (let ((mark-even-if-inactive transient-mark-mode))
                       (indent-region (region-beginning) (region-end) nil))))))

(defun rename-file-and-buffer (new-name)
"Renames both current buffer and file it's visiting to NEW-NAME."
(interactive "sNew name: ")
(let ((name (buffer-name))
      (filename (buffer-file-name)))
  (if (not filename)
      (message "Buffer '%s' is not visiting a file!" name)
    (if (get-buffer new-name)
        (message "A buffer named '%s' already exists!" new-name)
      (progn
        (rename-file name new-name 1)
        (rename-buffer new-name)
        (set-visited-file-name new-name)
        (set-buffer-modified-p nil))))))

(server-start)
(shell)
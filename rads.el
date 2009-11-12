(add-to-list 'load-path "~/.emacs.d/vendor")

(load "rads/global")
(load "rads/theme")
(load "rads/modes")

(server-start)
(shell)
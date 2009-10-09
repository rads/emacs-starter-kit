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

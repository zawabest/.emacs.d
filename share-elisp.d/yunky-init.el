;; coding
(define-coding-system-alias 'UTF-8 'utf-8)
(setq inhibit-startup-message t)
(setq flymake-mode t)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
(define-key ac-completing-map "\M-n" 'ac-next)
(define-key ac-completing-map "\M-p" 'ac-previous)
(setq ac-auto-start 2)
(setq ac-dwim t)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; default
(require 'undo-tree)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-j") 'newline)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-p") 'mark-paragraph)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "M-SPC") 'linum-mode)
(global-set-key (kbd "C-x /") 'comment-or-uncomment-region)

;; hideshow
(global-set-key (kbd "C-c h") 'hs-minor-mode)
(global-set-key (kbd "C-c a") 'hs-hide-all)
(global-set-key (kbd "C-c A") 'hs-show-all)
(global-set-key (kbd "C-c b") 'hs-hide-block)
(global-set-key (kbd "C-c B") 'hs-show-block)
(global-set-key (kbd "C-c t") 'hs-toggle-hiding)
(global-set-key (kbd "C-c l") 'hs-hide-leve)

;; c
(defun linux-c-mode ()
        "C mode with adjusted defaults for use with the Linux kernel."
	(interactive)
	(c-mode)
	(c-set-style "K&R")
	(setq tab-width 8)
	(setq indent-tabs-mode t)
	(setq c-basic-offset 8)
        (semantic-mode)
	(global-set-key (kbd "M-n") 'semantic-ia-complete-symbol)
	;;(require 'ascope)
	)
(setq auto-mode-alist (cons '("/.*\\.[ch]$" . linux-c-mode) auto-mode-alist))

;; smex
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)


;; python
;;(setq lsp-python-ms-auto-install-server t)
;;(setq lsp-python-ms-executable
;;      "~/.emacs.d/elpa/Microsoft.Python.LanguageServer")
;;(use-package lsp-python-ms
;;  :ensure t
;;  :init (setq lsp-python-ms-auto-install-server t)
;;  :hook (python-mode . (lambda ()
;;                         (require 'lsp-python-ms)
;;                         (lsp))))
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))
(setq lsp-idle-delay 0.0)
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0)
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

;; export
(provide 'yunky-init)

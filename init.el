;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("6dcf1ca4c7432773084b9d52649ee5eb2c663131c4c06859f648dea98d9acb3e"
     default))
 '(package-selected-packages
   '(clang-format company dap-mode flycheck go-mode helm-lsp lsp-ivy
		  lsp-treemacs lsp-ui markdown-mode rainbow-delimiters
		  standard-themes typescript-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq inhibit-startup-screen t)
(setq-default tab-width 4)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; (unless package-archive-contents (package-refresh-contents))
;; (package-install 'clang-format)

;(add-to-list 'exec-path "/opt/homebrew/bin")
;(setenv "PATH" (concat "/opt/homebrew/bin:/opt/homebrew/Cellar/clang-format/22.1.1/bin/:" (getenv "PATH")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; install:
;;         lsp-ui, flycheck, company,
;;         lsp-treemacs, helm-lsp, lsp-ivy
;;         dap-mode, lsp-mode, rainbow-delimiters
;;
;;         jupyter, ein? -=> Seem dodge
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-theme 'wombat :no-confirm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'clang-format)
(global-set-key (kbd "C-c i") 'clang-format-region)
(global-set-key (kbd "C-c u") 'clang-format-buffer)
;; (seq clang-fomrat-style-option "llvm")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'helm)
(helm-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq treemacs-follow-after-init t)
(setq treemacs-select-window-method t)
(setq treemacs-display-in-side-window t)
(setq treemacs-follow-mode t)
(setq treemacs-project-follow-mode t)
;(treemacs)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun pbcopy ()
  (interactive)
  (let ((deactivate-mark t))
    (call-process-region (point) (mark) "pbcopy")
    (setq mark-active nil)
    (message "Copied")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package rainbow-delimiters
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'lsp-mode)
;;
;; (add-hook 'prog-mode-hook #'lsp)
;; $ pip install 'python-lsp-server[all]'
(add-hook 'python-mode-hook 'lsp-deferred)
;; $ npm install -g unified-language-server
(add-hook 'markdown-mode-hook 'lsp-deferred)
;; $ npm install -g typescript-language-server; npm install -g typescript
(add-hook 'typescript-mode-hook 'lsp-deferred)
(add-hook 'javascript-mode-hook 'lsp-deferred)
;; $ npm install -g sql-language-server
(add-hook 'sql-mode-hook 'lsp-deferred)
(add-hook 'c-mode-hook 'lsp-deferred)
(add-hook 'cpp-mode-hook 'lsp-deferred)
(add-hook 'go-mode-hook 'lsp-deferred)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq initial-scratch-message nil)

(defun my-disable-scratch-buffer ()
  (let ((buf (get-buffer "*scratch*")))
    (when buf
      (kill-buffer buf))))
(add-hook 'emacs-startup-hook #'my-disable-scratch-buffer)


(global-set-key (kbd "TAB") 'self-insert-command)
(global-set-key (kbd "TAB") 'tab-to-tab-stop)
(setq-default tab-width 4)
(setq-default tab-stop-list (list 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108))

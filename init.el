;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(clang-format company dap-mode flycheck go-mode helm-lsp lsp-ivy
		  lsp-treemacs lsp-ui markdown-mode standard-themes
		  typescript-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; (unless package-archive-contents (package-refresh-contents))
;; (package-install 'clang-format)

(add-to-list 'exec-path "/opt/homebrew/bin")
(setenv "PATH" (concat "/opt/homebrew/bin:/opt/homebrew/Cellar/clang-format/22.1.1/bin/:" (getenv "PATH")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; install:
;;         lsp-ui, flycheck, company,
;;         lsp-treemacs, helm-lsp, lsp-ivy
;;         dap-mode, lsp-mode

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-theme 'modus-operandi :no-confirm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'clang-format)
(global-set-key (kbd "C-c i") 'clang-format-region)
(global-set-key (kbd "C-c u") 'clang-format-buffer)
;; (seq clang-fomrat-style-option "llvm")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'helm)
(helm-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(treemacs)
(treemacs-project-follow-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun pbcopy ()
  (interactive)
  (let ((deactivate-mark t))
    (call-process-region (point) (mark) "pbcopy")
    (setq mark-active nil) ;; I prefer to unset region afterward
    (message "Copied"))) ;; feedback


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


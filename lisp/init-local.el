;;; Code:
(require 'evil)
(evil-mode 1)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'rvm)
(rvm-use-default)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;;; evil-matchit
(require 'evil-matchit)
(global-evil-matchit-mode t)

;;; projectile-rails
(projectile-rails-global-mode)

;;; 在编程语言文件中使用 linum-mode
(add-hook 'prog-mode-hook 'linum-mode)

;;; 在html.erb 文件里使用 web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(setq web-mode-css-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;;; 设置光标颜色
(set-cursor-color "SpringGreen1")

;;; org mode 可以导出带中文字的pdf
(setq org-latex-to-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))

;;; 给elscreen绑定一些操作, emacs tab
(defun my-create-new-tab ()
  "Run elscreen-start, then run elscreen-create."
  (interactive)
  (elscreen-start)
  (elscreen-clone))

(global-set-key (kbd "C-c t t") 'my-create-new-tab)
(global-set-key (kbd "C-c t c") 'elscreen-clone)
;; (global-set-key (kbd "C-x t t") 'elscreen-create)
(global-set-key (kbd "C-c t n") 'elscreen-next)
(global-set-key (kbd "C-c t p") 'elscreen-previous)
(global-set-key (kbd "C-c t k") 'elscreen-kill)
(global-set-key (kbd "C-c t o") 'elscreen-kill-others)
(global-set-key (kbd "C-c t g") 'elscreen-goto)

;; set auto-fill to all major-mode
(setq auto-fill-function 'do-auto-fill)

;; create tags file for the project

(setq path-to-ctags "/usr/local/bin/ctags")
(defun create-tags (dir-name)
  "Create tags file in DIR-NAME."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name))))

(provide 'init-local)
;;; init-local.el ends here

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

(provide 'init-local)

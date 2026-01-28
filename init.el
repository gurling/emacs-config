;;; init.el -*- lexical-binding: t; -*-

;; If you're using straight, you usually want to prevent package.el from interfering.
(setq package-enable-at-startup nil)

;; ---- straight bootstrap (must be BEFORE org-babel-load-file) ----
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Use straight by default in use-package (NOTE: you had a typo in config.org)
(setq straight-use-package-by-default t)

;; Make sure use-package is available early
(straight-use-package 'use-package)
(require 'use-package)

;; CRITICAL: install + load straight's Org BEFORE using org-babel-load-file
(straight-use-package 'org)
(require 'org)
(require 'ob-tangle)

(org-babel-load-file
 (expand-file-name
 "config.org"
 user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("daa27dcbe26a280a9425ee90dc7458d85bd540482b93e9fa94d4f43327128077"
     "d2ab3d4f005a9ad4fb789a8f65606c72f30ce9d281a9e42da55f7f4b9ef5bfc6"
     "c20728f5c0cb50972b50c929b004a7496d3f2e2ded387bf870f89da25793bb44"
     "c3076fdee603e9768817cfe8dbf6253d5b3cf3bf4602cb32fa2f1df62fe70b1c"
     default))
 '(safe-local-variable-values
   '((eval add-hook 'after-save-hook #'org-latex-export-to-pdf nil t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

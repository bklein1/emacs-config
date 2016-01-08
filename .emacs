
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-agenda-files (quote ("~/Dokumente/Management/Aufgaben/TODO.org" "~/Dokumente/Management/Aufgaben/Ordnung.org" "~/Dokumente/Management/Sonstiges.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/src/emacs-config/modules")

(require 'move-lines)
(require 'org-manage)

(setq org-manage-directory-org  "~/Dokumente/Management")
(setq default-directory "~/Dokumente/")

 ;; Acticate key binding which migth clash with other Elisp packages
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)


(move-lines-binding)
(global-hl-line-mode 1)

(desktop-save-mode 0)

(eval-after-load 'org
  (progn
    (define-key org-mode-map (kbd "<S-right>") nil)
    (define-key org-mode-map (kbd "<S-left>") nil)
    (define-key org-mode-map (kbd "<S-up>") nil)
    (define-key org-mode-map (kbd "<S-down>") nil)
  )
)

;; Automatic word wrap
(global-visual-line-mode t)

;; Register custom drawer names
(add-to-list 'org-drawers "NOTES")

;; Configure org-capture
(setq org-default-notes-file "~/Dokumente/Notizen/Eingang.org")
;; (setq org-default-notes-file (concat org-directory "d:/Notizen/Eingang.org"))
(define-key global-map "\C-cc" 'org-capture)






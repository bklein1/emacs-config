
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-agenda-files (quote ("~/Dokumente/Management/Aufgaben/Ordnung.org" "~/Dokumente/Management/Sonstiges.org" "~/Dokumente/Management/TODO.org"))))
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


;; Publishing settings
(setq org-publish-project-alist nil)
(add-to-list 'org-publish-project-alist
             '("orgfiles"
                :base-directory "~/Dokumente/LessonsLearned/"
                :base-extension "org"
                :publishing-directory "~/Experiments/"
                :publishing-function org-html-publish-to-html
                :section-numbers nil
                :table-of-contents nil
                :auto-sitemap t
                :recursive t
                :sitemap-title "Sitemap"
                :style "<link rel=\"stylesheet\" href=\"css/worg.css\" 
type=\"text/css\"/>"))

(add-to-list  'org-publish-project-alist
              '("LessonsLearned"
                :components ("orgfiles")))




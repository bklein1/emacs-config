
;; ------------------------------------------------------------------------------
;;  Load required modules
;; ------------------------------------------------------------------------------
(add-to-list 'load-path "~/src/emacs-config/modules")
(require 'move-lines)
(require 'org-manage)

;; ------------------------------------------------------------------------------
;;  General configuration
;; ------------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-agenda-files (quote ("~/doc/Management/Aufgaben/TODO.org" "~/doc/Management/Aufgaben/Ordnung.org" "~/doc/Management/Sonstiges.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Highlight current line
(global-hl-line-mode 1)

;; Enable moving lines up and down
(move-lines-binding)

(desktop-save-mode 0)

;; Automatic word wrap
(global-visual-line-mode t)

;; Set the start directory for the "Visit new file" dialog
(setq default-directory "~/doc/")

;; ------------------------------------------------------------------------------
;;  Configure org-mode variables
;; ------------------------------------------------------------------------------

;; org-manage provides quick access on the org files in this directory:
(setq org-manage-directory-org  "~/doc/Management")

;; Configure org-capture
(setq org-default-notes-file "~/Dokumente/Notizen/Eingang.org")

;; http://orgmode.org/org.html#index-C_002dc-c-C-988
(setq org-capture-templates
    '(
        ("t" "Todo" entry (file+headline "~/doc/Notizen.org" "Aufgabeneingang") "* %?\n  %i")
        ("d" "Daily" entry (file+datetree "~/doc/Scrum/Daily.org" "Report") "* %?\nEntered on %U\n  %i")
        ("f" "Frage" entry (file+headline "~/doc/Notizen.org" "OffeneFragen") "* %?\n %i")	
        ("i" "Verbesserungsidee" entry (file+headline "~/doc/Notizen.org" "Verbesserungsideen") "* %?\n  %i")
        ("r" "Verbesserungsvorschlag" entry (file "~/doc/Scrum/Retro.org") "* %?\n  %i")
        ("l" "Lesson Learned" entry (file+headline "~/doc/Notizen.org" "LessonsLearned") "* %?\n  %i")
        ("s" "Sonstiges" entry (file+headline "~/doc/Notizen.org" "Sonstige Notizen") "* %?\n  %i")

    )
)

;; Register custom drawer names
(add-to-list 'org-drawers "NOTES")

;; ------------------------------------------------------------------------------
;;  Configure org-mode settings
;; ------------------------------------------------------------------------------

;; Acticate key binding which migth clash with other Elisp packages
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; Avoid conflict with text selection habits
(eval-after-load 'org
  (progn
    (define-key org-mode-map (kbd "<S-right>") nil)
    (define-key org-mode-map (kbd "<S-left>") nil)
    (define-key org-mode-map (kbd "<S-up>") nil)
    (define-key org-mode-map (kbd "<S-down>") nil)
  )
)


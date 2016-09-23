;; ------------------------------------------------------------------------------
;;  Load required modules
;; ------------------------------------------------------------------------------
(add-to-list 'load-path "~/src/emacs-config/modules")

(require 'move-lines)
(require 'org-manage)
(require 'org-habit)
(require 'yasnippet)

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
 '(org-agenda-files
   (quote
    ("/home/janux/doc/Management/Aufgaben/NächsteSchritte.org" "/home/janux/doc/Management/Aufgaben/RegelmäßigeAufgaben.org" "/home/janux/doc/Management/Aufgaben/Weiterbildung.org"))))
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
;; (global-visual-line-mode t)

;; Truncate long lines by default
(set-default 'truncate-lines t)

;; Set the start directory for the "Visit new file" dialog
(setq default-directory "~/doc/")

;; Custom YASnippet templates
(setq yas-snippet-dirs
    '("~/src/emacs-config/snippets"))

;; Use YASnippet as global mode
(yas-global-mode 1)


;; ------------------------------------------------------------------------------
;;  Configure org-mode variables
;; ------------------------------------------------------------------------------

;; org-manage provides quick access on the org files in this directory:
(setq org-manage-directory-org  "~/doc/Notizen")

;; http://orgmode.org/org.html#index-C_002dc-c-C-988
(setq org-capture-templates
    '(
        ("n" "Notizen Eingangsbox" entry (file+headline "~/doc/Notizen/Eingang.org" "Notizen") "* %?\n  %i")
        ("d" "Daily" entry (file+datetree "~/doc/Notizen/Daily.org" "Report") "* %?\nEntered on %U\n  %i")
	("e" "Entwicklungsumgebung" entry (file+headline "~/doc/Notizen/Entwicklungsumgebung.org" "Einrichtung Entwicklungsumgebung") "* %?\n  %i")
    )
)

;; Register custom drawer names (http://emacs.stackexchange.com/questions/16511)
(add-to-list 'org-drawers "NOTES")

;; Org-Mode RSS feeds - they can be fetched with C-c C-x g
(setq org-feed-alist
    '(
        ("Slashdot" "http://rss.slashdot.org/Slashdot/slashdot" "~/doc/Notizen/RSS.org" "Slashdot Entries")
    )
)


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

;; ------------------------------------------------------------------------------
;;  Makros
;; ------------------------------------------------------------------------------

;; Execute the lastly recorded markro with one key stroke
(global-set-key '[(f1)]          'call-last-kbd-macro)

;; Adjust binding for function 'org-tree-to-indirect-buffer'
(fset 'concentrate-on-one-item
   "\C-c\C-xb\C-xo\C-x1")
(global-set-key (kbd "C-<") 'concentrate-on-one-item)

(fset 'capture-note
   "\C-ccn\C-x1")
(global-set-key (kbd "C-t") 'capture-note)

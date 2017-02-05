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
    ("~/doc/Notizen/Einkauf.org" "~/doc/Notizen/RegelmäßigeAufgaben.org" "~/doc/Notizen/Aufgaben.org"))))
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

;; Start with Org Mode scratch buffer
(setq initial-major-mode 'org-mode)

;; ------------------------------------------------------------------------------
;;  Configure org-mode variables
;; ------------------------------------------------------------------------------

;; org-manage provides quick access on the org files in this directory:
(setq org-manage-directory-org  "~/doc/Notizen")

;; http://orgmode.org/org.html#index-C_002dc-c-C-988
(setq org-capture-templates
    '(
        ("n" "Notizen Eingangsbox" entry (file+headline "~/doc/Notizen/Eingang.org" "Notizen") "* %?\n  %i")
        ("l" "Lessons Learned" entry (file+headline "~/doc/Notizen/LessonsLearned.org" "Inbox") "* %?\n  %i")
        ("p" "Private Notizen Eingangsbox" entry (file+headline "~/doc/Succedo/Eingang.org" "Private Notizen") "* %?\n  %i")
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

;; Include Markdown exporter
(eval-after-load "org"
  '(require 'ox-md nil t))


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

;; Create directory and links to important files for current development ticket
(fset 'create-directory-and-links
   [home C-right C-right S-home S-right S-right S-right ?\C-c timeout end return ?\M-x ?m ?a ?k ?e ?- ?d ?i ?r ?e ?c ?t ?o ?r ?y return ?\C-v return ?- ?  ?\C-c ?\C-l ?. ?/ ?\C-v ?/ ?\C-v ?. ?o ?r ?g return ?\C-v ?. ?o ?r ?g return return ?- ?  ?\C-c ?\C-l ?h ?t ?t ?p ?s ?: ?/ ?/ ?e ?p ?a ?g ?e ?s ?. ?a ?t ?l ?a ?s ?s ?i ?a ?n ?. ?n ?e ?t ?/ ?b ?r ?o ?w ?s ?e ?r backspace ?/ ?\C-v return ?J ?i ?r ?a return return])
(global-set-key (kbd "<f12>") 'create-directory-and-links)

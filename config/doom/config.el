;;; package --- Personal Config
;;; Commentary:
;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

;;; Code:

(setq-default
 user-full-name    "Jeff Jewiss"
 user-mail-address "jeff@jeffjewiss.com"
 +workspaces-switch-project-function #'ignore
 +pretty-code-enabled-modes '(emacs-lisp-mode org-mode)
 doom-font (font-spec :family "Input Mono" :size 12)
 doom-variable-pitch-font (font-spec :family "Inter UI")
 doom-big-font (font-spec :family "Input Mono" :size 20))

(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-city-lights t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; or for treemacs users
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; Circadian
(setq circadian-themes '(("9:00" . doom-nord-light)
                         ("19:00" . doom-nord)))
(circadian-setup)

;; Org Journal
(setq org-journal-dir "~/org")
(setq org-journal-enable-agenda-integration t)
(setq org-journal-date-prefix "#+TITLE: Daily Notes ")
(setq org-agenda-file-regexp "\\`[^.].*\\.org\\'\\|\\`[0-9]+\\'")
(setq org-journal-file-format "%Y%m%d.org")

;; Helm Dash Docsets
(setq helm-dash-common-docsets '("EmberJS" "Elixir" "JavaScript"))

;; Magithub
(setq magithub-api-timeout 10)

;; MacOS Settings
(when IS-MAC
  (setq ns-use-thin-smoothing t)
  (add-hook 'window-setup-hook #'toggle-frame-maximized)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)))

;; Alchemist
(setq alchemist-mix-command "~/.asdf/shims/mix")
(setq alchemist-execute-command "~/.asdf/shims/elixir")
(setq alchemist-compile-command "~/.asdf/shims/elixirc")
(setq alchemist-iex-program-name "~/.asdf/shims/iex")
; (setq alchemist-hooks-compile-on-save t)

;; Flycheck
(custom-set-variables
 '(flycheck-typescript-tslint-executable "~/.asdf/shims/tslint"))'

;; Org Mode Config
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))
(setq org-agenda-files '("~/org/"))
(setq org-capture-templates
      '(("a" "My TODO task format." entry
         (file "todo.org")
         "* TODO %?
SCHEDULED: %t")))

;; Nov.el
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(setq nov-text-width most-positive-fixnum)
(setq nov-save-place-file "~/SynologyDrive/config/nov-places")
(setq visual-fill-column-center-text t)
(add-hook 'nov-mode-hook 'visual-line-mode)
(add-hook 'nov-mode-hook 'visual-fill-column-mode)

;; Backup / Temp file config
(setq backup-directory-alist
      `((".*" . ,"~/.emacs-backups")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs-backups" t)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      create-lockfiles nil              ; don't create lockfiles
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )


;; Email
(setq +mu4e-backend 'offlineimap)
(setq mu4e-maildir "~/Mail"
      mu4e-attachment-dir "~/Mail/.attachments")

(set-email-account! "Personal"
  '((mu4e-sent-folder       . "/jeff@jeffjewiss.com/Sent")
    (mu4e-drafts-folder     . "/jeff@jeffjewiss.com/Drafts")
    (mu4e-trash-folder      . "/jeff@jeffjewiss.com/Trash")
    (mu4e-refile-folder     . "/jeff@jeffjewiss.com/Archive")
    (smtpmail-smtp-user     . "jeff@jeffjewiss.com")
    (user-mail-address      . "jeff@jeffjewiss.com"))
  t)

(setq org-journal-dir "~/org")


;; Temp Fixes Waiting on upstream
(after! org (setq org-agenda-window-setup 'popup-window))

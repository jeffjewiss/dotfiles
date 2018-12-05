;;; package --- Personal Config
;;; Commentary:
;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

;;; Code:

(setq-default
 user-full-name    "Jeff Jewiss"
 user-mail-address "jeff@jeffjewiss.com"
 doom-font (font-spec :family "Input Mono" :size 12)
 doom-big-font (font-spec :family "Fira Code" :size 20))

;; Org Journal
(setq org-journal-dir "~/org")
(setq org-journal-enable-agenda-integration t)
(setq org-journal-date-prefix "#+TITLE: Daily Notes ")
(setq org-agenda-file-regexp "\\`[^.].*\\.org\\'\\|\\`[0-9]+\\'")
(setq org-journal-file-format "%Y%m%d.org")
(org-journal-update-auto-mode-alist)

;; Helm Dash Docsets
(setq helm-dash-common-docsets '("EmberJS" "Elixir" "JavaScript"))

;; Magithub
(setq magithub-api-timeout 10)

;; MacOS Settings
(when IS-MAC
  (setq ns-use-thin-smoothing t)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)))

;; Doom Settings
(load-theme 'doom-city-lights t)

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

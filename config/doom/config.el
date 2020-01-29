;;; package --- Personal Config
;;; Commentary:
;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

;;; Code:

;; Global settings (defaults)
(setq-default
  user-full-name    "Jeff Jewiss"
  user-mail-address "jeff@jeffjewiss.com"
  +workspaces-switch-project-function #'ignore
  +pretty-code-enabled-modes t
  doom-font (font-spec :family "Fira Code" :size 12)
  doom-variable-pitch-font (font-spec :family "Noto Sans" :size 16)
  doom-big-font (font-spec :family "Fira Code" :size 20))

(require 'doom-themes)

(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      projectile-project-search-path '("~/Code")
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-city-lights t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; or for treemacs users
(doom-themes-treemacs-config)

;; Reduce the delay for showing help popup
(setq which-key-idle-delay 0.1)

;; Circadian
(setq calendar-latitude 43.653225
  calendar-longitude -79.383186
  circadian-themes '((:sunrise . doom-nord-light)
                      (:sunset . doom-nord)))
(circadian-setup)

;; Org Mode Config
(setq org-directory "~/org/"
  org-agenda-file-regexp "\\`[^.].*\\.org\\'\\|\\`[0-9]+\\'"
  org-journal-dir "~/org"
  org-journal-file-format "%Y%m%d.org"
  org-journal-enable-agenda-integration t
  org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))

(after! org
  (add-to-list 'org-modules 'org-checklist)
  (add-to-list 'org-modules 'org-habit t))

;; Helm Dash Docsets
(setq helm-dash-common-docsets '("EmberJS" "Elixir" "JavaScript"))

;; MacOS Settings
(when IS-MAC
  (setq ns-use-thin-smoothing t)
  (add-hook 'window-setup-hook #'toggle-frame-maximized))

;; Alchemist
(setq alchemist-mix-command "~/.asdf/shims/mix")
(setq alchemist-execute-command "~/.asdf/shims/elixir")
(setq alchemist-compile-command "~/.asdf/shims/elixirc")
(setq alchemist-iex-program-name "~/.asdf/shims/iex")
; (setq alchemist-hooks-compile-on-save t)


;; Nov.el
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(setq nov-text-width t)
(setq nov-save-place-file "~/SynologyDrive/config/nov-places")
(setq visual-fill-column-center-text t)
(add-hook 'nov-mode-hook 'visual-line-mode)
(add-hook 'nov-mode-hook 'visual-fill-column-mode)

;; Backup / Temp file config
(setq backup-directory-alist
  `((".*" . ,"~/.emacs-backups")))
(setq auto-save-file-name-transforms
  `((".*" ,"~/.emacs-backups" t)))
(setq make-backup-files t           ; backup of a file the first time it is saved.
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
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
(after! mu4e
  (setq +mu4e-backend 'offlineimap)
  (setq mu4e-mu-binary "/usr/local/bin/mu")
  (setq mu4e-installation-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
  (setq send-mail-function 'smtpmail-send-it)
  (setq message-send-mail-function 'smtpmail-send-it)
  (setq mu4e-sent-messages-behavior 'delete)
  (setq mu4e-view-show-addresses 't)
  (setq mu4e-compose-format-flowed t)
  (setq mu4e-compose-dont-reply-to-self t)
  (setq mu4e-html2text-command "w3m -dump -T text/html -o display_link_number=true")
  (setq mu4e-view-show-images t)
  (setq mu4e-attachment-dir  "~/Downloads")

  ;; Use imagemagick, if available.
  (when (fboundp 'imagemagick-register-types)
      (imagemagick-register-types))
  ; (setq mu4e-compose-in-new-frame t)
  ;; Add option to open message in a browser
  (add-to-list 'mu4e-view-actions '("View in browser" . mu4e-action-view-in-browser) t)
  (setq mu4e-maildir "~/Mail"
        mu4e-drafts-folder "~/Mail/drafts"
        mu4e-attachment-dir "~/Mail/.attachments")

  (set-email-account! "Personal"
    '((user-mail-address      . "jeff@jeffjewiss.com")
      (mu4e-sent-folder       . "/jeff@jeffjewiss.com/Sent")
      (mu4e-drafts-folder     . "/jeff@jeffjewiss.com/Drafts")
      (mu4e-trash-folder      . "/jeff@jeffjewiss.com/Trash")
      (mu4e-refile-folder     . "/jeff@jeffjewiss.com/Archive")
      (smtpmail-smtp-user     . "jeff@jeffjewiss.com")
      (smtpmail-smtp-server   . "smtp.fastmail.com")
      (smtpmail-smtp-service  . 465)
      (smtpmail-stream-type   . ssl))
    t)

  ;; Bookmarks for common searches that I use.
  (setq mu4e-bookmarks '(("\\\\Inbox" "Inbox" ?i)
                        ("flag:unread" "Unread messages" ?u)
                        ("date:today..now" "Today's messages" ?t)
                        ("date:7d..now" "Last 7 days" ?w)
                        ("mime:image/*" "Messages with images" ?p))))

;; Keybinds

;; Leader key
(map! :leader
      (:prefix-map ("o" . "open")
        :desc "Open Mail"             "M" #'=mu4e
        )
      )

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;;; config.el --- Personal Config
;;;
;;; Commentary:
;;; Emacs Config File --- config for Emacs

;;; Code:

;; Global settings (defaults)
(setq-default
  user-full-name    "Jeff Jewiss"
  user-mail-address "jeff@jeffjewiss.com"
  +pretty-code-enabled-modes t
  doom-font (font-spec :family "Victor Mono" :size 14)
  doom-variable-pitch-font (font-spec :family "Overpass" :size 14)
  doom-big-font (font-spec :family "Overpass" :size 24))

(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      scroll-margin 2)                            ; It's nice to maintain a little margin

(unless (string-match-p "^Power N/A" (battery))   ; On laptops...
  (display-battery-mode 1))                       ; it's nice to know how much power you have

(global-subword-mode 1)                           ; Iterate through CamelCase words

(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")

;; Theming
(setq fancy-splash-image "~/.misc/blackhole-lines.svg")

(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
  projectile-project-search-path '("~/Code")
  doom-modeline-buffer-file-name-style 'relative-to-project
  doom-modeline-env-version t
  doom-modeline-github t
  doom-modeline-major-mode-icon t
  doom-modeline-persp-name t
  doom-modeline-enable-word-count t
  doom-themes-enable-italic t) ; if nil, italics is universally disabled

(setq display-line-numbers-type 'visual)

(setq frame-title-format
      '(""
        (:eval
         (if (s-contains-p org-roam-directory (or buffer-file-name ""))
             (replace-regexp-in-string
              ".*/[0-9]*-?" "☰ "
              (subst-char-in-string ?_ ?  buffer-file-name))
           "%b"))
        (:eval
         (let ((project-name (projectile-project-name)))
           (unless (string= "-" project-name)
             (format (if (buffer-modified-p)  " ◉ %s" "  ●  %s") project-name))))))

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-one t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Light/Dark Mode
(add-hook 'ns-system-appearance-change-functions
  #'(lambda (appearance)
      ;;(mapc #'disable-theme custom-enabled-themes)
      (pcase appearance
        ('light (load-theme 'doom-one t))
        ('dark (load-theme 'doom-one t)))))

;; Markdown
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))

;; Org Mode Config
(setq org-directory "~/org/"
  org-agenda-file-regexp "\\`[^.].*\\.org\\'\\|\\`[0-9]+\\'"
  org-journal-dir "~/org"
  org-journal-file-format "%Y%m%d.org"
  org-journal-enable-agenda-integration t
  org-noter-notes-search-path '("~/org/notes")
  org-roam-directory "~/org/notes"
  deft-directory "~/org/notes"
  deft-extensions '("org" "md" "markdown" "txt" "text")

  org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))

;; MacOS Settings
(when IS-MAC
  (setq ns-use-thin-smoothing t))

;; Alchemist
(setq alchemist-mix-command "~/.asdf/shims/mix")
(setq alchemist-execute-command "~/.asdf/shims/elixir")
(setq alchemist-compile-command "~/.asdf/shims/elixirc")
(setq alchemist-iex-program-name "~/.asdf/shims/iex")
; (setq alchemist-hooks-compile-on-save t)

;; LSP
(setq lsp-enable-file-watchers nil)
(setq lsp-tailwindcss-add-on-mode t)
(after! elixir-mode
  (setq lsp-enable-file-watchers nil)
  (setq lsp-completion-provider :capf)
  (add-to-list 'exec-path "~/Code/elixir-ls/release"))

(after! lsp-mode
  (add-to-list 'lsp-language-id-configuration '(".*\\.heex$" . "html"))
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.log\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.next\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]__snapshots?__\\'"))

(after! dap-mode
  (require 'dap-firefox)
  (dap-firefox-setup))

(use-package! lsp-tailwindcss
  :when (featurep! +lsp)
  :after lsp-mode
  :init
  (setq lsp-tailwindcss-add-on-mode t)
  :config
  (add-hook 'before-save-hook 'lsp-tailwindcss-rustywind-before-save)
  (setq lsp-tailwindcss-major-modes '(web-mode css-mode rjsx-mode typescript-tsx-mode)
        lsp-tailwindcss-emmet-completions (featurep 'emmet-mode)))


(set-docsets! '(web-mode css-mode rjsx-mode typescript-tsx-mode)
  :add "Tailwind_CSS")

;; Pocket
(add-to-list 'evil-emacs-state-modes 'pocket-reader-mode)

;; Nov.el
(defun custom-nov-font-setup ()
  (face-remap-add-relative 'variable-pitch :family "ETBembo"
                                           :height 1.8))

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(setq nov-text-width t)
(setq nov-save-place-file "~/SynologyDrive/config/nov-places")
(setq visual-fill-column-center-text t)
(add-hook 'nov-mode-hook 'visual-line-mode)
(add-hook 'nov-mode-hook 'visual-fill-column-mode)
(add-hook 'nov-mode-hook 'hide-mode-line-mode)
(add-hook 'nov-mode-hook 'custom-nov-font-setup)
(add-hook 'nov-mode-hook (lambda ()
            (set-fill-column 120)))

;; Magit
(use-package! magit-delta
  :hook (magit-mode . magit-delta-mode))
(after! magit
  (setq
    magit-delta-default-dark-theme "OneHalfDark"
    magit-delta-default-light-theme "GitHub"))

(setq +format-with-lsp nil)

(after! spell-fu
  (setq spell-fu-idle-delay 5))

(setf (alist-get 'markdown-mode +spell-excluded-faces-alist)
      '(markdown-code-face
        markdown-reference-face
        markdown-link-face
        markdown-url-face
        markdown-markup-face
        markdown-html-attr-value-face
        markdown-html-attr-name-face
        markdown-html-tag-name-face))

;; Lookup / Dash Docsets
(setq +lookup-open-url-fn #'+lookup-xwidget-webkit-open-url-fn)
(set-docsets! 'elixir-mode "Elixir")
(set-docsets! 'js2-mode "JavaScript" "EmberJS")
(set-docsets! 'typescript-mode "TypeScript")
(set-docsets! 'rjsx-mode :add "React")
(set-docsets! 'ruby-mode "Ruby 2")
(set-docsets! 'projectile-rails-mode :add "Ruby on Rails 6")

;; Backup / Temp file config
(setq backup-directory-alist
  `(("." . "~/.emacs-backups"))
  auto-save-file-name-transforms '((".*" "~/.emacs-backups/" t))
  make-backup-files t               ; backup of a file the first time it is saved.
  create-lockfiles nil              ; don't create lockfiles
  backup-by-copying t               ; don't clobber symlinks
  version-control t                 ; version numbers for backup files
  vc-make-backup-files t
  delete-old-versions t             ; delete excess backup files silently
  kept-old-versions 0               ; oldest versions to keep when a new numbered backup is made (default: 2)
  kept-new-versions 10              ; newest versions to keep when a new numbered backup is made (default: 2)
  auto-save-default t               ; auto-save every buffer that visits a file
  auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
  auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
  )




(use-package! request)

(use-package! graphql-mode
  :mode ("\\.gql\\'" "\\.graphql\\'")
  :config (setq-hook! 'graphql-mode-hook tab-width graphql-indent-level))

;; https://www.reddit.com/r/emacs/comments/idz35e/emacs_27_can_take_svg_screenshots_of_itself/
(defun screenshot-svg ()
  "Save a screenshot of the current frame as an SVG image.
Saves to a temp file and puts the filename in the kill ring."
  (interactive)
  (let* ((filename (make-temp-file "Emacs" nil ".svg"))
         (data (x-export-frames nil 'svg)))
    (with-temp-file filename
      (insert data))
    (kill-new filename)
    (message filename)))

;; Email
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
(setq +mu4e-backend 'offlineimap)

(after! mu4e
  ;; (setq mu4e-mu-binary "/opt/homebrew/bin/mu")
  ;; (setq mu4e-installation-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
  ;; (setq send-mail-function 'smtpmail-send-it)
  ;; (setq message-send-mail-function 'smtpmail-send-it)
  ;; (setq mu4e-sent-messages-behavior 'delete)
  ;; (setq mu4e-view-show-addresses 't)
  ;; (setq mu4e-compose-format-flowed t)
  ;; (setq mu4e-compose-dont-reply-to-self t)
  ;; (setq mu4e-html2text-command "w3m -dump -T text/html -o display_link_number=true")
  (setq mu4e-view-show-images t)
  (setq mu4e-attachment-dir  "~/Downloads")

  ; (setq mu4e-compose-in-new-frame t)
  ;; Add option to open message in a browser
  (add-to-list 'mu4e-view-actions '("View in browser" . mu4e-action-view-in-browser) t)
  (setq mu4e-maildir "~/Mail"
        mu4e-drafts-folder "~/Mail/drafts"
        mu4e-attachment-dir "~/Mail/.attachments")

  (set-email-account! "Personal"
    '((user-mail-address      . "jeff@jeffjewiss.com")
      (mu4e-inbox-folder       . "/jeff@jeffjewiss.com/Inbox")
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
        :desc "Open Feed Reader"      "F" #'=rss
        )
      )

(map! :after elfeed
  :map elfeed-show-mode-map
  :n "G" #'pocket-reader-add-link
  :map elfeed-search-mode-map
  :n "D" #'elfeed-update)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
;;

(provide 'config)

;;; config.el ends here

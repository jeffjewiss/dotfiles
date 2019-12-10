;;; package --- Personal Init
;;; Commentary:
;;; ~/.config/doom/init.el -*- lexical-binding: t; -*-

;;; Code:

(doom! :completion
       company           ; the ultimate code completion backend
      ;helm              ; the *other* search engine for love and life
      ;ido               ; the other *other* search engine...
       (ivy              ; a search engine for love and life
         +icons)

       :ui
      ;deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
      ;fill-column       ; a `fill-column' indicator
       hl-todo           ; highlight TODO/FIXME/NOTE tags
       modeline          ; a snazzy Atom-inspired mode-line
       nav-flash         ; blink the current line after jumping
       ;neotree          ; a project drawer, like NERDTree for vim
       ophints           ; highlight the region an operation acts on
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
      ;(pretty-code      ; replace bits of code with pretty symbols
      ;  +fira)
      ;tabbar            ; FIXME an (incomplete) tab bar for Emacs
      ;unicode           ; extended unicode support for various languages
       treemacs          ; a project drawer, like neotree but cooler
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
      ;(format +onsave)  ; automated prettiness
      ;lispy             ; vim for lisp, for people who dont like vim
       multiple-cursors  ; editing in many places at once
      ;objed             ; text object editing for the innocent
      ;parinfer          ; turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to

       :emacs
       (dired            ; making dired pretty [functional]
         +ranger         ; bringing the goodness of ranger to dired
         +icons          ; colorful icons for dired-mode
        )
       electric          ; smarter, keyword-based electric-indent
       ibuffer           ; interactive buffer management
       vc                ; version-control and Emacs, sitting in a tree

       :term
      ;eshell            ; a consistent, cross-platform shell (WIP)
       ;;shell             ; a terminal REPL for Emacs
       term              ; terminals in Emacs
      ;vterm             ; another terminals in Emacs

       :tools
       direnv
       ;;docker
       editorconfig      ; let someone else argue about tabs vs spaces
       ;ein              ; tame Jupyter notebooks with emacs
       (eval +overlay)   ; run code, run (also, repls)
       flycheck          ; tasing you for every semicolon you forget
       flyspell          ; tasing you for misspelling mispelling
       gist              ; interacting with github gists
       (lookup           ; helps you navigate your code and documentation
        +docsets)        ; ...or in Dash docsets locally
      ;lsp
       macos             ; MacOS-specific commands
       make              ; run make tasks from Emacs
       magit             ; It's Magit! A Git porcelain inside Emacs
       pdf               ; pdf enhancements
      ;prodigy           ; Managing external services
       rgb               ; creating color strings
      ;tmux              ; an API for interacting with tmux
      ;upload            ; map local to remote projects via ssh/ftp

       :lang
      ;assembly          ; assembly for fun or debugging
      ;cc                ; C/C++/Obj-C madness
      ;crystal           ; ruby at the speed of c
      ;clojure           ; java with a lisp
      ;csharp            ; unity, .NET, and mono shenanigans
       data              ; config/data formats
       erlang            ; an elegant language for a more civilized age
       elixir            ; erlang done right
       elm               ; care for a cup of TEA?
       emacs-lisp        ; drown in parentheses
       ess               ; emacs speaks statistics
       go                ; the hipster dialect
      ;(haskell +intero) ; a language that's lazier than I am
      ;hy                ; readability of scheme w/ speed of python
      ;(java +meghanada) ; the poster child for carpal tunnel syndrome
       javascript        ; all(hope(abandon(ye(who(enter(here))))))
      ;julia             ; a better, faster MATLAB
      ;latex             ; writing papers in Emacs has never been so fun
       ledger            ; an accounting system in Emacs
      ;lua               ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore
      ;nim               ; python + lisp at the speed of c
      ;nix               ; I hereby declare "nix geht mehr!"
      ;ocaml             ; an objective camel
       (org              ; organize your plain life in plain text
        +attach          ; custom attachment system
        +babel           ; running code in org
        +capture         ; org-capture in and outside of Emacs
        +export          ; Exporting org to whatever you want
        +habit           ; Keep track of your habits
        ;+hugo           ; use Emacs for hugo blogging
        +present)        ; Emacs for presentations
      ;perl              ; write code no one else can comprehend
       php               ; perl's insecure younger brother
      ;plantuml          ; diagrams for confusing people more
      ;purescript        ; javascript, but functional
       python            ; beautiful is better than ugly
       rest              ; Emacs as a REST client
       ruby              ; 1.step do {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
      ;scala             ; java, but good
       sh                ; she sells (ba|z)sh shells on the C xor
       swift             ; who asked for emoji variables?
       web               ; the tubes

       :email
       (mu4e +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They may have additional dependencies and
       ;; should be loaded late.
       :app
       ;calendar
       ;irc              ; how neckbeards socialize
       (rss +org)        ; emacs as an RSS reader
       ;twitter          ; twitter client https://twitter.com/vnought
       (write            ; emacs as a word processor (latex + org + markdown)
        +wordnut         ; wordnet (wn) search
        +langtool)       ; a proofreader (grammar/style check) for Emacs

      ;:collab
      ;floobits          ; peer programming for a price
      ;impatient-mode    ; show off code over HTTP

       :config
       ;; The default module set reasonable defaults for Emacs. It also provides
       ;; a Spacemacs-inspired keybinding scheme, a custom yasnippet library,
       ;; and additional ex commands for evil-mode. Use it as a reference for
       ;; your own modules.
       (default +bindings +smartparens))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((magit-todos-exclude-globs "*.map")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

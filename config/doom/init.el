;;; init.el --- Initialization file for Emacs
;;;
;;; Commentary:
;;; Emacs Startup File --- initialization for Emacs

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a "Module Index" link where you'll find
;;      a comprehensive list of Doom's modules and what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).
;;
;;; Code:

(doom! :input
       ;;chinese
       ;;japanese

       :completion
       (company          ; the ultimate code completion backend
         +childframe)     ; ... when your children are better than you
       ;helm             ; the *other* search engine for love and life
       ;ido              ; the other *other* search engine...
       (ivy              ; a search engine for love and life
         +fuzzy          ; fuzzy search for files
         +prescient      ; filter and sort search results
         +childframe     ; use a floating frame for results
         +icons)         ; use icons for file types

       :ui
       deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       (emoji +unicode)  ; 🙂
      ;fill-column       ; a `fill-column' indicator
       hl-todo           ; highlight TODO/FIXME/NOTE tags
       minimap           ; show a map of the code on the side
       modeline          ; a snazzy Atom-inspired mode-line
       nav-flash         ; blink the current line after jumping
       ;neotree          ; a project drawer, like NERDTree for vim
       ophints           ; highlight the region an operation acts on
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       (ligatures        ; replace bits of code with pretty symbols
         +fira)          ; use the Fira Code fontface
      ;tabs              ; a tab bar for Emacs
      ;treemacs          ; a project drawer, like neotree but cooler
      ;unicode           ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select    ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces
       zen               ; distraction-free coding or writing

       :editor
       (evil
        +everywhere)     ; come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
      ;(format +onsave)  ; automated prettiness
      ;lispy             ; vim for lisp, for people who dont like vim
       multiple-cursors  ; editing in many places at once
      ;objed             ; text object editing for the innocent
      ;parinfer          ; turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to
       word-wrap         ; soft wrapping with language-aware indent

       :emacs
       (dired            ; making dired pretty [functional]
         +ranger         ; bringing the goodness of ranger to dired
         +icons)         ; colorful icons for dired-mode
       electric          ; smarter, keyword-based electric-indent
       (ibuffer          ; interactive buffer management
        +icons)
       (undo             ; persistent, smarter undo for your inevitable mistakes
        +tree)
       vc                ; version-control and Emacs, sitting in a tree

       :term
      ;eshell            ; the elisp shell that works everywhere
      ;shell             ; simple shell REPL for Emacs
      ;term              ; basic terminal emulator for Emacs
       vterm             ; the best terminal emulation in Emacs

       :checkers
       syntax            ; tasing you for every semicolon you forget
       spell             ; tasing you for misspelling mispelling
       grammar           ; tasing grammar mistake every you make

       :tools
       (debugger +lsp)
       direnv
       (docker
         +lsp)
       editorconfig      ; let someone else argue about tabs vs spaces
       ;ein              ; tame Jupyter notebooks with emacs
       (eval +overlay)   ; run code, run (also, repls)
       gist              ; interacting with github gists
       (lookup           ; helps you navigate your code and documentation
         (+dictionary    ; Enable word definition and thesaurus lookup functionality
           +offline)     ; Install and prefer offline dictionary/thesaurus
        +docsets)        ; Enable integration with Dash.app docsets
       (lsp +peek)       ; auto completion and language server
       make              ; run make tasks from Emacs
       (magit +forge)    ; It's Magit! A Git porcelain inside Emacs
       pdf               ; pdf enhancements
       prodigy           ; Managing external services
       rgb               ; creating color strings
      ;tmux              ; an API for interacting with tmux
      ;upload            ; map local to remote projects via ssh/ftp

       :os
       (:if IS-MAC macos); MacOS-specific commands
      ;tty               ; improve the terminal Emacs experience

       :lang
      ;assembly          ; assembly for fun or debugging
      ;cc                ; C/C++/Obj-C madness
      ;crystal           ; ruby at the speed of c
      ;clojure           ; java with a lisp
      ;csharp            ; unity, .NET, and mono shenanigans
       data              ; config/data formats
       erlang            ; an elegant language for a more civilized age
       (elixir +lsp)     ; erlang done right
      ;elm               ; care for a cup of TEA?
       emacs-lisp        ; drown in parentheses
      ;ess               ; emacs speaks statistics
       (go +lsp)         ; the hipster dialect
      ;(haskell +intero) ; a language that's lazier than I am
      ;hy                ; readability of scheme w/ speed of python
      ;(java +meghanada) ; the poster child for carpal tunnel syndrome
       (javascript +lsp) ; all(hope(abandon(ye(who(enter(here))))))
       (json  +lsp)      ; At least it ain't XML
      ;julia             ; a better, faster MATLAB
      ;latex             ; writing papers in Emacs has never been so fun
      ;ledger            ; an accounting system in Emacs
      ;lua               ; one-based indices? one-based indices
       (markdown +grip)  ; writing docs for people to ignore
      ;nim               ; python + lisp at the speed of c
      ;nix               ; I hereby declare "nix geht mehr!"
      ;ocaml             ; an objective camel
       (org              ; organize your plain life in plain text
        +attach          ; custom attachment system
        +babel           ; running code in org
        +capture         ; org-capture in and outside of Emacs
        +journal
        +pretty
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
       (ruby +rails +lsp); 1.step do {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
      ;scala             ; java, but good
       (sh +lsp)         ; she sells (ba|z)sh shells on the C xor
       (swift +lsp)      ; who asked for emoji variables?
       (web +lsp)        ; the tubes
       (yaml +lsp)       ; JSON, but readable

       :email
       (mu4e +org)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
      ;calendar
      ;irc               ; how neckbeards socialize
       (rss +org)        ; emacs as an RSS reader
      ;twitter           ; twitter client

       :config
      ;literate
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

(provide 'init)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; init.el ends here

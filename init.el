(doom! :feature
       (popup
        +defaults)
      ;debugger          ; FIXME stepping through code, to help you add bugs
       eval              ; run code, run (also, repls)
       evil              ; come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       jump              ; helping you get around
       services          ; TODO managing external services & code builders
       snippets          ; my elves. They type so I don't have to
       spellcheck        ; tasing you for misspelling mispelling
       syntax-checker    ; tasing you for every semicolon you forget
       version-control   ; remember, remember that commit in November
       workspaces        ; tab emulation, persistence & separate workspaces

       :completion
       (company +auto)           ; the ultimate code completion backend
       ivy               ; a search engine for love and life
      ;helm              ; the *other* search engine for love and life
      ;ido               ; the other *other* search engine...

       :ui
       doom              ; what makes DOOM look the way it does
       dashboard    ; a nifty splash screen for Emacs
       modeline     ; a snazzy Atom-inspired mode-line
       ;doom-quit         ; DOOM quit-message prompts when you quit Emacs
       hl-todo           ; highlight TODO/FIXME/NOTE tags
       nav-flash         ; blink the current line after jumping
       evil-goggles      ; display visual hints when editing in evil
      ;unicode           ; extended unicode support for various languages
      ;tabbar            ; FIXME an (incomplete) tab bar for Emacs
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       (window-select +ace-window)  ; visually switch windows
       pretty-symbol

       :tools
       dired             ; making dired pretty [functional]
       electric-indent   ; smarter, keyword-based electric-indent
       eshell            ; a consistent, cross-platform shell (WIP)
       gist              ; interacting with github gists
       imenu             ; an imenu sidebar and searchable code index
       impatient-mode    ; show off code over HTTP
      ;macos             ; MacOS-specific commands
       make              ; run make tasks from Emacs
       neotree           ; a project drawer, like NERDTree for vim
       ;password-store    ; password manager for nerds
       rotate-text       ; cycle region at point between text candidates
       term              ; terminals in Emacs
       tmux              ; an API for interacting with tmux
       upload            ; map local to remote projects via ssh/ftp

       :lang
       cc                ; C/C++/Obj-C madness
       data              ; config/data formats
       emacs-lisp        ; drown in parentheses
       haskell
       idris
       (org              ; organize your plain life in plain text
        +attach          ; custom attachment system
        +babel           ; running code in org
        +capture         ; org-capture in and outside of Emacs
        +export          ; centralized export system + more backends
        +present         ; Emacs for presentations
        ;; TODO +publish
        )
       python            ; beautiful is better than ugly
       web               ; the tubes

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They may have additional dependencies and
       ;; should be loaded late.
       :app
      ;email             ; emacs as an email client
      ;irc               ; how neckbeards socialize
      ;rss               ; emacs as an RSS reader
      ;twitter           ; twitter client https://twitter.com/vnought
      ;write             ; emacs as a word processor (latex + org + markdown)

       ;; Private modules are where you place your personal configuration files.
       ;; By default, they are not tracked. There is one module included here,
       ;; the defaults module. It contains a Spacemacs-inspired keybinding
       ;; scheme and additional ex commands for evil-mode. Use it as a reference
       ;; for your own.
       :config
       (default +bindings +snippets +evil-commands)
       )

(setq
 frame-title-format
 '("emacs%@" (:eval (system-name)) ": " (:eval (if (buffer-file-name)
                                                   (abbreviate-file-name (buffer-file-name))
                                                 "%b")))
 doom-font (font-spec :family "Source Code Pro" :size 15)
 doom-theme 'doom-nord)

(setq
 doom-leader-key "SPC"
 doom-localleader-key ","
 +default-repeat-forward-key ";"
 +default-repeat-backward-key "'"
 evil-want-C-u-scroll nil
 evil-want-integration nil
 evil-shift-width 4
 evil-snipe-override-evil-repeat-keys nil
 evil-collection-company-use-tng nil
 evil-respect-visual-line-mode t)

(setq
 user-mail-address "csjinxue@outlook.com"
 user-full-name "Jin Xue"
 max-specpdl-size 10000
 +file-templates-dir "~/.doom.d/templates")

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(set! :popup "^\\*\\(?:scratch\\|Warnings\\)" nil '((transient)))

(doom! :feature
       eval
       (evil
        +everywhere)
       file-templates
       lookup
       snippets
       spellcheck
       (syntax-checker
        +childframe)
       version-control
       workspaces

       :completion
       (company
        +auto)
       (ivy
        +childframe)

       :ui
       (popup
        +all
        +defaults)
       doom
       doom-dashboard
       doom-modeline
       hl-todo
       nav-flash
       evil-goggles
       vi-tilde-fringe
       (window-select +switch-window)
       neotree
       pretty-symbol

       :tools
       dired
       electric-indent
       eshell
       gist
       imenu
       impatient-mode
       make
       password-store
       rotate-text
       term
       tmux
       upload

       :lang
       lsp
       cc
       data
       elixir
       emacs-lisp
       haskell
       idris
       ocaml
       (org
        +attach
        +babel
        +capture
        +export
        ;; +present
        +publish)
       python
       racket
       web

       :app
       email
       email-private

       :config
       (default +bindings +snippets +evil-commands))

(setq
 frame-title-format
 '("emacs@" (:eval (system-name)) ": " (:eval (if (buffer-file-name)
                                                  (abbreviate-file-name (buffer-file-name))
                                                "%b")))
 doom-font (font-spec :family "Source Code Pro" :size 15)
 doom-theme 'doom-spacegrey)

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

(defun *doom-dashboard-widget-banner ()
  (mapc (lambda (line)
          (insert (propertize (+doom-dashboard--center +doom-dashboard--width line)
                              'face 'font-lock-comment-face) " ")
          (insert "\n"))
        '("      ________  _______   ________  ________  _______   ________         "
          "     |\\   ___ \\|\\  ___ \\ |\\   ___ \\|\\   ____\\|\\  ___ \\ |\\   ____\\        "
          "     \\ \\  \\_|\\ \\ \\   __/|\\ \\  \\_|\\ \\ \\  \\___|\\ \\   __/|\\ \\  \\___|        "
          "      \\ \\  \\ \\\\ \\ \\  \\_|/_\\ \\  \\ \\\\ \\ \\_____  \\ \\  \\_|/_\\ \\  \\           "
          "       \\ \\  \\_\\\\ \\ \\  \\_|\\ \\ \\  \\_\\\\ \\|____|\\  \\ \\  \\_|\\ \\ \\  \\____      "
          "        \\ \\_______\\ \\_______\\ \\_______\\____\\_\\  \\ \\_______\\ \\_______\\    "
          "         \\|_______|\\|_______|\\|_______|\\_________\\|_______|\\|_______|    "
          "                                      \\|_________|                       "


          "                                                                            "
          "                                                                            "
          "                                 E M A C S                                  "
          "                                                                            "
          "                                                                            "
          "                                                                            ")))

(advice-add 'doom-dashboard-widget-banner :override #'*doom-dashboard-widget-banner)

(setq
 user-full-name "Jin Xue"
 max-specpdl-size 10000
 +file-templates-dir "~/.doom.d/templates")

(set! :email
  "outlook"
  '((user-mail-address . "csjinxue@outlook.com")
    (mu4e-sent-folder . "/outlook/Sent")
    (mu4e-drafts-folder . "/outlook/Drafts")
    (mu4e-trash-folder . "/outlook/Deleted")
    (mu4e-refile-folder . "/outlook/Archive")
    (mu4e-compose-signature . "Jin Xue")
    (smtpmail-smtp-server . "smtp.office365.com")
    (smtpmail-smtp-service . 587)
    (smtpmail-smtp-user "csjinxue@outlook.com"))
  t)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(set! :popup "^\\*\\(?:scratch\\|Warnings\\)" nil '((transient)))

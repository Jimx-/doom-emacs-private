;;;  -*- lexical-binding: t; -*-

;;; Key bindings
(defhydra hydra-scan-user-buffers (:hint nil)
  "scan user buffers"
  ("]" next-buffer)
  ("[" previous-buffer)
  ("k" kill-this-buffer)
  ("q" nil))
(global-set-key (kbd "C-x C-j") 'hydra-scan-user-buffers/body)

(global-set-key (kbd "C-x C-g") 'recentf-open-files)
(global-set-key (kbd "C-'") 'evil-avy-goto-char-2)

(set-email-account!
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

;;; company
(after! company
  (def-package! lispy
  :hook (emacs-lisp-mode . lispy-mode)
  :config
  (map! :map lispy-mode-map
        :i "_" #'special-lispy-different
        :i "C-d" #'lispy-delete
        :i "C-u" #'universal-argument
        :i [remap delete-backward-char] #'lispy-delete-backward))

  (setq company-tooltip-limit 10
        company-minimum-prefix-length 2
        company-tooltip-minimum-width 60
        company-tooltip-margin 0
        company-tooltip-offset-display nil
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil
        company-dabbrev-code-other-buffers t
        company-tooltip-align-annotations t
        company-require-match 'never
        company-frontends '(company-pseudo-tooltip-frontend)
        company-backends
        '(company-capf company-dabbrev company-files company-yasnippet)
        company-global-modes '(not comint-mode erc-mode message-mode help-mode gud-mode)
        company-childframe-child-frame nil))

;; Lispy mode
(def-package! zoutline)
(def-package! lispyville
  :after (evil)
  :hook (lispy-mode . lispyville-mode)
  :config
  (lispyville-set-key-theme
   '(operators
     c-w
     prettify
     escape
     (slurp/barf-lispy))))

;;Debugging
(def-package! realgud
  :commands (realgud:gdb realgud:pdb))

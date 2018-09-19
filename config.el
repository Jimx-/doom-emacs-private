;;;  -*- lexical-binding: t; -*-

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

;; Ivy
(after! ivy
  (ivy-rich-mode 1))

;; Org
(after! org
  (add-hook 'org-babel-after-execute-hook (lambda () 
                                            (when org-inline-image-overlays
                                              (org-redisplay-inline-images)))))

;; Debugging
(def-package! realgud
  :commands (realgud:gdb realgud:pdb))

;; Loading
(load! "+bindings")


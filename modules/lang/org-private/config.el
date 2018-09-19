;;; lang/org-private/config.el -*- lexical-binding: t; -*-

;; Sub-modules
(if (featurep! +capture) (load! "+capture"))


(add-hook 'org-load-hook #'+org-private|setup-ui t)
(add-hook 'org-load-hook #'+org-private|setup-agenda t)

(defun +org-private|setup-agenda ()
  (setq org-agenda-files (ignore-errors (directory-files-recursively org-directory "^\\(_.*\\|ref\\)\\.org$" t))))

(defun +org-private|setup-ui ()
  "Configure UI for `org-mode'."
  (setq org-modules '(org-protocol)
        org-refile-targets '((nil :maxlevel . 3)
                             (org-agenda-files :maxlevel . 3))))


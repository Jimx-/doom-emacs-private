;;; lang/org-private/+capture.el -*- lexical-binding: t; -*-


(setq org-capture-templates
      `(("p" "Protocol" entry (file+headline ,(concat org-directory "notes.org") "Web Links")
         "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
        ("L" "Protocol Link" entry (file+headline ,(concat org-directory "notes.org") "Web Links")
         "* %? [[%:link][%:description]] :link:\n")))

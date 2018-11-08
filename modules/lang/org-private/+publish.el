;;; lang/org-private/+publish.el -*- lexical-binding: t; -*-

(setq org-publish-project-alist
      '(("org-jimx"
         ;; Path to your org files.
         :base-directory "~/org/blog"
         :base-extension "org"

         ;; Path to your Jekyll project.
         :publishing-directory "~/projects/jekyll/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :html-extension "html"
         :body-only t ;; Only export section between <body> </body>
         )


        ("org-static-jimx"
         :base-directory "~/org/blog/assets"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
         :publishing-directory "~/projects/jekyll/assets"
         :recursive t
         :publishing-function org-publish-attachment)

        ("jimx" :components ("org-jimx" "org-static-jimx"))

        ))

(defun org-custom-link-img-follow (path)
  (org-open-file-with-emacs path))

(defun org-custom-link-img-export (path desc format)
  (cond
   ((eq format 'html)
    (format "<img src=\"%s\" alt=\"%s\"/>" (substring path 2) desc))))

(add-hook 'org-load-hook (lambda () (org-add-link-type "img" 'org-custom-link-img-follow 'org-custom-link-img-export)) t)

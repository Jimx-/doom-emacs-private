;;; ~/projects/dotfiles/doom.d/autoload/helm.el -*- lexical-binding: t; -*-

;;;###autoload
(defun dwim-helm-find-files-up-one-level-maybe ()
  (interactive)
  (if (looking-back "/" 1)
      (call-interactively 'helm-find-files-up-one-level)
    (delete-char -1)))

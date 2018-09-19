;;; ~/projects/dotfiles/doom.d/+bindings.el -*- lexical-binding: t; -*-

(defhydra hydra-scan-user-buffers (:hint nil)
  "scan user buffers"
  ("]" next-buffer)
  ("[" previous-buffer)
  ("k" kill-this-buffer)
  ("q" nil))

(map! :i "<M-return>" nil
      :gnvime "C-x C-j" 'hydra-scan-user-buffers/body
      :gnvime "C-x C-r" 'recentf-open-files
      :gnvime "C-'" 'evil-avy-goto-char-2)

;;; lang/matlab/config.el -*- lexical-binding: t; -*-

(def-package! matlab-mode
  :load-path "~/sources/matlab-mode"
  :config
  (matlab-mode-common-setup)
  (setq matlab-server-executable "/"))

;;; lang/idris/config.el -*- lexical-binding: t; -*-

(def-package! idris-mode
  :mode "\\.idr$"
  :interpreter (("idris" . idris-mode))
  :config
  (setq idris-interpreter-path "/usr/bin/idris"))

;;; lang/racket/config.el -*- lexical-binding: t; -*-

(def-package! racket-mode
  :config
  (setq racket-racket-program "racket")
  (setq racket-raco-program "raco"))

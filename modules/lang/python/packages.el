;; -*- no-byte-compile: t; -*-
;;; lang/python/packages.el

;; requires: python jedi setuptools

(package! anaconda-mode)
(package! py-isort)
(package! pip-requirements)
(package! yapfify :recipe (:fetcher github :repo "JorisE/yapfify"))
;; (package! nose)

(when (featurep! :completion company)
  (package! company-anaconda))

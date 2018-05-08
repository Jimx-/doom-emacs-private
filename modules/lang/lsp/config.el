;;; lang/lsp/config.el -*- lexical-binding: t; -*-

;;; LSP mode
(def-package! lsp-mode
  :commands (lsp-mode))

(def-package! lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :init
  :config
  (setq lsp-ui-doc-enable nil
        lsp-enable-completion-at-point t
        lsp-ui-doc-position 'top
        lsp-ui-doc-header nil
        lsp-ui-doc-include-signature t
        lsp-ui-doc-background (doom-color 'base4)
        lsp-ui-doc-border (doom-color 'fg)))

(def-package! company-lsp
  :after lsp-mode)

(def-package! lsp-python
  :commands (lsp-python-enable)
  :config
  (setq
   python-indent-guess-indent-offset-verbose nil)
  (set! :company-backend 'python-mode '(company-lsp company-files company-yasnippet))
  (set! :lookup 'python-mode
    :definition #'lsp-ui-peek-find-definitions
    :references #'lsp-ui-peek-find-references))

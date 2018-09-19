;;; lang/lsp/config.el -*- lexical-binding: t; -*-

;;; LSP mode
(def-package! lsp-mode
  :commands (lsp-mode))

(def-package! lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :init
  (setq-default lsp-ui-doc-frame-parameters
                '((left . -1)
                  (top . -1)
                  (no-accept-focus . t)
                  (min-width . 0)
                  (width . 0)
                  (min-height . 0)
                  (height . 0)
                  (internal-border-width . 0)
                  (vertical-scroll-bars)
                  (horizontal-scroll-bars)
                  (left-fringe . 0)
                  (right-fringe . 0)
                  (menu-bar-lines . 0)
                  (tool-bar-lines . 0)
                  (line-spacing . 0.1)
                  (unsplittable . t)
                  (undecorated . t)
                  (minibuffer . nil)
                  (visibility . nil)
                  (mouse-wheel-frame . nil)
                  (no-other-frame . t)
                  (cursor-type)
                  (no-special-glyphs . t)))
  :config
  (setq lsp-ui-doc-enable t
        lsp-enable-completion-at-point t
        lsp-ui-doc-position 'top
        lsp-ui-doc-header nil
        lsp-ui-doc-include-signature t
        lsp-ui-sideline-enable nil
        ;; lsp-ui-doc-background (doom-color 'base4)
        lsp-ui-doc-border (doom-color 'fg)))

(def-package! company-lsp
  :after lsp-mode)

(def-package! lsp-python
  :commands (lsp-python-enable)
  :after python
  :init
  (add-hook 'python-mode-hook #'lsp-python-enable)
  :config
  (setq
   python-indent-guess-indent-offset-verbose nil)
  (set-company-backend! 'python-mode '(company-lsp :with company-files company-yasnippet))
  (set-lookup-handlers! 'python-mode
    :definition #'lsp-ui-peek-find-definitions
    :references #'lsp-ui-peek-find-references))

(def-package! lsp-haskell
  :commands (lsp-haskell-enable)
  :after haskell-mode
  :init
  (add-hook 'haskell-mode-hook #'lsp-haskell-enable)
  :config
  (set-company-backend! 'haskell-mode '(company-lsp company-files company-yasnippet)))

(def-package! cquery
  :after cc-mode
  :commands lsp-cquery-enable
  :init
  (add-hook 'c-mode-common-hook #'+cquery/enable)
  (add-to-list 'projectile-globally-ignored-directories ".cquery_cached_index")
  :config
  (setq cquery-executable "/usr/bin/cquery")
  (set-company-backend!
    '(c-mode c++-mode objc-mode)
    '(company-lsp))
  (set-lookup-handlers! '(c-mode c++-mode objc-mode)
    :definition #'lsp-ui-peek-find-definitions
    :references #'lsp-ui-peek-find-references))

(def-package! lsp-elixir
  :after elixir-mode
  :load-path "~/sources/lsp-elixir"
  :commands lsp-elixir-enable
  :init
  (add-hook 'elixir-mode-hook #'lsp-elixir-enable)
  (add-hook! 'elixir-mode-hook (add-hook 'before-save-hook 'lsp-format-buffer))
  :config
  (set-company-backend! 'elixir-mode '(company-lsp company-files company-yasnippet)))

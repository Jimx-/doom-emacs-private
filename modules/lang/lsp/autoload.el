;;; lang/lsp/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +ccls//enable ()
  (condition-case nil
      (lsp-ccls-enable)
    (user-error nil)))

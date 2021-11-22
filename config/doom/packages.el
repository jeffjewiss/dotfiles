;;; package --- Personal Packages
;;; Commentary:
;;; ~/.config/doom/packages.el

;;; Code:
(package! org-journal)
(package! nov)
(package! treemacs-icons-dired)
(package! pocket-reader)
(package! org-sidebar)
(package! keycast)
(package! magit-delta)
;; (package! lsp-tailwindcss :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))
(package! prettier)
(package! prettier-js)
(package! web-beautify)

;; (package! atomic-chrome)
;; (package!
;;     greview
;;     :recipe
;;       (:fetcher github
;;        :repo "charignon/greview"
;;        :files ("greview.el")))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

(provide `packages)

;;; packages.el ends here

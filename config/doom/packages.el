;;; package --- Personal Packages -*- no-byte-compile: t; -*-
;;;
;;; Commentary:
;;; ~/.config/doom/packages.el

;;; Code:
(package! org-journal)
(package! nov)
(package! treemacs-icons-dired)
(package! pocket-reader)
(package! org-sidebar)
(package! lsp-tailwindcss :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))
(package! info-colors :pin "47ee73cc19b1049eef32c9f3e264ea7ef2aaf8a5")
;; (package! keycast :pin "72d9add8ba16e0cae8cfcff7fc050fa75e493b4e")
;; (package! vlf :recipe (:host github :repo "m00natic/vlfi" :files ("*.el"))
  ;; :pin "cc02f2533782d6b9b628cec7e2dcf25b2d05a27c" :disable t)
;; (use-package! vlf-setup
  ;; :defer-incrementally vlf-tune vlf-base vlf-write vlf-search vlf-occur vlf-follow vlf-ediff vlf)
(package! magit-delta
  :pin "ccc3795a72554439f230969322c0e3239252c193")
(package! page-break-lines :recipe (:host github :repo "purcell/page-break-lines"))

;; (package! atomic-chrome)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

(provide `packages)

;;; packages.el ends here

;;; packages.el --- my-spaceline layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: mdn <mdn@mdn-G551JW>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `my-spaceline-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-spaceline/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-spaceline/pre-init-PACKAGE' and/or
;;   `my-spaceline/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:
(defconst my-spaceline-packages
  '(all-the-icons
    spaceline
    spaceline-all-the-icons))

(defun my-spaceline/init-all-the-icons ()
  (use-package all-the-icons
    :config (setq neo-theme 'icons)))

(defun my-spaceline/init-spaceline ()
  (use-package spaceline))

(defun my-spaceline/init-spaceline-all-the-icons ()
  (use-package spaceline-all-the-icons
    :after spaceline
    :config (progn
              (spaceline-all-the-icons-theme)
              (spaceline-all-the-icons--setup-neotree)
              (setq spaceline-all-the-icons-separator-type 'arrow)
              (setq spaceline-all-the-icons-icon-set-modified 'chain)
              (setq spaceline-all-the-icons-icon-set-sun-time 'sun/moon))))
;;; packages.el ends here

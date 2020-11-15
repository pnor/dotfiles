;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(load! "Secret.el")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "MesloLGS Nerd Font" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-city-lights)

;; If you use `org' and don't want your org files in the default location below,;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys ;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; Start maximised
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-load-path! "lisp")
(load! "~/.doom.d/lisp/magit-pretty-graph.el")

;; Keymaps
(evil-define-key 'normal 'global
  ;; Command
  ";" 'evil-ex
  ;; Windows
  " l" 'evil-window-right
  " H" 'evil-window-left
  " j" 'evil-window-down
  " k" 'evil-window-up
  ; Change workspace
  "\\gt" '+workspace/cycle
  ;; Browsing the Web
  "\\s" 'browse-web
  ;; Finder
  "\\f" 'helm-find-files
  ;; Spelling Correction
  "\\l" 'flyspell-auto-correct-word
  ;; Buffers
  "\\b" 'helm-buffers-list
  )

 (evil-define-key 'visual 'global
  ;; Command
  ";" 'evil-ex
   )

(require 'evil-snipe)
(setq evil-snipe-scope 'buffer)
(evil-snipe-mode +1)

;; Markdown Previews
(use-package vmd-mode)

;;(require 'doom-modeline) is this doing anything??
;;(setq doom-modeline-modal-icon 'ryo)
;;
;; Company config
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)
;; Show help when writing prose
(set-company-backend! 'text-mode 'company-ispell 'company-dabbrev)

;; Trailing whitespace (?)
(doom-enable-show-trailing-whitespace-h)

;; Latex
(latex-preview-pane-enable)

;; Retina display / less fuzzy pdfs
(setq pdf-view-use-scaling t pdf-view-use-imagemagick nil)

;; Org mode
(setq org-hide-emphasis-markers t)
(setq org-pretty-entities t)

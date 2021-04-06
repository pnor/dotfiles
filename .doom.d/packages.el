;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; ===== external packages
(package! solaire-mode :disable t)

;; ===== appearence
(package! rainbow-mode)                 ;; Preview color codes in-line
(package! all-the-icons-ivy-rich)       ;; Add icons to ivy
(package! focus)                        ;; Dim text when typing

;; ===== functionality
(package! webkit-color-picker)          ;; Selct colors from a palette (using webkit)
(package! epaint :recipe                ;; paint drawing for emacs
  (:host github
   :repo "chuntaro/epaint"
   :files ("*")))
(package! evil-quickscope)              ;; Target highlighting for f/t jumps
(package! graphql)                      ;; Set of generic languages for interacting with graphql web services

;; ===== markup
(package! vmd-mode)                     ;; Preview markdown

;; ===== Latex
(package! webkit-katex-render :recipe   ;; Show preview of equation in popup
  (:host github
   :repo "fuxialexander/emacs-webkit-katex-render"))

;; ===== language support
(package! company-lsp)                  ;; Company + LSP mode
(package! lsp-sourcekit)                ;; LSP suppport for sourcekit (swift)
(package! graphql-mode)                 ;; Syntax support for the graphql query language
(package! zenscript-mode)               ;; Syntax support for a minecraft modding scripting language
(package! harmony-mode :recipe          ;; Syntax support for Harmony, a language used in CS 4410 at Cornell
  (:local-repo "local_packages/harmony-mode"))
(package! flycheck-swiftlint)           ;; Swiftlint

;; ===== OR tools
(package! ampl-mode :recipe             ;; Syntax support for AMPL
  (:host github
   :repo "dpo/ampl-mode"
   :files ("emacs/ampl-mode.el")))

;; ===== Json
(package! json-navigator)               ;; Navigate json with tree structure

;; ===== Org
(package! ord-d20 :recipe               ;; keybinds for table top games
  (:host github
   :repo "spwhitton/org-d20"))
(package! org-bullets)

;; ===== Misc / Fun
(package! exec-path-from-shell)         ;; Sync paths to the ones in shell when started from app
(package! font-lock-studio)             ;; Debugging font-lock regexes
(package! zone-rainbow)                 ;; Another zone program

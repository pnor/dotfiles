;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; ===== disabling packages
(package! solaire-mode :disable t)

;; ===== appearence
(package! all-the-icons-ivy-rich)       ;; Add icons to ivy
(package! focus)                        ;; Dim text when typing
(package! rainbow-mode)                 ;; Preview color codes in-line

;; ===== functionality
(package! company-tabnine)              ;; Completion + Deep Learning
(package! epaint :recipe                ;; paint drawing for emacs
  (:host github :repo "chuntaro/epaint" :files ("*")))
(package! evil-quickscope)              ;; Target highlighting for f/t jumps
(package! forge)                        ;; Work with git forges (like reviewing PRs)
(package! webkit-color-picker)          ;; Selct colors from a palette (using webkit)

;; ===== markup
(package! vmd-mode)                     ;; Preview markdown

;; ===== Latex
(package! webkit-katex-render    ;; Show preview of equation in popup
  :recipe (:host github :repo "fuxialexander/emacs-webkit-katex-render"))

;; ===== language support
(package! flycheck-swiftlint)           ;; Swiftlint
(package! graphql-mode)                 ;; Syntax support for the graphql query language
(package! harmony-mode                  ;; Syntax support for Harmony, a language used in CS 4410 at Cornell
  :recipe (:local-repo "local_packages/harmony-mode"))

(package! lsp-sourcekit)                ;; LSP suppport for sourcekit (swift)

;; ===== OR tools
(package! ampl-mode :recipe             ;; Syntax support for AMPL
  (:host github :repo "dpo/ampl-mode" :files ("emacs/ampl-mode.el")))

;; ===== Json
(package! json-navigator)               ;; Navigate json with tree structure

; ===== Org
(package! ord-d20 :recipe               ;; keybinds for table top games
  (:host github :repo "spwhitton/org-d20"))

;; ===== Misc / Fun
(package! font-lock-studio)             ;; Debugging font-lock regexes
(package! zone-rainbow)                 ;; Another zone program
(package! play-sound-osx                ;; Sound support in emacs
  :recipe (:host github :repo "leoliu/play-sound-osx"))
(package! tetris-sounds                 ;; Sounds for emacs tetris
  :recipe (:local-repo "local_packages/tetris-sounds"))
(package! leetcode)                     ;; Leetcode
(package! huecycle              ;; Colorize fonts
  :recipe (:local-repo "local_packages/huecycle"))
(package! svg-tag-mode
  :recipe (:host github :repo "rougier/svg-tag-mode"))

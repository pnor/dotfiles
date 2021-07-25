;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; ===== disabling packages
(package! solaire-mode :disable t)
(package! evil-snipe :disable t)

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
(package! floatbuf                      ;; Floating buffers
  :recipe (:host github :repo "pnor/floatbuf"))

;; ===== markup
(package! vmd-mode)                     ;; Preview markdown

;; ===== latex
(package! webkit-katex-render    ;; Show preview of equation in popup
  :recipe (:host github :repo "fuxialexander/emacs-webkit-katex-render"))

;; ===== language support
(package! flycheck-swiftlint)           ;; Swiftlint
(package! graphql-mode)                 ;; Syntax support for the graphql query language
(package! lsp-sourcekit)                ;; LSP suppport for sourcekit (swift)
(package! package-lint)                 ;; Static linter for Emacs Packages

;; ===== OR tools
(package! ampl-mode :recipe             ;; Syntax support for AMPL
  (:host github :repo "dpo/ampl-mode" :files ("emacs/ampl-mode.el")))

;; ===== json
(package! json-navigator)               ;; Navigate json with tree structure

; ===== org
(package! ord-d20 :recipe               ;; keybinds for table top games
  (:host github :repo "spwhitton/org-d20"))

;; ===== python
(package! lsp-pyright)                  ;; python LSP

;; ===== misc / Fun
(package! zone-rainbow)                 ;; Another zone program
(package! huecycle)                     ;; Colorize fonts
(package! chess)                        ;; Chess
(package! play-sound-osx                ;; Sound support in emacs
  :recipe (:host github :repo "leoliu/play-sound-osx"))
(package! tetris-sounds                 ;; Sounds for emacs tetris
  :recipe (:local-repo "local_packages/tetris-sounds"))

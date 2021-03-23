;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; ===== external packages
(package! solaire-mode :disable t)

;; ===== appearence
(package! rainbow-mode)                 ;; Preview color codes in-line
(package! magit-pretty-graph :recipe    ;; Better looking magit log graph
  (:local-repo "local_packages/magit-pretty-graph"))
(package! all-the-icons-ivy-rich)       ;; Add icons to ivy
(package! focus)

;; ===== functionality
(package! palette :recipe               ;; Select colors from a pallete
  (:local-repo "local_packages/palette"))
(package! epaint :recipe                ;; paint drawing for emacs
  (:host github
   :repo "chuntaro/epaint"
   :files ("*")))

;; ===== markup
(package! vmd-mode)                     ;; Preview markdown

;; ===== language support
(package! company-lsp)                  ;; Company + LSP mode
(package! lsp-sourcekit)                ;; LSP suppport for sourcekit (swift)
(package! zenscript-mode)               ;; Syntax support for a minecraft modding scripting language
(package! harmony-mode :recipe          ;; Syntax support for Harmony, a language used in CS 4410 at Cornell
  (:local-repo "local_packages/harmony-mode"))

;; ===== OR tools
(package! ampl-mode :recipe             ;; Syntax support for AMPL
  (:host github
   :repo "dpo/ampl-mode"
   :files ("emacs/ampl-mode.el")))

;; ===== Json
(package! json-navigator)               ;; Navigate json with tree structure

;; ===== Org
;; (package! org-download)                 ;; Download images via command
(package! ord-d20 :recipe               ;; keybinds for table top games
  (:host github
   :repo "spwhitton/org-d20"))
(package! org-bullets)

;; ===== Misc / Fun
(package! exec-path-from-shell)         ;; Sync paths to the ones in shell when started from app
(package! font-lock-studio)             ;; Debugging font-lock regexes

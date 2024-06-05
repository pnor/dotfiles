;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; ===== disabling packages
(package! solaire-mode :disable t)

;; ===== appearence
(package! focus)                        ;; Dim text when typing
(package! rainbow-mode)                 ;; Preview color codes in-line

;; ===== functionality
(package! blamer)                       ;; Show git blame on line
(package! demap)                        ;; Code Minimap
(package! evil-quickscope)              ;; Target highlighting for f/t jumps
(package! floatbuf                      ;; Floating buffers
  :recipe (:host github :repo "pnor/floatbuf"))
(package! forge)                        ;; Work with git forges (like reviewing PRs)
(package! gcmh)                         ;; Make emacs more responive by monkeying with the garbage collector
(package! org-modern)                   ;; Org mode modern look
(package! realgud-lldb)                 ;; lldb support for debugger
(package! vlf :recipe (:host github :repo "m00natic/vlfi" :files ("*.el"))
  :pin "cc02f2533782d6b9b628cec7e2dcf25b2d05a27c") ;; Open huge viles incrementally

;; ===== language support
(package! flycheck-swiftlint)           ;; Swiftlint
;;(package! lsp-sourcekit)                ;; LSP suppport for sourcekit (swift)
(package! package-lint)                 ;; Static linter for Emacs Packages
(package! docker)                       ;; Docker
(package! dockerfile-mode)              ;; Docker Syntax
(package! clang-format)                 ;; C family formatting

;; ===== OR tools
(package! ampl-mode :recipe             ;; Syntax support for AMPL
  (:host github :repo "dpo/ampl-mode" :files ("emacs/ampl-mode.el")))

;; ===== json
(package! json-navigator)               ;; Navigate json with tree structure

                                        ; ===== org
;; (package! ord-d20 :recipe               ;; keybinds for table top games
;;   (:host github :repo "spwhitton/org-d20"))

;; ===== library
(package! ts.el :recipe                 ;; Time stamps for the last crash calculation
  (:host github :repo "alphapapa/ts.el"))

;; ===== misc / fun
(package! zone-rainbow)                         ;; Another zone program
(package! huecycle)                             ;; Colorize fonts
(package! play-sound-osx :ignore IS-LINUX       ;; Sound support in emacs
  :recipe (:host github :repo "leoliu/play-sound-osx"))
;; (package! vlc)                                  ;; Music controlled by Emacs
(package! random-theme                          ;; Randomize my color theme
  :recipe (:host github :repo "pnor/random-theme"))
(package! leetcode)                             ;; Leetcode but in place where I can bear to do it

;; ===== Conditional
(package! ewal :ignore IS-MAC)
(package! ewal-doom-themes :ignore IS-MAC)


(package! emacs-copilot :recipe                 ;; LLM stuff
  (:host github :repo "jart/emacs-copilot"))

;; trying lsp-bridge, but no error inline sucks ):
;; (when (package! lsp-bridge
;;         :recipe (:host github
;;                  :repo "manateelazycat/lsp-bridge"
;;                  :branch "master"
;;                  :files ("*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
;;                  ;; do not perform byte compilation or native compilation for lsp-bridge
;;                  :build (:not compile)))
;;   (package! markdown-mode)
;;   (package! yasnippet))

(package! olivetti)
(package! auto-olivetti
  :recipe (:host sourcehut :repo "ashton314/auto-olivetti"))

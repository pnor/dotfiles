;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here, run 'doom sync' on
;; the command line, then restart Emacs for the changes to take effect.
;; Alternatively, use M-x doom/reload.


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a particular repo, you'll need to specify
;; a `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, for whatever reason,
;; you can do so here with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; --- external packages
;; appearence
(package! rainbow-mode)                 ;; Preview color codes in-line
(package! magit-pretty-graph :recipe    ;; Better looking magit log graph
  (:local-repo "./local_packages/magit-pretty-graph"))

;; company
(package! company-box)                  ;; Make the company completion look better
(package! company-lsp)                  ;; Company + LSP mode

;; markup
(package! latex-preview-pane)           ;; Preview LaTex in a seperate pane
(package! vmd-mode)                     ;; Preview markdown

;; lsp
(package! lsp-sourcekit)                ;; LSP suppport for sourcekit

;; OR tools
(package! ampl-mode :recipe             ;; Syntax support for AMPL
  (:host github
   :repo "dpo/ampl-mode"
   :files ("emacs/ampl-mode.el")))

;; Org
(package! org-download)                 ;; Download images via command
(package! ord-d20 :recipe               ;; keybinds for table top games
  (:host github
   :repo "spwhitton/org-d20"))

;; Shell syncing
(package! exec-path-from-shell)         ;; Sync paths to the ones in shell when started from app

;; Misc
(package! zenscript-mode)               ;; Syntax support for a minecraft modding scripting language
(package! palette :recipe               ;; Select colors from a pallete
  (:local-repo "local_packages/palette"))
(package! epaint :recipe                ;; paint drawing for emacs (don't know how to use...)
  (:host github
   :repo "chuntaro/epaint"))

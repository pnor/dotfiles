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

;;package settings
(use-package lsp-python-ms
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred

(use-package lsp-mode
  :ensure t
  :config
  (add-hook '+javascript-npm-mode-hook 'lsp)
  (add-hook 'c++-mode-hook 'lsp)
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'csharp-mode-hook 'lsp)
  (add-hook 'go-mode-hook 'lsp)
  (add-hook 'java-mode-hook 'lsp)
  (add-hook 'latex-mode-hook 'lsp)
  (add-hook 'swift-mode-hook 'lsp)
  (add-hook 'typescript-mode-hook 'lsp)
  )

(use-package lsp-ui
  :ensure t)

(use-package lsp-sourcekit
  :after lsp-mode
  :config
  (setq lsp-sourcekit-executable "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"))

(use-package swift-mode
  :hook (swift-mode . (lambda () (lsp))))

;;(require 'lsp-sourcekit)
;;(setenv "SOURCEKIT_TOOLCHAIN_PATH" "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain")
;;(setq lsp-sourcekit-executable "/Users/rudedogg/Desktop/Contrib/sourcekit-lsp/.build/debug/sourcekit-lsp")

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package company-quickhelp
  :ensure t)

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package company-jedi
  :ensure t)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

(package! company-sourcekit :disable t)
(package! company-lsp :disable t)

(require 'package)
(add-to-list 'package-archives 
    '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(add-to-list 'load-path "~/slime")
(require 'slime-autoloads)
(setq inferior-lisp-program "sbcl")

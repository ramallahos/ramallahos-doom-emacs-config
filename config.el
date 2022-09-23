(setq user-full-name "Safwan Nayeem"
      user-mail-address "SafwanNayeem569@gmail.com")

(setq doom-theme 'doom-xcode)

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(setq display-line-numbers-type t)

(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 15)
        doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font Mono" :size 15)
        doom-big-font (font-spec :family "FiraCode Nerd Font Mono" :size 24))

(setq org-pretty-entities t)

(setq org-directory "~/org/")

(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)
(after! org
  (setq org-directory "~/nc/Org/"
        org-agenda-files '("~/work/Org/agenda.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
        org-superstar-item-bullet-alist '((?+ . ?➤) (?- . ?✦)) ; changes +/- symbols in item lists
        org-log-done 'time
        org-hide-emphasis-markers t
        org-capture-bookmark nil
        org-src-fontify-natively t
        org-fontify-quote-and-verse-blocks t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 2
        org-hide-block-startup nil
        org-src-preserve-indentation nil
        org-startup-folded 'content
        org-cycle-separator-lines 2
        ;; ex. of org-link-abbrev-alist in action
        ;; [[arch-wiki:Name_of_Page][Description]]
        org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
          '(("google" . "http://www.google.com/search?q=")
            ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
            ("ddg" . "https://duckduckgo.com/?q=")
            ("wiki" . "https://en.wikipedia.org/wiki/"))
        org-table-convert-region-max-lines 20000
        org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
          '((sequence
             "TODO(t)"           ; A task that is ready to be tackled
             "BLOG(b)"           ; Blog writing assignments
             "GYM(g)"            ; Things to accomplish at the gym
             "PROJ(p)"           ; A project that contains other tasks
             "VIDEO(v)"          ; Video assignments
             "WAIT(w)"           ; Something is holding up this task
             "|"                 ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)"           ; Task has been completed
             "CANCELLED(c)" )))) ; Task has been cancelled

  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-use-outline-path t)

(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.4))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.3))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)

(use-package org-auto-tangle
  :load-path "site-lisp/org-auto-tangle/"    ;; this line is necessary only if you cloned the repo in your site-lisp directory
  :defer t
  :hook (org-mode . org-auto-tangle-mode))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))
(global-rainbow-mode 1 )

;; (after! core-ui (menu-bar-mode 1))
;; (after! core-ui (scroll-bar-mode 1))
;; (after! core-ui (tool-bar-mode 1))

;; (add-hook 'window-setup-hook #'neotree-show 'append)
;; (add-hook 'window-setup-hook #'minimap-mode 'append)
(add-hook 'window-setup-hook #'prettify-symbols-mode 'append)
(add-hook 'after-init-hook #'global-prettier-mode)

;;box hollow bar hbar nil
(setq evil-normal-state-cursor '(box "light blue")
      evil-insert-state-cursor '(bar "medium sea green")
      evil-visual-state-cursor '(box "orange"))
(add-hook 'window-setup-hook #'blink-cursor-mode 'append)

(beacon-mode 1)

(emms-all)
(emms-default-players)
(emms-mode-line 1)
(emms-playing-time 1)

(setq emms-source-file-default-directory "~/Music/"
      emms-playlist-buffer-name "*Music*"
      emms-info-asynchronously t
      emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)

(use-package emojify
  :hook (after-init . global-emojify-mode))

(setq default-tab-width 4)
(+global-word-wrap-mode +1)
;; (setq-default line-spacing 20)

(set-face-attribute 'mode-line nil :font "FiraCode Nerd Font Mono")

(setq doom-modeline-height 30     ;; sets modeline height
      doom-modeline-bar-width 5   ;; sets right bar width
      doom-modeline-persp-name t  ;; adds perspective name to modeline
      doom-modeline-persp-icon t) ;; adds folder icon next to persp name

(setq doom-modeline-enable-word-count t)
;; diminish mode
;; (setq doom-modeline-height 15
;;       doom-modeline-bar-width 6
;;       doom-modeline-lsp nil
;;       doom-modeline-github nil
;;       doom-modeline-mu4e nil
;;       doom-modeline-irc nil
;;       doom-modeline-minor-modes t
;;       doom-modeline-buffer-file-name-style 'truncate-except-project
;;       doom-modeline-persp-name nil)
(setq display-time-format "%l:%M %p %b %y"
      display-time-default-load-average nil)

(add-hook 'window-setup-hook #'display-battery-mode 'append)
(add-hook 'window-setup-hook #'display-time 'append)

(setq shell-file-name "/bin/zsh"
      vterm-max-scrollback 5000)
(setq eshell-rc-script "~/.config/doom/eshell/profile"
      eshell-aliases-file "~/.config/doom/eshell/aliases"
      eshell-history-size 5000
      eshell-buffer-maximum-lines 5000
      eshell-hist-ignoredups t
      eshell-scroll-to-bottom-on-input t
      eshell-destroy-buffer-when-process-dies t
      eshell-visual-commands'("bash" "fish" "htop" "ssh" "top" "zsh"))

(plist-put! +ligatures-extra-symbols
  ;; org
  :name          "»"
  :src_block     "»"
  :src_block_end "«"
  :quote         "“"
  :quote_end     "”"
  ;; Functional
  :lambda        "λ"
  :def           "ƒ"
  :composition   "∘"
  :map           "↦"
  ;; Types
  :null          "∅"
  :true          "𝕋"
  :false         "𝔽"
  :int           "ℤ"
  :float         "ℝ"
  :str           "𝕊"
  :bool          "𝔹"
  :list          "𝕃"
  ;; Flow
  :not           "￢"
  :in            "∈"
  :not-in        "∉"
  :and           "∧"
  :or            "∨"
  :for           "∀"
  :some          "∃"
  :return        "⟼"
  :yield         "⟻"
  ;; Other
  :union         "⋃"
  :intersect     "∩"
  :diff          "∖"
  :tuple         "⨂"
  :pipe          ""
  :dot           "•"
  :"[ ]"         ""
  :"[-]"         "﫠"
  :"[X]"         "﫟")

(cond (IS-MAC
       (setq mac-command-modifier       'meta
             mac-option-modifier        'alt
             mac-right-option-modifier  'alt
             mac-pass-control-to-system nil)))

(setq auto-save-default t
      make-backup-files t)

(setq confirm-kill-emacs nil)

(setq initial-frame-alist '((top . 0) (left . 0) (width . 1920) (height . 1080)))

(setq fancy-splash-image "~/.doom.d/doom.png")

;; (set-frame-parameter (selected-frame) 'alpha '(85 85))
;; (add-to-list 'default-frame-alist '(alpha 85 85))

(setq centaur-tabs-style "wave")
(setq centaur-tabs-height 32)
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-plain-icons t)
(setq centaur-tabs-gray-out-icons 'buffer)
(setq centaur-tabs-set-bar 'left)
(setq centaur-tabs-set-bar 'over)
(setq centaur-tabs-show-navigation-buttons t)
(setq centaur-tabs-enable-key-bindings t)
(define-key evil-normal-state-map (kbd "g t") 'centaur-tabs-forward)
(define-key evil-normal-state-map (kbd "g T") 'centaur-tabs-backward)
(defun centaur-tabs-buffer-groups ()
  "`centaur-tabs-buffer-groups' control buffers' group rules.

Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
All buffer name start with * will group to \"Emacs\".
Other buffer group by `centaur-tabs-get-group-name' with project name."
  (list
(cond
 ((or (string-equal "*" (substring (buffer-name) 0 1))
      (memq major-mode '(magit-process-mode
			 magit-status-mode
			 magit-diff-mode
			 magit-log-mode
			 magit-file-mode
			 magit-blob-mode
			 magit-blame-mode
                         prog-mode
                         dired-mode
                         helpful-mode
                         help-mode
		         			)))
  "Emacs")
      ((memq major-mode '(org-mode org-agenda-mode
                          diary-mode
                          org-agenda-clockreport-mode
		          org-src-mode
		          org-agenda-mode
		          org-beamer-mode
		          org-indent-mode
		          org-bullets-mode
		          org-cdlatex-mode
		          org-agenda-log-mode
		          diary-mode
                          emacs-lisp-mode
                          python-mode
                          shell-script-mode
                          ))
  "Code")
 (t
  (centaur-tabs-get-group-name (current-buffer))))))

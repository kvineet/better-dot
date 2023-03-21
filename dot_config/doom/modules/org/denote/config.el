;;; org/denote/config.el -*- lexical-binding: t; -*-


(defun my-denote-journal ()
  "Create an entry tagged 'journal', while prompting for a title."
  (interactive)
  (denote
   (denote--title-prompt)
   '("journal")))

;; Remember to check the doc strings of those variables.
(use-package! denote
  :config
  (setq denote-known-keywords '("emacs" "philosophy" "politics" "economics")
        denote-infer-keywords t
        denote-sort-keywords t
        denote-file-type nil  ; org is default
        denote-prompts '(title keywords)
        denote-date-prompt-use-org-read-date t
        denote-allow-multi-word-keywords t
        denote-date-format nil
        denote-link-fontify-backlinks t)
  (add-hook 'dired-mode-hook #'denote-dired-mode))
; #TODO: keybinding
; https://protesilaos.com/emacs/denote#h:b875450a-ae22-4899-ac23-c10fa9c279bb

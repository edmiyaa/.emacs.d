(defun open-file-in-clipboard ()
  "Open current clipboard content if it's a valid file path"
  (interactive)
  (let* ((clipboard-content (w32-get-clipboard-data))
	 (clipboard-content-clean (if clipboard-content
				      (replace-regexp-in-string
				       "['\"]+$\\|^['\"]+"
				       ""
				       clipboard-content))))
    (if (and clipboard-content-clean (file-exists-p clipboard-content-clean))
	(progn (message "Opening file: %s" clipboard-content-clean)
	       (find-file clipboard-content-clean))
      (message "Invalid file: %s" clipboard-content-clean))))

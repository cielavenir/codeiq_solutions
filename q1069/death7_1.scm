(map (lambda (c)
	(display (string-append ">" (make-string (char->integer c) #\+) "."))
) (string->list "deathma colosseum"))
" Tidy HTML 5 - https://github.com/htacg/tidy-html5
let &l:makeprg='tidy -quiet -indent -utf8 -wrap 0 --show-errors 0 --gnu-emacs yes %:p:S'

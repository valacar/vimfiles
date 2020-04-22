" Quickfix (after) syntax

" hide the || at start of line 
" assumes setlocal cole=2 cocu=nc in after/ftplugin/qf.vim
syntax match qfHide /^|| / conceal

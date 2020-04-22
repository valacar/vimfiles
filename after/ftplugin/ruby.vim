" Ruby 'after' ftplugin settings
scriptencoding utf-8

setlocal nowrap

setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

setlocal formatoptions-=c       " don't auto-wrap comments and insert comment leader
setlocal formatoptions-=o       " don't insert comment leader when pressing o or O
setlocal formatoptions-=r       " don't insert comment leader when pressing <Enter>

nnoremap <buffer> <silent> <LocalLeader>r :update<CR>:!start cmd /c ruby "%" & pause<CR>

setlocal makeprg=ruby\ %

iabbrev <buffer> elseif elsif

" macro to convert a WORD to #{variable} (assume Surround plugin is installed)
" TODO: change this is a function or something, and make it better (example: "varname shouldn't include the quote)
let b:old_regw = getreg('w')
call setreg('w', 'viWS}i#f}aa')

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin .= " | setlocal wrap< expandtab< tabstop< softtabstop< shiftwidth< makeprg< formatoptions< | call setreg('w', b:old_regw)"

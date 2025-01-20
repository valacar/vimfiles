setlocal nowrap
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal formatoptions-=c       " don't auto-wrap comments and insert comment leader
setlocal formatoptions-=o       " don't insert comment leader when pressing o or O
setlocal formatoptions-=r       " don't insert comment leader when pressing <Enter>

nnoremap <buffer> <silent> <LocalLeader>r :update<bar>make<bar>bot cwindow<CR>

compiler ruby

setlocal formatprg=rufo

iabbrev <buffer> elseif elsif

" surround variable with #{variable} e.g. ysw# (using tpope's surround plugin)
exec 'let b:surround_' .. char2nr('#') '= "#{\r}"'

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin .= " | setlocal wrap< expandtab< tabstop< softtabstop< shiftwidth< makeprg< formatoptions< | call setreg('w', b:old_regw)"

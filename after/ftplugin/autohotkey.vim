" Autohotkey 'after' ftplugin settings

setlocal nowrap

setlocal formatoptions-=c       " don't auto-wrap comments and insert comment leader
setlocal formatoptions-=o       " don't insert comment leader when pressing o or O
setlocal formatoptions-=r       " don't insert comment leader when pressing <Enter>

" Note: compiler is set in ~\vimfiles\compiler\autohotkey.vim

nnoremap <buffer> <silent> <LocalLeader>r :!start /b autohotkey %:p:S<CR>
nnoremap <buffer> <silent> <LocalLeader>b :make<CR>

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin .= ' | setlocal wrap< formatoptions<'

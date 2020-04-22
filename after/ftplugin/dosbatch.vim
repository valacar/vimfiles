" DOS Batch file 'after' ftplugin settings

setlocal nowrap

setlocal formatoptions-=c       " don't auto-wrap comments and insert comment leader
setlocal formatoptions-=o       " don't insert comment leader when pressing o or O
setlocal formatoptions-=r       " don't insert comment leader when pressing <Enter>

setlocal commentstring=::\ %s

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin .= ' | setlocal wrap< formatoptions< commentstring<'

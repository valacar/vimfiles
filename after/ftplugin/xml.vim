command! -buffer Tidy :%!tidy -xml -q -i -w 0 --show-errors 0
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal nowrap

let &l:formatprg = 'tidy -xml -q -i -w 0 --show-errors 0'

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin = b:undo_ftplugin . ' | setlocal tabstop< softtabstop< shiftwidth< wrap< formatprg<'

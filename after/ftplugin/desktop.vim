setlocal nowrap

" Up/Down: Jump to group header
nnoremap <buffer> <Down> <Cmd>call search('^\s*\[', 'W' )<CR>zt
nnoremap <buffer> <Up>   <Cmd>call search('^\s*\[', 'bW')<CR>zt

let b:undo_ftplugin = 'setlocal wrap<'

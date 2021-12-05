" Netrw 'after' ftplugin settings

" Escape or q to close netrw window
nnoremap <silent> <buffer> <nowait> <Esc> :bwipeout<CR>
nnoremap <silent> <buffer> <nowait> q :bwipeout<CR>

" Quicker up and down movement
nnoremap <buffer> <A-j> 5j
nnoremap <buffer> <A-k> 5k

nnoremap <buffer> <F1> :help netrw-quickmaps<CR>

" Just show the current directory on the status line
let &l:statusline = '%{substitute(b:netrw_curdir, escape($HOME, "\\"), "~", "")}'

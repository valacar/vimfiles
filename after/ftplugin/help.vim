" Enter key searches :help for word under cursor
nnoremap <buffer> <CR> <C-]>

" Enter or MiddleMouse button searches for visually selected text in :help
xnoremap <buffer> <CR> <C-]>
xnoremap <buffer> <MiddleMouse> <C-]>

" Backspace or Mouse4 to navigate backwards, Mouse5 to go forward
nnoremap <buffer> <BS> <C-t>
nnoremap <buffer> <X1Mouse> <C-t>
nnoremap <buffer> <X2Mouse> <C-]>

" q to close help window
nnoremap <buffer> q <C-w>c

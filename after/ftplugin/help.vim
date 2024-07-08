" Enter key follows a hyperlink tag in :help
nnoremap <buffer> <CR> <c-]>
xnoremap <buffer> <CR> <c-]>

" Backspace or Mouse4 to navigate tags backwards, Mouse5 to go forward
nnoremap <buffer> <BS> <Cmd>pop<CR>
nnoremap <buffer> <X1Mouse> <Cmd>pop<CR>
nnoremap <buffer> <X2Mouse> <Cmd>tag<CR>

" Press q to close help window
nnoremap <buffer> q <C-w>c

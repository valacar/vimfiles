" Enter key follows a hyperlink tag in :help
nnoremap <buffer> <silent> <CR> :call dist#man#PreGetPage(v:count)<CR>

" Backspace or Mouse4 to navigate tags backwards
nnoremap <buffer> <silent> <BS> :call dist#man#PopPage()<CR>
nnoremap <buffer> <silent> <X1Mouse> :call dist#man#PopPage()<CR>

" Press q to close help window
nnoremap <buffer> q <C-w>c

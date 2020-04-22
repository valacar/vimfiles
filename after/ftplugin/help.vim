" Enter key follows a hyperlink tag in :help
nnoremap <buffer> <CR> <c-]>

" go back a page with Backspace or extra mouse buttons
nnoremap <buffer> <X2Mouse> <c-o>
nnoremap <buffer> <X1Mouse> <c-t>
nnoremap <buffer> <BS> <c-t>

" close help window with just 'q'
nnoremap <buffer> q <C-w>c

" search for 'option' links
nnoremap <buffer> o /\<'\a\{2,\}'<CR>
nnoremap <buffer> O ?\<'\a\{2,\}'<CR>

" search for |subject| links
nnoremap <buffer> s /\|\S\{2,\}\|<CR>
nnoremap <buffer> S ?\|\S\{2,\}\|<CR>

" search for either 'option' or |subject| links (FIXME: doesn't work properly)
nnoremap <buffer> x /\<\(['\|]\)[^'\|\t ]\{2,\}\1\><CR>
nnoremap <buffer> X ?\<\(['\|]\)[^'\|\t ]\{2,\}\1\><CR>

" TODO: add a search for *topic* (helpstar)

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal nowrap

" disable nroff macros so using } and { don't stop
" lines beginning with ".sh" for example
setlocal sections=

if executable('prettier')
  let &formatprg = 'prettier --stdin --no-color --parser css'
endif

if exists(':ReloadFirefox')
  " Save and reload browser's current tab
  nnoremap <buffer> <silent> <LocalLeader>r
        \ :update<CR>
        \ :ReloadFirefox<CR>
endif

" Run :sort and :!uniq on current line up until '{' and fix ending comas
" Note: assumes each selector is on its own line, ending in a comma,
" and { is on its own line too after the list of selectors
function! s:SortCSSSelectors() abort
  let l:save_cursor = getpos('.')
  let l:range = ':.,/{/-'

  " strip ending commas
  execute l:range . 's/,\s*$//e'
  call setpos('.', l:save_cursor)

  execute l:range . 'sort'
  call setpos('.', l:save_cursor)

  execute l:range . '!uniq'
  call setpos('.', l:save_cursor)

  " restore ending commas except on the last selector
  execute l:range . '2norm! A,'
  call setpos('.', l:save_cursor)
endfunction

command! -buffer SortCSSSelectors call <SID>SortCSSSelectors()

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin = b:undo_ftplugin . ' | setlocal tabstop< softtabstop< shiftwidth< wrap< formatprg< sections<'

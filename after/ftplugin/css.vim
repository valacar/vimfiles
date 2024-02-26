" CSS 'after' ftplugin settings

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

command! -buffer SortCSSSelectors call mycommand#SortCSSSelectors()

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin = b:undo_ftplugin . ' | setlocal tabstop< softtabstop< shiftwidth< wrap< formatprg< sections<'

" HTML 'after' ftplugin settings

" command! -buffer Tidy :%!tidy -q -i -w 0 --show-errors 0
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal nowrap
" setlocal completefunc=htmlcomplete#CompleteTags

" Tidy HTML 5 - https://github.com/htacg/tidy-html5
let &l:formatprg = 'tidy -quiet -utf8 -indent -wrap 0 --show-errors 0'

" Type <// (in insert mode) to close last opened tag (using omni complete)
inoremap <// </<C-x><C-o>

" Load current html file in new tab of browser
" Note: this gives the browser window focus
nnoremap <buffer> <silent> <LocalLeader>l
      \ :!start %<CR>

if exists(':ReloadFirefox')
  " Save and reload browser's current tab
  nnoremap <buffer> <silent> <LocalLeader>r
        \ :update<CR>
        \ :ReloadFirefox<CR>
else
  " Save and load in new tab of browser
  nnoremap <buffer> <silent> <LocalLeader>r
        \ :update<CR>
        \ :!start %<CR>
endif

" Build (unused)
nnoremap <buffer> <silent> <LocalLeader>b
      \ :echom "Use " . g:localmapleader . "r to run/reload"<CR>

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin = b:undo_ftplugin . ' | setlocal tabstop< softtabstop< shiftwidth< wrap< formatprg<'

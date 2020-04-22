" markdown 'after' ftplugin settings

setlocal wrap
setlocal linebreak
set showbreak=>

setlocal spell

"TODO: Make AHK script and Vim command to split screen between vim and firefox.
"      Send Win+Left and Win+Right, or just WinMove each window.

" Load current html file in new tab of browser
" Note: this gives the browser window focus
nnoremap <buffer> <silent> <LocalLeader>l
      \ :!start %<CR>

if exists(':ReloadFirefox')
  " Save and reload browser's current tab
  nnoremap <buffer> <silent> <LocalLeader>r
        \ :update<CR>
        \ :ReloadFirefox<CR>

  " TODO: make a global variable and a command to enable/disable browser
  "       reloading after writing
  " augroup markdown_reload
  "   au!
  "   au BufWritePost <buffer> :execute "normal" . g:localmapleader . "r"
  " augroup END
else
  " Save and load in new tab of browser
  nnoremap <buffer> <silent> <LocalLeader>r
        \ :update<CR>
        \ :!start %<CR>
endif

" Build (unused, at least with Markdeep)
nnoremap <buffer> <silent> <LocalLeader>b
      \ :echom "Use " . g:localmapleader . "r to run/reload"<CR>

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin .= ' | setlocal wrap< linebreak< showbreak< spell<'

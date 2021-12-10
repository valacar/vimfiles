setlocal expandtab
setlocal nowrap
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal nowrap

setlocal formatoptions+=j        " when joining comments, remove comment leader
setlocal formatoptions-=c        " don't auto-wrap comments and insert comment leader
setlocal formatoptions-=o        " don't insert comment leader when pressing o or O
setlocal formatoptions-=r        " don't insert comment leader when pressing <Enter>

iabbrev <buffer> cl console.log

if executable('prettier')
  let &l:formatprg = 'prettier --stdin --no-color --print-width 80'
elseif executable('js-beautify')
  let &l:formatprg = 'js-beautify --stdin --indent-size=2 --wrap-line-length 80'
endif

if exists(':ReloadFirefox')
  " Save and reload browser's current tab
  nnoremap <buffer> <silent> <LocalLeader>r
        \ :update<CR>
        \ :ReloadFirefox<CR>
endif

if executable('python3')
  " I mainly use this command to decode javascript bookmarklets.
  " It converts things like %20 to a space character
  " Note: must be used with a visual selection
  command! -buffer -range DecodeURIComponent :<line1>,<line2>!python3 ~/.vim/after/ftplugin/javascript/decodeURIComponent.py
endif

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin .= ' | setlocal expandtab< tabstop< softtabstop< shiftwidth< wrap< formatoptions< formatprg<'

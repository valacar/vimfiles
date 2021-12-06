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

if executable('node')
  "WARN: these apply to the whole file
  "TODO: make these work for selections (at least line based)
  "FIXME: these shouldn't be for javascript files only!
  command! -buffer DecodeURIComponent call execute(':%!node ' . expand('$HOME') . '/vimfiles/after/ftplugin/javascript/decodeURIComponent.js')
  command! -buffer JsonParse call execute(':%!node ' . expand('$HOME') . '/vimfiles/after/ftplugin/javascript/jsonparse.js')
endif

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin .= ' | setlocal expandtab< tabstop< softtabstop< shiftwidth< wrap< formatoptions< formatprg<'

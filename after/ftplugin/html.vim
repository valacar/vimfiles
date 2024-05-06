" HTML 'after' ftplugin settings

" command! -buffer Tidy :%!tidy -q -i -w 0 --show-errors 0
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal nowrap
" setlocal completefunc=htmlcomplete#CompleteTags

" Format with Tidy HTML 5 - https://github.com/htacg/tidy-html5
let &l:formatprg = 'tidy -quiet -utf8 -indent -wrap 0 --show-errors 0'

" Ctrl-/ to insert closing tag.
inoremap <buffer> <C-/> </<C-x><C-o>

" F9: Save and reload browser's current tab without focusing window
if exists(':ReloadFirefox')
  for s:mode in split('niv', '\zs')
    execute s:mode . 'noremap <buffer> <silent> <F9> '
          \ . '<Cmd>update <bar> ReloadFirefox<CR>'
  endfor
endif

" F10: Open current html file in new browser tab (changing window focus)
if has('unix') && executable('xdg-open')
  for s:mode in split('niv', '\zs')
    execute s:mode . 'noremap <buffer> <silent> <F10> '
          \ . '<Cmd>call system("xdg-open " . fnameescape(expand("%")))<CR>'
  endfor
endif

let b:ale_linters = []
let b:ale_fixers = ['tidy', 'trim_whitespace']

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin = b:undo_ftplugin . ' | setlocal tabstop< softtabstop< '
      \ . 'shiftwidth< wrap< formatprg<'

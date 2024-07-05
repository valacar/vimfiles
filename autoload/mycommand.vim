" Various functions called from ~/.vim/plugin/commands/


" Remove trailing whitespace
function! mycommand#FixWhitespace(line1,line2) abort
  let l:save_cursor = getpos('.')
  let charCount = wordcount()['chars']
  execute ':keeppatterns' a:line1 . ',' . a:line2 . 's/\s\+$//e'
  let charDiff = charCount - wordcount()['chars']
  if charCount > 0
    echo printf('%d whitespace character%s removed',
          \ charDiff, charDiff != 1 ? 's' : '')
  endif
  call setpos('.', l:save_cursor)
endfunction


" Redirect a command to a scratch buffer
" updated from https://gist.github.com/romainl/eae0a260ab9c135390c30cd370c20cd7
function! mycommand#Redir(cmd) abort
  for win in range(1, winnr('$'))
    if getwinvar(win, 'scratch')
      execute win . 'windo close'
    endif
  endfor
  if a:cmd =~# '^!'
    execute "let output = system('" . substitute(a:cmd, '^!', '', '') . "')"
  else
    redir => output
    execute a:cmd
    redir END
  endif
  vnew
  let w:scratch = 1
  setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
  call setline(1, split(output, "\n"))
endfunction


" Run :sort and :!uniq on current line up until '{' and fix ending comas
" Note: assumes each selector is on its own line, ending in a comma,
" and { is on its own line too after the list of selectors
function! mycommand#SortCSSSelectors() abort
  let l:save_cursor = getpos('.')
  let l:range = ':.,/{/-'

  " strip ending commas
  execute l:range . 's/,\s*$//e'
  call setpos('.', l:save_cursor)

  " sort
  execute l:range . 'sort'
  call setpos('.', l:save_cursor)

  " uniq
  execute l:range . '!uniq'
  call setpos('.', l:save_cursor)

  " restore ending commas except on the last selector
  execute l:range . '2norm! A,'
  call setpos('.', l:save_cursor)
endfunction


function! mycommand#RebuildSpellFiles() abort
  for f in glob('~/.vim/spell/*.add', 1, 1)
    execute 'mkspell!' f
  endfor
  " re-enable spell option so it uses the updated spell file
  if &spell
    se nospell
    se spell
  endif
endfunction


" Open Vim's changelog using curl (in a scratch buffer)
function! mycommand#VimChangelog() abort
  let l:ver = v:version / 100 . '.' . v:version % 100
  let l:patch = v:versionlong[-4:]
  let l:longver = l:ver . '.' . l:patch
  let l:uri = 'ftp://ftp.vim.org/pub/vim/patches/' . l:ver . '/README;type=A'

  silent new vim-changelog [Scratch]
  setlocal buftype=nofile bufhidden=hide noswapfile cursorline
  echo 'Loading Vim Changelog. Please wait...'
  execute '0read !curl --silent' l:uri

  " Delete header
  silent 2,/Individual/delete

  " Add a blank line every 100 versions
  silent global/\d\+\.\d\+\.[0-9][1-9]00/normal! O

  " Search for the version of Vim we're currently using
  let l:ver_line = search(l:longver, 'n')
  if l:ver_line
    " Highlight the current version
    call matchaddpos('DiffAdd', [l:ver_line])

    " Jump to searched line
    execute l:ver_line
    normal! zt

    " Create mark 'm', so we can jump back
    mark m
  endif

  " Highlight 'size' column as a comment
  syntax match Comment /^\s*\zs\d\+/
  " Highlight table header
  syntax keyword Identifier SIZE NAME FIXES
endfunction

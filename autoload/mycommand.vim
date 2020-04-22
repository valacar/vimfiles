" Various functions called from ~/.vim/plugin/commands/


" Remove trailing whitespace
function! mycommand#FixWhitespace(line1,line2) abort
  let l:save_cursor = getpos('.')
  let charCount = wordcount()['chars']
  execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//e'
  let charDiff = charCount - wordcount()['chars']
  if charCount > 0
    echo printf('%d whitespace character%s removed', 
          \ charDiff, charDiff != 1 ? 's' : '')
  endif
  call setpos('.', l:save_cursor)
endfunction


" Get rid of those ending ^M characters
" TODO: this is dumb; run !dos2unix or use :%s instead
function! mycommand#Dos2Unix() abort
  let _s=@/
  let l = line('.')
  let c = col('.')
  try
    set fileformat=unix
    write!
    " %s/\%x0d$//e
  catch /E32:/
    echom 'Sorry, first save the file.'
  catch /E21:/
    echom 'Read only file'

  endtry
  let @/=_s
  call cursor(l, c)
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


" Set tabstop, softtabstop and shiftwidth to the same value
" Originally from http://vimcasts.org/episodes/tabs-and-spaces/
function! mycommand#Stab() abort
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call mycommand#SummarizeTabs()
endfunction

" View current tab settings
function! mycommand#SummarizeTabs() abort
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction


" Toggle GUI menu
function! mycommand#ToggleMenu() abort
  if &guioptions =~# 'm'
    set guioptions-=m
  else
    set guioptions+=m
  endif
endfunction

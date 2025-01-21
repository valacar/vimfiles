" Commands here are a little too big to put in my vimrc, and not quite long or
" complex enough to be real plugins. Any key mappings should be placed in vimrc.

" Remove trailing whitespace
function! s:FixWhitespace(line1,line2) abort
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

command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)
command! -range=% RemoveTrailingWhiteSpace FixWhitespace


" Redirect a command to a scratch buffer
" updated from https://gist.github.com/romainl/eae0a260ab9c135390c30cd370c20cd7
function! s:Redir(cmd) abort
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

command! -nargs=1 -complete=command Redir silent call <SID>Redir(<f-args>)


function! s:RebuildSpellFiles() abort
  for f in glob('~/.vim/spell/*.add', 1, 1)
    execute 'verbose mkspell!' f
  endfor
  " re-enable spell option so it uses the updated spell file
  if &spell
    se nospell
    se spell
  endif
endfunction

command! RebuildSpellFiles call <SID>RebuildSpellFiles()
command! SpellRebuild RebuildSpellFiles


" Show syntax highlighting groups for what's under the cursor
function! s:SynStack() abort
  let col = col('.')
  let line = line('.')
  let syntaxID = synID(line, col, 0)
  let syntaxID_trans = synID(line, col, 1)
  echo synIDattr(syntaxID_trans, 'name') .
     \ ', translated: ' . synIDattr(syntaxID, 'name') .
     \ ', link: ' . synIDattr(synIDtrans(syntaxID_trans), 'name') .
     \ ', FG: ' . synIDattr(synIDtrans(syntaxID_trans), 'fg#') .
     \ ', BG: ' . synIDattr(synIDtrans(syntaxID_trans), 'bg#')
endfunc

command! SynStack call <SID>SynStack()


" Requires xdotool to be installed.
command! FirefoxReload call system('xdotool search "Mozilla Firefox" key F5')
command! ReloadFirefox FirefoxReload

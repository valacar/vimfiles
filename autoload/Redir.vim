function! redir#Redir(cmd) abort
  redir => output
  execute a:cmd
  redir END
  vnew
  setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
  call setline(1, split(output, "\n"))
endfunction

command! -nargs=1 Redir silent call redir#Redir(<f-args>)


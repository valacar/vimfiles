if exists('g:loaded_redir_command')
  finish
endif

let g:loaded_redir_command = 1

command! -nargs=1 -complete=command Redir silent call mycommand#Redir(<f-args>)

" Usage:
"   :Redir hi ............. show the full output of command ':hi' in a scratch window
"   :Redir !ls -al ........ show the full output of command ':!ls -al' in a scratch window

" See ~/.vim/autoload/mycommand.vim

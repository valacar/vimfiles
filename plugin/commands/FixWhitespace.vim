if exists('g:loaded_fixwhitespace_command')
  finish
endif

let g:loaded_fixwhitespace_command = 1

" Remove trailing white space
command! -range=% FixWhitespace call mycommand#FixWhitespace(<line1>,<line2>)
command! -range=% RemoveTrailingWhiteSpace call mycommand#FixWhitespace(<line1>,<line2>)

" See ~/.vim/autoload/mycommand.vim

vim9script

# See ../autoload/toggle_word.vim for function implementation

# Toggle current word
nnoremap <silent> \t <cmd>call toggle_word#Toggle()<CR>
command ToggleWord call toggle_word#Toggle()

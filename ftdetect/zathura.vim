" ftdetect for Zathura PDF viewer config files

" vint: -ProhibitAutocmdWithNoGroup

autocmd BufRead,BufNewFile ~/.config/zathura/*
      \ set filetype=config

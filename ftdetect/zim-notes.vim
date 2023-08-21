" ftdetect for my Zim notes

" vint: -ProhibitAutocmdWithNoGroup

autocmd BufRead,BufNewFile ~/Documents/Notes/{*/,}*.txt
      \ set filetype=zim

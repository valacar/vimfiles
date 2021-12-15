" ftdetect for 'raw' info files

" vint: -ProhibitAutocmdWithNoGroup

autocmd BufRead,BufNewFile *.info,*.info-1,*.info-2 set filetype=myinfo

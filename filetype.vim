" My filetype file tweaks

if exists('did_load_filetypes')
  finish
endif
augroup filetypedetect
  autocmd BufNewFile,BufRead .Xresources set commentstring=!\ %s
augroup END


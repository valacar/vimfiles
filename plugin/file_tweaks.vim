" Tweak settings for specific files

augroup file_tweaks
  autocmd!

  " auto restart picom compositor after saving
  autocmd BufWritePost picom.conf
        \ :call system('pkill picom;picom --daemon')

  " auto reload .Xresources after saving
  autocmd BufWritePost .Xresources
        \ call system('xrdb -merge ' . expand('<afile>:p')) |
        \ echo 'Running: xrdb -merge' expand('<afile>:p')

  " change .Xresources to use '!' for commenting
  autocmd BufRead,BufNewFile .Xresources
        \ set commentstring=!\ %s

  " Simple syntax highlighting for Xorg logs,
  " and show warnings/errors in quickfix window
  autocmd BufRead Xorg.*.log,Xorg.*.log.old
        \ syntax match ErrorMsg /(EE)/ |
        \ syntax match WarningMsg /(WW)/ |
        \ syntax match Comment /^\[.\{-}\]/ |
        \ vimgrep /(\(EE\|WW\)/ % | cwindow | wincmd p

  " Simple syntax highlighting for xsession-errors
  " and show warnings/errors in quickfix window
  autocmd BufRead .xsession-errors,.xsession-errors.old
        \ syntax match ErrorMsg /\c\(error\|fail\(ed\|ure\|\)\|abort\|fatal\)/ |
        \ syntax match WarningMsg /\c\(warn\(ing\|\)\|not found\|invalid\|incomplete\|unable to\|denied\|timed\? out\)/ |
        \ syntax match Identifier /(.\{-}:\d\+)/

  " Simple syntax highlighting for Zathura pdf reader config
  autocmd BufRead,BufNewFile zathurarc
        \ syntax match Keyword "\v^\s*\zs(set|map|include)" |
        \ syntax keyword Boolean true false

augroup END

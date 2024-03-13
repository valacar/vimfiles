" Tweak settings for specific files

augroup file_tweaks
  autocmd!

  " auto restart picom compositor after saving
  autocmd BufWritePost picom.conf
        \ :call system('pkill picom;picom --daemon')

  " auto reload .Xresources after saving
  autocmd BufWritePost .Xresources
        \ call system('xrdb ' . expand('<afile>:p')) |
        \ echo 'Running: xrdb' expand('<afile>:p')

  " change .Xresources to use '!' for commenting
  autocmd BufRead,BufNewFile .Xresources
        \ set commentstring=!\ %s

  " Simple syntax highlighting for Xorg logs,
  " and show warnings/errors in quickfix window
  autocmd BufRead Xorg.*.log,Xorg.*.log.old
        \ syntax match ErrorMsg /(EE)/ |
        \ syntax match WarningMsg /(WW)/ |
        \ syntax match Comment /^\[.\{-}\]/ |
        \ vimgrep /\v^\[.{-}\] \((WW|EE)\)/ % | cwindow | wincmd p

  " Simple syntax highlighting for xsession-errors
  " and show warnings/errors in quickfix window
  autocmd BufRead .xsession-errors,.xsession-errors.old
        \ syntax match ErrorMsg /\v\c(error|fail(ed|ure|)|abort|fatal|crash)/ |
        \ syntax match WarningMsg /\v\c(warn(ing|)|not found|invalid|incomplete|unable to|denied|timed? out|missing|unknown|(does not|doesn't) exist)/ |
        \ syntax match Identifier /(.\{-}:\d\+)/

  " Simple syntax highlighting for Zathura pdf reader config
  autocmd BufRead,BufNewFile zathurarc
        \ syntax match Keyword "\v^\s*\zs(set|map|include)" |
        \ syntax keyword Boolean true false

  "https://github.com/FreedomBen/awk-hack-the-planet
  "
  "Youtube:
  "    Presentation https://youtu.be/43BNFcOdBlY
  "    Exercises https://youtu.be/4UGLsRYDfo8

  " Creates a local buffer mapping for \r that runs the awk script against the
  " payroll.tsv file.
  autocmd BufRead,BufNewFile */Projects/awk/awk-hack-the-planet/*.awk
        \ nmap <buffer> <LocalLeader>r :update<bar>!clear;awk -f % payroll.tsv<CR>

  " Set the tab stop for the payroll data file.
  autocmd BufRead,BufNewFile */Projects/awk/awk-hack-the-planet/payroll.tsv
        \ setlocal tabstop=19

  " auto restart tmux after saving
  autocmd BufWritePost .tmux.conf
        \ :call system('tmux source-file ~/.tmux.conf')


augroup END

" ftdetect for Team Fortress 2 CFG files

" Note: Requires tf2cfg syntax from http://jerry.devzero.info/up/misc/tf2cfg.vim

" detect CFG files in a directory like Steam/steamapps/common/Team Fortress 2/tf/cfg/
au BufRead,BufNewFile */tf/cfg/*.cfg set filetype=tf2cfg

" my old cfg files
au BufRead,BufNewFile */tf/!cfg/*.cfg set filetype=tf2cfg

"ftdetect for Awk: Hack the Planet
"
" Creates a local buffer mapping for \r that runs the awk script against the
" payroll.tsv file. Also sets the tab stop for the payroll data file.
"
"https://github.com/FreedomBen/awk-hack-the-planet
"
"Youtube:
"    Presentation https://youtu.be/43BNFcOdBlY
"    Exercises https://youtu.be/4UGLsRYDfo8

au BufRead,BufNewFile */Projects/awk/awk-hack-the-planet/*.awk
      \ nmap <buffer> <LocalLeader>r :update<bar>!clear;awk -f % payroll.tsv<CR>

au BufRead,BufNewFile */Projects/awk/awk-hack-the-planet/payroll.tsv
      \ setlocal tabstop=19

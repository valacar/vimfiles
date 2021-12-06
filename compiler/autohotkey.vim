" Vim compiler file
" Compiler: Autohotkey

if exists('current_compiler')
  finish
endif
let current_compiler = 'autohotkey'

if exists(':CompilerSet') != 2  " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" Note: make sure to add Autohotkey.exe's path to the PATH environment variable
CompilerSet makeprg=Autohotkey\ /ErrorStdOut\ %:p:S
CompilerSet errorformat=

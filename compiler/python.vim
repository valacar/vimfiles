" Compiler:	python

if exists('current_compiler')
  finish
endif
let current_compiler = 'python'

if exists(':CompilerSet') != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpoptions

" Don't concat backslash line-continuations
set cpoptions-=C

CompilerSet makeprg=python\ %

" stolen from https://github.com/aliev/vim-compiler-python
CompilerSet errorformat=
      \%E%f:%l:\ could\ not\ compile,
      \%-Z%p^,
      \%A%f:%l:%c:\ %t%n\ %m,
      \%A%f:%l:\ %t%n\ %m,
      \%+GTraceback%.%#,
      \%E\ \ File\ \"%f\"\\,\ line\ %l\\,%m%\\C,
      \%E\ \ File\ \"%f\"\\,\ line\ %l%\\C,
      \%C%p^,
      \%+C\ \ \ \ %.%#,
      \%+C\ \ %.%#,
      \%Z%\\S%\\&%m,
      \%-G%.%#

let &cpoptions = s:cpo_save
unlet s:cpo_save

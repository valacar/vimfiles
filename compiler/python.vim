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
" CompilerSet errorformat=
"       \%E%f:%l:\ could\ not\ compile,
"       \%-Z%p^,
"       \%A%f:%l:%c:\ %t%n\ %m,
"       \%A%f:%l:\ %t%n\ %m,
"       \%+GTraceback%.%#,
"       \%E\ \ File\ \"%f\"\\,\ line\ %l\\,%m%\\C,
"       \%E\ \ File\ \"%f\"\\,\ line\ %l%\\C,
"       \%C%p^,
"       \%+C\ \ \ \ %.%#,
"       \%+C\ \ %.%#,
"       \%Z%\\S%\\&%m,
"       \%-G%.%#


" stolen from https://github.com/idbrii/daveconfig/blob/master/multi/vim/compiler/python.vim

" Use each file and line of Tracebacks (to see and step through the code executing).
CompilerSet errorformat=%A%\\s%#File\ \"%f\"\\,\ line\ %l\\,\ in%.%#
" Include failed toplevel doctest example.
CompilerSet errorformat+=%+CFailed\ example:%.%#
" Ignore big star lines from doctests.
CompilerSet errorformat+=%-G*%\\{70%\\}
" Ignore most of doctest summary. x2
CompilerSet errorformat+=%-G%*\\d\ items\ had\ failures:
CompilerSet errorformat+=%-G%*\\s%*\\d\ of%*\\s%*\\d\ in%.%#

" SyntaxErrors (%p is for the pointer to the error column).
" Source: http://www.vim.org/scripts/script.php?script_id=477
CompilerSet errorformat+=%E\ \ File\ \"%f\"\\\,\ line\ %l
" %p must come before other lines that might match leading whitespace
CompilerSet errorformat+=%-C%p^
CompilerSet errorformat+=%+C\ \ %m
CompilerSet errorformat+=%Z\ \ %m


let &cpoptions = s:cpo_save
unlet s:cpo_save

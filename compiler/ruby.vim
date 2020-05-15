" Compiler:	ruby

if exists('current_compiler')
  finish
endif
let current_compiler = 'ruby'

if exists(':CompilerSet') != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpoptions

CompilerSet makeprg=ruby\ %

" stolen from https://github.com/vim-ruby/vim-ruby
CompilerSet errorformat=
      \%+E%f:%l:\ parse\ error,
      \%W%f:%l:\ warning:\ %m,
      \%E%f:%l:in\ %*[^:]:\ %m,
      \%E%f:%l:\ %m,
      \%-C%\t%\\d%#:%#\ %#from\ %f:%l:in\ %.%#,
      \%-Z%\t%\\d%#:%#\ %#from\ %f:%l,
      \%-Z%p^,
      \%-G%.%#

let &cpoptions = s:cpo_save
unlet s:cpo_save

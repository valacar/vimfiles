" C 'after' ftplugin settings

setlocal nowrap                  " no word wrapping
setlocal textwidth=0             " don't break long lines
setlocal cindent                 " enable C program indenting
setlocal formatoptions+=j        " when joining comments, remove comment leader
setlocal formatoptions-=c        " don't auto-wrap comments and insert comment leader
setlocal formatoptions-=o        " don't insert comment leader when pressing o or O
setlocal formatoptions-=r        " don't insert comment leader when pressing <Enter>
setlocal autowrite               " save before running :make (or switching to another file)
setlocal cinoptions+==0          " don't indent next line after a case label
setlocal commentstring=//\ %s    " C++-style single line comments
setlocal complete-=i             " remove includes from tab completion (very slow sometimes)

setlocal path+=/usr/include/     " append /usr/include/ to path

compiler gcc                     " set errorformat option

" Mapping to run current file as an executable.
nnoremap <buffer> <silent> <LocalLeader>r :!clear;%:p:r<CR>

" Mapping to build with :make and open/close quickfix depending on whether errors are found
nnoremap <buffer> <silent> <LocalLeader>b :update <bar> silent make <bar> redraw! <bar> botright cwindow <CR>

" Mapping to toggle spell checking
nnoremap <buffer> <silent> <LocalLeader>s :setlocal spell!<CR>

" Artistic Style code formatting (edit ~/.astylerc to change options)
if executable('astyle')
  setlocal formatprg=astyle
  " Change tabs and spaces option based on Vim settings.
  if &expandtab
    let &l:formatprg .= ' --indent=spaces=' . &l:tabstop
  else
    let &l:formatprg .= ' --indent=tab=' . &l:tabstop
  endif
endif

" Mapping to create ctags
if executable('ctags')
  nnoremap <buffer> <silent> <LocalLeader>c :!ctags -R .<CR>
endif

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin .= ' | setlocal formatprg< wrap< cindent< textwidth< formatoptions< '
                   \ . 'autowrite< cinoptions< commentstring< complete< path<'

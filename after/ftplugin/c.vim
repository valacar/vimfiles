" C 'after' ftplugin settings

setlocal formatprg=astyle        " Artistic Style (edit ~/.astylerc to change options)
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

compiler gcc                     " set errorformat option

" Astyle: use linux line endings unless win/dos format
" Note: This doesn't work properly with dos files (turns 0D0A into OD0D0A)
" TODO: get rid of this or figure out why the bug is occurring
" if &fileformat == 'dos'
"   setlocal formatprg+=\ --lineend=windows
" else
"   setlocal formatprg+=\ --lineend=linux
" endif

" Astyle: change tabs and spaces option based on Vim settings
if &expandtab
  let &l:formatprg .= ' --indent=spaces=' . &l:tabstop
else
  let &l:formatprg .= ' --indent=tab=' . &l:tabstop
endif

" DISABLED: this needs to be project specific (leaving here for reference though)
" setlocal tags+=~/vimfiles/tags/SDL2

" Run current file as an EXE (assuming it exists)
nnoremap <buffer> <silent> <LocalLeader>r :update<CR>:!start cmd /c "%:p:r:s,$,.exe," & pause<CR>

" Build with :make and open/close quickfix depending on whether errors are found
nnoremap <buffer> <silent> <LocalLeader>b :update<CR>:make<CR>:botright cwindow<CR>

" Build with :make silently and open/close quickfix depending on whether errors are found
" nnoremap <buffer> <silent> <LocalLeader>b :silent make<CR>:redraw!<CR>:cwindow<CR>

" Toggle spell checking
nnoremap <buffer> <silent> <LocalLeader>s :setlocal spell!<CR>

if executable('ctags')
  "TODO: will '.' be what :cd reports?  Maybe use %:p:h but we're using -R, so I dunno.
  nnoremap <buffer> <silent> <LocalLeader>c :!start ctags -R .<CR>:redraw!<CR>
endif

if exists(':SyntasticCheck')
  nnoremap <buffer> <silent> <F11> :SyntasticCheck <bar> lwin<cr>
endif

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin .= ' | setlocal formatprg< wrap< cindent< textwidth< formatoptions< autowrite< cinoptions< commentstring< path< tags<'

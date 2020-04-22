" Default color scheme on very dark gray background because I often use GVim,
" and default is forced (?) to a white background

set background=dark

if exists('syntax_on')
  syntax reset
endif

hi Normal guifg=#f0f0f0 guibg=#1c1c1c gui=NONE ctermfg=LightGray ctermbg=Black
hi ErrorMsg guifg=red guibg=NONE gui=NONE ctermfg=red ctermbg=NONE cterm=NONE term=NONE

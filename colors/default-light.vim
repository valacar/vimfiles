" Default color scheme on very dark gray background because I often use GVim,
" and default is forced (?) to a white background

set background=light

if exists('syntax_on')
  syntax reset
endif

hi Normal guifg=#000000 guibg=#f0f0f0 gui=NONE ctermfg=LightGray ctermbg=Black
hi EndOfBuffer guifg=#000000 guibg=#f0f0f0 gui=NONE ctermfg=LightGray ctermbg=Black

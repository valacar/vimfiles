if has('gui_gtk2') || has('gui_gtk3')
  " set guifont=Gohu\ GohuFont\ 10
  " set guifont=Monospace\ 10
  " set guifont=xos4\ Terminus\ Bold\ 12
  set guifont=TerminusMod\ Medium\ 12
  " se guifont=GohuFont\ Unicode\ 14
elseif has('x11') " Athena
  " Note: use xlsfont and/or xfontsel to find a font
  " Format: -fndry-fmly-wght-slant-sWdth-adstyl-pxlsz-ptSz-resx-resy-spc-avgWdth-rgstry-encdng
  " set guifont=-*-gohufont-medium-r-normal--14-*-*-*-*-*-*
  " set guifont=-*-gohufont-bold-r-normal--14-*-*-*-*-*-*
  " set guifont=-*-terminus-medium-r-normal--14-*-*-*-*-*-*
  " set guifont=-*-courier-medium-r-normal-*-*-100-*-*-m-*-*
elseif has('win32')
  set guifont=Consolas:h13
  " set guifont=Droid_Sans_Mono_Slashed:h13
  " set guifont=Source_Code_Pro_Medium:h12
endif

" :; ,. il1!| O0 S$ ~ ` ' " ^ @ # % & * [] () {} ({}) 
" + - _ = ++ -- == -= += *= \ / // \\ (< >) 0123456789 pgyq ft

if has('unix')
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

nnoremap <S-ScrollWheelDown> zL
nnoremap <S-ScrollWheelUp> zH


set columns=141     " adjust GUI window width
set lines=44        " adjust GUI window height
" winpos 0 0          " top left position of Vim's main window

" Note: guioptions moved to vimrc because of M option (see :help go-M)

set winaltkeys=no   " don't use Alt keys for menu (allows mapping Alt-F, etc)

" Default cursor:
" set guicursor=n-v-c:block-Cursor/lCursor,
" set guicursor+=ve:ver35-Cursor,
" set guicursor+=o:hor50-Cursor,
" set guicursor+=i-ci:ver25-Cursor/lCursor,
" set guicursor+=r-cr:hor20-Cursor/lCursor,
" set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

set guicursor=n-v-sm:block-Cursor-blinkon0,
set guicursor+=ve:ver35-Cursor,
set guicursor+=o:hor50-Cursor,
set guicursor+=i-c-ci:ver25-iCursor-blinkon1000-blinkoff250,
set guicursor+=r-cr:hor20-iCursor
" set guicursor+=a:blinkon0

" IMPORTANT: iCursor (insert mode cursor) highlight group needs to be set
" somewhere.  Currently I put it in my modified colorscheme (wombat-mod), but
" it should probably be put in vimrc using an autocmd that checks when the
" color scheme is loaded...or maybe in the after directory (?).

" highlight iCursor guibg=#ff0000

" Fix white background when fullscreen or resized oddly
" on Windows using wimproved plugin
if exists('g:loaded_wimproved_plugin')
  augroup wimproved
    autocmd!
    autocmd ColorScheme * silent! WFixWindowBG
    autocmd GUIEnter * silent! WFixWindowBG
  augroup END
endif

" TODO: find a way to change these dynamically when the colorscheme changes
" Note: For GTK3 Linux build, create the file
" ~/.config/gtk-3.0/gtk.css with the content:
"
" window#vim-main-window {
"     background-color: #1c1c1c;
" }

" Note: For GTK2 Linux build, create the file
" ~/.gtkrc-2.0 with the content:
" style "vimfix" {
"   bg[NORMAL] = "#1c1c1c" # this matches my gvim theme 'Normal' bg color.
" }
" widget "vim-main-window.*GtkForm" style "vimfix"

" Use DirectWrite on Windows for better font rendering
if has('directx')
  set renderoptions=type:directx
  set renderoptions+=gamma:1.0
  set renderoptions+=contrast:0.5
  set renderoptions+=level:0.3     " Saturation of the blue/orange fringes with ClearType
  set renderoptions+=geom:1        " RGB pixel stripe ordering
  set renderoptions+=renmode:5     " Natural symmetric antialiasing in both vertical and horizontal directions
  set renderoptions+=taamode:1     " ClearType
endif


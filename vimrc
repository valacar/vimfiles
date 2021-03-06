set encoding=utf-8     " set Vim's internal character encoding
scriptencoding utf-8   " vim docs recommend doing this after 'encoding' option

silent! execute pathogen#infect()

" enable true-color in terminals that support it
" TODO: find something more generic than testing all these
if has('termguicolors') &&
      \ ($COLORTERM ==# 'truecolor' || has('vcon') ||
      \ $MSYSCON ==? 'mintty.exe') ||
      \ &term ==# 'st-256color' ||
      \ &term ==# 'xterm-256color'
  set termguicolors
endif

set tabstop=4          " how many columns a tab counts for
set shiftwidth=4       " spaces to use for <<, >>, and auto indenting
set softtabstop=4      " treat spaces like tabs when backspacing
set expandtab          " convert new tabs to spaces

set autoindent         " copy indent from current line when starting a new line
set smartindent        " indent after line ending in '{' (and some other cases)
set breakindent        " word wrap indents to same number of spaces

" characters to show when 'list' options is enabled
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = "tab:\u00bb ,space:\u00b7,trail:\u25cf"
  let &listchars .= ",extends:\u203a,precedes:\u2039,nbsp:+"
  " let &listchars .= ",eol:\u21b5"
  let &fillchars = 'vert:░,stl: ,stlnc: ,fold:-,diff:-'
else
  let &listchars = 'tab:> ,space:.,trail:.'
  let &listchars .= ',extends:>,precedes:<,nbsp:+'
  " let &listchars .= ",eol:$"
  let &fillchars = 'vert:|,stl: ,stlnc: ,fold:-,diff:-'
endif

set fileformats=unix,dos " prefer unix line endings when editing new buffer

" Show current working directory in title
set title
set titlestring=%{v:progname}:\ %{substitute(getcwd(),escape($HOME,'\\'),'~','')}

set shortmess+=I       " disable Vim's intro screen
set shortmess-=S       " show search count, .e.g. [1/5]

set wildmenu           " enhanced command-line completion
set wildmode=full      " default setting for wildmenu
set wildignore=*.o,*.bin,*.so,*.dll,*.exe
set wildignore+=*.jpg,*.png,*.gif,*.bmp,*.tga
set suffixes+=/        " show directories after files in wildmenu

set showcmd            " show (partial) key commands on last line of screen
set incsearch          " incremental searching
" set hlsearch           " highlight when searching (F3 toggles it)

set ignorecase         " ignore case when searching (Note: use \C to match case)
set smartcase          " override 'ignorecase' if upper case character used

set hidden             " allow changing buffer without saving it first
set nofoldenable       " disable folding by default (:help fold-commands)
set scrolloff=4        " vertical scrolling margin (top and bottom)
set sidescrolloff=5    " horizontal scrolling margin
set ruler              " show row,columns in status line
set laststatus=2       " always show status line
set history=200        " more command and search history (default: 50)

if &lines >= 33 || has('gui_running')
  set cmdheight=2      " command line size (>1 reduces 'Press ENTER' prompts)
endif

if ! has('gui_running')
  set ttimeoutlen=100  " lessen delay when pressing escape in terminal
endif

set infercase          " change case when completing a word
set complete=.,i,t,b   " <C-p> and <C-n> keyword completion settings

set completeopt=menu
set completeopt+=menuone
set completeopt+=longest
set completeopt+=preview

set backspace=eol      " allow backspacing over line breaks (join lines)
set backspace+=start   " allow backspacing over the start of line
set backspace+=indent  " allow backspacing over autoindent

set nrformats-=octal   " prevent Ctrl-A and Ctrl-X from detecting octal numbers
set display=lastline   " show @@@ at end of long wrapped lines outside a window

set spelllang=en       " both American and British spellings are acceptable
set spellfile=~/.vim/spell/en.utf-8.add   " file for extra spellings (with zg)
set spellsuggest=10,best  " only show the top 10 spelling suggestions (with z=)

" dictionary: merged http://wordlist.aspell.net/ and enable1
set dictionary=~/.vim/dictionary/mywords.txt

" thesaurus: generated from https://github.com/hunspell/mythes project
set thesaurus=~/.vim/thesaurus/thesaurus.txt

set diffopt+=algorithm:patience " use a nicer (but slower) diff algorithm

set mouse=nvi          " enable mouse in most modes
set guioptions=Mci     " disable GUI, no menus.vim, console dialogs, use icon
set guioptions+=d

" █▓▒░  ░▒▓█
" ▊▋▌▍▎ ▎▍▌▋▊ ▚▚
"    
"    
"    
set statusline=%f%m%r%<
set statusline+=%{&paste?'\ [PASTE]\ ':''}
set statusline+=%=
set statusline+=%{&ft==''?'':&ft.':'}
set statusline+=\%{&fileencoding?&fileencoding:&encoding}:%{&fileformat}
set statusline+=\ %13(%l/%-5L%)

set synmaxcol=256      " limit highlighting to X columns

set nomodeline         " too much of a security risk (use :Modeline if needed)
set nomodelineexpr     " in case modeline is turned on, don't use expressions

set grepprg=grep\ -rnH\ --exclude-dir=.git\ --exclude='*.swp'\ --exclude=tags
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

" set sessionoptions+=localoptions

" set number             " show line numbers (globally)
" set relativenumber     " relative line numbers (ex: 5k to go up 5)

" set cursorline         " highlight current line in each buffer
" set cursorcolumn       " highlight current column
" set colorcolumn=+1     " highlight 'textwidth' column

if has('unix')
  " The following is based on archlinux.vim (which I removed from /usr/share/vim)
  " It makes backup, swap, and undo directories in ~/.cache/vim/
  if exists('$XDG_CACHE_HOME')
    let s:homecache = $XDG_CACHE_HOME
  else
    let s:homecache = $HOME . '/.cache'
  endif
  let &g:directory = s:homecache . '/vim/swap//'
  let &g:backupdir = s:homecache . '/vim/backup//'
  let &g:undodir   = s:homecache . '/vim/undo//'
  if ! isdirectory(expand(&g:directory))
    silent! call mkdir(expand(&g:directory), 'p', 0700)
  endif
  if ! isdirectory(expand(&g:backupdir))
    silent! call mkdir(expand(&g:backupdir), 'p', 0700)
  endif
  if ! isdirectory(expand(&g:undodir))
    silent! call mkdir(expand(&g:undodir), 'p', 0700)
  endif

  " .viminfo: directories to ignore
  let s:ignored_dirs = [
        \ '/tmp/',
        \ expand('$VIMRUNTIME') . '/doc/',
        \ ]
  for s:dir in s:ignored_dirs
    if &viminfo !~# s:dir
      let &viminfo .= ',r' . s:dir
    endif
  endfor

  " move viminfo to ~/.cache/vim/ (note: this option must be at the end)
  let &viminfo .= ',n' . s:homecache . '/vim/.viminfo'
elseif has('win32')
  silent! call mkdir($HOME . '/vimfiles/.swaps', 'p')
  silent! call mkdir($HOME . '/vimfiles/.backups', 'p')
  silent! call mkdir($HOME . '/vimfiles/.undos', 'p')

  " keep .swp files in a subdirectory of vim's files (// = unique filename)
  set directory=$HOME/vimfiles/.swaps//,.

  " create backups (:help backup-table)
  set backupdir=$HOME/vimfiles/.backups,.

  " Where :mkview and :loadview stores/loads its files
  set undodir=$HOME/vimfiles/.undos//

  " Don't keep DVD drive files in the viminfo file
  set viminfo+=rE:
endif

set backup
set writebackup

if !exists('g:syntax_on')
  syntax enable
endif

silent! colorscheme wombat_mod
let g:terminal_ansi_colors = [
      \ '#000000',
      \ '#aa0000',
      \ '#00aa00',
      \ '#aa5500',
      \ '#2424F2',
      \ '#aa00aa',
      \ '#00aaaa',
      \ '#b5b5b5',
      \ '#555555',
      \ '#ff5555',
      \ '#7EF27E',
      \ '#ffff55',
      \ '#7575F0',
      \ '#ff55ff',
      \ '#55ffff',
      \ '#ffffff'
      \ ]

filetype on            " enable file type detection
filetype plugin on     " enable loading plugins for specific file types
filetype indent on     " load indent file for specific file types

let mapleader = ','
let localmapleader = '\'

packadd! matchit       " better matching with % key

"===============================================================================
" :: Commands
"===============================================================================

" Note: other commands are in ~/.vim/plugin/commands
" Redir, FixWhiteSpace, Dos2Unix, and more

" reduce sequence of blank lines into just one
command! ReduceBlankLines let b:tmpView = winsaveview() |
      \ keeppatterns %v/\S/,/\S/-j |
      \ call winrestview(b:tmpView)

" get rid of all blank lines
command! RemoveBlankLines keeppatterns v/\S/d
command! DeleteBlankLines RemoveBlankLines

" Show diff between saved and unsaved changes of current buffer
" Note: switch to scratch buffer and :bw (buffer wipe) to leave diff mode
command! DiffOrig
      \ vertical new | set buftype=nofile | read ++edit # | 0d_ |
      \ diffthis | wincmd p | diffthis

" Enable/Disable diff between currently visible windows
command! DiffOn windo diffthis
command! DiffOff windo diffoff

" Make visible windows scroll together
command! ScrollLock windo set scrollbind!

" Toggle Theme (between a dark and light theme)
command! TT execute &bg == 'dark'
      \ ? 'set bg=light | colo gruvbox'
      \ : 'set bg=dark | colo wombat_mod'

command! FontSelect set guifont=*

command! Hitest source $VIMRUNTIME/syntax/hitest.vim
" TODO: make these toggle, and also track their returned ID number
command! Hitab call matchadd('ErrorMsg', '\t')
command! Hitrailingwhitespace call matchadd('ErrorMsg', '\s\+$')
command! Hiclear call clearmatches()

command! Hi80 execute 'setlocal colorcolumn=' . (&l:cc == '' ? '80' : '')
command! Hi88 execute 'setlocal colorcolumn=' . (&l:cc == '' ? '88' : '')
command! -nargs=1 -complete=highlight Hifilter
      \ execute 'filter /<args>/ highlight'

" print 'runtimepath' one line at a time
command! RTP call map(split(&rtp, ','),
      \ {_,path -> execute('echo'.
      \ string(substitute(tr(path,'\','/'), $HOME, '~', '')), '')})

" Swap single and double quotes within selection, or current line
" WARNING: might use previous selection (gv) when nothing selected
command! -range SwapQuotes
      \ let vis = <range> ? '\%V' : '' |
      \ execute 'keeppat <line1>,<line2>s/' . vis .
      \         '[\''\"]/\=tr(submatch(0), "''\"", "\"''")/g'
" "test quotes" 'test quotes' "test quotes" 'test quotes'

" Swap '/' and '\' within selection, or current line
" WARNING: might use previous selection (gv) when nothing selected
command! -range SwapSlashes
      \ let vis = <range> ? '\%V' : '' |
      \ execute 'keeppat <line1>,<line2>s_' . vis .
      \         '[/\\]_\=tr(submatch(0), "/\\", "\\/")_g'
" /test/slash/test/slash/

command! PasteJavascript :setf javascript | normal "+P
command! PasteCSS :setf css | normal "+P
command! PasteHTML :setf html | normal "+P
command! PasteJSON :setf json | normal "+PgqG``

command! ClearSearchHistory call histdel('/')|nohls
command! ClearCommandHistory call histdel(':')
command! ClearLetterRegisters
      \ for r in range(97,122)|call setreg(nr2char(r),[])|endfor

" Reload file as UTF-16LE
command! ReloadAsUnicode16 edit ++enc=utf-16le
" Reload file as DOS code page 437
command! ReloadAsCodePage437 edit ++enc=cp437

" Save with sudo and re-edit
command! SudoSave :execute 'w !sudo tee % > /dev/null' | :edit!

" Redirect :global results to a scratch buffer. Accepts pattern, otherwise
" uses last search. e.g. :Filter red\|blue
" WARN: Overwrites @t register
command! -nargs=? Filter let @t='' |
      \ execute 'g/<args>/y T' | new | setlocal buftype=nofile | put! t

" align words in table format, using external linux column command
if executable('column')
  command! -range Align
        \ :'<,'>!column -t -o ' '
endif

command! CopyDirectory let @+ = expand('%:p:h')
command! CopyFilename  let @+ = expand('%:p:t')
command! CopyPath      let @+ = expand('%:p')

command! -nargs=+ -bang Grep execute 'silent grep <args>' | redraw! |
      \ if empty('<bang>') | cwindow | endif

command! SynStack call myfunc#SynStack()

" Make background transparent in terminal
" Note: if something goes wrong, reload colorscheme with :Transparent!
if ! has('gui_running')
  command! -bang Transparent
        \ for s:grp in ['Normal', 'NonText', 'LineNr', 'SignColumn'] |
        \ execute 'highlight' s:grp 'ctermbg=NONE guibg=NONE' | endfor |
        \ if !empty('<bang>') | execute 'colorscheme' g:colors_name | endif
endif

" Make a banner around a line, as seen in the section dividers in this vimrc
" Note: must specify a width (minus 7); applies to first line only
command! -nargs=1 -range=0 MakeBanner
      \   s/.*/\=printf(' :: %-<args>s  ',getline('.'))/
      \ | execute 'norm! YPVjr=p'
      \ | -,+s/^/"/
      \ | -,s/\s\+$//

" Manually apply modeline for current buffer, and reload
command! -bang Modeline setlocal modeline | edit<bang> | setlocal modeline<

" TODO: make this toggle, and restore filetype, and buftype
command! HexView
      \ silent! exe '%!xxd -g1' |
      \ setlocal filetype=xxd buftype=nofile cursorline nowrap |
      \ keeppat %s/^/\=(line('.')%17==0?"\n":'')/g | 1

"===============================================================================
" :: Copy/Paste with system clipboard
"===============================================================================

" Alt-v: Paste from system clipboard in normal, insert and command mode
nnoremap <A-v> "+p
nnoremap <A-S-v> "+P
inoremap <A-v> <Esc>"+pa
inoremap <A-S-v> <Esc>"+Pa
cnoremap <A-v> <C-r>+

" Alt-c: Copy using system clipboard (in normal mode and visual)
nnoremap <A-c> "+y
vnoremap <A-c> "+y
nnoremap <A-S-c> "+y$

" copy whole file to system clipboard
nnoremap <A-a> :%y+<CR>

"===============================================================================
" :: Normal Mode Mappings
"===============================================================================

" move up and down one single row even when word wrapping is on
nnoremap j gj
nnoremap k gk

" Alt-j: Move to next paragraph (downward)
nnoremap <A-j> g'}zz

" Alt-k: Move to next paragraph (upward)
nnoremap <A-k> g'{zz

" Y: yank to end of line, similar to how D, and C work
" nnoremap Y y$:echomsg strlen(@0)." character(s) yanked"<CR>
nnoremap Y y$

" Alt-PageUp/Down: Cycle between buffers
nnoremap <silent> <A-PageUp> :bnext<CR>
nnoremap <silent> <A-PageDown> :bprevious<CR>

" Alt-1,2,3: switch to specific tabs
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt

" Alt-t/Alt-T to create/close a tab
nnoremap <A-t> :tabnew<CR>
nnoremap <A-T> :tabclose<CR>

" Alt-F1: Show syntax highlighting groups for word under cursor
nnoremap <A-F1> :SynStack<CR>

" gV: visual select previously inserted/changed/yanked text
nnoremap <expr> gV (&modified) ? '`[v`]zz' : ''

" section jumping with scroll adjustment
nnoremap ]] ]]zt
nnoremap [[ [[zt
nnoremap [] []z!&!<
nnoremap ][ ][zb

" Alt-n and Alt-N to navigate quickfix results
nnoremap <A-n> :cnext<CR>
nnoremap <A-N> :cprevious<CR>

" Backspace: switch to alternate buffer
nnoremap <BS> <C-^>

" Alt-b: view and switch buffers
" Note: afterwards, type <Tab> to cycle (shown in wildmenu),
"       or part of filename, or buffer number to switch
nnoremap <A-b> :ls<CR>:b<Space>
" Alt-Shift-B: view and switch buffers (including hidden)
nnoremap <A-S-b> :ls!<CR>:b<Space>

" Shift-Enter: un-join line (opposite of J)
nnoremap <S-Enter> i<CR><Esc>

" Ctrl-z: open terminal instead of minimizing GVim
if has('gui_running')
  if has('terminal')
    nnoremap <C-z> :vertical term<CR>
  else
    nnoremap <C-z> <nop>
  endif
endif

" Alt-\: vertical split new buffer
nnoremap <silent> <A-\> :vnew<CR>

" move through buffers in :args list
nnoremap ]a :next<CR>
nnoremap [a :previous<CR>
nnoremap ]A :last<CR>
nnoremap [A :first<CR>

" 'smart' home, because I don't like pressing shift-6 (^)
nnoremap <expr> 0 (col('.') == 1) ? '^' : '0'

"===============================================================================
" :: Insert Mode Mappings
"===============================================================================

" Ctrl-u: undo in insert mode
inoremap <C-U> <C-G>u<C-U>

" jj: exit insert mode
inoremap jj <Esc>

" Alt-0: paste register 0
inoremap <A-0> <C-r>0

" Alt-': paste register "
inoremap <A-'> <C-r>"

"===============================================================================
" :: Visual Mode Mappings
"===============================================================================

" > to indent
xnoremap > >gv
" < to unindent
xnoremap < <gv

" Alt-j: Move to next paragraph (downward) in visual mode
xnoremap <A-j> g`}

" Alt-k: Move to next paragraph (upward) in visual mode
xnoremap <A-k> g`{

function! s:setSearch()
  let l:v = visualmode()
  let l:old_t = @t
  silent exe 'normal! `<' . l:v . '`>"ty'
  let @/ = substitute(escape(@t, '\/.*$^~[]'), "\n", '\\n', 'g')
  let @t = l:old_t
endfunction

" Search visual selected text forward (*) and backward (#)
vnoremap <silent> * :call <SID>setSearch()<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :call <SID>setSearch()<CR>?<C-R>=@/<CR><CR>

" p: Keep unnamed register (") when pasting in visual mode
xnoremap p pgvy
xnoremap P Pgvy

" L, H: Indent/Unindent with a space in visual block (Ctrl-v) mode
vnoremap L I<Space><Esc>gv
vnoremap H xgv

" @: Run macro on selected lines only
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo '@'.getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

"===============================================================================
" :: Operator Pending Mappings
"===============================================================================

" shorten ci"  to just cq (for double quotes) and cQ (single quotes)
" dq, dQ, yq, yQ also work
onoremap q i"
onoremap Q i'

" text object for numbers (ints and floats)
" cn, dn, yn, vn
function! VisualNumber()
	let start = search('\d\([^0-9\.]\|$\)', 'cW', line('.'))
  if !start | return | endif
	normal! v
	call search('\(^\|[^0-9\.]\d\)', 'becW', line('.'))
endfunction
xnoremap n :<C-u>call VisualNumber()<CR>
onoremap n :<C-u>normal vn<CR>

"===============================================================================
" :: Leader Key Mappings
"===============================================================================

" Change working directory to the directory of the current buffer
" Note: 'autochdir' option can do this automatically if necessary
" Note: cd is global, lcd is window-based, tcd is tab-based
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>lcd :lcd %:p:h<CR>:pwd<CR>
nnoremap <Leader>tcd :tcd %:p:h<CR>:pwd<CR>

" add blank line above and below current line
nnoremap <Leader><Space><Space> m`o<Esc>kO<Esc>``
nnoremap <Leader>s :browse oldfiles<cr>

"===============================================================================
" :: Function Key Mappings
"===============================================================================

" F1: (disabled)
nnoremap <F1> <nop>
inoremap <F1> <nop>

" F2: toggle paste mode
set pastetoggle=<F2>

" F3: toggle search highlighting
nnoremap <silent> <F3> :set hlsearch!<CR>

" F4: toggle word wrap, and show setting
nnoremap <silent> <F4> :set wrap! wrap?<CR>

" F5: toggle list (show white-space)
nnoremap <silent> <F5> :set list! list?<CR>

" F8, Shift-F8: jump to next/previous error
if &runtimepath =~# 'ale'
  nmap <silent> <F8> <Plug>(ale_next_wrap)
  nmap <silent> <S-F8> <Plug>(ale_previous_wrap)
endif

" F12: toggle tag bar
if &runtimepath =~# 'tagbar'
  nnoremap <silent> <F12> :TagbarToggle<CR>
endif

"===============================================================================
" :: Abbreviations
"===============================================================================

" Note: inoreabbrev <incorrect> <correct>
" TODO: install vim-abolish, and move to another file?
inoreabbrev seperate separate
inoreabbrev seperated separated
inoreabbrev seperating separating
inoreabbrev definate definite
inoreabbrev definately definitely
inoreabbrev recieve receive
inoreabbrev recieved received
inoreabbrev truely truly
inoreabbrev wierd weird
inoreabbrev neccessary necessary
inoreabbrev neccesary necessary
inoreabbrev neccesarily necessarily
inoreabbrev calender calendar
inoreabbrev appearence appearance
inoreabbrev embarass embarrass
inoreabbrev embarassed embarrassed
inoreabbrev dissapear disappear
inoreabbrev dissapeared disappeared
inoreabbrev accidently accidentally
inoreabbrev refered referred
inoreabbrev mispell misspell
inoreabbrev boundry boundary
inoreabbrev opposit opposite
inoreabbrev hexidecimal hexadecimal
inoreabbrev occuring occurring

" sometimes I type :man when I mean :help
cnoreabbrev man <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'help' : 'man')<CR>

"===============================================================================
" :: Plugin settings
"===============================================================================

" nnoremap <Leader>e :Lexplore<CR>
" nnoremap <Leader>E :exe 'Lexplore' expand('%:p:h')<CR>
" more settings -> :h netrw-browser-options
let g:netrw_winsize=50
let g:netrw_liststyle=3
let g:netrw_banner=0

if &runtimepath =~# 'vim-startify'
  nnoremap <Leader>s :Startify<cr>

  let g:startify_disable_at_vimenter = 1
  let g:startify_custom_header = []
  let g:startify_bookmarks = [
        \ {22: '~/.vim/'},
        \ {33: '~/.vim/after/ftplugin'},
        \ {44: '~/.vim/vimrc'},
        \ {45: '~/.vim/gvimrc'},
        \ {55: '~/.vim/colors/wombat_mod.vim'},
        \ {56: '~/.vim/vim-rnb/wombat_mod.erb'},
        \ {66: '~/.vim/plugin'},
        \ ]
  if $SHELL =~# 'bash$'
    call extend(g:startify_bookmarks, [
          \ {77: '~/.bashrc'},
          \ {88: '~/.profile'},
          \ ])
  endif
  let g:startify_session_autoload = 1
  let g:startify_skiplist = [
        \ '\\vim\\doc\\.*\.txt$',
        \ '^/usr/share/vim/',
        \ '^/usr/local/share/vim/',
        \ '/bundle/.*/doc/',
        \ '^/run/media/',
        \ '\\bundle\\.*\\doc\\.*\.txt$',
        \ 'COMMIT_EDITMSG',
        \ 'MERGE_MSG',
        \ 'vimrc$',
        \ ]
  " let g:startify_update_oldfiles = 1
  let g:startify_session_sort = 1
  let g:startify_files_number = 10
  let g:startify_padding_left = 3
  let g:startify_mapping_nowait = 0
endif

if &runtimepath =~# 'vim-mucomplete'
  let g:mucomplete#chains = {}
  let g:mucomplete#chains.default = ['c-n']
  let g:mucomplete#chains.autohotkey = ['user', 'c-n']
  let g:mucomplete#chains.c = ['c-n']
  let g:mucomplete#chains.html = ['omni', 'c-n']
  let g:mucomplete#chains.css = ['omni', 'c-n']
  let g:mucomplete#chains.javascript = ['omni', 'c-n']
  let g:mucomplete#chains.vimwiki = ['omni', 'c-n']
endif

" Disable some built-in plugins
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_tar = 1
let g:loaded_vimballPlugin= 1
let g:loaded_vimball = 1
let g:loaded_zipPlugin= 1

" sh syntax: too many "errors" when using $() instead of backticks
let g:sh_no_error = 1

" vim syntax: don't highlight "errors"
let g:vimsyntax_noerror = 0

if &runtimepath =~# 'tagbar'
  let g:tagbar_zoomwidth = 0
  let g:tagbar_compact = 1
  if &encoding ==# 'utf-8'
    let g:tagbar_iconchars = ["\u25b6", "\u25bc"]
  endif
endif

if &runtimepath =~# '/ale'
  let g:ale_lint_on_text_changed = 'normal'
  let g:ale_lint_on_insert_leave = 1
  let g:ale_lint_delay = 1500
  let g:ale_linters = {
        \'javascript': ['my-eslint'],
        \'html': ['tidy', 'htmlhint'],
        \}
  let g:ale_fixers = {
        \'javascript': ['eslint']
        \}
  let g:ale_type_map = {
        \'flake8': {'ES': 'WS'},
        \}
endif

"===============================================================================
" :: Auto commands
"===============================================================================

augroup vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC,$MYGVIMRC,~/.vim/vimrc,~/.vim/gvimrc
        \ call myfunc#ReloadConfig('<afile>')

" reload color scheme after writing
  autocmd BufWritePost */.vim/colors/*.vim :exe 'colo' expand("<afile>:t:r")

" change insert mode cursor color (Note: must add iCursor to 'guicursor')
  highlight iCursor guibg=#ff0000
  autocmd ColorScheme * highlight iCursor guibg=#ff0000

" Up/Down: jump between different sections of this vimrc
  autocmd BufReadPost $MYVIMRC,~/.vim/vimrc
        \ nnoremap <silent> <buffer> <Down> :let @/ = '^" :: '<cr>nzt|
        \ nnoremap <silent> <buffer> <Up> :let @/ = '^" :: '<cr>Nzt

" enable spell-check when doing a git commit
  autocmd BufReadPost COMMIT_EDITMSG,MERGE_MSG setlocal spell

" Remove quickfix lines ending in ^M
" TODO: is this problem related to 'makeencoding' when encoding=utf-8 in Win32?
" TODO: maybe test if w:quickfix_title == 'make' since I've only
"       seen it occur with 'make' so far
"   autocmd BufReadPost quickfix setlocal modifiable
"                            \ | silent! exe 'g/^/s/\%x0d$//g'
"                            \ | setlocal nomodifiable
augroup END

"===============================================================================
" :: Terminal tweaks
"===============================================================================

if &term ==# 'xterm-256color'
      \ || &term ==# 'rxvt-unicode-256color'
      \ || &term ==# 'st-256color'
  " 2 = block cursor
  " 4 = underline cursor, 3 = underline blinking
  " 6 = vertical bar, 5 = vertical bar blinking
  " SI = start insert, EI = end insert, SR = start replace
  let &t_SI = "\e[5 q"
  let &t_EI = "\e[2 q"
  let &t_SR = "\e[3 q"
  " start and end termcap mode
  let &t_ti .= "\e[2 q"
  let &t_te .= "\e[0 q"
endif

if &term ==# 'linux'
  " TODO: find out why these don't work
  " ?2c = underline, ?3c = quarter block, ?6c = full block
  let &t_SI = "\e[?2c"
  let &t_EI = "\e[?6c"
  let &t_SR = "\e[?3c"
endif

if &term ==# 'st-256color'
  " enable true color support
  let &t_8f = "\e[38;2;%lu;%lu;%lum"
  let &t_8b = "\e[48;2;%lu;%lu;%lum"
endif

" Mode dependent cursor for mintty
" https://github.com/mintty/mintty/wiki/Tips#mode-dependent-cursor-in-vim
if $MSYSCON==?'mintty.exe'
  let &t_SI = "\e[5 q"
  let &t_EI = "\e[1 q"
  let &t_ti .= "\e[1 q"
  let &t_te .= "\e[0 q"
endif

"===============================================================================
" :: Temporary/Experimental junk
"===============================================================================

" add Alt-key support in linux terminals
if has('linux') && !has('gui_running')
  for s:letter in split('jkbcva\123tTnNq', '\zs')
    execute "map <nowait> \e" . s:letter . ' <A-' . s:letter . '>'
  endfor
endif

" --: comment line with vim-commentary
" Note: nnoremap and vnoremap don't work in this case
if &runtimepath =~# 'vim-commentary'
  nmap -- gcc
  vmap -- gc
endif

" " Note: these can actually match Alt keys too, i.e. <Esc>w is Alt-w
" nnoremap <Esc>ww <C-w><C-w>
" " The following maps <C-w>x to <Esc>wx (where x is letter in the split())
" for s:escKey in split('hjklHJKLnsvcor', '\zs')
"   execute 'nnoremap <Esc>w' . s:escKey ' <C-w>' . s:escKey
" endfor

" let g:airline_powerline_fonts = 1
" let g:airline#extensions#wordcount#enabled = 0


" Alt-8: change word under cursor; '.' to repeat, n or N to skip
nnoremap <A-8> *g``cgn
" same as above, but without word boundaries
nnoremap g<A-8> g*g``cgn

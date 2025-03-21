set encoding=utf-8     " set Vim's internal character encoding
scriptencoding utf-8   " vim docs recommend doing this after 'encoding' option

set tabstop=4          " how many columns a tab counts for
set shiftwidth=4       " spaces to use for <<, >>, and auto indenting
set softtabstop=4      " treat spaces like tabs when backspacing
set expandtab          " convert new tabs to spaces

set autoindent         " copy indent from current line when starting a new line
set smartindent        " indent after line ending in '{' (and some other cases)
set breakindent        " word wrap indents to same number of spaces
set linebreak          " don't chop words in half when wrapping is on
set nojoinspaces       " use only one space after joining sentences.

set shortmess+=I       " disable Vim's intro screen
set shortmess-=S       " show search count, .e.g. [1/5]

set wildmenu           " enhanced command-line completion
set wildmode=longest,full " command-line completion setting
set wildignore=*.o,*.bin,*.so,*.dll,*.exe
set wildignore+=*.jpg,*.JPG,*.png,*.gif,*.bmp,*.tga
set suffixes+=/        " show directories after files in wildmenu

set incsearch          " incremental searching
set nohlsearch         " disable highlighting when searching (F3 toggles it)

set ignorecase         " ignore case when searching (Note: use \C to match case)
set smartcase          " override 'ignorecase' if upper case character used

set hidden             " allow changing buffer without saving it first
set nofoldenable       " disable folding by default (:help fold-commands)
set scrolloff=4        " vertical scrolling margin (top and bottom)
set sidescrolloff=5    " horizontal scrolling margin
set ruler              " show row,columns in status line
set showcmd            " show (partial) key commands on last line of screen
set laststatus=2       " always show status line
set history=1000       " more command-line and search history (default: 50)

set splitbelow         " create new window below when splitting

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
set diffopt+=context:99999      " don't use folding in diff mode

set mouse=nvi          " enable mouse in most modes
set guioptions=Mci     " disable GUI, no menus.vim, console dialogs, use icon
set guioptions+=d      " use dark GTK theme if available.
set guioptions+=a      " copy visual selection to * register
set guioptions+=!      " don't use dumb terminal with :shell in GVim

set synmaxcol=500      " limit highlighting to X columns

set nomodeline         " too much of a security risk (use :Modeline if needed)
set nomodelineexpr     " in case modeline is turned on, don't use expressions

set virtualedit=block  " move cursor freely in visual block mode

" set number             " show line numbers
" set relativenumber     " relative line numbers (e.g. 5k to go up 5 lines)

" set cursorline         " highlight current line in each buffer
" set cursorcolumn       " highlight current column
" set colorcolumn=+1     " highlight 'textwidth' column

" Show current working directory in title
set title
let &titlestring =
      \ '%{v:progname}: %{substitute(g:cwd, escape($HOME, "\\"), "~", "")}'

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

let &grepprg = "grep -rnH --exclude-dir=.git --exclude='*.swp' --exclude=tags"
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m
if executable('rg')
  let &grepprg = 'rg --vimgrep'
  set grepformat=%f:%l:%c:%m
endif

if &lines > 37 || has('gui_running')
  set cmdheight=2      " command line size (>1 reduces 'Press ENTER' prompts)
endif

if ! has('gui_running')
  set timeout           " allow timing out halfway into a mapping
  set timeoutlen=1000   " timeout on mapping after X milliseconds
  set ttimeout          " allow timing out halfway into a key code
  set ttimeoutlen=100   " timeout on key codes after X milliseconds
endif

" Delete old backup, and backup current file
set backup
set writebackup

set path=.,,            " just search current dir and relative to current file

" characters to show when 'list' options is enabled
let &listchars = "tab:\u00bb ,space:\u00b7,trail:\u25cf"
let &listchars .= ",extends:\u203a,precedes:\u2039,nbsp:+"
" let &listchars .= ",eol:\u21b5"
let &fillchars = "vert:\u2591"
let &showbreak = "\u21aa "

if $TERM ==# 'linux' || $TERM ==# 'screen.linux'
  let &listchars = 'tab:> ,space:.,trail:.,extends:>,precedes:<,nbsp:+'
  let &showbreak = '> '
endif

" enable true-color in terminals that support it
if has('termguicolors') &&
      \ ($COLORTERM ==# 'truecolor'
      \ || &term ==# 'xterm-256color')
  set termguicolors
endif

" Move swap, backup, and undo directories to ~/.cache/vim/
if exists('$XDG_CACHE_HOME')
  let s:homecache = $XDG_CACHE_HOME
else
  let s:homecache = $HOME . '/.cache'
endif
let &g:directory = s:homecache . '/vim/swap//'
let &g:backupdir = s:homecache . '/vim/backup//'
let &g:undodir   = s:homecache . '/vim/undo//'
silent! call mkdir(expand(&g:directory), 'p', 0700)
silent! call mkdir(expand(&g:backupdir), 'p', 0700)
silent! call mkdir(expand(&g:undodir), 'p', 0700)

" viminfo: directories to ignore
let s:ignored_dirs = [
      \ '/tmp/',
      \ '/data/disk2/',
      \ expand('$VIMRUNTIME') . '/doc/',
      \ ]
for s:dir in s:ignored_dirs
  if &viminfo !~# s:dir
    let &viminfo .= ',r' . s:dir
  endif
endfor

" move viminfo to ~/.cache/vim/ (note: this option must be at the end)
exec 'set viminfo+=' . 'n' . s:homecache . '/vim/viminfo'

if ! exists('g:syntax_on')
  syntax enable
endif

silent! colorscheme wombat_mod
let g:terminal_ansi_colors = [
      \ '#000000',
      \ '#aa0000',
      \ '#00aa00',
      \ '#aa5500',
      \ '#5c5cff',
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

let mapleader = "\<Space>"
let localmapleader = '\'

packadd! matchit       " better matching with % key
packadd! comment       " toggle comments (:h comment.txt)

" Load man pages in Vim when pressing K
" Note: pressing a number before K loads that man section, e.g. 3K
runtime ftplugin/man.vim
let &keywordprg = ':Man'

"===============================================================================
" :: Commands
"===============================================================================

" Note: Slightly more complex commands are in ~/.vim/plugin/commands.vim

" reduce sequence of blank lines into just one
command! -range=% ReduceBlankLines
      \ mark ` |
      \ keeppatterns <line1>,<line2>v/\S/,/\S/-join |
      \ normal! ``

" get rid of blank lines
command! -range=% DeleteBlankLines
      \ mark ` |
      \ keeppatterns <line1>,<line2>v/\S/delete |
      \ normal! ``

" Show diff between saved and unsaved changes of current buffer
" Note: switch to scratch buffer and :bw (buffer wipe) to leave diff mode
command! DiffOrig
      \ vertical new | set buftype=nofile | read ++edit # | 0d_ |
      \ diffthis | wincmd p | diffthis

" Toggle diff between currently visible windows
command! Diff
      \ execute 'windo diff' . (&diff ? 'off' : 'this')

" Make visible windows scroll together
command! ScrollLock
      \ windo set scrollbind!

" Toggle Theme (between a dark and light theme)
command! TT execute &bg == 'dark'
      \ ? 'set bg=light | colo iceberg'
      \ : 'set bg=dark | colo wombat_mod'

command! FontSelect
      \ set guifont=*

command! Hitab execute !exists('b:hiTab')
      \ ? 'let b:hiTab = matchadd("Error", "\\t") | set list'
      \ : 'call matchdelete(b:hiTab) | unlet b:hiTab| set nolist'

command! Hitrailingwhitespace execute !exists('b:hiTrail')
      \ ? 'let b:hiTrail = matchadd("Error", "\\s\\+$") | set list'
      \ : 'call matchdelete(b:hiTrail) | unlet b:hiTrail| set nolist'

command! Hitest
      \ runtime syntax/hitest.vim

command! -nargs=1 -bang Hicol
      \ execute <bang>0 ? 'windo' : '' 'setlocal colorcolumn=' .
      \ (&cc != <q-args> || &cc == '' ? <q-args> : '')
command! -bang Hi80 Hicol<bang>80
command! -bang Hi88 Hicol<bang>88

" Resize Vim to fit two windows side-by-side, and equalize windows horizontally
command! -nargs=? -bang DoubleWide
      \ exec 'set columns=' . ((<q-args> ?? (&l:textwidth ?? 80)) * 2 + 1) |
      \ horizontal wincmd =

command! -nargs=1 -complete=highlight Hifilter
      \ execute 'filter /<args>/ highlight'

" print 'runtimepath' one line at a time
command! RTP
      \ call map(split(&rtp, ','),
      \ {_,path -> execute('echo'.
      \ string(substitute(tr(path,'\','/'), $HOME, '~', '')), '')})

" Swap single and double quotes within selection, or current line
command! -range SwapQuotes
      \ let vis = <range> ? '\%V' : '' |
      \ execute 'keeppat <line1>,<line2>s/' . vis .
      \         '[\''\"]/\=tr(submatch(0), "''\"", "\"''")/ge'
" "test quotes" 'test quotes' "test quotes" 'test quotes'

" Swap '/' and '\' within selection, or current line
command! -range SwapSlashes
      \ let vis = <range> ? '\%V' : '' |
      \ execute 'keeppat <line1>,<line2>s_' . vis .
      \         '[/\\]_\=tr(submatch(0), "/\\", "\\/")_ge'
" /test/slash/test/slash/

" Convert unicode quotes to ASCII quotes within selection or current line
command! -range FixQuotes
      \ let vis = <range> ? '\%V' : '' |
      \ execute 'keeppat <line1>,<line2>s/' . vis . "[\u2018\u2019]/'/ge" |
      \ execute 'keeppat <line1>,<line2>s/' . vis . "[\u201C\u201D]/\"/ge"

command! PasteJavascript setfiletype javascript | normal! "+P
command! PasteCSS setfiletype css | normal! "+P
command! PasteHTML setfiletype html | normal! "+P
command! PasteJSON setfiletype json | normal! "+PgqG``
command! PastePython setfiletype python | normal! "+P
command! PasteBookmarklet
      \ setfiletype javascript |
      \ normal! "+P`[v`]:DecodeURIComponent<CR>gvgq

command! ClearSearchHistory call histdel('/') | nohlsearch
command! ClearCommandHistory call histdel(':')
command! ClearLetterRegisters
      \ for r in range(97,122) | call setreg(nr2char(r),[]) | endfor

" Reload file as DOS code page 437
command! ReloadAsCodePage437 edit ++enc=cp437

" Save with sudo and re-edit
command! SudoSave
      \ execute 'write !sudo tee % > /dev/null' | edit!

" align words in table format, using external column command
if executable('column')
  command! -range Align
        \ :'<,'>!column -t -L -o ' '
endif

command! CopyDirectory let @+ = expand('%:p:h')
command! CopyFilename  let @+ = expand('%:p:t')
command! CopyPath      let @+ = expand('%:p')

" Make a banner around a line, as seen in the section dividers in this vimrc
command! MakeBanner
      \ normal! I" :: <Esc>O<Esc>79I=<Esc>I"<Esc>Yjp

" Enable and apply modeline to current buffer
command! Modeline
      \ setlocal modeline modelineexpr | doautocmd BufEnter %

" After installing a plugin, this will add it to Vim's :help command
command! UpdateHelp
      \ 11verbose helptags ALL

command! CamelToSnake
      \ exec "normal! ciw" . substitute(expand('<cword>'), '\u', '_\l&', "g")

" Break line(s) into multiple lines of X maximum characters
command! -nargs=1 -range HardBreak
      \ exec 'keeppat <line1>,<line2>s/.\{' .. <args> .. '}/&\r/g'

command! FZFVim
      \ call fzf#run(fzf#wrap(
      \   {'source': 'fd --type f --no-ignore-vcs . ~/.vim/'}))

" Edit a register in the command-line window
command! -nargs=1 RegEdit
      \ call feedkeys($":let @{<q-args>} = \"\<C-r>{<q-args>}\"\<C-f>\<Left>")

"===============================================================================
" :: Copy/Paste with system clipboard
"===============================================================================

" Alt-v: Paste from system clipboard in normal, insert and command mode
nnoremap <A-v> "+p
inoremap <A-v> <Esc>"+pa
nnoremap <A-V> "+P
inoremap <A-V> <Esc>"+Pa
cnoremap <A-v> <C-r>+

" Alt-c: Copy using system clipboard (in normal mode and visual)
nnoremap <A-c> "+y
xnoremap <A-c> "+y
nnoremap <A-C> "+y$

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

" Alt-1,2,3: switch to specific tabs
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt

" Alt-t/Alt-T to create/close a tab
nnoremap <A-t> :tabnew<CR>
nnoremap <A-T> :tabclose<CR>

" Alt-F1: Show syntax highlighting groups for word under cursor
nnoremap <A-F1> :SynStack<CR>

" Alt-n and Alt-N to navigate quickfix results
nnoremap <A-n> :cnext<CR>
nnoremap <A-N> :cprevious<CR>

" Backspace: switch to alternate buffer
nnoremap <BS> <C-^>

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

" --: toggle comment
nmap -- gcc
xmap -- gc

" Ctrl-BackButton: pop tag stack
nnoremap <C-X1Mouse> <C-t>

" LocalLeader t: toggle word (e.g. true -> false)
nnoremap <LocalLeader>t <Cmd>ToggleWord<CR>

"===============================================================================
" :: Insert Mode Mappings
"===============================================================================

" jj: exit insert mode
inoremap jj <Esc>

" Ctrl-x Ctrl-f: complete paths with FZF
inoremap <C-x><C-f> <plug>(fzf-complete-path)

"===============================================================================
" :: Visual Mode Mappings
"===============================================================================

" Space / Shift-Space: indent/unindent with a space in visual block mode
xnoremap <expr> <Space>   (mode() == "\<C-V>") ? 'I<Space><Esc>gv' : ''
xnoremap <expr> <S-Space> (mode() == "\<C-V>") ? '"_xgv' : ''

" Alt-j: Move to next paragraph (downward) in visual mode
xnoremap <A-j> g`}

" Alt-k: Move to next paragraph (upward) in visual mode
xnoremap <A-k> g`{

function! s:setSearch()
  let l:v = visualmode()
  let l:old_t = @t
  silent execute 'normal! `<' . l:v . '`>"ty'
  let @/ = substitute(escape(@t, '\/.*$^~[]'), "\n", '\\n', 'g')
  let @t = l:old_t
endfunction

" Search visual selected text forward (*) and backward (#)
xnoremap <silent> * :call <SID>setSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap <silent> # :call <SID>setSearch()<CR>?<C-R>=@/<CR><CR>

" p: Keep unnamed register (") when pasting in visual mode
" xnoremap p pgvy
" xnoremap P Pgvy

" @: Run macro on selected lines only
xnoremap @ :<C-u>echo '@' . getcmdline()
      \ <bar> execute ":'<,'>normal! @" . nr2char(getchar())<CR>

" Alt-r: copy selected lines with indenting for preformatted text on Reddit
xnoremap <A-r> <Plug>(RedditCopy)

"===============================================================================
" :: Operator Pending Mappings
"===============================================================================

" return i" or i' depending on which quote is closest to cursor
function! s:InnerQuote()
    let line = getline('.')
    let cursor_pos = col('.') - 1
    let max_distance = len(line)
    for distance in range(0, max_distance)
        let left_index = cursor_pos - distance
        if left_index >= 0
        \ && (line[left_index] == "'" || line[left_index] == '"')
            return 'i' .. line[left_index]
        endif
        let right_index = cursor_pos + distance
        if right_index < len(line)
        \ && (line[right_index] == "'" || line[right_index] == '"')
            return 'i' .. line[right_index]
        endif
    endfor
    return "iX" " invalid text object to do nothing
endfunction

" shorten ci" and ci' to just cq (depending on which quote is closest)
" dq, yq, also work
onoremap <expr> q <SID>InnerQuote()

" text object for numbers (ints and floats)
" cn, dn, yn, vn, vin
function! s:VisualNumber()
	if search('\d\%([^0-9\.]\|$\)', 'c', line('.'))
    normal! v
    call search('\%([^0-9\.]\d\)', 'bec', line('.'))
  endif
endfunction
xnoremap in :<C-u>call <SID>VisualNumber()<CR>
xnoremap n :<C-u>normal vin<CR>
onoremap n :<C-u>normal vin<CR>

"===============================================================================
" :: Leader Key Mappings
"===============================================================================

" Change working directory to the directory of the current buffer
" Note: 'autochdir' option can do this automatically if necessary
" Note: cd is global, lcd is window-based, tcd is tab-based
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>lcd :lcd %:p:h<CR>:pwd<CR>
nnoremap <Leader>tcd :tcd %:p:h<CR>:pwd<CR>

nnoremap <Leader>s :browse oldfiles<cr>

" FZF mappings
nnoremap <Leader>f <Cmd>Files<CR>
nnoremap <leader>b <Cmd>Buffers<CR>
nnoremap <leader>t <Cmd>Tags<CR>
nnoremap <leader>v <Cmd>FZFVim<CR>
nnoremap <leader>V <Cmd>FZF $VIMRUNTIME<CR>

"===============================================================================
" :: Function Key Mappings 0-9
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
nmap <silent> <F8> <Plug>(ale_next_wrap)
nmap <silent> <S-F8> <Plug>(ale_previous_wrap)

" F12: toggle tag bar
nnoremap <silent> <F12> :TagbarToggle<CR>

"===============================================================================
" :: Plugin settings
"===============================================================================

" --- vim-startify ---
nnoremap <Leader>s :Startify<cr>
let g:startify_session_sort = 1
let g:startify_files_number = 10
let g:startify_padding_left = 3
let g:startify_mapping_nowait = 0
let g:startify_disable_at_vimenter = 1
let g:startify_custom_header = []
let g:startify_enable_special = 0
let g:startify_bookmarks = [
      \ {44: '~/.vim/vimrc'},
      \ {45: '~/.vim/gvimrc'},
      \ ]
if $SHELL =~# 'bash$'
  call extend(g:startify_bookmarks, [
        \ {55: '~/.bashrc'}
        \ ])
endif

let g:startify_commands = [
    \ {66: ['FZF ~/.vim/', 'FZFVim']},
    \ {67: ['FZF Vim Runtime', 'FZF $VIMRUNTIME']},
    \ {77: ['Vim Functions', 'help function-list']},
    \ {78: ['Ex Commands', 'help ex-cmd-index']},
    \ ]

let g:startify_session_autoload = 1
let g:startify_skiplist = [
      \ '^/usr/share/vim/',
      \ '^/usr/local/share/vim/',
      \ '^/run/media/',
      \ '^/tmp/',
      \ '/.vim/pack/',
      \ 'COMMIT_EDITMSG',
      \ 'MERGE_MSG',
      \ 'vimrc$',
      \ ]

" --- vim-mucomplete ---
let g:mucomplete#chains = {}
let g:mucomplete#chains.default = ['c-n']
let g:mucomplete#chains.c = ['c-n']
let g:mucomplete#chains.html = ['omni', 'c-n']
let g:mucomplete#chains.css = ['omni', 'c-n']
let g:mucomplete#chains.javascript = ['omni', 'c-n']

" --- tagbar ---
let g:tagbar_zoomwidth = 0
let g:tagbar_compact = 1
if &encoding ==# 'utf-8'
  let g:tagbar_iconchars = ["\u25b6", "\u25bc"]
endif

" --- ale ---
let g:ale_virtualtext_cursor = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 2000
let g:ale_echo_msg_format = '%s [%linter% %severity% %code%]'

" --- fzf.vim ---
let $FZF_DEFAULT_COMMAND =
      \ 'fd --type f --hidden --ignore-file ~/.config/fd/vim-ignore'
let $FZF_DEFAULT_OPTS =
      \ '--preview-window top'

" --- vim-pasta ---
let g:pasta_disabled_filetypes = ['tagbar']

" --- netrw ---
" more settings -> :h netrw-browser-options
let g:netrw_winsize=50
let g:netrw_liststyle=0
let g:netrw_banner=0
let g:netrw_special_syntax=1

" --- syntax settings ---
" don't try to detect errors
let g:sh_no_error = 1
let g:vimsyntax_noerror = 1
let g:c_no_curly_error = 1
let g:c_no_bracket_error = 1

" --- Disable built-in plugins ---
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_matchparen = 1
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_tar = 1
let g:loaded_vimballPlugin= 1
let g:loaded_vimball = 1
let g:loaded_zipPlugin= 1

"===============================================================================
" :: Auto commands
"===============================================================================

augroup vimrc | autocmd!
" Auto reload vimrc when it changes
  autocmd BufWritePost $MYVIMRC
        \ source $MYVIMRC |
        \ setf vim

" reload color scheme after writing
  autocmd BufWritePost */.vim/colors/*.vim
        \ execute 'colorscheme' expand("<afile>:t:r")

" always make insert/command mode cursor red in GVim
  highlight! lCursor guibg=red
  autocmd ColorScheme *
        \ highlight lCursor guifg=NONE guibg=red

" Up/Down: jump between different sections of this vimrc
  autocmd BufReadPost $MYVIMRC,~/.vim/vimrc
        \ nnoremap <buffer> <Down> <Cmd>call search('^" :: ', 'W')<CR>zt|
        \ nnoremap <buffer> <Up> <Cmd>call search('^" :: ', 'bW')<CR>zt

" enable spell-check when doing a git commit
  autocmd BufReadPost COMMIT_EDITMSG,MERGE_MSG
        \ setlocal spell

" Keep track of working directory changes for titlestring
  let g:cwd = getcwd()
  autocmd DirChanged *
        \ let g:cwd = getcwd()
  autocmd TabEnter *
        \ let g:cwd = getcwd()

" Force hlsearch when seaching in order to see incsearch highlight
  autocmd CmdLineEnter /
        \ let hls = &hlsearch | set hlsearch
  autocmd CmdLineLeave /
        \ execute 'set' hls ? 'hlsearch' : 'nohlsearch' | unlet hls
augroup END

"===============================================================================
" :: Terminal tweaks
"===============================================================================

if &term ==# 'xterm-256color'
      \ || &term ==# 'rxvt-unicode-256color'
      \ || &term ==# 'alacritty'
  " 1 = blinking block,        2 = steady block
  " 3 = blinking underline,    4 = steady underline
  " 5 = blinking vertical bar, 6 = steady vertical bar
  let &t_SI = "\e[5 q"   " cursor in insert mode
  let &t_EI = "\e[2 q"   " cursor in normal mode
  let &t_SR = "\e[3 q"   " cursor in replace mode
  let &t_ti .= "\e[2 q"  " cursor when vim starts
  let &t_te .= "\e[3 q"  " cursor when vim exits
  " \e]12;...\a (OSC 12) changes cursor color
elseif &term =~# 'linux$'
  " ?2c = underline, ?4c = half block, ?6c = full block
  let &t_SI = "\e[?2c"
  let &t_EI = "\e[?16;255c" " steady white solid block, text colors inverted
  let &t_SR = "\e[?4c"
  let &t_ti = "\e[?16;255c"
  let &t_te = "\e[?2c"
  " remove cursor shape change from the following:
  let &t_vi = "\e[?25l" " cursor visible
  let &t_ve = "\e[?25h" " cursor invisible
  let &t_vs = "\e[?25h" " cursor very visible
endif

" Disable background erase
if &term ==# 'xterm-kitty' || &term ==# 'screen.xterm-256color'
  let &t_ut = ''
endif

" linux virtual console
if &term =~# 'linux$'
  " Force 16 colors
  set t_Co=16
  " Change color palette to some wombat_mod colors
  let &t_ti .= "\e]P01c1c1c" "black
  let &t_ti .= "\e]P3ffcc99" "orange
  let &t_ti .= "\e]PC8ac6f2" "light blue
  let &t_ti .= "\e]PAcae682" "light green
  let &t_ti .= "\e]P9d47f7f" "light red
  let &t_ti .= "\e]PDb984b1" "light purple
  let &t_ti .= "\e]P4333333" "dark blue -> dark gray
  " Restore colors and clear screen on exit
  " TODO: restore more colors
  let &t_te .= "\e]P0000000\e[2J\e[H"
endif

" Add Alt-key support in linux terminals
" Note: these are specific to only the keys I need
" Note: don't use imap or cmap, or it'll break the timeouts
if !has('gui_running')
  for s:key in split('vVcCajk123tTnN8\', '\zs')
    execute 'set <A-' . s:key . ">=\e" . s:key
  endfor
  execute "map \e[1;3P <A-F1>"
  execute "map \e[19;2~ <S-F8>"
endif

"===============================================================================
" :: Temporary/Experimental junk
"===============================================================================

" Alt-8: change word under cursor; '.' to repeat, n or N to skip
nnoremap <A-8> *Ncgn
" same as above, but without word boundaries
nnoremap g<A-8> g*Ncgn

" Space-Space: fuzzy find buffers
nnoremap <silent> <Space><Space> <Cmd>Buffers<CR>


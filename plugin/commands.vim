vim9script
# Commands here are a little too big to put in my vimrc, and not quite long or
# complex enough to be real plugins. Any key mappings should be placed in vimrc.

# Remove trailing whitespace
def FixWhitespace(line1: number, line2: number)
  var save_cursor = getpos('.')
  var charCount = wordcount()['chars']
  execute $'keeppatterns : {line1},{line2}s/\s\+$//e'
  var charDiff = charCount - wordcount()['chars']
  if charCount > 0
    echo printf('%d whitespace character%s removed',
          \ charDiff, charDiff != 1 ? 's' : '')
  endif
  setpos('.', save_cursor)
enddef

command! -range=% FixWhitespace FixWhitespace(<line1>, <line2>)
command! -range=% RemoveTrailingWhiteSpace FixWhitespace

# ------------------------------------------------------------------------------

# Redirect a command to a scratch buffer
# Based on https://gist.github.com/romainl/eae0a260ab9c135390c30cd370c20cd7
def Redir(cmd: string)
  for win in range(1, winnr('$'))
    if !!getwinvar(win, 'scratch')
      execute $':{win}windo close'
    endif
    echomsg win
  endfor
  var output = ''
  if cmd =~# '^!'
    execute "let output = system('" .. substitute(cmd, '^!', '', '') .. "')"
  else
    redir => output
    execute 'legacy' cmd
    redir END
  endif
  vnew
  w:scratch = 1
  setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
  setline(1, split(output, "\n"))
enddef

command! -nargs=1 -complete=command Redir silent Redir(<f-args>)

# ------------------------------------------------------------------------------

def RebuildSpellFiles()
  for f in glob('~/.vim/spell/*.add', 1, 1)
    execute 'verbose mkspell!' f
  endfor
  # re-enable spell option so it uses the updated spell file
  if &spell
    set nospell
    set spell
  endif
enddef

command! RebuildSpellFiles RebuildSpellFiles()
command! SpellRebuild RebuildSpellFiles

# ------------------------------------------------------------------------------

# Show syntax highlighting groups for what's under the cursor
def SynStack()
  var col = col('.')
  var line = line('.')
  var syntaxID = synID(line, col, 0)
  var syntaxID_trans = synID(line, col, 1)
  var attr = [
    "bold", "italic", "reverse",
    "inverse", "standout", "underline",
    "undercurl", "strike", "nocombine"
  ]
  var enabled_attr = filter(attr, (k, v) =>
    synIDattr(synIDtrans(syntaxID_trans), v) == "1")
  var attributes = ''
  if !!enabled_attr
    attributes = reduce(enabled_attr, (acc, val) => acc .. ',' .. val)
  endif
  echo printf('"%s", trans: "%s", link: "%s", fg: %s, bg: %s, attr: %s',
    synIDattr(syntaxID, 'name'),
    synIDattr(syntaxID_trans, 'name'),
    synIDattr(synIDtrans(syntaxID_trans), 'name'),
    synIDattr(synIDtrans(syntaxID_trans), 'fg#') ?? 'NONE',
    synIDattr(synIDtrans(syntaxID_trans), 'bg#') ?? 'NONE',
    attributes ?? 'NONE'
  )
enddef

command! SynStack SynStack()

# ------------------------------------------------------------------------------

# Toggle current word
# stolen from habamax's config at:
# https://github.com/habamax/.vim/blob/a385d1a9d2c559f11cfd7cbe5de6e7dd0ce838e3/autoload/text.vim
def ToggleWord()
    var toggles = {
        true: 'false', false: 'true', True: 'False', False: 'True', TRUE: 'FALSE', FALSE: 'TRUE',
        yes: 'no', no: 'yes', Yes: 'No', No: 'Yes', YES: 'NO', NO: 'YES',
        on: 'off', off: 'on', On: 'Off', Off: 'On', ON: 'OFF', OFF: 'ON',
        open: 'close', close: 'open', Open: 'Close', Close: 'Open',
        dark: 'light', light: 'dark',
        width: 'height', height: 'width',
        first: 'last', last: 'first',
        top: 'right', right: 'bottom', bottom: 'left', left: 'center', center: 'top',
    }
    var word = expand("<cword>")
    if toggles->has_key(word)
        execute 'normal! "_ciw' .. toggles[word]
    endif
enddef

command! ToggleWord ToggleWord()

# ------------------------------------------------------------------------------

# Copy selection with all lines indented 4 spaces
# Note: key map supports Ctrl-v selection, but not :RedditCopy
def RedditCopy(line1: number, line2: number)
  var _t = @t
  if mode() == "\<C-V>"
    silent normal! "ty
  else
    exec printf('silent :%d,%dyank t', line1, line2)
  endif
  silent new [RedditCopy]
  silent put! t
  silent :%s/^/    /
  silent :$delete
  :%yank +
  @t = _t
  bwipe!
enddef

# map a key in vimrc
xnoremap <Plug>(RedditCopy) <ScriptCmd>RedditCopy(line('v'), line('.'))<CR>

command! -range=% RedditCopy {
  RedditCopy(<line1>, <line2>)
}

# ------------------------------------------------------------------------------

# Make background transparent in terminal
# Note:
# - Add bang to disable.
# - With alacritty terminal, specify opacity as first argument 0 to 100
def Transparent(bang: string, opacity: number = 90)
  for grp in ['Normal', 'NonText', 'LineNr', 'SignColumn', 'Terminal']
    execute 'highlight' grp 'ctermbg=NONE guibg=NONE'
  endfor
  if executable('alacritty')
    var percent = opacity / 100.0
    if !!bang || opacity < 0 || opacity > 100
      percent = 1.0
    endif
    call system($"alacritty msg config 'window.opacity = {percent}'")
  endif
  if !!bang
    execute 'colorscheme' g:colors_name
  endif
enddef

if ! has('gui_running')
  command! -bang -nargs=? Transparent Transparent("<bang>", <args>)
endif

# ------------------------------------------------------------------------------

# Reload Firefox. Requires xdotool to be installed.
command! FirefoxReload system('xdotool search "Mozilla Firefox" key F5')
command! ReloadFirefox FirefoxReload

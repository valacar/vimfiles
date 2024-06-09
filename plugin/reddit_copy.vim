vim9script

if exists('g:loaded_reddit_copy')
  finish
endif
g:loaded_reddit_copy = 1

# copy selection with all lines indented 4 spaces
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

vnoremap <unique> <F5> <ScriptCmd>RedditCopy(line('v'), line('.'))<CR>

command! -range=% RedditCopy {
  RedditCopy(<line1>, <line2>)
}

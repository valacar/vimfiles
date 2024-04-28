vim9script

if exists('g:loaded_reddit_copy')
  finish
endif
g:loaded_reddit_copy = 1

# copy selection with all lines indented 4 spaces
def RedditCopy()
  var _t = @t
  silent normal! "ty
  silent new [RedditCopy]
  silent put! t
  silent :%s/^/    /
  silent :$delete
  :%yank +
  @t = _t
  bwipe!
enddef

vnoremap <unique> <F5> <ScriptCmd>RedditCopy()<CR>

# Can't get this to work (problem with `"ty` yank):(
# command! -range RedditCopy {
#   RedditCopy()
# }

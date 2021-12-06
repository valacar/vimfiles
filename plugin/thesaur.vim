" Use aiksaurus with thesaurusfunc
" Stolen from :help compl-thesaurusfunc

" Note: press ^x^t in insert mode to get suggestions

func Thesaur(findstart, base)
  if a:findstart
    return searchpos('\<', 'bnW', line('.'))[1] - 1
  endif
  let res = []
  let h = ''
  let guess = '[?]' " No synonyms known
  for l in systemlist('aiksaurus '.shellescape(a:base))
    if l[:3] ==# '=== '
      let h = '('.substitute(l[4:], ' =*$', ')', '')
    elseif l ==# 'Alphabetically similar known words are: '
      let h = guess
    elseif l[0] =~# '\a' || (h ==# guess && l[0] ==# "\t")
      call extend(res, map(split(substitute(l, '^\t', '', ''), ', '), {_, val -> {'word': val, 'menu': h}}))
    endif
  endfor
  return res
endfunc

if exists('+thesaurusfunc') && executable('aiksaurus')
  set thesaurusfunc=Thesaur
endif

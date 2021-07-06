" ==========================================
" Status Line
" ==========================================
function! CocStatus()
  return ""
  let info = get(b:, 'coc_diagnostic_info', {})
  let status = substitute(get(g:, 'coc_status', ''), 'Prettier', '', '')
  if get(info, 'error', 0) || get(info, 'warning', 0)
    let status = status . ' ⚠️ ' . (get(info, 'error', 0) + get(info, 'warning', 0))
  endif
  return status
endfunction

augroup StatusLine
  autocmd!
  autocmd WinLeave * set statusline=\ %f%q\ %M\ %=%{CocStatus()}\ %p%%\ 

  autocmd VimEnter,WinEnter,BufWinEnter * setl statusline=\ %f%q\ %M\ %=%{CocStatus()}\ ↓%l→%-2.c\ ¬%-2{strlen(getline('.'))}\ %L×%p%%\ 
augroup END

" ==========================================
" Tab Line
" ==========================================
function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let name = bufname(buflist[winnr - 1])
  if empty(name)
    return 'No Name'
  else
    return fnamemodify(name, ':t')
  end
endfunction

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999X%{strftime("%H:%M")}'
  endif

  return s
endfunction

set tabline=%!MyTabLine()

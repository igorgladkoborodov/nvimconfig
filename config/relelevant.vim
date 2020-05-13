function! RelatedStyle()
  let related = GetRelatedStyle(expand('%'))
  call RelatedOpen(related)
endfunction

function! GetRelatedStyle(file)
  if match(a:file, '\.jsx$') != -1
    return substitute(a:file, '\(.*\)\/\([^\/]*\).jsx', '\1/__styles__/\2.styl', '')
  endif
  if match(a:file, '\.tsx$') != -1
    return substitute(a:file, '\(.*\)\/\([^\/]*\).tsx', '\1/__styles__/\2.styl', '')
  endif
endfunction

function! RelatedTest()
  let related = GetRelatedTest(expand('%'))
  call RelatedOpen(related)
endfunction

function! GetRelatedTest(file)
  if match(a:file, '\.jsx$') != -1
    return substitute(a:file, '\(.*\)\/\([^\/]*\).jsx', '\1/__tests__/\2.js', '')
  endif
  if match(a:file, '\.tsx$') != -1
    return substitute(a:file, '\(.*\)\/\([^\/]*\).tsx', '\1/__tests__/\2.js', '')
  endif
endfunction

function! RelatedOpen(file)
  exec('e ' . a:file)
endfunction

map gs :call RelatedStyle()<CR>

map gt :call RelatedTest()<CR>


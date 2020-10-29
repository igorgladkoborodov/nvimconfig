" Jump between related files: test, styles, etc.
" Let's say you have a following structure
" src
" └── components
"     ├── __styles__
"     │   └── ComponentName.styl
"     ├── __tests__
"     │   ├── __snapshots__
"     │   │   └── ComponentName.test.tsx.snap
"     │   └── ComponentName.test.tsx
"     └── ComponentName.tsx
"
" This script can jump between all of that files. Or create file if it is not
" there.
" * Jump to tests: <Leader>jt
" * Styles: <Leader>js
" * Test snapshots: <Leader>js
" * Back to original file: <Leader>js
"
" It will try to find existing file based on customized regexp. And if file is
" not found it can optionally create it.
" Files patters could be configured in `g:jumpMap` variable. Docs TBD.
"
" TODO: Make a plugin. Docs, customization, default settings etc

function! s:FileInfo(fileName)
  let result = {
    \   'path': a:fileName,
    \ }
  for fileType in g:jumpMap
    for match in fileType['match']
      let matched = matchlist(a:fileName, match[0])
      if get(matched, match[1]) != '0' && get(matched, match[2]) != '0'
        let result['type'] = fileType['type']
        let result['dir'] = matched[match[1]]
        let result['file'] = matched[match[2]]
        if get(match, 3)
          let result['ext'] = matched[match[3]]
        endif
        break
      endif
    endfor
    if has_key(result, 'type')
      break
    endif
  endfor
  return result
endfunction

function s:FindFile(fileInfo, typeInfo)
  for dir in a:typeInfo['dir']
    let dir = substitute(dir, '$dir', a:fileInfo['dir'], 'g')
    let dir = substitute(dir, '$file', a:fileInfo['file'], 'g')
    let files = split(globpath(dir, '*'))
    for file in files
      let info = s:FileInfo(file)
      if has_key(info, 'file') && info['file'] ==# a:fileInfo['file'] && info['dir'] ==# a:fileInfo['dir']
        return info
      end
    endfor
  endfor
  return {}
endfunction

function! s:TypeInfo(type)
  for fileType in g:jumpMap
    if fileType['type'] ==# a:type
      return fileType
    endif
  endfor
endfunction

function! JumpTo(type)
  let fileInfo = s:FileInfo(expand('%'))

  if !has_key(fileInfo, 'type')
    return
  endif

  let typeInfo = s:TypeInfo(a:type)

  if a:type ==# fileInfo['type']
    return
  endif

  let findFile = s:FindFile(fileInfo, typeInfo)
  if has_key(findFile, 'path')
    call s:OpenFile(findFile['path'])
    return
  elseif (has_key(typeInfo, 'new'))
    let newFile = typeInfo['new']
    let newFile = substitute(newFile, '$dir', fileInfo['dir'], 'g')
    let newFile = substitute(newFile, '$file', fileInfo['file'], 'g')
    if has_key(fileInfo, 'ext')
      let newFile = substitute(newFile, '$ext', fileInfo['ext'], 'g')
    else
      let originTypeInfo = s:TypeInfo('origin')
      let originFile = s:FindFile(fileInfo, originTypeInfo)

      let newFile = substitute(newFile, '$ext', originFile['ext'], 'g')
    endif
    call s:OpenFile(newFile)
    return
  endif
endfunction

function! s:OpenFile(file)
  exec('e ' . a:file)
endfunction

map <silent> <Leader>jf :call JumpTo('origin')<CR>
map <silent> <Leader>js :call JumpTo('style')<CR>
map <silent> <Leader>jt :call JumpTo('test')<CR>
map <silent> <Leader>jn :call JumpTo('snapshot')<CR>

" TODO: scopes (ruby/javasript etc)
" TODO: per-project config
" TODO: Docs
let g:jumpMap = [
\ {
\   'type': 'snapshot',
\   'match': [
\     ['\(.*\)\/__tests__\/__snapshots__\/\(.*\)\.test\.\([jt]sx\?\)', 1, 2],
\     ['\(.*\)\/__tests__\/__snapshots__\/\(.*\)\.\([jt]sx\?\)', 1, 2],
\   ],
\   'dir': ['$dir/__tests__/__snapshots__'],
\ },
\ {
\   'type': 'test',
\   'match': [
\     ['\(.*\)\/__tests__\/\(.*\)\.test\.\([jt]sx\?\)', 1, 2],
\     ['\(.*\)\/__tests__\/\(.*\)\.\([jt]sx\?\)', 1, 2],
\   ],
\   'dir': ['$dir/__tests__'],
\   'new': '$dir/__tests__/$file.test.$ext',
\ },
\ {
\   'type': 'style',
\   'match': [['\(.*\)\/__styles__\/\(.*\)\.\(styl\)', 1, 2]],
\   'dir': ['$dir/__styles__'],
\   'new': '$dir/__styles__/$file.styl'
\ },
\ {
\   'type': 'origin',
\   'match': [['\(.*\)\/\(.*\)\.\([jt]sx\?\)', 1, 2, 3]],
\   'dir': ['$dir'],
\ },
\ ]

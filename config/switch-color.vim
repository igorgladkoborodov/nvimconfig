function ToggleColors()
  let g:colors_variant = exists('g:colors_variant') ? (g:colors_variant + 1)%2 : 0
  if g:colors_variant == 0
    set background=dark
    colorscheme nord
    hi! clear CocUnderline
    hi! CocUnderline gui=undercurl term=undercurl guisp=#BF616A
    hi! Visual guibg=#4C566A

  elseif g:colors_variant == 1
    set background=light
    colorscheme NeoSolarized

    hi MatchParen ctermfg=230 ctermbg=32 guifg=#fdf6e3 guibg=#268bd2 guisp=NONE cterm=NONE gui=NONE
    hi! link EndOfBuffer NonText

    hi Pmenu cterm=NONE gui=NONE
    hi! link CocFloating     Pmenu
    hi! link CocErrorFloat   CocFloating
    hi! link CocWarningFloat CocFloating
    hi! link CocInfoFloat    CocFloating
    hi! link CocHintFloat    CocFloating

    hi clear CocUnderline
    hi CocUnderline gui=undercurl term=undercurl guisp=#FF0000
  endif

  hi! link typescriptParens CocFloating
  hi! link typescriptBraces CocFloating
  hi! link typescriptCall CocFloating

  hi! default link CocErrorHighlight   CocUnderline
  hi! default link CocWarningHighlight CocUnderline
  hi! default link CocInfoHighlight    CocUnderline
  hi! default link CocHintHighlight    CocUnderline
endfunction

function ToggleColorsTo(colors_variant)
  let g:colors_variant = a:colors_variant - 1
  call ToggleColors()
endfunction

function ToggleSpellTo(spell_variant)
  let g:spell_variant = a:spell_variant - 1
  call ToggleSpell()
endfunction

function ToggleSpell()
  let g:spell_variant = exists('g:spell_variant') ? (g:spell_variant + 1) % 2 : 0
  if g:spell_variant == 0
    hi clear SpellBad
    hi clear SpellCap
    hi clear SpellLocal
    hi clear SpellRare
  elseif g:spell_variant == 1
    hi SpellBad cterm=underline gui=undercurl
    hi SpellCap cterm=underline gui=undercurl
    hi SpellLocal cterm=underline gui=undercurl
    hi SpellRare cterm=underline gui=undercurl
  endif
endfunction

" call ToggleSpellTo(1)

call ToggleColorsTo(0)

map <F6> :call ToggleColors()<CR>
map <F7> :call ToggleSpell()<CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . "> trans<" . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

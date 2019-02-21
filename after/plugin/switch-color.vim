function ToggleColors()
  let g:colors_variant = exists('g:colors_variant') ? (g:colors_variant + 1)%2 : 0
  if g:colors_variant == 0
    set background=dark
    colorscheme NeoSolarized
    hi ALEErrorSign ctermfg=10  ctermbg=0  guifg=#ff2600 guibg=#073642  gui=NONE
    hi! link ALEWarningSign AleErrorSign
    hi CursorLine ctermfg=NONE ctermbg=236 guifg=NONE guibg=#002E38 guisp=#93a1a1 cterm=NONE gui=NONE
    hi illuminatedWord ctermfg=NONE ctermbg=236 guifg=NONE guibg=#003e4d guisp=#93a1a1 cterm=NONE gui=NONE
    hi MatchParen ctermfg=230 ctermbg=160 guifg=#fdf6e3 guibg=#dc322f guisp=NONE cterm=NONE gui=NONE
    hi Normal ctermfg=247 ctermbg=235 guifg=#93a1a1 guibg=#00232B guisp=NONE cterm=NONE gui=NONE
    hi VertSplit guibg=#073642
    hi SignColumn guibg=#073642
  elseif g:colors_variant == 1
    set background=light
    colorscheme NeoSolarized
    hi ALEErrorSign ctermfg=10  ctermbg=0  guifg=#c34915  guibg=#eee8d5  gui=NONE
    hi! link ALEWarningSign AleErrorSign
    hi CursorLine ctermfg=NONE ctermbg=254 guifg=NONE guibg=#F7F1DF guisp=#586e75 cterm=NONE gui=NONE
    hi illuminatedWord ctermfg=NONE ctermbg=254 guifg=NONE guibg=#f5edd6 guisp=#586e75 cterm=NONE gui=NONE
    hi MatchParen ctermfg=230 ctermbg=32 guifg=#fdf6e3 guibg=#268bd2 guisp=NONE cterm=NONE gui=NONE
    hi VertSplit guibg=#eee8d5
    hi SignColumn guibg=#eee8d5
  endif

  hi! link EndOfBuffer NonText
  hi clear MatchTag

  " Make lightline switch light/dark background
  runtime autoload/lightline/colorscheme/solarized.vim
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
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

" Solarized colors
let g:neosolarized_visibility = "low"
let g:neosolarized_contrast = "high"
let g:neosolarized_bold = 0
let g:neosolarized_underline = 0
let g:neosolarized_italic = 0

call ToggleSpellTo(1)

if exists('g:vv')
  call ToggleColorsTo(1)
else
  call ToggleColorsTo(0)
end

map <F6> :call ToggleColors()<CR>
map <F7> :call ToggleSpell()<CR>

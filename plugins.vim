" ======================================================================
" Plugins and their settings
" ======================================================================
call plug#begin('~/.local/share/nvim/plugged')

" ==================================================
" FZF
" ==================================================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Show git files only (respect .gitignore)
map ; :GFiles<CR>
" FZF all files
map <Leader>t :Files<CR>
" Leader b for buffers
map <Leader>b :Buffers<CR>

" ==================================================
" NERD tree
" ==================================================
Plug 'scrooloose/nerdtree'

map <Leader>a :NERDTreeToggle<CR>
map <Leader>z :NERDTreeFind<CR>
let g:NERDTreeMinimalUI=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeCustomOpenArgs = {'file': {'where': 'p'}, 'dir': {}}

autocmd FileType nerdtree setlocal signcolumn=auto

" ===========================================================
" gc for comment
" ===========================================================
Plug 'tomtom/tcomment_vim'

" ===========================================================
" Leader ig to show indent
" ===========================================================
Plug 'nathanaelkane/vim-indent-guides'

" ===========================================================
" Leader f for search and The Silver Searcher
" ===========================================================
Plug 'mileszs/ack.vim'

if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading --smart-case'
endif

nnoremap <Leader>f :Ack!<Space>

" ======================================================
" LustyJuggler
" ======================================================
Plug 'sjbach/lusty'
map <Leader>s :LustyJuggler<CR>

" ====================================================================
" Fix copypaste
" ====================================================================
Plug 'ConradIrwin/vim-bracketed-paste'

" ====================================================================
" File utils (:Rename, :Move, :Delete etc)
" ====================================================================
Plug 'tpope/vim-eunuch'

" ================================================
" Syntax
" ================================================
Plug 'iloginow/vim-stylus'
" Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'jparise/vim-graphql'
" Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" ====================================================================
" Color Scheme
" ====================================================================
Plug 'iCyMind/NeoSolarized'
let g:neosolarized_visibility = "low"
let g:neosolarized_contrast = "high"
let g:neosolarized_bold = 0
let g:neosolarized_underline = 0
let g:neosolarized_italic = 0

Plug 'arcticicestudio/nord-vim'
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_underline_comments = 0
let g:nord_underline = 0
let g:nord_italic = 0
let g:nord_bold = 0

" =================================================
" Working with pair symbols
" ====================================================================
Plug 'tpope/vim-surround'

" ====================================================================
" Make . (repeat) operator useful for plugins
" ====================================================================
Plug 'tpope/vim-repeat'

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" ====================================================================
" Show marks
" ====================================================================
Plug 'kshenoy/vim-signature'

" ====================================================================
" Undo tree
" ====================================================================
Plug 'sjl/gundo.vim'

nnoremap `u :GundoToggle<CR>
nnoremap <Leader>u :GundoToggle<CR>

" ====================================================================
" Highlight current word
" ====================================================================
Plug 'RRethy/vim-illuminate'
let g:Illuminate_ftblacklist = ['qf']

" ===================================================================
" COC
" ===================================================================
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_node_path = $HOME."/.nvm/versions/node/v10.15.3/bin/node"

set signcolumn=auto

nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
nmap <silent> gy :call CocActionAsync('jumpTypeDefinition')<CR>
nmap <silent> gi :call CocActionAsync('jumpImplementation')<CR>
nmap <silent> gr :call CocActionAsync('jumpReferences')<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
map <Leader>c <Plug>(coc-diagnostic-info)

map <silent> <leader>p :call CocActionAsync('format')<CR>

" ===================================================================

call plug#end()

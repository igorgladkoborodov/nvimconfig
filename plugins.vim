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

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'VertSplit'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8, 'border': 'sharp' } }
" let g:fzf_layout = { 'down': '40%' }

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
Plug 'sheerun/vim-polyglot'

let g:csv_no_conceal = 1
hi! link CSVDelimiter Comment
hi! link CSVColumnHeaderOdd Text
hi! link CSVColumnHeaderEven Statement

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

let g:gundo_prefer_python3 = 1

" ====================================================================
" Highlight current word
" ====================================================================
Plug 'RRethy/vim-illuminate'
let g:Illuminate_ftblacklist = ['qf']

" ===================================================================
" COC
" ===================================================================
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" let g:coc_node_path = $HOME."/.nvm/versions/node/v10.15.3/bin/node"
"
" set signcolumn=auto
"
" nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
" nmap <silent> gy :call CocActionAsync('jumpTypeDefinition')<CR>
" nmap <silent> gi :call CocActionAsync('jumpImplementation')<CR>
" nmap <silent> gr :call CocActionAsync('jumpReferences')<CR>
"
" " Use K to show documentation in preview window
" nnoremap <silent> K :call CocActionAsync('doHover')<CR>
"
" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" " Use `[c` and `]c` to navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)
" map <Leader>c <Plug>(coc-diagnostic-info)
"
" map <silent> <leader>p :call CocActionAsync('format')<CR>

" autocmd FileType * let b:coc_root_patterns = ['.git']
"
"
" ===================================================================
" LSP
" ===================================================================
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/lsp-status.nvim'

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" " Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nmap <silent> ]c <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
map <Leader>c <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

" ===================================================================
" Open in GitHub
" ===================================================================
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'

let g:openbrowser_github_always_use_commit_hash = 0
" let g:openbrowser_github_always_used_branch = 1

" ===================================================================
" Jump between alternate files
" ===================================================================
Plug 'igorgladkoborodov/alter-ego.vim'

map <silent> <Leader>jf :A<CR>
map <silent> <Leader>js :A style<CR>
map <silent> <Leader>jt :A test<CR>
map <silent> <Leader>jn :A snapshot<CR>

" ===================================================================
" Reload All on W12
Plug 'igorgladkoborodov/load-all.vim'


call plug#end()

lua << EOF
require'lspconfig'.tsserver.setup{}
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   -- Enable signs
   signs = false,
   virtual_text = {
     spacing = 2,
     prefix = '',
   },
 }
)


vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultinips = true;
    luasnip = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

EOF


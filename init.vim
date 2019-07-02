set nocompatible              " be iMproved, required
filetype off                  " required

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ruby_host_prog = '~/.rbenv/versions/2.4.1/bin/neovim-ruby-host'

language en_US                " sets the language of the messages / ui (vim)
" set ruler                   " Info in the bottom right
syntax enable

set laststatus=2

set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

set wildmenu                    " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to.

" Whitespace
"set nowrap                     " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set wrap                        " Wrap by default

" Scroll
set scrolloff=10

" `= and `- to change window size
map `= :vertical resize +20<CR>
map `- :vertical resize -20<CR>

" Ignore these from search etc
set wildignore+=*/tmp,*/node_modules,.DS_Store,*/.bundle

" Navigation on wrapped lines
nmap <silent> j gj
nmap <silent> k gk
"
" Don't require to save hidden buffers
set hidden

" History size
set history=5000

" Directories for swp files
" set backupdir=~/.vim/backup//
" set directory=~/.vim/backup//
set nobackup
set noswapfile

" Ctrl + hjkl to navigate between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set cursorline


" ============================
" Navigating tabs

" New tab on Cmd+t
map <D-t> :tabnew<CR>

" Double leader opens file in new tab
map <Leader><Leader> :tabe %<CR>

map <D-S-}> :tabn<CR>
map <D-S-{> :tabp<CR>

" Shit+Cmd+Ctrl+] to move tab left
" Shit+Cmd+Ctrl+[ to move tab right
map <C-S-D-{> :tabm -1<CR>
map <C-S-D-}> :tabm +1<CR>

" Scroll when you are 5 lines close to the edge
set scrolloff=5

" Invisible characters
set list
set listchars=eol:¬,tab:→\ ,nbsp:_,precedes:(,extends:),trail:·

set nonumber

" Indent on < or >
vnoremap < <gv
vnoremap > >gv

" Copy current filename to clipboard by `i
map `i :let @*=expand("%")<CR>
map <Leader>i :let @*=expand("%")<CR>

" Turn on vim-repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" Remove scrollbars in mvim
set guioptions=

" Limit syntax for long lines to increase speed
set synmaxcol=4000

" Enable mouse in terminal
" set mouse=a

" Trying to make vim faster
" https://vi.stackexchange.com/questions/10495/most-annoying-slow-down-of-a-plain-text-editor
set regexpengine=1
set ttyfast
set lazyredraw

" Disable {visual}u lowercase. Always hit it by accident.
vmap u <Nop>

" Make gf work for node custom root
set path+=$PWD/**3
set suffixesadd+=.js,.jsx,.ts,.tsx

" `y moves last saved register to yank register 0
map `y :let @0=@"<CR>
" `p in paste yanked register
map `p "0p


" Don't jump on search word
nnoremap * *``
nnoremap # #``

" Reset current search
map `/ :noh<CR>

" hide | on window split (space after \ is important)
" set fillchars+=vert:\ 

" Folding
nnoremap <Space> za
set nofoldenable
set foldmethod=indent
set foldlevel=99999

" Specific VV config
if filereadable(expand("~/.config/nvim/vv.vim"))
  source ~/.config/nvim/vv.vim
endif

" Load specifics to this host
if filereadable(expand("~/.config/nvim/local/local.vim"))
  source ~/.config/nvim/local/local.vim
endif


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
let g:NERDTreeNoSwitchTabs=1
" let g:NERDTreeHighlightCursorline=0

autocmd FileType nerdtree setlocal signcolumn=no

let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '

" autocmd VimEnter * NERDTree

" How can I close vim if the only window left open is a NERDTree? 
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" How can I open NERDTree automatically when vim starts up on opening a directory?
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"
" " How can I open a NERDTree automatically when vim starts up if no files were specified?
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Remove right scrollbar
" set guioptions-=L


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
" map <Leader>b :LustyBufferExplorer<CR>
" map <Leader>d :LustyFilesystemExplorerFromHere<CR>


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
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0    " Allow JSX in normal JS files

Plug 'digitaltoad/vim-pug'
Plug 'iloginow/vim-stylus'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

Plug 'leafgarland/typescript-vim'
let g:typescript_indent_disable = 0

Plug 'ianks/vim-tsx'

" autocmd BufNewFile,BufRead *.ts set filetype=typescript
" autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
" autocmd BufNewFile,BufRead *.ts set syntax=typescript
" autocmd BufNewFile,BufRead *.tsx set syntax=typescript.tsx

Plug 'jparise/vim-graphql'

" ====================================================================
" Color Scheme
" ====================================================================
Plug 'iCyMind/NeoSolarized'

" ================================================
" Lightline
" ================================================
Plug 'itchyny/lightline.vim'

set background=dark

let g:lightline = {
\ 'colorscheme': 'solarized',
\ 'active': {
\   'left': [ [ 'paste' ], ['relativepath'] ],
\   'right': [ [ 'lineinfo' ], ['readonly', 'cocstatus', 'linter_warnings', 'linter_errors' ] ]
\ },
\ 'inactive': {
\   'left': [ ['relativepath'] ],
\   'right': [ ]
\ },
\ 'tabline': {
\   'left': [ [ 'tabs' ] ],
\   'right': [ [ 'time' ] ]
\ },
\ 'component': {
\   'lineinfo': '%2l/%L %2v',
\   'relativepath': '%f%{&modified?" +":""}',
\   'pwd': systemlist('dirs')[0],
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'time': 'LightlineTime'
\ },
\ 'component_type': {
\   'readonly': 'warning',
\   'linter_warnings': 'custom',
\   'linter_errors': 'custom'
\ },
\ 'component_function': {
\   'cocstatus': 'CocStatus'
\ },
\ 'mode_map': {
\   'n' : '',
\   'i' : '',
\   'R' : 'REPLACE',
\   'v' : '',
\   'V' : '',
\   "\<C-v>": '',
\   'c' : '',
\   's' : 'SELECT',
\   'S' : 'S-LINE',
\   "\<C-s>": 'S-BLOCK',
\   't': 'TERMINAL',
\ }
\ }

function! LightlineTime() abort
  return strftime('%I:%M')
endfunction

function! CocStatus() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, get(g:, 'coc_status_error_sign') . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, get(g:, 'coc_status_warning_sign') . info['warning'])
  endif
  return join(msgs, ' ')
endfunction


function! LightlineLinterWarnings() abort
  let l:problems = ale#engine#GetLoclist(bufnr(''))
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_non_errors == 0 ? '' : printf('⚠️ %d:L%d', all_non_errors, problems[0].lnum)
endfunction

function! LightlineLinterErrors() abort
  let l:problems = ale#engine#GetLoclist(bufnr(''))
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_errors == 0 ? '' : printf('🚫%d:L%d', all_errors, problems[0].lnum)
endfunction

" =================================================
" Working with pair symbols
" ====================================================================
Plug 'tpope/vim-surround'


" ====================================================================
" Make . (repeat) operator useful for plugins
" ====================================================================
Plug 'tpope/vim-repeat'


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


" ====================================================================
" Insert jsdoc
" ====================================================================
Plug 'heavenshell/vim-jsdoc'
let g:jsdoc_enable_es6=1
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1

" ===================================================================
" COC
" ===================================================================
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

let g:coc_node_path = $HOME."/.nvm/versions/node/v10.15.3/bin/node"

set signcolumn=no

nmap <silent> gd <Plug>(coc-definition)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:coc_status_error_sign = "🚫"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
map <Leader>c <Plug>(coc-diagnostic-info)

map <silent> <leader>p :call <SID>format()<CR>

function! s:format()
  if index(['javasript', 'typescript', 'typescript.tsx', 'javascript.jsx', 'typescriptreact', 'javascriptreact', 'graphql', 'json'], &filetype) != -1
    call CocAction('runCommand', 'prettier.formatFile')
  else
    call CocAction('format')
  endif
endfunction

" ===================================================================

call plug#end()

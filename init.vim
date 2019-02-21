set nocompatible              " be iMproved, required
filetype off                  " required

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

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

set number

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
set synmaxcol=400

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

" `y moves last saved register to yank register 0
map `y :let @0=@"<CR>
" `p in paste yanked register
map `p "0p


" Don't jump on search word
nnoremap * *``
nnoremap # #``

" hide | on window split (space after \ is important)
set fillchars+=vert:\ 

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
map <Leader>t :GFiles<CR>
" FZF all files
map <Leader>r :Files<CR>


" ==================================================
" NERD tree
" ==================================================
Plug 'scrooloose/nerdtree'

map <Leader>a :NERDTreeToggle<CR>
map <Leader>z :NERDTreeFind<CR>
let g:NERDTreeMinimalUI=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeNoSwitchTabs=1
let g:NERDTreeHighlightCursorline=0

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
" https://github.com/mileszs/ack.vim
" https://robots.thoughtbot.com/faster-grepping-in-vim
" ===========================================================
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <Leader>f :Ack!<Space>


" ======================================================
" LustyJuggler
" ======================================================
Plug 'sjbach/lusty'
map <Leader>s :LustyJuggler<CR>
map <Leader>b :LustyBufferExplorer<CR>
map <Leader>d :LustyFilesystemExplorerFromHere<CR>


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
\   'right': [ [ 'lineinfo' ], ['readonly', 'linter_warnings', 'linter_errors'] ]
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

" Update and show lightline but only if it's visible (e.g., not in Goyo)
autocmd User ALELint call s:MaybeUpdateLightline()
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction


" =================================================
" ALE (async linter)
" =================================================
Plug 'w0rp/ale'

let g:ale_sign_offset = 1000

let g:ale_linters = {
\ 'javascript': ['eslint', 'flow'],
\ 'ruby': ['rubocop', 'mri'],
\}

let g:ale_fixers = {
\ 'ruby': ['rubocop'],
\ 'javascript': ['prettier'],
\ 'json': ['fixjson', 'prettier'],
\}

let g:ale_sign_error = "🚫"
let g:ale_sign_warning = "⚠️ "

let g:ale_lint_on_text_changed = "never" " only lint on file save

" Run ale fixer on `l
nmap `l <Plug>(ale_fix)

let g:ale_open_list = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0

nnoremap <silent> I :call <SID>toggle_detail()<CR>
function! s:toggle_detail()
  if exists('b:ale_detail') && b:ale_detail == 1
    pclose
    let b:ale_detail = 0
  else
    ALEDetail
    let b:ale_detail = 1
  endif
endfunction


" ====================================================================
" Completion
" ====================================================================

" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

" Start search from the first character
let g:ncm2#complete_length=[[1,1]]
let g:ncm2#popup_delay=50
let g:ncm2#popup_limit=10

 " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" ======================================================
" Language Server
" ======================================================
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ncm2/ncm2-vim-lsp'

let g:lsp_diagnostics_enabled=0
let g:lsp_diagnostics_echo_cursor=0
let g:lsp_signs_enabled=0

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  let l:hoverCursor = col('.') . '|' . line('.')
  if exists('b:lsp_hoverCursor') && b:lsp_hoverCursor == l:hoverCursor
    pclose
    let b:lsp_hoverCursor = ''
  else
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      LspHover
    endif
    let b:lsp_hoverCursor = l:hoverCursor
  endif
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(lsp-definition)

if executable('flow')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'flow',
    \ 'cmd': {server_info->['flow', 'lsp']},
    \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.flowconfig'))},
    \ 'whitelist': ['javascript', 'javascript.jsx'],
    \ })
endif


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


" ====================================================================
" Auto close brackets
" ====================================================================
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<D-b>'
let g:AutoPairsOnlyWhitespace = 1


" ====================================================================
" Auto close tags
" ====================================================================
Plug 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.jsx,*.xml,*.erb'
let g:closetag_xhtml_filenames = '*.html,*.jsx,*.xml,*.erb'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'


call plug#end()

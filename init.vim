set nocompatible

language en_US.utf-8            " sets the language of the messages / ui (vim)
syntax enable

set laststatus=2                " Show status line

set encoding=utf-8
set showcmd                     " display incomplete commands

set wildmenu                    " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to.

set wrap                        " Wrap by default
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set scrolloff=5                 " Scroll when you are 5 lines close to the edge

set hidden                      " Don't require to save hidden buffers

set history=5000                " History size

set nobackup                    " Disable backup
set noswapfile

set nocursorline                " Hide cursor line

set wildignore+=*/tmp,*/node_modules,.DS_Store,*/.bundle " Ignore these from search

set list                        " Show invisible characters
set listchars=eol:¬,tab:→\ ,nbsp:_,precedes:«,extends:»,trail:·

set nonumber                    " Hide line numbers

set guioptions=                 " Remove scrollbars (legacy)

set path+=$PWD/**3              " Make gf work for node custom root
set suffixesadd+=.js,.jsx,.ts,.tsx " Make gf work with js imports

set fillchars=stl:\ ,stlnc:\ ,vert:┃   " Split windows separators
" set fillchars=vert:║

set nofoldenable                " Enable folding
set foldmethod=indent           " ...by indent
set foldlevel=99999             " Always expand everything by default

" set switchbuf=uselast           " Jump to last buffer when select file from quickfix

let g:ruby_host_prog = '~/.rbenv/versions/2.6.6/bin/neovim-ruby-host'
let g:node_host_prog = '~/.nvm/versions/node/v10.15.3/bin/neovim-node-host'
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Always start syntax from start
autocmd BufEnter * :syntax sync fromstart

" Load plugins and their settings
source <sfile>:h/plugins.vim

" Load config files
runtime! config/**/*.vim

set guicursor+=i-ci-c-ve:ver25-blinkwait500-blinkoff500-blinkon500

" Local config overrides
runtime! local/**/*.vim

" Always start syntax from start
autocmd BufEnter * :syntax sync fromstart

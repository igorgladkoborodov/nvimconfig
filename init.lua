vim.cmd "language en_US.utf-8" -- sets the language of the messages / ui (vim)

vim.o.laststatus = 2 -- Show status line

vim.o.showcmd = true -- display incomplete commands

vim.o.wildmenu = true -- visual autocomplete for command menu
vim.o.lazyredraw = true -- redraw only when we need to.

vim.o.tabstop = 2
vim.o.shiftwidth = 2 -- a tab is two spaces
vim.o.expandtab = true -- use spaces, not tabs

vim.o.hlsearch = true -- highlight matches
vim.o.incsearch = true -- incremental searching
vim.o.ignorecase = true -- searches are case insensitive...
vim.o.smartcase = true -- ... unless they contain at least one capital letter
vim.o.scrolloff = 5 -- Scroll when you are 5 lines close to the edge

vim.o.swapfile = false

-- Ignore these from search
vim.opt.wildignore:append { "*/tmp/*", "*/node_modules/*", ".DS_Store", "*/.bundle/*" }

vim.o.list = true -- Show invisible characters
vim.o.listchars = "eol:¬,tab:→\\ ,nbsp:_,precedes:«,extends:»,trail:·"

vim.opt.path:append(vim.fn.getcwd() .. "/**3") -- Make gf work for node custom root
vim.opt.suffixesadd:append { ".js", ".jsx", ".ts", ".tsx" } -- Make gf work with js imports

vim.o.foldenable = false -- Enable folding
vim.o.foldmethod = "indent" -- ...by indent
vim.o.foldlevel = 99999 -- Always expand everything by default

-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
-- -- start unfolded:
-- vim.o.foldlevel = 99

vim.o.switchbuf = "uselast" -- Jump to last buffer when select file from quickfix

vim.o.guicursor = vim.o.guicursor .. ",i-ci-c-ve:ver25-blinkwait500-blinkoff500-blinkon500"

vim.g.ruby_host_prog = "~/.rbenv/versions/3.3.4/bin/neovim-ruby-host"
vim.g.node_host_prog = "~/.nvm/versions/node/v18.18.2/bin/neovim-node-host"
vim.g.python2_host_prog = "/usr/local/bin/python"
vim.g.python3_host_prog = "/usr/local/bin/python3"

require "config.lazy"

-- Load config files
vim.cmd "runtime! config/**/*.vim"
vim.cmd "runtime! config/**/*.lua"

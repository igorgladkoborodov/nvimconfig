return {
  -- ===========================================================
  -- gc for comment
  -- ===========================================================
  { "tomtom/tcomment_vim" },

  -- ===========================================================
  -- Leader ig to show indent
  -- ===========================================================
  { "nathanaelkane/vim-indent-guides" },

  -- ===========================================================
  -- Leader f for search and The Silver Searcher
  -- ===========================================================
  {
    "mileszs/ack.vim",
    init = function()
      if vim.fn.executable("rg") == 1 then
        vim.g.ackprg = "rg --vimgrep --no-heading --smart-case"
      end
      -- Map to open Ack with a trailing space to start typing the query
      vim.keymap.set("n", "<Leader>f", ":Ack! ", { silent = false })
      vim.keymap.set("n", "<D-f>", ":Ack! ", { silent = false })
      vim.keymap.set("n", "\\f", ":Ack! ", { silent = false })
    end,
  },

  -- ======================================================
  -- LustyJuggler
  -- ======================================================
  {
    "sjbach/lusty",
    init = function()
      vim.keymap.set("n", "<Leader>s", ":LustyJuggler<CR>", { silent = true })
      vim.keymap.set("n", "\\s", ":LustyJuggler<CR>", { silent = true })
    end,
  },

  -- ====================================================================
  -- Fix copypaste
  -- ====================================================================
  { "ConradIrwin/vim-bracketed-paste" },

  -- ====================================================================
  -- File utils (:Rename, :Move, :Delete etc)
  -- ====================================================================
  { "tpope/vim-eunuch" },

  -- =================================================
  -- Working with pair symbols
  -- ====================================================================
  { "tpope/vim-surround" },

  -- ====================================================================
  -- Make . (repeat) operator useful for plugins
  -- ====================================================================
  {
    "tpope/vim-repeat",
    init = function()
      -- silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
      pcall(function()
        vim.fn["repeat#set"]("<Plug>MyWonderfulMap", vim.v.count)
      end)
    end,
  },

  -- ====================================================================
  -- Show marks
  -- ====================================================================
  { "kshenoy/vim-signature" },

  -- ====================================================================
  -- Undo tree
  -- ====================================================================
  {
    "sjl/gundo.vim",
    init = function()
      vim.keymap.set("n", "`u", ":GundoToggle<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>u", ":GundoToggle<CR>", { silent = true })
      vim.g.gundo_prefer_python3 = 1
    end,
  },

  -- ====================================================================
  -- Highlight current word
  -- ====================================================================
  -- { "RRethy/vim-illuminate",
  --   init = function()
  --     vim.g.Illuminate_ftblacklist = { "qf" }
  --     vim.g.Illuminate_delay = 100
  --   end,
  -- },

  -- ===================================================================
  -- COC
  -- ===================================================================
  {
    "neoclide/coc.nvim",
    branch = "release",
    init = function()
      vim.g.coc_node_path = vim.env.HOME .. "/.nvm/versions/node/v18.18.2/bin/node"
      vim.opt.signcolumn = "auto"

      -- Keep your original mappings/functions verbatim (they rely on coc#…)
      vim.cmd([[
" Use K to show documentation in preview window
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Jumps
nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
nmap <silent> gy :call CocActionAsync('jumpTypeDefinition')<CR>
nmap <silent> gi :call CocActionAsync('jumpImplementation')<CR>
nmap <silent> gr :call CocActionAsync('jumpReferences')<CR>

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Ctrl + < and > to jump to the next/prev diagnostics
nmap <silent> <C-,> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-.> <Plug>(coc-diagnostic-next)

map <Leader>c <Plug>(coc-diagnostic-info)

" map <silent> <leader>p :call CocActionAsync('format')<CR>
" map <silent> \p :call CocActionAsync('format')<CR>

" autocmd FileType * let b:coc_root_patterns = ['.git']
      ]])
    end,
  },

  -- ===================================================================
  -- Jump between alternate files
  -- ===================================================================
  {
    "igorgladkoborodov/alter-ego.vim",
    init = function()
      vim.keymap.set("n", "<Leader>jf", ":A<CR>",         { silent = true })
      vim.keymap.set("n", "<Leader>js", ":A style<CR>",   { silent = true })
      vim.keymap.set("n", "<Leader>jt", ":A test<CR>",    { silent = true })
      vim.keymap.set("n", "<Leader>jn", ":A snapshot<CR>",{ silent = true })
    end,
  },

  -- ===================================================================
  -- Reload All on W12
  { "igorgladkoborodov/load-all.vim" },

  -- ===================================================================
  -- Show nested functions and operators on top
  -- Plug 'wellle/context.vim'
  -- let g:context_highlight_normal = 'PMenu'
  -- let g:context_highlight_border = '<hide>'
  -- let g:context_highlight_tag    = '<hide>'
}

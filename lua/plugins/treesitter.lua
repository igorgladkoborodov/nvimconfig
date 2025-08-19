return {
  -- Treesitter is a new parser generator tool that we can
  -- use in Neovim to power faster and more accurate
  -- syntax highlighting.
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is old on some platforms
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    -- load treesitter early when opening a file from the cmdline
    lazy = vim.fn.argc(-1) == 0,
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and its custom query predicates early,
      -- for plugins that only need queries and don't require("nvim-treesitter") themselves.
      require("lazy.core.loader").add_to_rtp(plugin)
      pcall(require, "nvim-treesitter.query_predicates")
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      { "<c-space>", desc = "Increment Selection" },
      { "<bs>", desc = "Decrement Selection", mode = "x" },
    },
    -- you can extend ensure_installed later by editing this table
    opts = {
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]a"] = "@parameter.inner",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
            ["]A"] = "@parameter.inner",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[a"] = "@parameter.inner",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[A"] = "@parameter.inner",
          },
        },
      },
    },
    config = function(_, opts)
      -- dedup ensure_installed without LazyVim
      local seen, unique = {}, {}
      for _, lang in ipairs(opts.ensure_installed or {}) do
        if not seen[lang] then
          seen[lang] = true
          table.insert(unique, lang)
        end
      end
      opts.ensure_installed = unique

      require("nvim-treesitter.configs").setup(opts)

      -- Make all imports white, including classes and types
      vim.api.nvim_set_hl(0, "@constructor",   { link = "@variable" })
      vim.api.nvim_set_hl(0, "@class",         { link = "@variable" })
      vim.api.nvim_set_hl(0, "@interface",     { link = "@variable" })

      -- Function names (definitions) look like variables
      vim.api.nvim_set_hl(0, "@function",        { link = "@variable" })
      vim.api.nvim_set_hl(0, "@function.method", { link = "@variable" })
      vim.api.nvim_set_hl(0, "@type",        { link = "@variable" })

      -- "function" keyword should look like other reserved keywords (e.g. const)
      vim.api.nvim_set_hl(0, "@keyword.function", { link = "@keyword" })

      -- "new" keyword same as const/keywords
      vim.api.nvim_set_hl(0, "@keyword.operator", { link = "@keyword" })
      vim.api.nvim_set_hl(0, "@keyword.return",   { link = "@keyword" })

      -- Imported identifiers like observer (JS/TS import bindings)
      vim.api.nvim_set_hl(0, "@variable.builtin", { link = "@variable" })
      vim.api.nvim_set_hl(0, "@module",           { link = "@variable" })
      vim.api.nvim_set_hl(0, "@namespace",        { link = "@variable" })

      vim.api.nvim_set_hl(0, "@tag.attribute", { link = "@keyword" })
      vim.api.nvim_set_hl(0, "@tag.tsx",       { link = "Function" })
      vim.api.nvim_set_hl(0, "@tag.builtin.tsx", { link = "@keyword" })
      vim.api.nvim_set_hl(0, "@tag.delimiter", { link = "Function" })

      vim.api.nvim_set_hl(0, "@property", { link = "@keyword" })

      -- Optional: in diff mode, prefer built-in [c ]c text objects over TS ones
      -- (replicates the logic you had, but without LazyVim)
      local move = require("nvim-treesitter.textobjects.move")
      local configs = require("nvim-treesitter.configs")
      for name, fn in pairs(move) do
        if name:find("^goto") then
          move[name] = function(q, ...)
            if vim.wo.diff then
              local cfg = configs.get_module("textobjects.move")[name]
              for key, query in pairs(cfg or {}) do
                if q == query and key:find("[%]%[][cC]") then
                  vim.cmd.normal({ args = { key }, bang = true })
                  return
                end
              end
            end
            return fn(q, ...)
          end
        end
      end
    end,
  },
}


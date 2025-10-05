return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    init = function()
      -- Keys: <Leader>a to toggle, <Leader>z to reveal current file
      vim.keymap.set("n", "<Leader>a", "<Cmd>Neotree toggle left<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>z", "<Cmd>Neotree reveal left<CR>", { silent = true })

      -- Match your FileType autocmd for signcolumn
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "neo-tree",
        callback = function()
          vim.opt_local.signcolumn = "auto"
        end,
      })
    end,
    config = function()
      require("neo-tree").setup {
        popup_border_style = "rounded",

        -- Close the tree when opening a file (like NERDTreeQuitOnOpen)
        event_handlers = {
          {
            event = "file_opened",
            handler = function(_)
              require("neo-tree").close_all()
            end,
          },
        },
        default_component_configs = {
          container = {
            enable_character_fade = false,
            -- right_padding = 1,
          },
          git_status = {
            symbols = {
              -- Change type
              added = "", -- or "✚"
              modified = "", -- or ""
              deleted = "", -- this can only be used in the git_status source
              renamed = "", -- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored = "",
              unstaged = "",
              staged = "",
              conflict = "",
            },
          },
          icon = {
            -- keep icons subtle; you can remove devicons dep if you want *no* icons
            folder_closed = "▶︎",
            folder_open = "▼",
            folder_empty = "▷",
            folder_empty_open = "▽",
            default = " ",
          },
          modified = { symbol = "*" },
          indent = {
            indent_size = 2,
            padding = 0,
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
        },
        filesystem = {
          window = {
            mappings = {
              ["/"] = false, -- disable fuzzy find
              ["<esc>"] = "close_window",
            },
          },
        },
      }
    end,
  },
}

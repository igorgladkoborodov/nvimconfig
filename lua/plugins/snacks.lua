return {
  "folke/snacks.nvim",
  priority = 900,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    picker = {
      enabled = true,
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["<C-h>"] = { "toggle_hidden", mode = { "i", "n" } },
            ["<C-i>"] = { "toggle_ignored", mode = { "i", "n" } },
          },
        },
      },
      layout = {
        preset = "left",
      },
    },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
  keys = {
    {
      ";",
      function()
        Snacks.picker.files {
          finder = "files",
          format = "file",
          show_empty = true,
          hidden = true,
          -- ignored = false,
          follow = false,
        }
      end,
      desc = "Smart Files",
    },
  },
  config = function(_, opts)
    require("snacks").setup(opts)
    local function set_snacks_nontext_as_comment()
      local to_comment = {
        "Totals",
        "PathIgnored",
        "PathHidden",
        "Dir",
        "Unselected",
        "BufFlags",
        "KeymapRhs",
        "GitStatusUntracked",
        "GitStatusIgnored",
      }
      for _, name in ipairs(to_comment) do
        vim.api.nvim_set_hl(0, "SnacksPicker" .. name, { link = "Comment" })
      end
    end

    set_snacks_nontext_as_comment()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_snacks_nontext_as_comment,
      desc = "Reapply Snacks picker NonText→Comment links",
    })
  end,
}

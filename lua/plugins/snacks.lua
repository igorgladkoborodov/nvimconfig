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
        preview = {
          wo = {
            number = false,
            spell = false,
            statuscolumn = "",
          },
        },
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["<C-h>"] = { "toggle_hidden", mode = { "i", "n" } },
            ["<C-i>"] = { "toggle_ignored", mode = { "i", "n" } },
          },
        },
      },
      layout = {
        preview = "main",
        layout = {
          backdrop = false,
          width = 0.5,
          min_width = 80,
          height = 0.2,
          min_height = 3,
          box = "vertical",
          border = "rounded",
          title = "{title}",
          title_pos = "center",
          { win = "input", height = 1, border = "bottom" },
          { win = "list", border = "none" },
          { win = "preview", title = "{preview}", height = 0.4, border = "top" },
        },
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
        -- Don't show preview until I type
        vim.schedule(function()
          local picker = Snacks.picker.files {
            finder = "files",
            format = "file",
            show_empty = true,
            hidden = true,
            -- ignored = false,
            follow = false,
          }

          -- Immediately toggle preview off before first render completes
          picker:action "toggle_preview"

          local input_buf = picker.input.bufnr or picker.input.buf
          local preview_enabled = false
          local aug = vim.api.nvim_create_augroup("SnacksPreviewOnFirstType", { clear = true })

          vim.api.nvim_create_autocmd({ "TextChangedI", "TextChanged" }, {
            group = aug,
            buffer = input_buf,
            callback = function()
              if not preview_enabled then
                local line = (picker.input and picker.input.get and picker.input:get())
                  or (vim.api.nvim_buf_get_lines(input_buf, 0, 1, false)[1] or "")

                if #line > 0 then
                  preview_enabled = true
                  picker:action "toggle_preview"
                  vim.api.nvim_clear_autocmds { group = aug }
                end
              end
            end,
          })
        end)
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

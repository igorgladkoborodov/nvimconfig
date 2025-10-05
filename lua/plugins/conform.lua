-- =================================================
-- Prettify
-- =================================================
return {
  "stevearc/conform.nvim",
  lazy = false,
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "\\p",
      function()
        require("conform").format()
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      ["*"] = { "prettierd" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = { timeout_ms = 500 },
    formatters = {
      -- rubocop = {
      --   args = { "--only-recognized-file-types", "--force-exclusion", "-A", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" }
      --
      --   -- append_args =
      --   --   { "--server", "--auto-correct-all", "--stderr", "--force-exclusion", "--stdin", "$FILENAME" }
      --   --   { "--only-recognized-file-types", "--force-exclusion", "-A" },
      -- },
      eslint_d = {
        append_args = { "--fix", "--flag", "unstable_config_lookup_from_file" },
      },
      prettier = {
        append_args = { "--ignore-unknown" },
      },
      prettierd = {
        append_args = { "--ignore-unknown" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}

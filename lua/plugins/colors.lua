return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup {
        options = {
          hide_end_of_buffer = false, -- Hide the '~' character at the end of the buffer for a cleaner look
          hide_nc_statusline = false, -- Override the underline style for non-active statuslines
        },
      }
    end,
  },
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup {}
      vim.cmd.colorscheme "nord"
    end,
  },
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    config = function()
      -- vim.g.zenbones_lightness = "bright"
      -- vim.g.zenbones_darken_comments = 45
      -- vim.cmd.colorscheme('zenbones')
    end,
  },
  {
    "p00f/alabaster.nvim",
    config = function()
      vim.g.alabaster_dim_comments = true
      -- vim.g.alabaster_floatborder = true
    end,
  },
}

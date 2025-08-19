return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme nord]])
    end,
  },
  {
    "ishan9299/nvim-solarized-lua"
  }
  -- {
  --   "shaunsingh/solarized.nvim",
  -- },
  -- {
  --   "iCyMind/NeoSolarized",
  --   config = function()
  --     vim.g.neosolarized_visibility = "low"
  --     vim.g.neosolarized_contrast = "normal"
  --     vim.g.neosolarized_bold = 0
  --     vim.g.neosolarized_underline = 0
  --     vim.g.neosolarized_italic = 0
  --   end,
  -- },
}

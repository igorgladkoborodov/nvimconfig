return {
  "ernstwi/juggler.nvim",
  lazy = false,
  opts = {},
  keys = {
    {
      "\\s",
      function()
        require("juggler").activate()
      end,
      desc = "Juggler",
    },
  },
  dependencies = {
    "nvimtools/hydra.nvim",
  },
}

return {
  "igorgladkoborodov/popup-juggler.nvim",
  opts = {},
  keys = {
    {
      "\\s",
      function()
        require("popup-juggler").open()
      end,
      desc = "Popup Juggler",
    },
  },
}

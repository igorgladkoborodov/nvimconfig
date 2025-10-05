-- ~/.config/nvim/lua/colorswitch.lua
local combos = {
  { bg = "dark", scheme = "nord" },
  { bg = "light", scheme = "github_light" },
  { bg = "light", scheme = "default" },
  { bg = "light", scheme = "alabaster" },
  { bg = "light", scheme = "zenwritten" },
  { bg = "light", scheme = "seoulbones" },
  { bg = "light", scheme = "forestbones" },
  { bg = "light", scheme = "zenbones" },
  { bg = "light", scheme = "vimbones" },
  { bg = "light", scheme = "tokyobones" },
  { bg = "light", scheme = "rosebones" },
  { bg = "light", scheme = "neobones" },
}

local index = 1

local function apply()
  local combo = combos[index]
  vim.opt.background = combo.bg
  vim.cmd.colorscheme(combo.scheme)
  print("Colorscheme: " .. combo.scheme .. " (" .. combo.bg .. ")")
end

local function switch_forward()
  index = index % #combos + 1
  apply()
end

local function switch_back()
  index = (index - 2) % #combos + 1
  apply()
end

vim.keymap.set("n", "<F6>", switch_forward, { desc = "Next colorscheme" })
vim.keymap.set("n", "<S-F6>", switch_back, { desc = "Previous colorscheme" })

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = { "default", "alabaster" },
  callback = function()
    local function setcurl(group, color)
      vim.api.nvim_set_hl(0, group, { undercurl = true, sp = color })
    end

    setcurl("DiagnosticUnderlineError", "#dc322f") -- Solarized red
    setcurl("DiagnosticUnderlineWarn", "#b58900") -- yellow
    setcurl("DiagnosticUnderlineInfo", "#268bd2") -- blue
    setcurl("DiagnosticUnderlineHint", "#2aa198") -- cyan
  end,
})

-- Toggle line numbers
-- vim.keymap.set("n", "<D-l>", "<cmd>set number!<cr>", { silent = true })
vim.keymap.set("n", "<D-l>", function()
  local wo = vim.wo -- window-local options
  if not wo.number and not wo.relativenumber then
    -- 1: numbers off → turn on absolute
    wo.number = true
    wo.relativenumber = false
  elseif wo.number and not wo.relativenumber then
    -- 2: absolute → turn on relative
    wo.relativenumber = true
  else
    -- 3: relative on → turn both off
    wo.number = false
    wo.relativenumber = false
  end
end, { desc = "Toggle line numbers (off → abs → rel)" })

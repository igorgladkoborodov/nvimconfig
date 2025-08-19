-- Option+= and Option+- to change window size (Mac)
vim.keymap.set("n", "<A-≠>", "<cmd>vertical resize +10<cr>", { silent = true })
vim.keymap.set("n", "<A-–>", "<cmd>vertical resize -10<cr>", { silent = true })

-- Ctrl + hjkl to navigate between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Cmd+D for vertical split, Cmd+Shift+D for horizontal split
vim.keymap.set("n", "<D-d>", "<cmd>vs<cr><C-w>l", { silent = true })
vim.keymap.set("n", "<D-S-d>", "<cmd>sp<cr><C-w>j", { silent = true })

-- Navigation on wrapped lines
vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "k", "gk", { silent = true })

-- New tab on Cmd+t
vim.keymap.set("n", "<D-t>", "<cmd>tabnew<cr>", { silent = true })

-- Double leader: toggle fold
vim.keymap.set("n", "<Leader><Leader>", "za")

-- \\ opens current file in new tab
vim.keymap.set("n", "\\\\", "<cmd>tabe %<cr>", { silent = true })

-- Cmd+Shift+]/[ for next/previous tab
vim.keymap.set("n", "<D-S-}>", "<cmd>tabn<cr>", { silent = true })
vim.keymap.set("n", "<D-S-{>", "<cmd>tabp<cr>", { silent = true })
vim.keymap.set("n", "<D-S-]>", "<cmd>tabn<cr>", { silent = true })
vim.keymap.set("n", "<D-S-[>", "<cmd>tabp<cr>", { silent = true })

-- Shift+Cmd+Ctrl+] move tab left; Shift+Cmd+Ctrl+[ move tab right
vim.keymap.set("n", "<C-S-D-{>", "<cmd>tabm -1<cr>", { silent = true })
vim.keymap.set("n", "<C-S-D-}>", "<cmd>tabm +1<cr>", { silent = true })

-- Indent on < or > (stay in visual mode)
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Copy current filename to clipboard by `i or \i
vim.keymap.set("n", "`i", '<cmd>let @*=expand("%")<cr>', { silent = true })
vim.keymap.set("n", "<Leader>i", '<cmd>let @*=expand("%")<cr>', { silent = true })

-- Disable visual 'u' (accidental lowercase)
vim.keymap.set("v", "u", "<Nop>")

-- `y moves last saved register to yank register 0; `p pastes from 0
vim.keymap.set("n", "`y", '<cmd>let @0=@"<cr>', { silent = true })
vim.keymap.set("n", "`p", '"0p')

-- When searching current word, don't jump to the next one
vim.keymap.set("n", "*", "*``")
vim.keymap.set("n", "#", "#``")

-- Reset current search with `/
vim.keymap.set("n", "`/", "<cmd>noh<cr>", { silent = true })

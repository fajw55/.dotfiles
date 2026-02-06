-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "X", '"_X')
vim.keymap.set("n", "<Del>", '"_x')

-- radera rad ... delete line without copy
vim.keymap.set("n", "åå", '"_dd')

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank entire line to system" })

-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste before cursor from system" })

-- put
vim.keymap.set("n", "<leader>u", ":put<CR>", { desc = "Put internal register below" })
vim.keymap.set("n", "<leader>U", ":put!<CR>", { desc = "Put internal register above" })

-- disable mid mouse button
vim.keymap.set({ "n", "i", "v", "c" }, "<MiddleMouse>", "<Ignore>")
vim.keymap.set({ "n", "i", "v", "c" }, "<2-MiddleMouse>", "<Ignore>")
vim.keymap.set({ "n", "i", "v", "c" }, "<3-MiddleMouse>", "<Ignore>")

-- Show diagnostics in a floating window
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- jk exits insert mode
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

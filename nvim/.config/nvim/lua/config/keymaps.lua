-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- delete single character without copying into register
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "X", '"_X')
vim.keymap.set({ "n", "v" }, "<Del>", '"_x')

-- delete line without copy
vim.keymap.set("n", "åå", '"_dd')

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank entire line to system" })

-- paste over selection without loosing yanked
vim.keymap.set("x", "<leader>p", [["_dP]])

-- put
vim.keymap.set("n", "<leader>ä", ":put<CR>", { desc = "Put internal register below" })
vim.keymap.set("n", "<leader>Ä", ":put!<CR>", { desc = "Put internal register above" })

-- disable mid mouse button
vim.keymap.set({ "n", "i", "v", "c" }, "<MiddleMouse>", "<Ignore>")
vim.keymap.set({ "n", "i", "v", "c" }, "<2-MiddleMouse>", "<Ignore>")
vim.keymap.set({ "n", "i", "v", "c" }, "<3-MiddleMouse>", "<Ignore>")

-- Show diagnostics in a floating window
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- jk exits insert mode
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

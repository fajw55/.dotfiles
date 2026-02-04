-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- vim.opt.clipboard = "unnamedplus"

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P')

-- Show diagnostics in a floating window
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- organize imports
-- vim.keymap.set("n", "<leader>cu", function()
--   vim.lsp.buf.code_action({
--     apply = true,
--     context = {
--       only = { "source.organizeImports", "source.fixAll" },
--     },
--   })
-- end, { desc = "Remove unused imports / organize imports" })

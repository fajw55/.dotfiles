local opts = { noremap = true, silent = true }

-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness

-- General Keymaps --
vim.keymap.set("i", "<C-c>", "<ESC>", { desc = "Exit insert mode with ctrl+c" })
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlights" })
-- vim.keymap.set("i", "<Esc>", "<nop>") -- unmap Esc in insert mode

-- copy / delete
vim.keymap.set("v", "p", '"_dp', opts) -- remeber yanked
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- use system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts) -- use system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], opts) -- use system clipboard
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]], opts) -- use system clipboard

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete without yank
vim.keymap.set("n", "x", '"_x', opts) -- delete single character without yank

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

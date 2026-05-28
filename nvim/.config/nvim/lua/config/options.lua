-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.scrolloff = 0 -- allow scrolloff
vim.o.scroll = 5 -- for neoscroll

vim.opt.termguicolors = true

vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.wrap = false -- do not wrap lines by default
vim.opt.scrolloff = 5 -- keep 5 lines above/below cursor
vim.opt.sidescrolloff = 10 -- keep 10 lines to left/right of cursor

vim.opt.backspace = "indent,eol,start" -- better backspace behaviour
vim.opt.iskeyword:append("-") -- include - in words
vim.opt.selection = "inclusive" -- include last char in selection

-- Native inline completions don't support being shown as regular completions
-- vim.g.ai_cmp = false

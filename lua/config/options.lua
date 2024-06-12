-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.spelllang = { "en", "cjk" }
vim.o.scrolloff = 3
vim.o.scrolloff = vim.o.scrolloff == 3 and 999 or 3

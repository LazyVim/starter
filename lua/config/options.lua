-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.smartindent = true
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "100"
-- 边输入边搜索
vim.o.incsearch = true

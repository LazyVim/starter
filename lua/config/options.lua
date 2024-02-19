-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opt = vim.opt

opt.background = "dark"
opt.guifont = "Fira Code:h12"
vim.api.nvim_set_var("gruvbox_contrast_dark", "hard")

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.o.shell = "powershell"
vim.o.shellcmdflag = "-command"
vim.o.shellquote = '"'

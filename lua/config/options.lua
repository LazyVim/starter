-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakat = " ^I!@*-+;:,./?"
vim.opt.showbreak = "++"
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH
vim.opt.undofile = true
vim.opt.autowriteall = true
vim.opt.swapfile = false
vim.opt.writebackup = true
vim.g.CheatSheetDisableFrameworkDetection = 0
vim.g.ruby_host_prog = "$HOME/.local/share/mise/shims/ruby"
vim.g.python_host_prog = "$HOME/.local/share/mise/shims/python3"
vim.g.node_host_prog = "$HOME/.local/share/mise/shims/node"
